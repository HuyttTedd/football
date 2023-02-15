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
        // if (matchsSelectedForAllOdd) {
        //     console.log(matchsSelectedForAllOdd);
        //     await insertRandomListItem(matchsSelectedForAllOdd, 'all');
        // }
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
    let selectQuery = "SELECT entity_id, datetime FROM new_match_today newmatch WHERE newmatch.result = '2' AND newmatch.odd != '0' AND entity_id NOT IN " +
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
    let maxFailCount = 99999;
    let failCount = 0;
    let matchsSelected;
    while(failCount < maxFailCount && !matchsSelected) {
        matchsSelected = getRandom(matchs, match_count);
        failCount++;
    }
    console.log(matchsSelected);
    let arrTimeCheck = [];
}

function getRandom(arr, maxCount) {
    console.log(arr)
    let arrBackup = [...arr];
    let randomIndex;
    let canUseThisArr = false;
    let count = 0;
    let arrStreak = [];

    if (arr.length < maxCount) {
        maxCount = arr.length;
    }

    if (arr.length === maxCount) {
        canUseThisArr = checkValidTime(arr);
        if (!canUseThisArr) {
            return [];
        }
    }

    let maxFailCount = 9999;
    let failCount = 0;

    //if first value chosen is too large. we need to random again
    let failCountAtLength1 = 0;
    let valueSelected = [];
    while (count < maxCount && failCount < maxFailCount) {
        randomIndex = Math.floor(Math.random() * arrBackup.length);
        console.log(randomIndex)
        if (arrStreak.length === 0) {
            arrStreak.push(arrBackup[randomIndex]);
            arrBackup.splice(randomIndex, 1);
            count++;
        } else if (arrStreak.length === 1) {
            if (getSubDateValueAbs(arrBackup[randomIndex].datetime, arrStreak[0].datetime)) {
                if (arrBackup[randomIndex].datetime > arrStreak[0].datetime) {
                    arrStreak.push(arrBackup[randomIndex]);
                } else {
                    arrStreak.unshift(arrBackup[randomIndex]);
                }
                arrBackup.splice(randomIndex, 1);
                sortStreakMinToMax(arrStreak);
                count++;
            }
        } else {
            let lastIndex = arrStreak.length - 1;
            if (getSubDateValue(arrStreak[0].datetime, arrBackup[randomIndex].datetime)) {
                arrStreak.unshift(arrBackup[randomIndex]);
                arrBackup.splice(randomIndex, 1);
                count++;
            } else if (getSubDateValue(arrBackup[randomIndex].datetime, arrStreak[lastIndex].datetime)) {
                arrStreak.push(arrBackup[randomIndex]);
                arrBackup.splice(randomIndex, 1);
                count++;
            }
        }
        failCount++;
        console.log(arrStreak);
    }

    if (failCount === maxFailCount && arrStreak.length < maxCount) {
        return [];
    }
    return arrStreak;
}

function checkValidTime(streak) {
    let canUseThisRandom = true;
    for (let i = 0; i < streak.length; i++) {
        if (((new Date(arrTimeCheck[i].datetime) - new Date(arrTimeCheck[i + 1].datetime)) / 1000) > 7200) {
            canUseThisRandom = false;
            break;
        }
    }

    return canUseThisRandom;
}

function getSubDateValue(dateA, dateB, timeDistance = 7200) {
    let subValue = (new Date(dateA) - new Date(dateB)) / 1000;
    return subValue > timeDistance;
}

function getSubDateValueAbs(dateA, dateB, timeDistance = 7200) {
    let subValue = Math.abs(new Date(dateA) - new Date(dateB)) / 1000;
    return subValue > timeDistance;
}

function sortStreakMinToMax(streak) {
    streak.sort(function (a, b) {
        return new Date(a.datetime) - new Date(b.datetime);
    });

    return streak;
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