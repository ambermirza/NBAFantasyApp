const NBA = require("nba");
const kp = NBA.findPlayer('Kristaps Porzingis');
//console.log(kp);

//const stat = NBA.stats.playerSplits(204001);
//console.log(stat);


//NBA.stats.playerStats({ PlayerID: kp.playerId }).then(console.log);
//NBA.stats.playerClutch({PlayerID: kp.playerId}).then(console.log);

//var txtFile = "/tmp/test.txt";
//var file = new File(txtFile, "write");
//var str = JSON.stringify(NBA.findPlayer('Kristaps Porzingis'));

var fs = require("fs");


fs.writeFile("./object.json", JSON.stringify(kp, null, 4), (err) => {
	if (err) {
	    console.error(err);
	    return;
	};
	console.log("File has been created");
    });