var ServerUrl = "127.0.0.1";
var server_Password = "MyPassword";

function isJsonString(str) {
try {
JSON.parse(str);
} catch (e) {
return false;
}
return true;
}

function RequestAPI(path, data) {
var pp = $.ajax({
url: "http://" + ServerUrl + ":4545/" + path,
type: "POST",
async: false,
data: data,
headers: {
password: server_Password,
},
});
if (isJsonString(pp.responseText))
return JSON.parse(pp.responseText);
else
return pp.responseText;
}

const Bot_Status = {
0: "Disconnected",
1: "Connected",
2: "Banned",
3: "Suspended",
4: "Wrong_Password",
5: "Update_Required",
6: "Maintenance",
7: "AAP",
8: "LogonATTEMPTS",
9: "OnSendToServer",
10: "Captcha",
11: "Success",
12: "SERVER_OVERLOADED",
13: "BypassTutorial",
};

function updateList() {
var Response = RequestAPI("runScript", {
script:
'for k,v in pairs(getAllBot) do \nping = v:getMs()\nworld = v:getCurrentWorld()\nstatus = v:getBotStatus()\ngrowid = v:getLocal().name\nprint(growid.."|"..status.."|"..world.."|"..ping)\nend',
});

var Output = RequestAPI("getOutput", {
scriptID: Response["scriptID"],
}).split("\n");

const parsedData = Output.map((item) => {
const [growID, Status, World, Ping] = item.split("|");
if (growID == "") {
return null;
}
return { growID, Status, World, Ping };
}).filter(item => item !== null);

const table = document.getElementById("myTable");
const tbody = table.querySelector("tbody");
tbody.innerHTML = "";

for (let i = 0; i < parsedData.length; i++) {
const row = document.createElement("tr");
const cell1 = document.createElement("td");
const cell2 = document.createElement("td");
const cell3 = document.createElement("td");
const cell4 = document.createElement("td");
const cell5 = document.createElement("td");
const cell6 = document.createElement("td");
cell1.textContent = i;
cell2.textContent = parsedData[i].growID;
cell3.textContent = Bot_Status[parsedData[i].Status];
cell4.textContent = parsedData[i].World;
cell5.textContent = parsedData[i].Ping;

cell6.innerHTML = '<button onclick="warp(\'' + parsedData[i].growID + '\')"type="button">Warp</button>';

row.appendChild(cell1);
row.appendChild(cell2);
row.appendChild(cell3);
row.appendChild(cell4);
row.appendChild(cell5);
row.appendChild(cell6);

tbody.appendChild(row);
}
}

function warp(botName) {
let WorldName = prompt("Please enter the World Name");
RequestAPI("runScript", {
script: 'getBot("' + botName + '"):warp("' + WorldName + '")',
});
}

updateList();
setInterval(updateList, 5000);
