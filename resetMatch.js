const fs = require(`fs`);
const mysql = require(`./mysql-await/index`);
const pool = mysql.createPool(JSON.parse(fs.readFileSync(`./mysql-await/mysql-config.json`)));

(async function run() {
    await ResetMatch();
    console.log('DOne');
})();

async function ResetMatch() {
    let query = "UPDATE new_match_today SET result = 1 WHERE 1";
    const connection2 = await pool.awaitGetConnection();
    connection2.on(`error`, (err) => {
        console.error(`Connection error ${err.code}`);
    });

    let result = [];
    result = await connection2.awaitQuery(query);
    connection2.release();

    return result;
}