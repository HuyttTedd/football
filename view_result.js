const express = require('express')
const bodyParser = require('body-parser')
const mysql = require('mysql')
const arrayOdd = [0.25, -0.25, 0.5, -0.5, 0.75, -0.75, 1, -1, 1.25, -1.25, 1.5, -1.5, 1.75, -1.75, 2, -2, 2.25, -2.25, 2.5, -2.5, 2.75, -2.75, 3, -3];
const app = express()
app.set("view engine", "ejs");
const port = process.env.PORT || 5002;
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
    // port            : '3309'
});

// Listen on enviroment port or 5000
app.listen(port, () => console.log(`Listening on port ${port}`))

app.get('/result', async (req, res) => {
    let rows = await getResultMatchComplete();
    let dataByOdd = {};
    for await (let odd of arrayOdd) {
        dataByOdd[odd] = await getResultMatchCompleteByOdd(odd);
    }

    res.render("view_result.ejs", { rows, dataByOdd });
})


async function getResultMatchComplete() {
    return new Promise( (resolve) => {
        pool.getConnection(async (err, connection) => {
            let id = 0;
            if(err) throw err
            connection.query("SELECT * FROM less_position_but_higher_odd_match WHERE result != '2' ORDER BY entity_id ASC", (err, rows) => {
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

async function getResultMatchCompleteByOdd(odd) {
    return new Promise( (resolve) => {
        pool.getConnection(async (err, connection) => {
            let id = 0;
            if(err) throw err
            connection.query("SELECT * FROM less_position_but_higher_odd_match WHERE result != '2' AND odd='" + odd + "' ORDER BY entity_id ASC", (err, rows) => {
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