# Functions
* [getBot](#getbot)
* [sendPacket](#sendpacket)
* [SendPacketRaw](#sendpacketraw)
* [findPath](#findpath)
* [getLocal](#getlocal)
* [getInventory](#getinventory)
* [getPlayers](#getplayers)
* [getObjects](#getobjects)
* [getTile](#gettile)
* [getTiles](#gettiles)
* [checkFlag](#checkflag)
* [hasAccessToTile](#hasaccesstotile)
* [getItemInfo](#getiteminfo)
* [isSolid](#issolid)
* [isSeed](#isseed)
* [canHarvest](#canharvest)
* [placeTile](#placetile)
* [hitTile](#hittile)
* [wrenchTile](#wrenchtile)
* [warp](#warp)
* [move](#move)
* [setPos](#setpos)
* [say](#say)
* [getAllBot](#getallbot)
* [useDoor](#usedoor)
* [isInside](#isinside)
* [collectObject](#collectobject)
* [inWorld](#inworld)
* [itemExist](#itemexist)
* [getItemCount](#getitemcount)
* [getSeedTime](#getseedtime)
* [inWorld](#inworld)
* [getWorld](#getworld)
* [autoCollect](#autocollect)
* [getCurrentWorld](#getcurrentworld)
* [getBotStatus](#getbotstatus)
* [getEnetStatus](#getenetstatus)
* [reConnect](#reconnect)
* [connect](#connect)
* [addGuest](#addguest)
* [loginGuest](#loginguest)
* [updateProxy](#updateproxy)
* [setMac](#setmac)
* [updateBot](#updatebot)
* [remove](#remove)
* [getMs](#getms)
* [setBool](#setbool)
* [removeWorld](#removeworld)
* [addWorld](#addworld)
* [createUbi](#createubi)
* [getIndex](#getindex)
* [getID](#getid)

* [httpReq](#httpreq)
* [hwid](#hwid)
* [msgBox](#msgbox)
* [scan](#scan)
* [readFile](#readfile)
* [moveFile](#movefile)
* [writeFile](#writefile)


## getBot
`getBot(string botname)`

`getBot(int botID)`

`getBot() -> Selected bot`


https://user-images.githubusercontent.com/58826689/235254325-1ea20c15-f9c3-4965-8929-0ff25a6dda4e.mp4


Return bot from list

Example:
```lua
bot = getBot("growid")
bot:sendPacket("action|respawn", 2)
bot:move(RIGHT,1)
log("GrowID ",bot:getLocal().name)
```


## sendPacket
`sendPacket( string packet, int type)`

Sends text packet with selected type to client .

Example:
```lua
-- Sends respawn packet to server
sendPacket("action|respawn", 2)
```

## sendPacketRaw
`sendPacketRaw( GamePacket packet)`

Sends [GamePacket](Structs.md#gamepacket) to server.

Example:
```lua
-- Sends wear clothing packet to server
packet = {}
packet.type = 10 
packet.int_data = 48 -- Clothing ID (Jeans)
sendPacketRaw(packet)
```

## findPath
`findPath(int x, int y)`

Finds path to selected x,y

Example:
```lua
-- Finds path to top left corner of the world
if findPath(0, 0) then
log("Path Found Successfully")
else
log("Failed to Find Path")
end
if
```

## getLocal
`getLocal()`

Returns table of  [NetAvatar](Structs.md#netavatar)


Example:
```lua
-- Logs local players name
me = getLocal()
log(me.name)
```

## getInventory
`getInventory()`

Returns table of [InventoryItems](Structs.md#inventoryitem)

Example:
```lua
-- Logs all item ids in your inventory
for _,cur in pairs(getInventory()) do
log(cur.id)
end
```

## getPlayers
`getPlayers()`

Returns table of [NetAvatars](Structs.md#netavatar)

Example:
```lua
-- Logs current worlds players names
for _,player in pairs(getPlayers()) do
log(player.name)
end
```

## getObjects
`getObjects()`

Returns table of [WorldObjects](Structs.md#worldobject)

Example:
```lua
-- Logs current worlds objects item id's
for _,object in pairs(getObjects()) do
log(object.id)
end
```

## getTile
`getTile(int x, int y)`


https://user-images.githubusercontent.com/58826689/235254798-594f43d7-4956-43d4-826b-c9e1d917b7cf.mp4


Returns world [Tile](Structs.md#tile) in selected position

Example:
```lua
-- Logs top left corners foreground block id
tile = getTile(0, 0)
log(tile.fg)
```
```lua
tile = getTile(0, 0)
if tile.extra.extraType == Provider then
	if tile.extra.ready then
		log("The Provider is Ready To Collect")
	else
		log("The Provider is not Ready To Collect")
  end
elseif tile.extra.extraType == Vending then
	if tile.extra.each then
		log(tile.extra.price, " World Locks Each")
	else
		log(tile.extra.price, " per World Lock")
	end
end

```

## getTiles
`getTiles()`

Returns table of [Tiles](Structs.md#tile)

Example:
```lua
-- Logs current worlds all foreground block id's
for _,tile in pairs(getTiles()) do
log(tile.fg)
end
```

## checkFlag
`checkFlag(int x,int y,enum Flag)`

Example:
```lua
if checkFlag(0, 0,flagType.WATER) then
log("Tile 0, 0 is WATER")
end

if checkFlag(0, 0,flagType.LOCKED) then
log("Tile 0, 0 is Locked")
end

if checkFlag(0, 0,flagType.PUBLIC) then
log("Tile 0, 0 is Public Area.")
end

if checkFlag(0, 0,flagType.FIRE) then
log("Tile 0, 0 is on FIRE")
end

if checkFlag(0, 0,flagType.WATER) and checkFlag(0, 0,flagType.PUBLIC) then
log("Tile 0, 0 is Water And Public")
end

if checkFlag(0, 0,flagType.LOCKED) and hasAccessToTile(0, 0) then
log("Tile 0, 0 is Locked but bot have access.")
end

```


## hasAccessToTile
`hasAccessToTile(int x,int y)`

Return true if Access To x,y , false if it's not


Example:
```lua
if hasAccessToTile(0, 0) then
log("Bot Has Access To 0 0 Tile.")
else
log("Bot Does Not Have Access to the 0 0 Tile.")
end

```


## getItemInfo
`getItemInfo(int itemid)`

Returns [ItemInfo](Structs.md#iteminfo) of selected Item ID

Example:
```lua
local ItemInfo = getItemInfo(2) --dirt
log("name: ", ItemInfo.name)
log("id: ", ItemInfo.id)
log("rarity: ", ItemInfo.rarity)
log("growTime: ", ItemInfo.growTime)
log("breakHits: ", ItemInfo.breakHits)
log("dropChance: ", ItemInfo.dropChance)
log("itemCategory: ", ItemInfo.itemCategory)
log("untradeable: ", ItemInfo.untradeable)
```

## isSolid
`isSolid(int x, int y)`

Returns true if block is solid and false if its not

Example:
```lua
if isSolid(0, 0) then
log("Tile 0, 0 is solid")
else
log("Tile 0, 0 is not solid")
end
```

## isSeed
`isSeed(int x, int y)`

Returns true if tile is seed , false if its not

Example:
```lua
if isSeed(0, 0) then
log("Tile 0, 0 is Seed")
else
log("Tile 0, 0 is not Seed")
end
```

## canHarvest
`canHarvest(int x, int y)`
Returns true if tile is harvestable , false if  not

Example:
```lua
if canHarvest(0, 0) then
log("Tile 0, 0 is harvestable")
else
log("Tile 0, 0 is not harvestable")
end
```

## hitTile
`hitTile(int x, int y)`

Send Punch Packet To X,Y

Example:
```lua
---Punch To 0,0
hitTile(0,0)

```

## wrenchTile
`wrenchTile(int x, int y)`

Send Wrench Packet To x,y

Example:
```lua
---Wrench To 0,0

wrenchTile(0,0)

```

## placeTile
`placeTile(int x,int y,int blockid)`

Place Block To x,y

Example:
```lua
---Place Dirt To 0,0
placeTile(0,0,2)

```

## warp
`warp(string x)`

Warp To x

Example:
```lua
warp("BUYGHC")

```

## move
`move(enum MOVE,int speed)`

Example:
```lua
-- Speed Default Value 1, Max Value 10
move(RIGHT,1)
move(LEFT,1)
move(UP,1)
move(DOWN,1)


```

## setPos
`setPos(int x,int y)`

Example:
```lua
--- Set bot position to x 0 y 0
setPos(0,0)
```
## say
`say(string text)`

Example:
```lua
-- Send chat message
say("Hello")
```

## getAllBot

Example:
```lua
for k,v in pairs(getAllBot()) do 
v:say("hi")
end
```

## useDoor
`useDoor(int x,int y)`

Example:
```lua
useDoor(0,0)
```

## isInside
`isInside(int x,int y,int rad)`

Example:
```lua
if isInside(0, 0,5) then
log("x 0, y 0 is in inside")
else
log("x 0, y 0 is not inside")
end
```

## collectObject
`collectObject(int uid)`

Example:
```lua
-- Collecting Object With UID
for _,object in pairs(getObjects()) do
collectObject(object.uid)
end


```
## inWorld
`inWorld()`

Example:
```lua
if inWorld() then
log("in world")
else
log("not in world")
end
```

## getWorld
`getWorld()`
Returns [World](Structs.md#world)

Example:
```lua
if inWorld() then
x = getWorld()
log("Current World Name is :",x.name)
if x.timer == 0 then
log("this world no have timer")
else
log("this world have timer",x.timer," minutes")
end
else
log("not in world")
end
```

## itemExist
`itemExist(int itemid)`

Example:
```lua
if itemExist(2) then
log("Dirt Exist In Inventory")
else
log("Dirt Not Exist In Inventory")
end
```

## getItemCount
`getItemCount(int itemid)`

Example:
```lua
if getItemCount(2)>100 then
log("the amount of dirt is higher than 100")
else
log("the amount of dirt is less than 100")
end
```

## getSeedTime
`getSeedTime(int x, int y)`

Return Seed time as Miliseconds

if return as -1 tile its not seed

if return as 0 seed is ready.

Example:
```lua
if getSeedTime(0, 0) == 0 then
log("Tile 0, 0 is harvestable")
else
log("Tile 0, 0 is not harvestable")
end
```
```lua
seedtime=bot:getSeedTime(0,0) 
SeedID=bot:getTile(0,0).fg
growtime=bot:getItemInfo(SeedID).growTime
log("Seeds Ready In ",getTimeString(growtime-seedtime))
--output Seeds Ready In '7 days, 15 hours, 27 mins, 25 secs'


```
```lua
if getSeedTime(0, 0) == -1 then
log("Tile 0, 0 is not Seed")
else
log("Tile 0, 0 is Seed")
end
```

## getCurrentWorld
`getCurrentWorld()`

Example:
```lua
if inWorld() then
log("Current World Name is :",getCurrentWorld())
else
log("not in world")
end
```

## isEquipped
`isEquipped(item ID)`

Example:
```lua
local targetItemID = 2204;
if isEquipped(targetItemID) then
log(getItemInfo(targetItemID).name," is equiped")
else
log(getItemInfo(targetItemID).name," is not equiped")
end
```

## getSignal 
`getSignal()`

Example:
```lua
local currentSignal = getSignal()

if not isEquipped(2204) then-- check geiger is isEquipped
  log("Geiger is not Equipped")
elseif currentSignal == RAPIDGREEN then
  log("Geiger Signal Color : ","RAPID GREEN")
elseif currentSignal == GREEN then
  log("Geiger Signal Color : ","GREEN")
elseif currentSignal == YELLOW then
  log("Geiger Signal Color : ","YELLOW")
elseif currentSignal == RED then
  log("Geiger Signal Color : ","RED")
else
  log("Geiger Signal Color : ","NULL")
end
```

## autoCollect
`autoCollect(int collectrange,bool autocollect)`

Example:
```lua
-- Disable/Enable AutoCollect.
autoCollect(10,true) -- Enable Auto Collect With 10 Range.
autoCollect(10,false) -- Disable Auto Collect.
```


## getBotStatus
`getBotStatus()`

Example:
```lua
 if getBotStatus() == Success then
      log("Success")
    elseif getBotStatus() == OnSendToServer then
      log("OnSendToServer")
    elseif getBotStatus() == Suspended then
      log("Suspended")
    elseif getBotStatus() == Disconnected then
      log("Disconnected")
    end
```
```c++
-- Enum Information
enum Bot_Status
{
    Disconnected,
    Connected,
    Banned,
    Suspended,
    Wrong_Password,
    Update_Required,
    Maintenance,
    AAP,
    LogonATTEMPTS,
    OnSendToServer,
    Captcha,
    Success,
    SERVER_OVERLOADED,
    BypassTutorial,
    Unable_to_create_new_account,
    InvalidEmail,
    guestCaptcha
};
```


## getEnetStatus
`getEnetStatus()`

Example:
```lua
    if getEnetStatus() == Connected then
      log("Connected")
    elseif getEnetStatus() == Disconnected then
      log("Disconnected")
    elseif getEnetStatus() == ShadowBan then
      log("ShadowBan")
    end
```
```c++
-- Enum Information
enum Enet_Status
{
    Disconnected,
    Connected,
    ShadowBan
};
```

## reConnect
`reConnect()`

reConnect the bot

```lua
getBot("id"):reConnect()
```

## disconnect
`disconnect()`

Disconnect the bot


```lua
getBot("id"):disconnect()
```

## remove
`remove()`

Remove the bot from list ( QUIT )

```lua
getBot("id"):remove()
```
## getMs
`getMs()`

Return bot MS ( Ping ) 


```lua
getBot("id"):getMs()
```

## setBool
`setBool()`

enable/disable feature for bot

Feature List : 
```
rotation
autoCollect
skipTutorial
autoReconnect
autoAccess
adminDetector -- if a admin joins the world bot will leave the world
modLeave  -- if a moderator or guardian joins the world bot will leave the world
modUnaccess
modDisconnect -- disconnect and disable auto - reconnect
ignoreGem -- (autoCollect)
```
Example : 
```lua
setBool("autocollect",false) --Disable AutoCollect
setBool("autocollect",true) --Enable AutoCollect
setBool("skipTutorial",false) --Disable skipTutorial
setBool("ignoreGem",false) --Disable ignoreGem on autoCollect
setBool("rotation",true) --Enable rotation
```


## connect
`connect(string growid,string password,table Botnet/Socks5 Information)`

Example:
```lua
local botID = connect("mygrowid","mypassword") -- Without Socks5/Botnet

Proxy = {
HostName="ipaddress:port",
Username="MyUsername",
Password="MyPassword",
Type=SOCKS5--SOCKS5/BOTNET
}

connect("mygrowid","mypassword",Proxy) -- With Socks5


connect("surferbot@gmail.com","surfer@",Proxy) -- Ubisoft Connect Account

```


## addGuest
`addGuest(string GrowID,table Botnet/Socks5 Information)`

Example:
```lua
Proxy = {
HostName="127.0.0.1:5555",
Username="MyUsername",
Password="MyPassword",
Type=SOCKS5 --SOCKS5/BOTNET
}

local botID = addGuest("") -- with a random GrowID
addGuest("GrowID") -- with a custom GrowID, without SOCKS5
addGuest("",Proxy) -- with SOCKS5 and a random GrowID
addGuest("GrowID",Proxy) -- with SOCKS5 and a custom GrowID

```

## loginGuest
`loginGuest(string GrowID,table Botnet/Socks5 Information,string guestInfo (session Information) )`

Example:
```lua
Proxy = {
HostName="127.0.0.1:5555",
Username="MyUsername",
Password="MyPassword",
Type=SOCKS5 --SOCKS5/BOTNET
}
-- You can obtain the guestInfo from getLocal().guestInfo

local botID = loginGuest("", guestInfo) -- with a random GrowID
loginGuest("GrowID", guestInfo) -- with a custom GrowID, without SOCKS5
loginGuest("", Proxy, guestInfo) -- with SOCKS5 and a random GrowID
loginGuest("GrowID", Proxy, guestInfo) -- with SOCKS5 and a custom GrowID

```

## updateBot
`updateBot(string GrowID,string Password )`

Example:
```lua
updateBot("newGrowID", "newPassword") 
```

## updateProxy
`updateProxy(table Botnet/Socks5)`

Example:
```lua
newProxy = {
HostName="127.0.0.1:5555",
Username="MyUsername",
Password="MyPassword",
Type=SOCKS5 --SOCKS5/BOTNET
}
updateProxy(newProxy)
```

## setMac
`setMac(string newMac)`

Example:
```lua
bot = getBot()
bot:setMac("42:d4:a6:0b:5f:c3")
```


## addWorld
`addWorld(int blockID,string worldname)`

Example:
```lua
--4584 = Pepper Tree
addWorld(4584,"worldName")
addWorld(4584,"worldName|doorID")
```

## removeWorld
`removeWorld(string worldname)`

Example:
```lua
removeWorld("worldName")
```

## createUbi
`createUbi(mail,username,password,proxy)`

Example:
```lua
local mail= "surferbot@gmail.com"
local username= "surferbot"
local password = "surferBOT123@"
local proxy =   "socks5://username:password@ip:port"

local sucess,message = createUbi(mail,username,password,proxy)
log("Success: ",sucess,"\nMessage: ",message)

if sucess then 
  addBot(mail,password)
end
```


## getIndex
`getIndex()`

The getIndex() function returns the index of the bot in the bot list. (I don't recommend using getAllBot to get the index, as it can lead to high memory and CPU usage when you have many bots.)
Example:
```lua
connect("mygrowid0", "mypassword")
connect("mygrowid1", "mypassword")
connect("mygrowid2", "mypassword")
log("Index: ", getBot("mygrowid0"):getIndex()) --> Output: 0
log("Index: ", getBot("mygrowid1"):getIndex()) --> Output: 1
log("Index: ", getBot("mygrowid2"):getIndex()) --> Output: 2
```


## getID
`getID()`

The getID() function returns the ID of the bot.

Example:
```lua
connect("mygrowid0", "mypassword")
botID = getBot("mygrowid0"):getID()
log("growID: ",getBot(botID):getLocal().name)
```

## httpReq
`httpReq(httpRequestInfo data)`

Returns table of  [httpResponseInfo](Structs.md#httpresponseinfo)


httpRequestInfo struct : [httpRequestInfo](Structs.md#httprequestinfo) 

Example Get Request:
```lua
RequestINFO={}
RequestINFO.url="https://example.com/"
x = httpReq(RequestINFO)
if x.success then
log("Response Body : ",x.body)
log("Response Http Status Code : ",x.httpCode)
else
log("Request Failed Error Msg : ",x.failInfo)
end
```
Example Post Request:
```lua
RequestINFO={}
RequestINFO.url="https://httpbin.org/post"
RequestINFO.method=POST
RequestINFO.postData="name=heysurfer&surname=gay"
x = httpReq(RequestINFO)
if x.success then
log("Response Body : ",x.body)
log("Response Http Status Code : ",x.httpCode)
else
log("Request Failed Error Msg : ",x.failInfo)
end
```
Example Discord Webhook Request:
```lua
function sendWebhook(text,WebHook)
RequestINFO={}
RequestINFO.url=WebHook
RequestINFO.method=POST
RequestINFO.postData="content="..text
x = httpReq(RequestINFO)
if x.success then
log("Response Body : ",x.body)
log("Response Http Status Code : ",x.httpCode)
else
log("Request Failed Error Msg : ",x.failInfo)
end
end

sendWebhook("webhook test","webhook url")
```


## hwid
`hwid()`
 return Hardware ID
 
 Example:
```lua
log("Your HWID :",hwid())
```
Example auth system:


![eg](https://cdn.upload.systems/uploads/T3l9ZWzG.gif)

## msgBox
`msgBox(string HeaderText,string BodyText)`

Displays a message box with the specified header text and body text.

```lua
msgBox("Error","xxxx")
```
![ss](https://cdn.upload.systems/uploads/Iiu3HDcC.png)


## scan
`scan(string data)`
```lua
local data = "spawn|avatar\nnetID|2\nuserID|id"
local parser = scan(data)
log("Spawn : ",parser:get("spawn"))
log("netID : ",parser:get("netID"))
log("userID : ",parser:get("userID"))
```
## readFile
`readFile(path)`

Reads the contents of a file specified by the path parameter and returns the content as a string.
```lua
local content = readFile("myfile.txt")
print(content) -- Output: Contents of the file
```
## moveFile

`moveFile(src, dest)`

Moves the file specified by the src parameter to the destination specified by the dest parameter. If the file is successfully moved, it returns true; otherwise, if the source file doesn't exist, it returns false.
```lua
local success = moveFile("oldfile.txt", "newfile.txt")
print(success) -- Output: true if the file was successfully moved, false otherwise
```
## writeFile
`writeFile(src, text)`

Writes the provided text to the file specified by the src parameter. If the write operation is successful, it returns true.
```lua
local success = writeFile("myfile.txt", "Hello, world!")
print(success) -- Output: true if the write operation was successful, false otherwise
```
