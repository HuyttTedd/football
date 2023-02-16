const express = require('express')
const fs = require('fs');
const app = express()
app.set("view engine", "ejs");
const port = process.env.PORT || 5002;
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
    sortStreakByListId(streak);
    for (let item of streak) {
        if (!dataStreak[item['list_id']]) {
            dataStreak[item['list_id']] = [];
        }
        dataStreak[item['list_id']].push(item);
    }

    for (let item in dataStreak) {
        console.log(item)
        console.log(dataStreak[item])
    }

    res.render("streak.ejs", { streak, dataStreak });
})

async function getStreak() {
    let selectQuery = "SELECT * FROM random_list rl INNER JOIN random_list_item rlitem ON rl.entity_id = rlitem.list_id INNER JOIN new_match_today nm ON nm.entity_id = rlitem.match_id WHERE result = 2";
    const connection = await pool.awaitGetConnection();
    connection.on(`error`, (err) => {
        console.error(`Connection error ${err.code}`);
    });

    let result = await connection.awaitQuery(selectQuery);
    connection.release();
    return result;
}

function sortStreakByListId(streak) {
    streak.sort(function (a, b) {
        return a.list_id - b.list_id;
    });

    return streak;
}