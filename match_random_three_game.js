const mysql = require('mysql')
const arrayOdd = [0.25, -0.25, 0.5, -0.5, 0.75, -0.75, 1, -1, 1.25, -1.25, 1.5, -1.5, 1.75, -1.75, 2, -2, 2.25, -2.25, 2.5, -2.5, 2.75, -2.75, 3, -3];
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

(async function run() {
    let dataRandomMatchAll = await getMatchNotCompleteAndNotInListAll();
    let matchsSelectedForAllOdd;
    let matchsSelectedForEachOdd = [];
    if (dataRandomMatchAll) {
        matchsSelectedForAllOdd = randomMatch(dataRandomMatchAll, MATCH_COUNT);
        if (matchsSelectedForAllOdd) {
            await insertRandomListItem(matchsSelectedForAllOdd, 'all');
        }
    }

    let dataByOdd;
    for await (let odd of arrayOdd) {
        matchsSelectedForEachOdd = await getMatchNotCompleteAndNotInOddList(odd);
        dataByOdd = randomMatch(matchsSelectedForEachOdd, MATCH_COUNT);
        if (dataByOdd) {
            // await 
        }
    }
})();

// app.get('/new_prediction', async (req, res) => {
//     let dataRandomMatchAll = await getMatchNotCompleteAndNotInListAll();
//     let matchsSelectedForAllOdd;
//     let matchsSelectedForEachOdd = [];
//     if (dataRandomMatchAll) {
//         matchsSelectedForAllOdd = randomMatch(dataRandomMatchAll, MATCH_COUNT);
//         console.log(matchsSelectedForAllOdd);
//         if (matchsSelectedForAllOdd) {
//             await insertRandomListItem(matchsSelectedForAllOdd, 'all');
//         }
//     }

//     let dataByOdd;
//     for await (let odd of arrayOdd) {
//         matchsSelectedForEachOdd = await getMatchNotCompleteAndNotInOddList(odd);
//         dataByOdd = randomMatch(matchsSelectedForEachOdd, MATCH_COUNT);
//         if (dataByOdd) {
//             // await 
//         }
//     }

//     console.log(matchsSelectedForAllOdd);
//     // console.log(dataByOdd);
//     res.render("random_three_match.ejs", { matchsSelectedForAllOdd, dataByOdd, arrayOdd });
// });

async function insertRandomListItem(data, odd) {
    return new Promise( (resolve) => {
        pool.getConnection(async (err, connection) => {
            let insertResult, maxId;

            if(err) throw err
            try {
                connection.beginTransaction();
                // await insertRandomList(data, odd, connection);
                insertResult = new Promise((resolve) => {
                    let sqlInsert = "INSERT INTO random_list(match_count, odd)" + 
                                        " VALUES ('"+ data.length +"', '"+ odd +"')";
                    connection.query(sqlInsert, (e, result, fields) => {
                        if (e) {
                            console.log("insert fail: List Random Entity with error: " + e);
                            connection.rollback();
                            resolve(0)
                        } else {
                            resolve(1)
                        }
                    })
                }).then((response) => {
                    return response;
                }); 

                // let maxId = await selectMaxEntityFromRandomList(connection);
                maxId = new Promise((resolve) => {
                    let sqlGetLastEntityId = "SELECT MAX(entity_id) as max_entity from random_list"
                    connection.query(sqlGetLastEntityId, (err, rows) => {
                        if (!err) {
                            console.log(rows[0]['max_entity']);
                            console.log('&&&&&&&&&&&');
                            resolve(rows[0]['max_entity']);
                        } else {
                            resolve(0);
                        }
                    })
                }).then((response) => {
                    return response;
                }); 

                if (!maxId) {
                    resolve(0);
                    connection.rollback();
                } else {
                    // for await (let item of data) {
                    new Promise((resolve) => {
                        for (let item of data) {
                            console.log(maxId);
                            let sqlInsertItem = "INSERT INTO random_list_item(list_id, match_id)" + 
                                " VALUES ('"+ maxId +"', '"+ item['entity_id'] +"')";
                            connection.query(sqlInsertItem, (e, result, fields) => {
                                if (e) {
                                    connection.rollback();
                                    console.log("insert fail: Item List Random Entity with error: " + e);
                                    resolve(0)
                                } else {
                                    resolve(1)
                                }
                            })   
                        }
                    }).then((response) => {
                        return response;
                    });
                    // }
                }

                connection.commit();
                connection.release();
            } catch (err) {
                connection.rollback();
                reject(err);
            }
        });
    }).then((response) => {
        return response;
    }); 
}

async function insertRandomList(data, odd, connection) {
    return new Promise((resolve) => {
        let sqlInsert = "INSERT INTO random_list(match_count, odd)" + 
                            " VALUES ('"+ data.length +"', '"+ odd +"')";
        connection.query(sqlInsert, (e, result, fields) => {
            if (e) {
                console.log("insert fail: List Random Entity with error: " + e);
                resolve(0)
            } else {
                resolve(1)
            }
        })
    }).then((response) => {
        return response;
    }); 
}

async function selectMaxEntityFromRandomList(connection) {
    return new Promise((resolve) => {
        let sqlGetLastEntityId = "SELECT MAX(entity_id) as max_entity from random_list"
        connection.query(sqlGetLastEntityId, (err, rows) => {
            connection.release();
            if (!err) {
                resolve(rows[0]['max_entity']);
            } else {
                resolve(0);
            }
        })
    }).then((response) => {
        return response;
    }); 
}


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