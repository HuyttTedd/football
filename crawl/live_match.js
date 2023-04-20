const fs = require(`fs`);
const puppeteer = require("puppeteer");
const mysql = require(`../mysql-await/index`);
const { exit } = require("process");
const { log } = require("console");
const pool = mysql.createPool(JSON.parse(fs.readFileSync(`./mysql-await/mysql-config.json`)));
const liveUrl = 'https://www.bongdalu4.com/';
const reg = /onclick="(.*?)"/g;
(async function run() {
    let time = new Date().getTime();
    let dataRandomMatchAll = await crawlLiveMatch(liveUrl, time);
    process.exit(1);
})();

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

    await page.waitForTimeout(4000);
    let liveData = await page.evaluate(() => {
        let regOnclick = /onclick="(.*?)"/g;
        let regAds = /<tr id="tr_ad(.*?)class="adtext-bg">(.*?)<\/tr>/g;
        let regF = /<tr id="trF(.*?)style="display:none"(.*?)<\/tr>/g;
        let regDisplayNoneA = /<tr  style="display:none"><\/tr>/g;
        let regDisplayNoneB = /<tr  style="display:none"(.*?)<\/tr>/g;
        let regId = /id="(.*?)"/g;
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
        let regOddsHead = /class="oddsHead">(.*?)<\/td>/g;
        let regStatistic = /<td class="data_td">Số liệu<\/td>/g;
        let data = document.getElementById('live').outerHTML;
        data = data.replace(regOnclick, "")
                    .replace(regAds, "")
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
                    .replace(regImgIn, "/pub/images/bling.gif")
                    .replace(regImgStarOff, "/pub/images/star_off.png")
                    .replace(regImgStarOn, "/pub/images/star_on.png")
                    .replace(regImgTv, "")
                    .replace(regOddsHead, "</td>")
                    .replace(regStatistic, "</td>");
        return data;
    });
    fs.writeFileSync('result_text/' + 'data'+fileIndex+'.html', liveData);
}