let oddFrom = -5;
let oddTo = 5;
let arrayOdd_0_5 = [];
while (oddFrom <= oddTo) {
    arrayOdd_0_5.push(oddFrom);
    oddFrom += 0.5;
}

const MATCH_COUNT = 4;
const fs = require(`fs`);
const mysql = require(`./mysql-await/index`);
const pool = mysql.createPool(JSON.parse(fs.readFileSync(`./mysql-await/mysql-config.json`)));

//random for 0.5 space
(async function run() {
    let dataRandomMatchAll = await getMatchNotCompleteAndNotInListAll();
    let matchsSelectedForAllOdd;
    let matchsSelectedForEachOdd = [];
    
    if (dataRandomMatchAll) {
        matchsSelectedForAllOdd = randomMatch(dataRandomMatchAll, MATCH_COUNT);
        if (matchsSelectedForAllOdd) {
            console.log(matchsSelectedForAllOdd);
            await insertRandomListItem(matchsSelectedForAllOdd, 'all');
        }
    }

    // let dataByOdd;
    // for (let odd of arrayOdd) {
    //     matchsSelectedForEachOdd = await getMatchNotCompleteAndNotInOddList(odd);
    //     dataByOdd = randomMatch(matchsSelectedForEachOdd, MATCH_COUNT);

    //     console.log(dataByOdd);
    //     console.log(odd);
    //     console.log('--------------------------------------');
    //     if (dataByOdd) {
    //         await insertRandomListItem(dataByOdd, odd);
    //     }
    // }
})();

async function getMatchNotCompleteAndNotInListAll() {
    let selectQuery = "SELECT entity_id FROM new_match_today newmatch WHERE newmatch.result = '2' AND newmatch.odd != '0' AND entity_id NOT IN " + 
                        // get all list_id have odd = all and get all match_id in those lists then get NOT IN table less_position_but_higher_odd_match
                    // "(SELECT match_id FROM random_list_item WHERE list_id IN (SELECT entity_id from random_list WHERE odd='all'))" +
                    "(SELECT match_id FROM random_list_item)" +
                    "ORDER BY rand()";
    const connection2 = await pool.awaitGetConnection();
    connection2.on(`error`, (err) => {
        console.error(`Connection error ${err.code}`);
    });

    let result = [];
    result = await connection2.awaitQuery(selectQuery);
    connection2.release();

    return result;
}


function randomMatch(matchs, match_count, failedCount = 0) {
    let arrMatch = [];
    let groupMatch = [];
    let randomResult = [];
    let key;
    for (let match of matchs) {
        arrMatch.push(match.entity_id);
    }
    key = Math.floor(Math.random() * arrMatch.length);

    while (arrMatch.length != 0 || (arrMatch.length < match_count && arrMatch.length % match_count != 0)) {
        if (groupMatch.length == match_count) {
            randomResult.push(groupMatch);
            groupMatch = [];
        }
        key = Math.floor(Math.random() * arrMatch.length);
        groupMatch.push(arrMatch[key]);
        arrMatch.splice(key, 1);
    }

    return randomResult;
    //delete by key
    // console.log(randomResult);
}

async function insertRandomListItem(data, odd) {
    let maxId;
    const connection = await pool.awaitGetConnection();
    connection.on(`error`, (err) => {
        console.error(`Connection error ${err.code}`);
    });
    await connection.awaitBeginTransaction();
    for (let item of data) {
    await connection.awaitQuery(`INSERT INTO random_list(match_count, odd) VALUES (?, ?)`, [data.length, odd]);
    let resultMax = await connection.awaitQuery(`SELECT MAX(entity_id) as max_entity from random_list`);
    maxId = resultMax[0]['max_entity'];

    console.log('aaaa');
        console.log(item);
        for (let it of item) {
            await connection.awaitQuery(`INSERT INTO random_list_item(list_id, match_id) VALUES (?, ?)`, [maxId, it]);
        }
    }

    await connection.awaitCommit();
    connection.release();
    // await pool.awaitEnd();
}