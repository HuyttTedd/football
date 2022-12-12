// const arrayOdd = [0.25, -0.25, 0.5, -0.5, 0.75, -0.75, 1, -1, 1.25, -1.25, 1.5, -1.5, 1.75, -1.75, 2, -2, 2.25, -2.25, 2.5, -2.5, 2.75, -2.75, 3, -3];
const arrayOdd = [0.25, -0.25];
const MATCH_COUNT = 3;
const fs = require(`fs`);
const mysql = require(`./mysql-await/index`);
const pool = mysql.createPool(JSON.parse(fs.readFileSync(`./mysql-await/mysql-config.json`)));

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
    for (let odd of arrayOdd) {
        matchsSelectedForEachOdd = await getMatchNotCompleteAndNotInOddList(odd);
        dataByOdd = randomMatch(matchsSelectedForEachOdd, MATCH_COUNT);

        console.log(dataByOdd);
        console.log(odd);
        console.log('--------------------------------------');
        if (dataByOdd) {
            await insertRandomListItem(dataByOdd, odd);
        }
    }
})();

async function insertRandomListItem(data, odd) {
    let insertResult, maxId;
    const connection = await pool.awaitGetConnection();
    connection.on(`error`, (err) => {
        console.error(`Connection error ${err.code}`);
    });

    await connection.awaitBeginTransaction();
    await connection.awaitQuery(`INSERT INTO random_list(match_count, odd) VALUES (?, ?)`, [data.length, odd]);
    let resultMax = await connection.awaitQuery(`SELECT MAX(entity_id) as max_entity from random_list`);
    maxId = resultMax[0]['max_entity'];

    for (let item of data) {
        await connection.awaitQuery(`INSERT INTO random_list_item(list_id, match_id) VALUES (?, ?)`, [maxId, item['entity_id']]);
    }

    await connection.awaitCommit();
    connection.release();
    // await pool.awaitEnd();
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
    let selectQuery = "SELECT * FROM less_position_but_higher_odd_match lpbhom WHERE lpbhom.result = '2' AND entity_id NOT IN " + 
                        // get all list_id have odd = all and get all match_id in those lists then get NOT IN table less_position_but_higher_odd_match
                    "(SELECT match_id FROM random_list_item WHERE list_id IN (SELECT entity_id from random_list WHERE odd='all'))" +
                    "ORDER BY lpbhom.entity_id ASC";
    const connection2 = await pool.awaitGetConnection();
    connection2.on(`error`, (err) => {
        console.error(`Connection error ${err.code}`);
    });

    let result = [];
    result = await connection2.awaitQuery(selectQuery);
    connection2.release();

    return result;
}

async function getMatchNotCompleteAndNotInOddList(odd) {
    let selectQuery = "SELECT * FROM less_position_but_higher_odd_match lpbhom WHERE lpbhom.result = '2' AND entity_id NOT IN " + 
                        // get all list_id have odd = all and get all match_id in those lists then get NOT IN table less_position_but_higher_odd_match
                    "(SELECT match_id FROM random_list_item WHERE list_id IN (SELECT entity_id from random_list WHERE odd='" + odd + "'))" +
                    "ORDER BY lpbhom.entity_id ASC";
    let result = [];
    const connection3 = await pool.awaitGetConnection();
    connection3.on(`error`, (err) => {
        console.error(`Connection error ${err.code}`);
    });
    result = await connection3.awaitQuery(selectQuery);
    connection3.release();

    return result;
}