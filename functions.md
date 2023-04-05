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
* [remove](#remove)
* [getMs](#getms)
* [runThread](#runthread)
* [httpReq](#httpreq)
* [hwid](#hwid)
* [msgBox](#msgbox)

## getBot
`getBot(string botname)`

Return bots from list

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

Returns world [Tile](Structs.md#tile) in selected position

Example:
```lua
-- Logs top left corners foreground block id
tile = getTile(0, 0)
log(tile.fg)
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
-- Logs Item ID 2's name (Dirt)
log(getItemInfo(2).name)
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

## Move
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
for k,v in pairs(getAllBot) do 
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
    BypassTutorial
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

Return bots MS ( Ping ) 


```lua
getBot("id"):getMs()
```

## connect
`connect(string growid,string password,table Botnet/Socks5 Information)`

Example:
```lua
connect("mygrowid","mypassword") -- Without Socks5/Botnet

Proxy = {
HostName="ipaddress:port",
Username="MyUsername",
Password="MyPassword",
Type=SOCKS5--SOCKS5/BOTNET
}

connect("mygrowid","mypassword",Proxy) -- With Socks5

```


## addGuest
`addGuest(table Botnet/Socks5 Information)`

Example:
```lua
addGuest() -- Without Socks5/Botnet

Proxy = {
HostName="ipaddress:port",
Username="MyUsername",
Password="MyPassword",
Type=SOCKS5--SOCKS5/BOTNET
}

addGuest(Proxy) -- With Socks5

```

## runThread
`runThread(function() 
//code here
end)`

Example:
```lua
runThread(function()
while true do
log("New Thread")
Sleep(1)
end
end)

while true do
log("Normal Thread")
Sleep(1)
end
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
```lua
msgBox("Error","xxxx")
```
![ss](https://cdn.upload.systems/uploads/Iiu3HDcC.png)
