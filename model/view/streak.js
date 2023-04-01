const express = require('express')
const fs = require('fs');
const app = express()
app.set("view engine", "ejs");
const port = process.env.PORT || 5003;
app.use(express.urlencoded({extended: true})); // New
// Parse application/json
// app.use(bodyParser.json()); // Remove
app.use(express.json()); // New

// MySQL Code goes here
const mysql = require(`./../../mysql-await/index`);
const pool = mysql.createPool(JSON.parse(fs.readFileSync(`./mysql-await/mysql-config.json`)));

// Listen on enviroment port or 5000
app.listen(port, () => console.log(`Listening on port ${port}`))

app.get('/view/streak.html', async (req, res) => {
    let streak = await getStreak();
    let dataStreak = {};
    let itemStreak = [];
    let listIdFlag = false;
    let m, checkResult;
    sortStreakByListId(streak);
    for (let item of streak) {
        if (!dataStreak[item['list_id']]) {
            dataStreak[item['list_id']] = [];
        }
        // check result
        checkResult = await checkResultData(item);
        item['home_result'] = 'Not done';
        item['away_result'] = 'Not done';
        if (typeof checkResult[0] !== 'undefined') {
            item['home_result'] = checkResult[0]['home_result'];
            item['away_result'] = checkResult[0]['away_result'];
        }
        // start to my time
        let formatDateTime = new Date(item['datetime']);
        formatDateTime.setTime(formatDateTime.getTime() + 7 * 60 * 60 * 1000);
        item['datetime'] = formatDateTime.toLocaleString();
        // end to my time
        dataStreak[item['list_id']].push(item);
    }

    // for (let item in dataStreak) {
    //     console.log(item)
    //     console.log(dataStreak[item])
    // }

    res.render("streak.ejs", { streak, dataStreak });
})

async function getStreak() {
    let selectQuery = "SELECT * FROM random_list rl INNER JOIN random_list_item rlitem ON rl.entity_id = rlitem.list_id INNER JOIN new_match_today nm ON nm.entity_id = rlitem.match_id";
    const connection = await pool.awaitGetConnection();
    connection.on(`error`, (err) => {
        console.error(`Connection error ${err.code}`);
    });

    let result = await connection.awaitQuery(selectQuery);
    connection.release();
    return result;
}

async function checkResultData(item) {
    let homeName = item['home_name'];
    let awayName = item['away_name'];
    let datetime = item['datetime'].split(' ')[0];
    const connection = await pool.awaitGetConnection();
    connection.on(`error`, (err) => {
        console.error(`Connection error ${err.code}`);
    });

    let result = await connection.awaitQuery(`SELECT * FROM match_result_entity WHERE home_name = ? AND away_name = ? AND datetime = ?`, [homeName, awayName, datetime]);
    connection.release();
    return result;
}

function sortStreakByListId(streak) {
    streak.sort(function (a, b) {
        return a.list_id - b.list_id;
    });

    return streak;
}