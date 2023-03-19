const puppeteer = require("puppeteer");
const fs = require('fs');

//node start
const mysql = require('mysql')

const port = process.env.PORT || 5003;

/// MySQL Code goes here
const pool  = mysql.createPool(JSON.parse(fs.readFileSync(`./mysql-await/mysql-config.json`)));

// Listen on enviroment port or 5000
//node end
var dataReport = [];
async function makeResult(url, fileIndex) {
    self = this;
    const browser = await puppeteer.launch({ headless: false, 
        defaultViewport: null, 
        args:[
        '--start-maximized'
     ]});
    const page = await browser.newPage();
    await page.goto(url, {timeout:0});
    await page.waitForTimeout(6500);
    
    // const dataText = await page.evaluate(() => {
    //     document.querySelector('.setit').click();
    //     document.querySelector('#otc_1').click();
    //     document.querySelector('#otc_2').click();
    //     document.querySelector('#otc_3').click();
    //     let items = document.querySelector("body").outerHTML;
    //     return items;
    // });
    await page.waitForTimeout(1000);
    var dataReport = [];

    //get result
    let pageData = await page.evaluate(() => {
        let leagueName,
            datetime,
            homeName,
            homePosition,
            completeState,
            awayName,
            awayPosition,
            odd;
        var dataReport = [];
        var dataRow = {};
        let tableResult = document.querySelectorAll('#table_live tbody tr');
        tableResult.forEach(element => {
            leagueName = '',
            datetime = '',
            homeName = '',
            homePosition = '',
            completeState = '',
            awayName = '',
            awayPosition = '',
            odd = '';
            let elementId = element.getAttribute('id');
            let elementClass = element.className;
            let allTdData = element.querySelectorAll('td');
            if(elementId != 'topLine' 
            && elementId != 'tr_0' 
            && typeof elementId == 'string'
            && typeof elementClass == 'string'
            && !elementId.includes("tr_ad")
            && !elementClass.includes("adtext-bg")
            && element.style.display != 'none'
            && allTdData.length > 10) {
                //check league name
                leagueName = allTdData[1]?.attributes?.title?.textContent;
                if (!leagueName) {
                    leagueName = allTdData[1].innerText;
                }
                //check date time
                datetime = allTdData[2]?.dataset?.t;
                // check complete state
                homePosition = allTdData[5]?.firstChild?.childNodes[0]?.innerText;
                awayPosition = allTdData[7]?.childNodes[4]?.innerText;
                //check odd
                odd = allTdData[11]?.firstChild?.innerText;
                completeState = allTdData[6]?.firstChild?.innerText;

                if(typeof homePosition == 'undefined' || !homePosition) {
                    homePosition = false;
                } else {
                    // check home's rank
                    if (homePosition.includes("[")) {
                        homePosition = homePosition.replace('[', '');
                    }

                    if (homePosition.includes("]")) {
                        homePosition = homePosition.replace(']', '');
                    }

                    if (homePosition.includes("-")) {
                        let rankDataSplitHome = homePosition.split('-');
                        homePosition = rankDataSplitHome[rankDataSplitHome.length - 1];
                    }

                    if (isNaN(homePosition)) homePosition = false;
                    // end check home's rank
                }

                if(typeof awayPosition == 'undefined' || !awayPosition) {
                    awayPosition = false;
                } else {
                    // check away's rank
                    if (awayPosition.includes("[")) {
                        awayPosition = awayPosition.replace('[', '');
                    }

                    if (awayPosition.includes("]")) {
                        awayPosition = awayPosition.replace(']', '');
                    }

                    if (awayPosition.includes("-")) {
                        let rankDataSplitAway = awayPosition.split('-');
                        awayPosition = rankDataSplitAway[rankDataSplitAway.length - 1];
                    }

                    if (isNaN(awayPosition)) awayPosition = false;
                    // end check away's rank
                }
                
                if (leagueName
                    && datetime
                    && homePosition
                    && (completeState == 'Tips' || completeState == '-') 
                    && awayPosition
                    && (odd || odd == 0))
                {
                    dataRow = {};
                    homeName = allTdData[5].childNodes[4].innerText;
                    awayName = allTdData[7].childNodes[0].innerText;
                    //remove character after name. Example: Uruguay(N)
                    if (homeName.includes("(N)")) {
                        homeName = homeName.split("(").shift();
                    }

                    if (awayName.includes("(N)")) {
                        awayName = awayName.split("(").shift();
                    }
                    //end remove
                    dataRow['leagueName'] = leagueName;
                    dataRow['datetime'] = datetime;
                    dataRow['homeName'] = homeName;
                    dataRow['homePosition'] = homePosition;
                    dataRow['awayName'] = awayName;
                    dataRow['awayPosition'] = awayPosition;
                    dataRow['odd'] = odd;
                    dataReport.push(dataRow);
                }
            }
        });

        return dataReport;
    });
    await page.waitForTimeout(5000);

    // fs.writeFileSync('result_text/' + 'data'+fileIndex+'.txt', JSON.stringify(pageData));
    await browser.close();

    return pageData;
}

async function test() {
    const fileNameByDate = new Date();
    let time = fileNameByDate.getTime();
    let result = await makeResult('https://www.bongdalu2.com/', time);

    return result;
}

(async function run() {
    let renderData = await test();
    let mess = 'error';
    if (renderData) {
        mess = 'done';
        pool.getConnection(async (err, connection) => {
            if(err) throw err
            connection.release();
            for await (let row of renderData) {
                await insertMatch(row);
            }
        })
    }
})();

async function insertMatch(data) {
    return new Promise( (resolve) => {
        pool.getConnection((err, connection) => {
            if(err) throw err

            //calculate odd 
            let odd = data['odd'];
            let realOdd;
            if (!isNaN(odd)) {
                realOdd = odd;
            } else {
                if (odd.includes('-') && odd.includes('/')) {
                    oddSplit = odd.split('/');
                    if (oddSplit[1] < 0) {
                        realOdd = oddSplit[1] - 0.25;
                    } else {
                        realOdd = -1 * (oddSplit[1] - 0.25);
                    }

                }
                if (!odd.includes('-') && odd.includes('/')) {
                    oddSplit = odd.split('/');
                    realOdd = oddSplit[1] - 0.25;
                }
            }

            // choose match less position but higher odd
            let isLessButHigh = false;
            let positionRange;
            
            if (Number(data['homePosition']) > Number(data['awayPosition']) && realOdd > 0) {
                isLessButHigh = true;
                positionRange = data['homePosition'] - data['awayPosition'];
            }

            if (Number(data['homePosition']) < Number(data['awayPosition']) && realOdd < 0) {
                isLessButHigh = true;
                positionRange = data['awayPosition'] - data['homePosition'];
            }

            //check Name have '
            if (data['homeName'].includes("'")) {
                data['homeName'] = data['homeName'].replace("'", "");
            }
            if (data['awayName'].includes("'")) {
                data['awayName'] = data['awayName'].replace("'", "");
            }
            if (data['leagueName'].includes("'")) {
                data['leagueName']= data['leagueName'].replace("'", "");
            }

            //format datetime ko dc vì các trận đấu ko đc cùng time nhau
            // if (data['datetime'].includes(" ")) {
            //     let splitDateTime = data['datetime'].split(" ");
            //     data['datetime'] = splitDateTime[0];
            // }

            // result: 	2 is not set, 1 is win, 0 is lose
            if (isLessButHigh) {
                let sqlInsertLessPosition = "INSERT INTO less_position_but_higher_odd_match(league_name, datetime, home_name, away_name, result, position_range, odd)" + 
            " VALUES ('"+ data['leagueName'] +"','"+ data['datetime'] +"', '"+ data['homeName'] +"','"+ data['awayName'] +"','2','"+ positionRange +"','"+ realOdd +"')";
                connection.query(sqlInsertLessPosition, (e, result, fields) => {
                    if (e) {
                        console.log(data['datetime'] + " insert fail: " + e + ': home_id' + data['homeName']);
                        resolve(0);
                    } else {
                        console.log("1 record inserted " + data['datetime'] + ' : home_id' + data['homeName']);
                        resolve(1);
                    }
                })
            }

            let sqlInsertTodayMatch = "INSERT INTO new_match_today(league_name, datetime, result, home_name, away_name, home_position, away_position, odd, odd_converted)" + 
                                " VALUES ('"+ data['leagueName'] +"','"+ data['datetime'] +"','2', '"+ data['homeName'] +"','"+ data['awayName'] +"','"+ data['homePosition'] +"','"+ data['awayPosition'] +"','"+ data['odd'] +"','"+ realOdd +"')";
            connection.query(sqlInsertTodayMatch, (e, result, fields) => {
                connection.release();
                if (e) {
                    console.log(data['datetime'] + " insert fail: " + e + ': home_id' + data['homeName']);
                    resolve(0);
                } else {
                    console.log("1 record inserted " + data['datetime'] + ' : home_id' + data['homeName']);
                    resolve(1);
                }
            })
        });
    }).then((response) => {
        console.log(response);
        return response;
    }); 
}

