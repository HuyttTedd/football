const puppeteer = require("puppeteer");
const fs = require('fs');

//node start
const express = require('express')
const bodyParser = require('body-parser')
const mysql = require('mysql')

const app = express()
app.set("view engine", "ejs");
const port = process.env.PORT || 5000;

// Parsing middleware
// Parse application/x-www-form-urlencoded
// app.use(bodyParser.urlencoded({ extended: false })); // Remove 
app.use(express.urlencoded({extended: true})); // New
// Parse application/json
// app.use(bodyParser.json()); // Remove
app.use(express.json()); // New

// MySQL Code goes here
const pool  = mysql.createPool({
    connectionLimit : 1000,
    host            : 'localhost',
    user            : 'root',
    password        : '',
    database        : 'football'
});

// Listen on enviroment port or 5000
app.listen(port, () => console.log(`Listening on port ${port}`))
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
    await page.waitForTimeout(4500);

    const dataText = await page.evaluate(() => {
        document.querySelector('.setit').click();
        document.querySelector('#otc_1').click();
        document.querySelector('#otc_2').click();
        document.querySelector('#otc_3').click();
        let items = document.querySelector("body").outerHTML;
        return items;
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
                leagueName = allTdData[1].innerText;
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

                if (completeState === 'FT' 
                    && leagueName
                    && datetime
                    && homePosition
                    && awayPosition
                    && !isNaN(resultHome) 
                    && !isNaN(resultAway)
                    && odd) 
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
                    // console.log(leagueName);
                    // console.log(datetime);
                    // console.log(completeState);
                    // console.log(homeName);
                    // console.log(homePosition);
                    // console.log(result);
                    // console.log(resultHome);
                    // console.log(resultAway);
                    // console.log(awayName);
                    // console.log(awayPosition);
                    // console.log(homeCorner);
                    // console.log(awayCorner);
                    // console.log(totalCorner);
                    // console.log(odd);
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

    fs.writeFileSync('result_text/' + 'data'+fileIndex+'.txt', JSON.stringify(pageData));
    await browser.close();

    return pageData;
}


async function test() {
    const fileNameByDate = new Date();
    let time = fileNameByDate.getTime();
    let result = await makeResult('https://www.bongdalu.fun/ket-qua-bong-da', time);

    return result;
}


app.get('', async (req, res) => {
    let renderData = await test();
    let mess = 'error';
    let leagueId;
    let statusInsertLeague = 0;
    if (renderData) {
        mess = 'done';
        pool.getConnection(async (err, connection) => {
            if(err) throw err
            // console.log('connected as id ' + connection.threadId)
            
            for (let row of renderData) {
                leagueId = await getLeagueId(row['leagueName']);
                //     console.log(row['leagueName']);
                    console.log(leagueId);
                    console.log('+++++++++++++++');
                // console.log('hhhhhhhhhhhhhhhhhhhhhhhhhh');
                // console.log('---------0');
                // console.log(row['leagueName']);
                // console.log('---------1');
                // console.log(row['leagueName']);
                // console.log(leagueId);
                // console.log('+++++++++++++++');
                if (!leagueId) {
                    statusInsertLeague = await insertLeague(row['leagueName']);
                    console.log('status INSERT start');
                    console.log(statusInsertLeague);
                    console.log('status INSERT');
                    leagueId = await getLeagueId(row['leagueName']);
                }

                if (statusInsertLeague || leagueId) {
                    var sql = "INSERT INTO match_entity(datetime, home_club_id, away_club_id, home_position, away_position, home_corner, away_corner, total_corner, odd)" + 
                                " VALUES ("+ row['leagueName'] +")";
                }
            }
        })
    }
    res.render("home.ejs", { mess });
    // console.log(renderData)
})

// async function getLeagueId(leagueName)  {

//     return new Promise( (resolve) => {
//         pool.query("SELECT * FROM league_entity WHERE name = '" + leagueName + "'", (error) => {
//             resolve({ result: !error });
//         });
//     }); 
// } 

async function insertLeague(leagueName) {
    return new Promise( (resolve) => {
        pool.getConnection((err, connection) => {
            if(err) throw err
            var sqlInsert = "INSERT INTO league_entity(name)" + 
                                " VALUES ('"+ leagueName +"')";
            connection.query(sqlInsert, (e, result, fields) => {
                connection.release();
                if (e) {
                    console.log(leagueName + " insert fail: " + e);
                    resolve(0);
                } else {
                    console.log("1 record inserted " + leagueName);
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
                console.log(rows);
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
// const element = document.querySelector("#start-report-result");
// element.addEventListener("click", () => {
// 	(async function test() {
//         const fileNameByDate = new Date();
//         let time = fileNameByDate.getTime();
//         console.log(time);
//         await makeResult('https://www.bongdalu.fun/ket-qua-bong-da', time);
//     })();
// });
