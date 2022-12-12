const mysql = require('mysql')

// MySQL Code goes here
const pool  = mysql.createPool({
    host            : 'localhost',
    user            : 'root',
    password        : '',
    database        : 'football'
    // port            : '3309'
});


pool.getConnection(async (err, connection) => {
    if(err) throw err
    let allLeagueNotComplete = await getMatchsNotComplete();
    let result;
    let matchComplete;
    let dataSingleMatch;
    let odd,
        homeResult,
        awayResult;
    if (allLeagueNotComplete) {
        for await (let row of allLeagueNotComplete) {
            matchComplete = await getMatchComplete(row['datetime'], row['home_name'], row['away_name']);
            if (matchComplete.length > 0) {
                dataSingleMatch = matchComplete[0];
                odd = dataSingleMatch['odd'];
                homeResult = dataSingleMatch['home_result'];
                awayResult = dataSingleMatch['away_result'];
                if (odd > 0) {
                    if ((homeResult - awayResult) > odd) {
                        result = 1;
                    }
                    if ((homeResult - awayResult) < odd) {
                        result = 0;
                    }
                    if ((homeResult - awayResult) == odd) {
                        result = 3;
                    }
                } else if (odd < 0) {
                    if ((awayResult - homeResult) > odd) {
                        result = 1;
                    }
                    if ((awayResult - homeResult) < odd) {
                        result = 0;
                    }
                    if ((awayResult - homeResult) == odd) {
                        result = 3;
                    }
                }

                if (odd == 0) {
                    result = 10;
                }
                await updateResult(result, row['datetime'], row['home_name'], row['away_name']);
            }
            // await updateResult(result, row['datetime'], row['home_name'], row['away_name']);
        }
    }
})

async function getMatchComplete(datetime, homeName, awayName) {
    return new Promise( (resolve) => {
        pool.getConnection(async (err, connection) => {
            let datetimeSplit = datetime.split(" ");
            if (datetimeSplit.length == 2) {
                datetime = datetimeSplit[0];
                let getCompleteMatchQuery = "SELECT * FROM match_entity WHERE datetime LIKE '%"
                + datetime + "%' AND home_name='" + homeName + "' AND away_name='" + awayName + "'";
                if(err) throw err
                connection.query(getCompleteMatchQuery, (err, rows) => {
                    connection.release();
                    if (!err) {
                        console.log(homeName);
                        console.log(rows);
                        console.log(getCompleteMatchQuery);
                        console.log('++++++++++++++++++++++++++++');
                        if (rows.length == 1) {
                            resolve(rows);
                        } else {
                            console.log('More than 1 match are queried or match is not complete:' + homeName);
                        }
                    resolve(rows);
                    } else {
                        console.log(err);
                        resolve(0);
                    }
                });
            }
        });
    }).then((response) => {
        return response;
    }); 
}

async function updateResult(result, datetime, homeName, awayName) {
    return new Promise( (resolve) => {
        pool.getConnection(async (err, connection) => {
            let id = 0;
            let updateQuery = "UPDATE less_position_but_higher_odd_match SET result = '" + result +"' WHERE datetime='"
                                + datetime + "' AND home_name='" + homeName + "' AND away_name='" + awayName + "'";
            if(err) throw err
            connection.query(updateQuery, (err, result) => {
                connection.release();
                if (!err) {
                resolve(1);
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

async function getMatchsNotComplete() {
    return new Promise( (resolve) => {
        pool.getConnection(async (err, connection) => {
            let id = 0;
            if(err) throw err
            connection.query("SELECT * FROM less_position_but_higher_odd_match WHERE result = '2'", (err, rows) => {
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

            let sqlInsert = "INSERT INTO match_entity(league_id, datetime, home_name, away_name, home_position, away_position, home_corner, away_corner, total_corner, odd)" + 
                                " VALUES ('"+ leagueId +"','"+ data['datetime'] +"', '"+ data['homeName'] +"','"+ data['awayName'] +"','"+ data['homePosition'] +"','"+ data['awayPosition'] +"','"+ data['homeCorner'] +"','"+ data['awayCorner'] +"','"+ data['totalCorner'] +"','"+ data['odd'] +"')";
            connection.query(sqlInsert, (e, result, fields) => {
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
        return response;
    }); 
}

