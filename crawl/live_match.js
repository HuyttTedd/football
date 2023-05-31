// import { getMainTable } from "../model/resourceModel/liveMatchContent.js";
const fs = require(`fs`);
const puppeteer = require("puppeteer");
const mysql = require(`../mysql-await/index`);
const { exit } = require("process");
const { log } = require("console");
const pool = mysql.createPool(JSON.parse(fs.readFileSync(`./mysql-await/mysql-config.json`)));
const liveUrl = 'https://www.bongdalu4.com/';

const liveTable = require("../model/resourceModel/liveMatchContent.js");
(async function run() {
    let time = new Date().getTime();
    let matchData = await crawlLiveMatch(liveUrl, time);
    let content = matchData[0];
    let json = matchData[1];
    await updateContent(content, json);
    process.exit(1);
})();

async function updateContent(content, json) {
    const connection = await pool.awaitGetConnection();
    try {
        let tableLiveMatch = liveTable();
        await connection.awaitQuery("DELETE FROM "+ tableLiveMatch +" WHERE 1");
        await connection.awaitQuery("INSERT INTO " + tableLiveMatch + " (content,match_data_json) VALUES (?,?)",[content,JSON.stringify(json)]);
    } catch (err) {
        console.log(err);
        fs.writeFileSync('var/log/exception.log', JSON.stringify(err));
    }
    await pool.awaitEnd();
}

async function crawlLiveMatch(url, fileIndex) {
    self = this;
    const browser = await puppeteer.launch({ headless: true,
        defaultViewport: null, 
        args:[
        '--start-maximized'
     ]});
    const page = await browser.newPage();
    await page.goto(url, {timeout:0});

    await page.waitForTimeout(6500);
    await page.evaluate(() => {
        document.querySelector('#li_ShowAll').click();
    });

    await page.waitForTimeout(5000);
    //end crawl data json
    let liveData = await page.evaluate(() => {
        function filterEmptyValueOdd(odd) {
            if (odd == 0 && odd.length == 1) {
              odd = "";
            }

            return odd;
        }

        var resultArray = ["FT", "Treo", "Hoãn", "HT", "Hiệp phụ"];
        //start crawl data json
        let jsonMatchData = {};
        const NULL_STATUS = "undefined";
        document.querySelectorAll('[matchid]').forEach(function (elm) {
        if (elm.className.includes('Leaguestitle')) {
            return;
        }
        let matchId = elm.getAttribute("matchid");
        let TdData = elm.querySelectorAll('td');
        let statusTime = TdData[3]?.innerHTML ? TdData[3]?.innerHTML : NULL_STATUS;
        // if (!resultArray.includes(statusTime) && statusTime == 0 && statusTime.length == 1) {
        //     statusTime = "";
        // }
        jsonMatchData[matchId] = {};
        jsonMatchData[matchId].status_time = statusTime;
        //check score live
        let score = TdData[6]?.firstChild.innerText ? TdData[6]?.firstChild.innerText : NULL_STATUS;
        // score = 'Tips' ? '-' : score;
        if (score == 'Tips') {
            score = '-';
        }
        jsonMatchData[matchId].score_live = score;

        //check booking
        let bookingHomeYellow = TdData[5]?.childNodes[1]?.innerText ? TdData[5]?.childNodes[1]?.innerText : NULL_STATUS;
        let bookingHomeRed = TdData[5]?.childNodes[2]?.innerText ? TdData[5]?.childNodes[2]?.innerText : NULL_STATUS;
        let bookingAwayYellow = TdData[7]?.childNodes[3]?.innerText ? TdData[7]?.childNodes[3]?.innerText : NULL_STATUS;
        let bookingAwayRed = TdData[7]?.childNodes[2]?.innerText ? TdData[7]?.childNodes[2]?.innerText : NULL_STATUS;
        jsonMatchData[matchId].booking = {};
        jsonMatchData[matchId].booking = {};
        jsonMatchData[matchId].booking.home = {};
        jsonMatchData[matchId].booking.away = {};
        jsonMatchData[matchId].booking.home.yellow = bookingHomeYellow;
        jsonMatchData[matchId].booking.home.red = bookingHomeRed;
        jsonMatchData[matchId].booking.away.yellow = bookingAwayYellow;
        jsonMatchData[matchId].booking.away.red = bookingAwayRed;
        //check corner
        let corner = TdData[8]?.firstChild.innerText ? TdData[8]?.firstChild.innerText : NULL_STATUS;
        jsonMatchData[matchId].corner = corner;
        // check ht score
        let htScore = TdData[8]?.childNodes[1]?.innerText ? TdData[8]?.childNodes[1].innerText : NULL_STATUS;
        jsonMatchData[matchId].ht_score = htScore;
        // check odd1
        let data11 = TdData[10]?.firstChild.innerText ? TdData[10]?.firstChild.innerText : NULL_STATUS;
        let data12 = TdData[10]?.childNodes[1]?.innerText ? TdData[10]?.childNodes[1]?.innerText : NULL_STATUS;
        jsonMatchData[matchId].odd1 = {};
        data11 = filterEmptyValueOdd(data11);
        data12 = filterEmptyValueOdd(data12);
        jsonMatchData[matchId].odd1.data1 = data11;
        jsonMatchData[matchId].odd1.data2 = data12;
        // check odd2
        let data21 = TdData[11]?.firstChild.innerText ? TdData[11]?.firstChild.innerText : NULL_STATUS;
        let data22 = TdData[11]?.childNodes[1]?.innerText ? TdData[11]?.childNodes[1]?.innerText : NULL_STATUS;
        jsonMatchData[matchId].odd2 = {};
        jsonMatchData[matchId].odd2.data1 = data21;
        jsonMatchData[matchId].odd2.data2 = data22;
        // check odd3
        let data31 = TdData[12]?.firstChild.innerText ? TdData[12]?.firstChild.innerText : NULL_STATUS;
        let data32 = TdData[12]?.childNodes[1]?.innerText ? TdData[12]?.childNodes[1]?.innerText : NULL_STATUS;
        jsonMatchData[matchId].odd3 = {};
        data31 = filterEmptyValueOdd(data31);
        data32 = filterEmptyValueOdd(data32);
        jsonMatchData[matchId].odd3.data1 = data31;
        jsonMatchData[matchId].odd3.data2 = data32;
        });

        let regOnclick = /onclick="(.*?)"/g;
        let regAds = /<tr id="tr_ad(.*?)class="adtext-bg">(.*?)<\/tr>/g;
        let regAds2 = /<tr style="display:" (.*?)class="adtext-bg">(.*?)<\/tr>/g;
        let regF = /<tr id="trF(.*?)style="display:none"(.*?)<\/tr>/g;
        let regDisplayNoneA = /<tr  style="display:none"><\/tr>/g;
        let regDisplayNoneB = /<tr  style="display:none"(.*?)<\/tr>/g;
        let regId = /[^match]id="(.*?)"/g;
        let regfbHead = / fbHead/g;
        let regOdds = /odds="(.*?)"/g;
        let regSclass = /sclass/g;
        let regLea = /lea/g;
        let regDate = /date="(.*?)"/g;
        let regIndex = /index="(.*?)"/g;
        let regOnmouseover = /onmouseover="(.*?)"/g;
        let regOnmouseout = /onmouseout="(.*?)"/g;
        let regOnmouseenter = /onmouseenter="(.*?)"/g;
        let regOnmouseve = /onmouseve="(.*?)"/g;
        let regImgIn = /\/images\/in.gif/g;
        let regImgStarOff = /\/images\/star_off.png/g;
        let regImgStarOn = /\/images\/star_on.png/g;
        let regImgTv = /\/images\/Vn\/tv.png/g;
        let regOddsHead = /colspan="3" class="oddsHead">(.*?)<\/td>/g;
        let regStatistic = /<td class="data_td">Số liệu<\/td>/g;
        let regAlignMid = /class="tds"/g;
        let regHandpoint = /class="blue handpoint"/g;
        let regTips = /Tips/g;
        let regScoreTitle = /<tr class="scoretitle"(.*?)<\/tr>/g;
        let regResultAtLiveMatch = /<tr class="result-split".+<\/tr>/g;
        let regWidth = /width="6%"/g;
        let data = document.getElementById('live').outerHTML;
        data = data.replace(regOnclick, "")
                    .replace(regAds, "")
                    .replace(regAds2, "")
                    .replace(regF, "")
                    .replace(regfbHead, "")
                    .replace(regOdds, "")
                    .replace(regId, "")
                    .replace(regDisplayNoneA, "")
                    .replace(regDisplayNoneB, "")
                    .replace(regSclass, "")
                    .replace(regIndex, "")
                    .replace(regLea, "")
                    .replace(regDate, "")
                    .replace(regOnmouseover, "")
                    .replace(regOnmouseout, "")
                    .replace(regOnmouseenter, "")
                    .replace(regOnmouseve, "")
                    // .replace(regImgIn, "/images/bling.gif")
                    .replace(regImgStarOff, "/images/star_off.png")
                    .replace(regImgStarOn, "/images/star_on.png")
                    .replace(regImgTv, "")
                    .replace(regOddsHead, `colspan="6">FT HDP/OU</td>`)
                    .replace(regStatistic, "</td>")
                    .replace(regAlignMid, `class="tds align-middle"`)
                    .replace(regHandpoint, `class="blue handpoint" style="text-align:center;"`)
                    .replace(regTips, "-")
                    .replace(regScoreTitle, "")
                    // .replace(regResultAtLiveMatch, "")
                    .replace(regWidth, `width="4%"`);
        return [data, jsonMatchData];
    });
    // fs.writeFileSync('result_text/' + 'data'+fileIndex+'.html', liveData[0]);

    return liveData;
}