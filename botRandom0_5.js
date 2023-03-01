let oddFrom = -5;
let oddTo = 5;
let arrayOdd_0_5 = [];
while (oddFrom <= oddTo) {
    arrayOdd_0_5.push(oddFrom);
    oddFrom += 0.5;
}

let str_0_5 = arrayOdd_0_5.join(',');
str_0_5 = [0.5, -0.5];

const MATCH_COUNT = 3;
const fs = require(`fs`);
const mysql = require(`./mysql-await/index`);
const pool = mysql.createPool(JSON.parse(fs.readFileSync(`./mysql-await/mysql-config.json`)));

//random for 0.5 space
(async function run() {
    let dataRandomMatchAll = await getMatchNotCompleteAndNotInListAll();
    let matchsSelectedForAllOdd;
    if (dataRandomMatchAll) {
        matchsSelectedForAllOdd = randomMatch(dataRandomMatchAll, MATCH_COUNT);
        if (matchsSelectedForAllOdd) {
            await insertRandomListItem(matchsSelectedForAllOdd, '0.5');
        }
    }
})();

async function getMatchNotCompleteAndNotInListAll() {
    let selectQuery = "SELECT entity_id, datetime FROM new_match_today newmatch WHERE newmatch.result = '2' " +
                    "AND newmatch.odd != '0' AND newmatch.odd_converted IN ("+ str_0_5 +") AND entity_id NOT IN " +
                        // get all list_id have odd = all and get all match_id in those lists then get NOT IN table less_position_but_higher_odd_match
                    "(SELECT match_id FROM random_list_item WHERE list_id IN (SELECT entity_id from random_list WHERE odd='0.5'))" +
                    // "(SELECT match_id FROM random_list_item)" +
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
    let maxFailCount = 1000;
    let failCount = 0;
    let streak;
    let totalStreak = [];
    let dataRandom;
    while(failCount < maxFailCount) {
        dataRandom = getRandom(matchs, match_count);
        streak = dataRandom[0];
        matchs = dataRandom[1];
        if (streak.length > 0 && streak.length === match_count) {
            totalStreak.push(streak);
            streak = [];
        }
        failCount++;
    }

    console.log(totalStreak);
    return totalStreak;
}

function getRandom(arr, maxCount) {
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
            return [[], arr];
        }
    }

    let maxFailCount = 1000;
    let failCount = 0;

    //if first value chosen is too large. we need to random again
    let failCountAtLength1 = 0;
    let valueSelected = [];
    while (count < maxCount && failCount < maxFailCount) {
        randomIndex = Math.floor(Math.random() * arrBackup.length);
        if (arrStreak.length === 0) {
            arrStreak.push(arrBackup[randomIndex]);
            arrBackup.splice(randomIndex, 1);
            count++;
            continue;
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
                continue;
            }
        } else {
            let lastIndex = arrStreak.length - 1;
            if (getSubDateValue(arrStreak[0].datetime, arrBackup[randomIndex].datetime)) {
                arrStreak.unshift(arrBackup[randomIndex]);
                arrBackup.splice(randomIndex, 1);
                count++;
                continue;
            } else if (getSubDateValue(arrBackup[randomIndex].datetime, arrStreak[lastIndex].datetime)) {
                arrStreak.push(arrBackup[randomIndex]);
                arrBackup.splice(randomIndex, 1);
                count++;
                continue;
            }
        }
        failCount++;
    }

    if (failCount === maxFailCount || arrStreak.length < maxCount) {
        return [[], arr];
    }
    return [arrStreak, arrBackup];
}

function checkValidTime(streak) {
    let canUseThisRandom = true;
    for (let i = 0; i < streak.length - 1; i++) {
        if (((new Date(streak[i].datetime) - new Date(streak[i + 1].datetime)) / 1000) > 7200) {
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
    let listId;
    const connection = await pool.awaitGetConnection();
    connection.on(`error`, (err) => {
        console.error(`Connection error ${err.code}`);
    });
    await connection.awaitBeginTransaction();
    for (let item of data) {
        await connection.awaitQuery(`INSERT INTO random_list(match_count, odd, result) VALUES (?, ?, ?)`, [item.length, odd, '0']);
        let resultMax = await connection.awaitQuery(`SELECT MAX(entity_id) as max_entity from random_list`);
        listId = resultMax[0]['max_entity'];

        for (let it of item) {
            await connection.awaitQuery(`INSERT INTO random_list_item(list_id, match_id) VALUES (?, ?)`, [listId, it.entity_id]);
        }
    }

    await connection.awaitCommit();
    connection.release();
    // await pool.awaitEnd();
}