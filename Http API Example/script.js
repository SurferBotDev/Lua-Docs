const ServerUrl = "127.0.0.1";
const serverPassword = "MyPassword";

function isJsonString(str) {
  try {
    JSON.parse(str);
    return true;
  } catch (e) {
    return false;
  }
}

async function requestAPI(path, data) {

    const formData = new FormData();
    for (const key in data) {
      formData.append(key, data[key]);
    }

    const response = await fetch(`http://${ServerUrl}:4545/${path}`, {
    method: "POST",
    headers: {
      "password": serverPassword,
    },
    body: formData
  });

  const responseText = await response.text();
  return isJsonString(responseText) ? JSON.parse(responseText) : responseText;
}

const BotStatus = [
  "Disconnected",
  "Connected",
  "Banned",
  "Suspended",
  "Wrong Password",
  "Update Required",
  "Maintenance",
  "AAP",
  "Logon ATTEMPTS",
  "On Send To Server",
  "Captcha",
  "Success",
  "SERVER OVERLOADED",
  "Bypass Tutorial",
];

async function updateList() {
  const response1 = await requestAPI("runScript", {
    script: `
      for k, v in pairs(getAllBot) do
        ping = v:getMs()
        world = v:getCurrentWorld()
        status = v:getBotStatus()
        growid = v:getLocal().name
        print(growid .. "|" .. status .. "|" .. world .. "|" .. ping)
      end
    `
  });

await new Promise(resolve => setTimeout(resolve, 100));

const response2 = await requestAPI("getOutput", {
    scriptID: response1.scriptID
 });

const output = response2.split("\n");
const parsedData = output.map(item => {
    const [growID, status, world, ping] = item.split("|");
    if (growID === "") {
      return null;
    }
    return { growID, status, world, ping };
}).filter(item => item !== null);

const table = document.getElementById("myTable");
const tbody = table.querySelector("tbody");
tbody.innerHTML = "";

parsedData.forEach((data, i) => {
  const row = document.createElement("tr");
  
  row.appendChild(document.createElement("td")).textContent = i;
  row.appendChild(document.createElement("td")).textContent = data.growID;
  row.appendChild(document.createElement("td")).textContent = BotStatus[data.status];
  row.appendChild(document.createElement("td")).textContent = data.world;
  row.appendChild(document.createElement("td")).textContent = data.ping;

  const cell6 = document.createElement("td");
  cell6.innerHTML = `<button onclick="warp('${data.growID}')" type="button">Warp</button>`;
  row.appendChild(cell6);

  tbody.appendChild(row);
});
}

function warp(botName) {
  const worldName = prompt("Please enter the World Name");
  RequestAPI("runScript", {
    script: `getBot('${botName}'):warp('${worldName}')`,
  });
}

updateList();
setInterval(updateList, 1000);
