const puppeteer = require("puppeteer");
const fs = require('fs');

//node start
const mysql = require('mysql')

// Parsing middleware
// Parse application/x-www-form-urlencoded
// app.use(bodyParser.urlencoded({ extended: false })); // Remove 
// Parse application/json
// app.use(bodyParser.json()); // Remove

// MySQL Code goes here
const pool  = mysql.createPool(JSON.parse(fs.readFileSync(`./mysql-await/mysql-config.json`)));

//node end
var dataReport = [];
async function makeResult(url, fileIndex) {
    self = this;
    const browser = await puppeteer.launch({ headless: true,
        defaultViewport: null, 
        args:[
        '--start-maximized'
     ]});
    const page = await browser.newPage();
    await page.goto(url);
    await page.waitForTimeout(6500);

    const dataText = await page.evaluate(() => {
        document.querySelector('#li_ShowAll').click();
        //     document.querySelector('.setit').click();
    //     document.querySelector('#otc_1').click();
    //     document.querySelector('#otc_2').click();
    //     document.querySelector('#otc_3').click();
    //     let items = document.querySelector("body").outerHTML;
    //     return items;
    });
    await page.waitForTimeout(1000);
    var dataReport = [];

    //get result
    let pageData = await page.evaluate(() => {
        let leagueName,
            datetime,
            completeState,
            homeName,
            homePosition,
            result,
            resultHome,
            resultAway,
            awayName,
            awayPosition,
            homeCorner,
            awayCorner,
            totalCorner,
            odd;
        var dataReport = [];
        var dataRow = {};
        var count = 0;
        let tableResult = document.querySelectorAll('#table_live tbody tr');
        tableResult.forEach(element => {
            leagueName = '',
            datetime = '',
            completeState = '',
            homeName = '',
            homePosition = '',
            result = '',
            resultHome = '',
            resultAway = '',
            awayName = '',
            awayPosition = '',
            homeCorner = '',
            awayCorner = '',
            totalCorner = '',
            odd = '';
            let elementId = element.getAttribute('id');
            let elementClass = element.className;
            let allTdData = element.querySelectorAll('td');
            if(elementId != 'topLine' 
            && elementId != 'tr_0' 
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
                completeState = allTdData[3]?.firstChild?.innerText;
                homePosition = allTdData[5]?.firstChild?.childNodes[0]?.innerText;
                awayPosition = allTdData[7]?.childNodes[4]?.innerText;
                //check result
                result = allTdData[6]?.firstChild?.innerText;
                //check corner Data
                cornerData = allTdData[8]?.childNodes[0]?.outerText;
                //check odd
                odd = allTdData[11]?.firstChild?.innerText;

                if (cornerData.includes('-')) {
                    let cornerDataSplit = cornerData.split(' - ');
                    homeCorner = Number(cornerDataSplit[0]);
                    awayCorner = Number(cornerDataSplit[1]);
                    totalCorner = homeCorner + awayCorner;
                }

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

                if(typeof result == 'undefined') {
                    result = false;
                } else {
                    if (result.includes(" - ")) {
                        result = result.split(' - ');
                        resultHome = result[0];
                        resultAway = result[1];
                    }
                }

                if (!leagueName) {
                    leagueName = "Not defined!";
                }

                if (completeState === 'FT' 
                    && leagueName
                    && datetime
                    && homePosition
                    && awayPosition
                    && !isNaN(resultHome) 
                    && !isNaN(resultAway)
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
                    dataRow['completeState'] = completeState;
                    dataRow['homeName'] = homeName;
                    dataRow['homePosition'] = homePosition;
                    dataRow['resultHome'] = resultHome;
                    dataRow['resultAway'] = resultAway;
                    dataRow['awayName'] = awayName;
                    dataRow['awayPosition'] = awayPosition;
                    dataRow['homeCorner'] = homeCorner;
                    dataRow['awayCorner'] = awayCorner;
                    dataRow['totalCorner'] = totalCorner;
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
    let result = await makeResult('https://www.bongdalu4.com/ket-qua-bong-da', time);

    return result;
}

async function insertLeague(leagueName) {
    return new Promise( (resolve) => {
        pool.getConnection((err, connection) => {
            if(err) throw err
            if (leagueName.includes("'")) {
                leagueName = leagueName.replace("'", "");
            }

            var sqlInsert = "INSERT INTO league_entity(name)" + 
                                " VALUES ('"+ leagueName +"')";
            connection.query(sqlInsert, (e, result, fields) => {
                connection.release();
                if (e) {
                    // console.log(leagueName + " insert fail: " + e);
                    resolve(0);
                } else {
                    // console.log("1 record inserted " + leagueName);
                    resolve(1);
                }
            })
        });
    }).then((response) => {
        return response;
    }); 
}

async function getLeagueId(leagueName) {
    return new Promise( (resolve) => {
        pool.getConnection(async (err, connection) => {
            let id = 0;
            if(err) throw err
            connection.query("SELECT * FROM league_entity WHERE name = '" + leagueName + "'", (err, rows) => {
                connection.release();
                if (!err) {
                    if (rows.length == 1) {
                        id = rows[0].entity_id;
                    }
                resolve(id);
                } else {
                    console.log(err);
                    resolve(0);
                }
            })
        });
    }).then((response) => {
        return response;
    }); 
}

async function insertMatch(data, leagueId) {
    return new Promise( (resolve) => {
        pool.getConnection((err, connection) => {
            if(err) throw err

            let odd = data['odd'];
            let realOdd;
            if (!isNaN(odd)) {
                realOdd = odd;
            } else {
                if (odd.includes('-') && odd.includes('/')) {
                    oddSplit = odd.split('/');
                    realOdd = -1 * (oddSplit[1] - 0.25);
                }
                if (!odd.includes('-') && odd.includes('/')) {
                    oddSplit = odd.split('/');
                    realOdd = oddSplit[1] - 0.25;
                }
            }
            data['odd'] = realOdd;
            //check Name have '
            if (data['homeName'].includes("'")) {
                data['homeName'] = data['homeName'].replace("'", "");
            }
            if (data['awayName'].includes("'")) {
                data['awayName'] = data['awayName'].replace("'", "");
            }
            //format datetime
            if (data['datetime'].includes(" ")) {
                let splitDateTime = data['datetime'].split(" ");
                data['datetime'] = splitDateTime[0];
            }
            
            let sqlInsert = "INSERT INTO match_result_entity(league_id, datetime, home_name, away_name, home_position, away_position, home_result, away_result, home_corner, away_corner, total_corner, odd)" + 
                                " VALUES ('"+ leagueId +"','"+ data['datetime'] +"', '"+ data['homeName'] +"','"+ data['awayName'] +"','"+ data['homePosition'] +"','"+ data['awayPosition'] +"','"+ data['resultHome'] +"','"+ data['resultAway'] +"','"+ data['homeCorner'] +"','"+ data['awayCorner'] +"','"+ data['totalCorner'] +"','"+ data['odd'] +"')";
            connection.query(sqlInsert, (e, result, fields) => {
                connection.release();
                if (e) {
                    // console.log(data['datetime'] + " insert fail: " + e + ': home_id' + data['homeName']);
                    resolve(0);
                } else {
                    // console.log("1 record inserted " + data['datetime'] + ' : home_id' + data['homeName']);
                    resolve(1);
                }
            })
        });
    }).then((response) => {
        return response;
    }); 
}
// const element = document.querySelector("#start-report-result");
// element.addEventListener("click", () => {
	(async function run() {
        let renderData = await test();
        // fs.writeFileSync('renderData.txt', JSON.stringify(renderData));  
        let leagueId;
        let statusInsertLeague = 0;
        if (renderData) {
            pool.getConnection(async (err, connection) => {
                if(err) throw err
                for await (let row of renderData) {
                    leagueId = await getLeagueId(row['leagueName']);
                    if (!leagueId) {
                        statusInsertLeague = await insertLeague(row['leagueName']);
                        leagueId = await getLeagueId(row['leagueName']);
                    }

                    if (statusInsertLeague || leagueId) {
                        await insertMatch(row, leagueId);
                        console.log('done! ' + row['homeName']);
                    }
                }
            })
        }
    })();
// });