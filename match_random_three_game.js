const express = require('express')
const mysql = require('mysql')
const arrayOdd = [0.25, -0.25, 0.5, -0.5, 0.75, -0.75, 1, -1, 1.25, -1.25, 1.5, -1.5, 1.75, -1.75, 2, -2, 2.25, -2.25, 2.5, -2.5, 2.75, -2.75, 3, -3];
const app = express()
app.set("view engine", "ejs");
const port = process.env.PORT || 5002;
app.use(express.urlencoded({extended: true})); // New
app.use(express.json()); // New

const MATCH_COUNT = 3;

// MySQL Code goes here
const pool  = mysql.createPool({
    connectionLimit : 1000,
    host            : 'localhost',
    user            : 'root',
    password        : 'admin123',
    database        : 'football',
    port            : '3309'
});

// Listen on enviroment port or 5000
app.listen(port, () => console.log(`Listening on port ${port}`))

app.get('/prediction', async (req, res) => {
    let dataRandomMatchAll = await getMatchNotCompleteAndNotInListAll();
    let matchsSelectedForAllOdd = [];
    let matchsSelectedForEachOdd = [];
    if (dataRandomMatchAll) {
        matchsSelectedForAllOdd = randomMatch(dataRandomMatchAll, MATCH_COUNT);
    }

    let dataByOdd = {};
    for await (let odd of arrayOdd) {
        matchsSelectedForEachOdd = await getMatchNotCompleteAndNotInOddList(odd);
        dataByOdd[odd] = randomMatch(matchsSelectedForEachOdd, MATCH_COUNT);
    }

    console.log(matchsSelectedForAllOdd);
    console.log(dataByOdd);
    res.render("random_three_match.ejs", { matchsSelectedForAllOdd, dataByOdd, arrayOdd });
});


function randomMatch(matchs, match_count, failedCount = 0) {
    let matchsSelected = getRandom(matchs, match_count);
    let arrTimeCheck = [];

    for (let item of matchsSelected) {
        arrTimeCheck.push(item.datetime);
    }

    arrTimeCheck.sort(function (a, b) {
        return new Date(b) - new Date(a);
    });

    let canUseThisRandom = false;
    for (let i = 0; i < arrTimeCheck.length; i++) {
        if (((new Date(arrTimeCheck[i]) - new Date(arrTimeCheck[i + 1])) / 1000) > 7000) {
            if ((i + 1) === arrTimeCheck.length - 1) {
                canUseThisRandom = true;
                break;
            }
            continue;
        }
    }

    if (canUseThisRandom) {
        return matchsSelected;
    }

    //set max failed = 20
    if (failedCount <= 40 && !canUseThisRandom) {
        return randomMatch(matchs, match_count, failedCount + 1);
    } else {
        return [];
    }
}

function getRandom(arr, num) {
    let arrBackup = [...arr];
    let count = 0;
    let arrRandom = [];

    if (arr.length < num) {
        num = arr.length;
    }

    if (arr.length == num) {
        return arr;
    }

    while (count < num) {
      randomElementIndex = Math.floor(Math.random()*arrBackup.length);
      arrRandom.push(arrBackup[randomElementIndex]);
      // arr.splice(2, 1, 'tmp');	// Replaces 1 item at index 2 with 'tmp'
      arrBackup.splice(randomElementIndex, 1);
      count++;
    }
    return arrRandom;
}


async function getMatchNotCompleteAndNotInListAll() {
    return new Promise( (resolve) => {
        pool.getConnection(async (err, connection) => {
            if(err) throw err
            let selectQuery = "SELECT * FROM less_position_but_higher_odd_match lpbhom WHERE lpbhom.result = '2' AND entity_id NOT IN " + 
                                // get all list_id have odd = all and get all match_id in those lists then get NOT IN table less_position_but_higher_odd_match
                            "(SELECT match_id FROM random_list_item WHERE list_id IN (SELECT entity_id from random_list WHERE odd='all'))" +
                            "ORDER BY lpbhom.entity_id ASC";
            connection.query(selectQuery, (err, rows) => {
                connection.release();
                if (!err) {
                resolve(rows);
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

async function getMatchNotCompleteAndNotInOddList(odd) {
    return new Promise( (resolve) => {
        pool.getConnection(async (err, connection) => {
            if(err) throw err
            let selectQuery = "SELECT * FROM less_position_but_higher_odd_match lpbhom WHERE lpbhom.result = '2' AND entity_id NOT IN " + 
                                // get all list_id have odd = all and get all match_id in those lists then get NOT IN table less_position_but_higher_odd_match
                            "(SELECT match_id FROM random_list_item WHERE list_id IN (SELECT entity_id from random_list WHERE odd='" + odd + "'))" +
                            "ORDER BY lpbhom.entity_id ASC";
            connection.query(selectQuery, (err, rows) => {
                connection.release();
                if (!err) {
                resolve(rows);
                } else {
                    console.log(err);
                    resolve([]);
                }
            })
        });
    }).then((response) => {
        return response;
    }); 
}