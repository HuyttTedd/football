// Log to console
function random_item(items)
{
  
return items[Math.floor(Math.random()*items.length)];
     
}

function getRandom(arr, num) {
    let arrBackup = [...arr];
    let count = 0;
    let arrRandom = [];
    while (count < num) {
      randomElementIndex = Math.floor(Math.random()*arrBackup.length);
      arrRandom.push(arrBackup[randomElementIndex]);
      // arr.splice(2, 1, 'tmp');	// Replaces 1 item at index 2 with 'tmp'
      arrBackup.splice(randomElementIndex, 1);
      count++;
    }
    return arrRandom;
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
    if (failedCount <= 1 && !canUseThisRandom) {
        return randomMatch(matchs, match_count, failedCount + 1);
    } else {
        return [];
    }
}

let dataRandomMatchAll = [
  {
    entity_id: 137,
    league_name: null,
    datetime: '2022-12-01 11:00:00'
  },
  {
    entity_id: 137,
    league_name: null,
    datetime: '2022-12-08 12:00:00'
  },
  {
    entity_id: 137,
    league_name: null,
    datetime: '2022-12-09 10:00:00'
  }
]

// console.log(randomMatch(dataRandomMatchAll, 2))
leagueName = "abc'";
if (leagueName.includes("'")) {
    leagueName = leagueName.replace("'", "");
}
console.log(leagueName);