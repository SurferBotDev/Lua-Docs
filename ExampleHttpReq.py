from time import sleep
import time
import requests


def executeScript(script):
    url = "http://127.0.0.1:4545/runScript"
    payload={'script': script}
    headers = {
    'Password': 'MyPassword'
    }
    response = requests.request("POST", url, headers=headers, data=payload).json()
    if(response["Status"]):
        return response["scriptID"]
    else:
        return -1
    
def stopScript(scriptID):
    url = "http://127.0.0.1:4545/stopScript"
    payload={'scriptID': scriptID}
    headers = {
    'Password': 'MyPassword'
    }
    response = requests.request("POST", url, headers=headers, data=payload).json()
    return response["Status"]

def getOutput(scriptID):
    url = "http://127.0.0.1:4545/getOutput"
    payload={'scriptID': scriptID}
    headers = {
    'Password': 'MyPassword'
    }
    response = requests.request("POST", url, headers=headers, data=payload)
    return response.text

def getStatus(scriptID):
    url = "http://127.0.0.1:4545/status"
    payload={'scriptID': scriptID}
    headers = {
    'Password': 'MyPassword'
    }
    response = requests.request("POST", url, headers=headers, data=payload).json()
    return response

def getGrowID():
    scriptID = executeScript("print(getBot():getLocal().name)")
    while(getStatus(scriptID)["Running"] ):
        sleep(0.05)
    return getOutput(scriptID)

def addBot(growid,password):
    executeScript(f'connect("{growid}","{password}")')


scriptID = executeScript(
"""
targetWorld="zzz"
getBot():warp(targetWorld)
while getBot():getCurrentWorld() ~= targetWorld do
Sleep(1)
end
print("Current World Name "..getBot():getCurrentWorld())
""")

while(getStatus(scriptID)["Running"] ):
    print("Script is running, waiting to stop")
    sleep(0.5)
    
print("Script Output : "+getOutput(scriptID))

print("Bot GrowID : "+getGrowID())

addBot("id","pw")
