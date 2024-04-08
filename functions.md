# Functions
* [getBot](#getbot): Function used to retrieve a specific bot by name or bot ID.

* [sendPacket](#sendpacket): Function used to send a packet to the server with a specific packet type.

* [sendPacketRaw](#sendpacketraw): Function used to send a GamePacket to the server.

* [findPath](#findpath): Function to find a path to a selected x, y position.

* [getPath](#getpath): Function to return pathfind result.

* [getLocal](#getlocal): Function to retrieve information about the bot.

* [getInventory](#getinventory): Function to retrieve a list of items in the bot's inventory.

* [getPlayers](#getplayers): Function to retrieve a list of players in the current world.

* [getObjects](#getobjects): Function to retrieve a list of objects (items) in the current world.

* [getTile](#gettile): Function to retrieve information about a tile in the world.

* [getTiles](#gettiles): Function to retrieve a table of tiles in the current world.

* [checkFlag](#checkflag): Function to check if a specific tile at the given coordinates has a certain flag type.

* [hasAccessToTile](#hasaccesstotile): Function to check if the bot has access to a specific tile.

* [getItems](#getitems): Function to retrieve items' information

* [getItemInfo](#getiteminfo): Function to retrieve information about a specific item using its item ID.

* [isSolid](#issolid): Function to check if a specific tile is solid.

* [isSeed](#isseed): Function to check if a specific tile is a seed.

* [canHarvest](#canharvest): Function to check if a specific tile is harvestable.

* [hitTile](#hittile): Function to punch at a specific tile.

* [wrenchTile](#wrenchtile): Function to wrench at a specific tile.

* [placeTile](#placetile): Function to place a block at a specific tile.

* [canPunch](#canpunch): Function to check can punch to target coordinates 

* [canPlace](#canplace): Function to check can place item to target coordinates 

* [warp](#warp): Function to warp to a specific world.

* [getNukedWorlds](#getnukedworlds): Function to retrieve nuked worlds

* [move](#move): Function to move the bot in a specified direction.

* [setPos](#setpos): Function to set the bot's position to specific coordinates.

* [say](#say): Function to send a chat message.

* [getBots](#getbots): Function to retrieve a list of all bots.

* [useDoor](#usedoor): Function to use a door at specific coordinates.

* [isInside](#isinside): Function to check if the bot is inside a certain area.

* [collectObject](#collectobject): Function to collect an object in the world by UID.

* [inWorld](#inworld): Function to check if the bot is currently in a world.

* [getWorld](#getworld): Function to retrieve information about the current world.

* [itemExist](#itemexist): Function to check if a specific item exists in the bot's inventory.

* [getItemCount](#getitemcount): Function to retrieve the count of a specific item in the bot's inventory.

* [getSeedTime](#getseedtime): Function to retrieve the seed time for a specific tile.

* [getCurrentWorld](#getcurrentworld): Function to retrieve the name of the current world.

* [isEquipped](#isequipped): Function to check if an item with a specified item ID is equipped by the bot.

* [getSignal](#getsignal): Function to retrieve the current signal color of the Geiger counter.

* [autoCollect](#autocollect): Function to enable or disable the AutoCollect feature with a specified collection range and an optional ignore list.

* [getBotStatus](#getbotstatus): Function to retrieve the status of the bot.

* [getEnetStatus](#getenetstatus): Function to retrieve the ENet (Networking Library) status.

* [reConnect](#reconnect): Function to reconnect the bot.

* [disconnect](#disconnect): Function to disconnect the bot.

* [remove](#remove): Function to remove the bot from the SurferBot.

* [getMs](#getms): Function to retrieve the bot's ping (MS).
* [setBool](#setbool): Function to enable or disable a feature for the bot
* [getBool](#getbool): Function to retrieve the bool status of the bot
* [connect](#connect): Function to connect a bot to server with optional SOCKS5 proxy settings
* [addGuest](#addguest):Function to add a guest bot with optional SOCKS5 proxy settings
* [loginGuest](#loginguest):Function to log in a guest bot with optional SOCKS5 proxy settings
* [updateGuest](#updateguest): Function to update the MAC and RID of bot
* [updateBot](#updatebot): Function to update the GrowID and Password of a bot account
* [updateProxy](#updateproxy): Function to update the SOCKS5 proxy settings for bot
* [setMac](#setmac): Function to set the MAC address for the bot
* [getIndex](#getindex): Function that returns the index of the bot in the bot list.
* [getID](#getid): Function to retrieve the ID of the bot
* [autoManager](#automanager): Function to retrieve automation

* [setCustomStatus](#setcustomstatus): Function to set custom bot status
* [setReconnectInterval](#setreconnectinterval): Function to set reconnect delay
* [httpReq](#httpreq): Function to send an HTTP request and receive an HTTP response
* [addProxy](#addproxy): Function to Add SOCKS5 Proxy
* [hwid](#hwid): Function to retrieve hardware ID
* [msgBox](#msgbox): Displays a message box with the specified header text and body text
* [proxyManager](#proxymanager)
* [switchManager](#switchmanager)
* [App](#app)
* [setValue](#setvalue) 
* [getValue](#getvalue) 
* [writeFile](#writefile) 
* [readFile](#readfile) 
* [execute](#execute) 

## getBot
`getBot(string botname)`

`getBot(number botID)`

`getBot() -> Selected bot`

https://user-images.githubusercontent.com/58826689/235254325-1ea20c15-f9c3-4965-8929-0ff25a6dda4e.mp4

Function to retrieve a specific bot by name or bot ID

Example:
```lua
bot = getBot("growid")
bot:sendPacket("action|respawn", 2)
bot:move(RIGHT,1)
log("GrowID ",bot:getLocal().name)
```


## sendPacket
`sendPacket( string packet, number type)`

Function to send a packet with a specified packet type to the server.

Example:
```lua
-- Sends a respawn packet to the server
sendPacket("action|respawn", 2)
```

## sendPacketRaw
`sendRawPacket( GamePacket packet)`

Function to send a [GamePacket](Structs.md#gamepacket) to the server.


Example:
```lua
-- Sends wear clothing packet to server
packet = {}
packet.type = 10 
packet.int_data = 48 -- Clothing ID (Jeans)
sendPacketRaw(packet)
```

## findPath
`findPath(number x, number y)`

Function to find a path to a selected x, y position.

Example:
```lua
-- Find a path to the top left corner of the world
if findPath(0, 0) then
    log("Path found successfully.")
else
    log("Failed to find a path.")
end
```

## getPath
`getPath(number x, number y)`

Function finds a path to a specified x, y position

Example:
```lua
local result = getPath(0,0)

if #result > 0 then
    log("Path found successfully")
    for _,path in ipairs(result) do
        setPos(path.x,path.y)
        sleep(15)
    end
else
    log("Failed to find a path")
end
```

## getLocal
`getLocal()`

Function to retrieve information about the  bot. Returns a table of [NetAvatar](Structs.md#netavatar)

Example:
```lua
me = getLocal()
log(me.name)
```

## getInventory
`getInventory()`

Function to retrieve a list of items in the bot's inventory. Returns a table of [InventoryItems](Structs.md#inventoryitem)

Example:
```lua
-- Logs all item IDs in your inventory
for _,item in pairs(getInventory()) do
log(item.id)
end
```

## getPlayers
`getPlayers()`

Function to retrieve a list of players in the current world. Returns a table of [NetAvatars](Structs.md#netavatar)

Example:
```lua
-- Logs current world's player names
for _,player in pairs(getPlayers()) do
log(player.name)
end
```

## getObjects
`getObjects()`

Function to retrieve a list of objects(items) in the current world. Returns a table of [WorldObjects](Structs.md#worldobject)

Example:
```lua
-- Logs current world's object item IDs
for _,object in ipairs(getObjects()) do
log(object.id)
end
```

## getTile
`getTile(number x, number y)`


https://user-images.githubusercontent.com/58826689/235254798-594f43d7-4956-43d4-826b-c9e1d917b7cf.mp4


Function to retrieve information about a tile in the world.

Example:
```lua
-- Retrieve information about the top left corner's foreground block
local tile = getTile(0, 0)
log("Foreground Block ID:", tile.fg)

-- Check if the tile has extra information
if tile.extra then
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
else
    log("No extra information available for this tile")
end
```

## getTiles
`getTiles()`

Function to retrieve a table of [Tiles](Structs.md#tile) in the current world.

Example:
```lua
local tiles = getTiles()
for _, tile in ipairs(tiles) do
    log("Foreground Block ID:", tile.fg)
    log("Background Block ID:", tile.bg)
    log("X Position:", tile.x)
    log("Y Position:", tile.y)
end
```

## checkFlag
`checkFlag(number x,number y,enum Flag)`

Function to check if a specific tile at the given coordinates has a certain flag type.

Example:
```lua
-- Check if Tile 0, 0 is WATER
if checkFlag(0, 0, flagType.WATER) then
    log("Tile 0, 0 is WATER")
end

-- Check if Tile 0, 0 is LOCKED
if checkFlag(0, 0, flagType.LOCKED) then
    log("Tile 0, 0 is Locked")
end

-- Check if Tile 0, 0 is PUBLIC
if checkFlag(0, 0, flagType.PUBLIC) then
    log("Tile 0, 0 is Public Area")
end

-- Check if Tile 0, 0 is on FIRE
if checkFlag(0, 0, flagType.FIRE) then
    log("Tile 0, 0 is on FIRE")
end

-- Check if Tile 0, 0 is both WATER and PUBLIC
if checkFlag(0, 0, flagType.WATER) and checkFlag(0, 0, flagType.PUBLIC) then
    log("Tile 0, 0 is Water and Public")
end

-- Check if Tile 0, 0 is LOCKED but the bot has access
if checkFlag(0, 0, flagType.LOCKED) and hasAccessToTile(0, 0) then
    log("Tile 0, 0 is Locked, but the bot has access")
end

```


## hasAccessToTile
`hasAccessToTile(number x,number y)`

Function to check if the bot has access to a specific tile.

Example:
```lua
if hasAccessToTile(0, 0) then
    log("Bot Has Access To 0 0 Tile.")
else
    log("Bot Does Not Have Access to the 0 0 Tile.")
end

```

## getItems
`getItems()`

Function to retrieve items' information
Returns Table [ItemInfo](Structs.md#iteminfo)

Example:
```lua
for _, item in ipairs(getItems()) do
    log("name: ", item.name)
    log("id: ", item.id)
    log("rarity: ", item.rarity)
    log("growTime: ", item.growTime)
    log("breakHits: ", item.breakHits)
    log("dropChance: ", item.dropChance)
    log("itemCategory: ", item.itemCategory)
    log("untradeable: ", item.untradeable)
end
```

## getItemInfo
`getItemInfo(number itemid)`


Function to retrieve information about a specific item using its item ID
Returns [ItemInfo](Structs.md#iteminfo)


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
`isSolid(number x, number y)`

Function to check if a specific tile is solid.

Example:
```lua
if isSolid(0, 0) then
    log("Tile 0, 0 is solid")
else
    log("Tile 0, 0 is not solid")
end
```

## isSeed
`isSeed(number x, number y)`

Function to check if a specific tile is a seed.

Example:
```lua
if isSeed(0, 0) then
    log("Tile 0, 0 is a seed")
else
    log("Tile 0, 0 is not a seed")
end
```

## canHarvest
`canHarvest(number x, number y)`

Function to check if a specific tile is harvestable.

Example:
```lua
if canHarvest(0, 0) then
    log("Tile 0, 0 is harvestable")
else
    log("Tile 0, 0 is not harvestable")
end
```

## hitTile
`hitTile(number x, number y)`

Function to punch at a specific tile.

Example:
```lua
-- Punch to 0, 0
hitTile(0, 0)
```

## wrenchTile
`wrenchTile(number x, number y)`

Function to wrench at a specific tile.

Example:
```lua
-- Wrench to 0, 0
wrenchTile(0, 0)
```

## placeTile
`placeTile(number x,number y,number blockid)`

Function to place a block at a specific tile.

Example:
```lua
-- Place Dirt at 0, 0
placeTile(0, 0, 2)
```

## canPunch
`canPunch(number x,number y)`

Example:
```lua
-- Check if the bot can punch to coordinates (0, 0)
canPunch(0, 0,)
```


## canPlace
`canPlace(number x,number y)`

Example:
```lua
-- Check if the bot can place an item at coordinates (0, 0)
canPlace(0, 0)
```

## warp
`warp(string name)`

Function to warp to a  specific world

Example:
```lua
warp("BUYGHC")
```

## getNukedWorlds
`getNukedWorlds()`

Function to retrieve nuked worlds

Example:
```lua
local bot = getBot()
for _, world in pairs(bot:getNukedWorlds()) do
    log(world)
end
```


## move
`move(enum MOVE,number speed)`

Function to move the bot in a specified direction.

speed (number): The speed of movement (default value is 1, max value is 10).


Example:
```lua
move(RIGHT,1)
move(LEFT,1)
move(UP,1)
move(DOWN,1)
```

## setPos
`setPos(number x,number y)`

Function to set the bot's position to specific coordinates.

Example:
```lua
-- Set bot position to x 0, y 0
setPos(0, 0)
```
## say
`say(string text)`

Function to send a chat message.

Example:
```lua
say("Hello")
```

## getBots

Function to retrieve a list of all bots.

Example:
```lua
for index,bot in ipairs(getBots()) do 
  bot:say("hi")
end
```

## useDoor
`useDoor(number x,number y)`

Example:
```lua
useDoor(0,0)
```

## isInside
`isInside(number x,number y,number rad)`

Example:
```lua
if isInside(0, 0, 5) then
    log("x 0, y 0 is inside")
else
    log("x 0, y 0 is not inside")
end
```

## collectObject
`collectObject(number uid)`

Function to collect an object in the world by uid

Example:
```lua
-- Collecting Objects with UID
for _, object in ipairs(getObjects()) do
    collectObject(object.uid)
end
```
## inWorld
`inWorld()`

Function to check if the bot is currently in a world.

Example:
```lua
log(inWorld() and "Bot is in the world" or "Bot is not in the world")
```

## getWorld
`getWorld()`

Function to retrieve information about the current world. Returns a [World](Structs.md#world) object.

Example:
```lua
if inWorld() then
    local world = getWorld()
    log("Current World Name is:", world.name)
    
    if world.timer == 0 then
        log("This world has no timer")
    else
        log("This world has a timer:", world.timer, "minutes")
    end
else
    log("Not in a world")
end
```

Example NPC: 
```lua
local bot = getBot()
local world = bot:getWorld()
for id, npc in pairs(world.npcs) do
	log("NPC ID:", id, " Type:", npc.type, " Event:", npc.event)
	log("Start X:", npc.startX, " Y:", npc.startY)
	log("Destination X:", npc.destX, " Y:", npc.destY)
end
```

## itemExist
`itemExist(number itemid)`

Function to check if a specific item exists in the bot's inventory.

Example:
```lua
if itemExist(2) then
    log("Dirt Exists in Inventory")
else
    log("Dirt Does Not Exist in Inventory")
end
```

## getItemCount
`getItemCount(number itemid)`

Function to retrieve the count of a specific item in the bot's inventory

Example:
```lua
if getItemCount(2) > 100 then
    log("The amount of dirt is higher than 100")
else
    log("The amount of dirt is less than 100")
end
```

## getSeedTime
`getSeedTime(number x, number y)`

Function to retrieve the seed time in milliseconds for a specific tile.

### Return Value

- If the function returns -1, the tile is not a seed.
- If the function returns 0, the seed is ready for harvest.

Example:
```lua
if getSeedTime(0, 0) == 0 then
    log("Tile 0, 0 is harvestable")
else
    log("Tile 0, 0 is not harvestable")
end
```
```lua
local seedtime = bot:getSeedTime(0, 0) 
local SeedID = bot:getTile(0, 0).fg
local growtime = bot:getItemInfo(SeedID).growTime
log("Seeds Ready In", getTimeString(growtime - seedtime))
-- Output: Seeds Ready In '7 days, 15 hours, 27 mins, 25 secs'
```
```lua
if getSeedTime(0, 0) == -1 then
    log("Tile 0, 0 is not a seed")
else
    log("Tile 0, 0 is a seed")
end
```

## getCurrentWorld
`getCurrentWorld()`

Function to retrieve the name of the current world.

Example:
```lua
if inWorld() then
    log("Current World Name is:", getCurrentWorld())
else
    log("Not in a world")
end
```

## isEquipped
`isEquipped(number item_ID)`

Function to check if an item with the specified item ID is equipped by the bot.

Example:
```lua
local targetItemID = 2204;
if isEquipped(targetItemID) then
    log(getItemInfo(targetItemID).name, "is equipped")
else
    log(getItemInfo(targetItemID).name, "is not equipped")
end
```

## getSignal 
`getSignal()`

Function to retrieve the current signal color of the Geiger counter

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
`autoCollect(number collectrange,bool autocollect,table ignoreList)`

Function to enable or disable the AutoCollect feature with a specified collection range and an optional ignore list.

Example:
```lua
-- Disable/Enable AutoCollect.
autoCollect1(0, true) -- Enable Auto Collect With 10 Range.
autoCollect(10, false) -- Disable Auto Collect.

-- Enable Auto Collect with a range of 10 blocks and provide an ignore list.
local ignoreList = {1, 2, 3, 5, 6}
autoCollect(10, true, ignoreList)
```


## getBotStatus
`getBotStatus()`

Function to retrieve the status of the bot

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
    guestCaptcha,
    temporaryBan,
    fetchingMeta
    failedToFetchMeta
};
```


## getEnetStatus
`getEnetStatus()`

Function to retrieve the ENet (Networking Library) status

Example:
```lua
if getEnetStatus() == Connected then
    log("Connected")
elseif getEnetStatus() == Disconnected then
    log("Disconnected")
end
```
```c++
-- Enum Information
enum Enet_Status
{
    Disconnected,
    Connected,
};
```

## reConnect
`reConnect()`

Function to reconnect the bot

```lua
getBot("id"):reConnect()
```

## disconnect
`disconnect()`

Function to disconnect the bot

```lua
getBot("id"):disconnect()
```

## remove
`remove()`

Function to remove the bot from the SurferBot

```lua
getBot("id"):remove()
```
## getMs
`getMs()`

Function to retrieve the bot's ping (MS).


```lua
getBot("id"):getMs()
```

## setBool
`setBool(string featureName)`

Function to enable or disable a feature for the bot


Feature List : 
```
autoCollect
skipTutorial
autoQuest
autoReconnect
autoAccess
ignoreGem -- (autoCollect)
```
Example : 
```lua
-- Disable AutoCollect
setBool("autoCollect", false)

-- Enable AutoCollect
setBool("autoCollect", true)

-- Disable skipTutorial
setBool("skipTutorial", false)

-- Disable ignoreGem for AutoCollect
setBool("ignoreGem", false)
```

## getBool
`getBool(string featureName)`

Function to retrieve the bool status of the bot

Example : 
```lua
-- Check if AutoCollect is enabled
local isAutoCollectEnabled = getBool("autoCollect")

-- Check if skipTutorial is enabled
local isSkipTutorialEnabled = getBool("skipTutorial")

-- Check if ignoreGem is enabled
local isIgnoreGemEnabled = getBool("ignoreGem")
```

## connect
`connect(string growid,string password,table Socks5 Information)`

Function to connect a bot to server with optional SOCKS5 proxy settings

Example:
```lua
-- Define the SOCKS5 proxy settings in a table
local Proxy = {
    HostName = "ipaddress:port",
    Username = "MyUsername",
    Password = "MyPassword",
    Type = SOCKS5
}

-- Example usage of the connect function with different configurations
local botID = connect("mygrowid", "mypassword") -- Without SOCKS5
connect("mygrowid", "mypassword", Proxy) -- With SOCKS5
connect("mygrowid", "mypassword", "auto") -- With Auto-Select Proxy

local botID = connect("mygrowid", "mypassword", "auto") -- With Auto-Select Proxy

if botID  == -1 then
		log("No available proxies. The limit has been exceeded (You can adjust the limit on the proxy page)")
elseif botID == -2 then
		log("You have exceeded your limit. You can purchase to increase your limit from SurferWallet")
else
		local bot = getBot(botID)
end

```


## addGuest
`addGuest(string GrowID,table Socks5 Information)`

Function to add a guest bot with optional SOCKS5 proxy settings

Example:
```lua
-- Define the proxy settings in a table
local Proxy = {
    HostName = "127.0.0.1:5555",
    Username = "MyUsername",
    Password = "MyPassword",
    Type = SOCKS5
}

-- Example usage of the addGuest function with different configurations
local botID1 = addGuest("") -- Using a random GrowID
addGuest("GrowID") -- Using a custom GrowID, without SOCKS5
addGuest("", Proxy) -- Using SOCKS5 and a random GrowID
addGuest("GrowID", Proxy) -- Using SOCKS5 and a custom GrowID
addGuest("GrowID","auto") -- Using SOCKS5 (AUTO-SELECT) and a custom GrowID

local botID = addGuest("GrowID","auto")  -- With Auto-Select Proxy
if botID  == -1 then
		log("No available proxies. The limit has been exceeded (You can adjust the limit on the proxy page)")
elseif botID == -2 then
		log("You have exceeded your limit. You can purchase to increase your limit from SurferWallet")
else
		local bot = getBot(botID)
end
```

## loginGuest
`loginGuest(string GrowID,table Socks5 Information,string guestInfo )`

Function to log in a guest bot with optional SOCKS5 proxy settings

Example:
```lua
-- Define the proxy settings in a table
local Proxy = {
    HostName = "127.0.0.1:5555",
    Username = "MyUsername",
    Password = "MyPassword",
    Type = SOCKS5
}

-- You can obtain the guestInfo from getLocal().guestInfo

-- Example usage of loginGuest function with different configurations
local botID = loginGuest("", guestInfo) -- Using a random GrowID
loginGuest("GrowID", guestInfo) -- Using a custom GrowID, without SOCKS5
loginGuest("", Proxy, guestInfo) -- Using SOCKS5 and a random GrowID
loginGuest("GrowID", Proxy, guestInfo) -- Using SOCKS5 and a custom GrowID
loginGuest("GrowID", "auto", guestInfo) --Using SOCKS5 (AUTO-SELECT) and a custom GrowID

local botID = loginGuest("GrowID", "auto", guestInfo)
if botID  == -1 then
		log("No available proxies. The limit has been exceeded (You can adjust the limit on the proxy page)")
elseif botID == -2 then
		log("You have exceeded your limit. You can purchase to increase your limit from SurferWallet")
else
		local bot = getBot(botID)
end
```

## updateGuest
`updateGuest(string guestInfo ,string GuestName)`

Function to update the MAC and RID of bot

Example:
```lua
updateGuest("mac+rid","GrowID")
updateGuest("02:38:d7:77:9d:d3+3B948C923D122E03CE88C0342AE1ED4B")
updateGuest("02:38:d7:77:9d:d3+3B948C923D122E03CE88C0342AE1ED4B","surferBot")
```


## updateBot
`updateBot(string GrowID,string Password )`

Function to update the GrowID and Password of a bot account


Example:
```lua
-- This function will change the bot's MAC and RID to bypass suspensions, bans, etc.
updateBot("newGrowID", "newPassword") 
```

## updateProxy
`updateProxy(table Socks5)`

Function to update the SOCKS5 proxy settings for bot

Example:
```lua
-- Define the new proxy settings in a table
local newProxy = {
    HostName = "127.0.0.1:5555",
    Username = "MyUsername",
    Password = "MyPassword",
    Type = SOCKS5
}
updateProxy(newProxy)
```

## setMac
`setMac(string newMac)`

Function to set the MAC address for the bot

Example:
```lua
bot = getBot()
bot:setMac("42:d4:a6:0b:5f:c3")
```


## getIndex
`getIndex()`

Function that returns the index of the bot in the bot list (I don't recommend using getAllBot to get the index, as it can lead to high memory and CPU usage when you have many bots.)
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

Function to retrieve the ID of the bot

Example:
```lua
-- Connect to the Growtopia account
connect("mygrowid0", "mypassword")

-- Get the bot ID
local botID = getBot("mygrowid0"):getID()

-- Retrieve and log the bot's name using the bot ID
local bot = getBot(botID)
log("GrowID:", bot:getLocal().name)
```

## autoManager
`autoManager()`

Spammer
```lua
local spamManager = getBot():autoManager().spam
spamManager.enabled = false
spamManager.randomColor = false
spamManager.worldName = "target world name"
spamManager.delay = 5000 -- Milliseconds
spamManager.clearText()
spamManager.pushText("Your text goes here")
```

Fishing
```lua
local fishManager = getBot():autoManager().fish
fishManager.enabled = false
fishManager.worldName = "target world name"
fishManager.waterPos_x = 0
fishManager.waterPos_y = 0

fishManager.detonator = false
fishManager.drill = false
fishManager.trawler = false
fishManager.gemonade = false
```


Mod Detector
```lua
local modManager = getBot():autoManager().mod
modManager.enabled = false

modManager.leaveTheWorld = false
modManager.unAccess = false 
modManager.rejoinWorld = false -- rejoin the world with custom intervals
modManager.interval = 5 -- 5 minutes
```

Admin Detector
```lua
local adminManager = getBot():autoManager().admin
adminManager.enabled = false

adminManager.leaveTheWorld = false
adminManager.rejoinWorld = false -- rejoin the world with custom intervals
adminManager.interval = 5 -- 5 minutes
```

## setReconnectInterval
`setReconnectInterval(number seconds)`

Function to set reconnect delay

```lua
setReconnectInterval(5) -- 5 seconds
```

## setCustomStatus
`setCustomStatus(string status)`

Function to set custom bot status

```lua
setCustomStatus("script running") 
setCustomStatus("") -- Disable custom status
```


## addProxy
`addProxy(table proxy)`
```lua
local Proxy = {
    HostName = "ipaddress:port",
    Username = "MyUsername",
    Password = "MyPassword",
    Type = SOCKS5
}
addProxy(Proxy)
```

## httpReq
`httpReq(httpRequestInfo data)`

Function to send an HTTP request and receive an HTTP response. It returns a table of [httpResponseInfo](Structs.md#httpresponseinfo).

httpRequestInfo struct : [httpRequestInfo](Structs.md#httprequestinfo) 

Example Get Request:
```lua
-- Example Get Request
local requestInfo = {
    url = "https://example.com/"
}
local response = httpReq(requestInfo)

if response.success then
    log("Response Body:", response.body)
    log("Response Http Status Code:", response.httpCode)
else
    log("Request Failed. Error Message:", response.failInfo)
end
```
Example Post Request:
```lua
-- Example Post Request
local requestInfo = {
    url = "https://httpbin.org/post",
    method = POST,
    postData = "name=hey&surname=surfer"
}
local response = httpReq(requestInfo)

if response.success then
    log("Response Body:", response.body)
    log("Response Http Status Code:", response.httpCode)
else
    log("Request Failed. Error Message:", response.failInfo)
end
```
Example Discord Webhook Request:
```lua
function sendWebhook(text, webhookURL)
    local requestInfo = {
        url = webhookURL,
        method = POST,
        postData = "content=" .. text
    }
    local response = httpReq(requestInfo)

    if response.success then
        log("Response Body:", response.body)
        log("Response Http Status Code:", response.httpCode)
    else
        log("Request Failed. Error Message:", response.failInfo)
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


## msgBox
`msgBox(string HeaderText,string BodyText)`

Displays a message box with the specified header text and body text

```lua
msgBox("Error","xxxx")
```


## proxyManager
`proxyManager()`

return proxyManager Class

```lua
local proxyManager = proxyManager()

-- Add proxies with ProxyManager

proxyManager.add("127.0.0.1:5556:user:pass")
proxyManager.add("127.0.0.1:5555")

-- Remove proxies with ProxyManager

proxyManager.remove("127.0.0.1:5556")
proxyManager.remove("127.0.0.1:5555")

-- Check proxies with ProxyManager

proxyManager.check("127.0.0.1:5556", proxy) -- Check if the proxy is not working
proxyManager.check("127.0.0.1:5555", growtopia) -- Check if the proxy can connect to Growtopia

local proxy_1_status = proxyManager.status("127.0.0.1:5556", proxy)
local proxy_2_status = proxyManager.status("127.0.0.1:5555", growtopia)

if proxy_2_status == not_working then
    proxyManager.remove("127.0.0.1:5555")
end


-- Proxy statuses:
-- processing
-- not_working
-- working
-- pending

-- Growtopia statuses:
-- processing
-- banned
-- shadowban
-- working
-- pending

-- Http statuses:
-- processing
-- blocked
-- working
-- pending


local proxies = proxyManager.getProxies()
for _, proxy in ipairs(proxies) do
    log(proxy) --ip:port:user:pass
end


-- Enable/disable auto-select
proxyManager.autoSelect = false;

-- Set the limit (Number of accounts you will use with a proxy (BOTS/PROXY) (Recommended 1/PROXY))
proxyManager.limit = 3;
```

## switchManager
`switchManager()`

return switchManager Class

```lua
local switchManager = switchManager()

-- Add Accounts with switchManager

switchManager.addAccount("growid","password")
switchManager.addGuest("e8:6f:bc:14:9f:35")

-- Remove Accounts with switchManager

switchManager.remove("growid")
switchManager.remove("e8:6f:bc:14:9f:35")

-- Enable/disable auto-switch

switchManager.enable = true
```

## App
`App()`

return App(Settings) Class


```lua
local app = App()
app.optimizeUI = true
app.fps = 60
app.captchaEnable = false
app.captchaKey = "key"
app.selectAll=false
```




Lua's setValue and getValue functions provide a structured way to manage global variables accessible across different scripts (threads) within surferbot. This enables seamless data sharing and communication between various parts of your code

## setValue
`setValue(string key,value)`

Sets the value of a global variable

```lua
setValue("myBool", true)
setValue("myNumber", 42)
setValue("myFloat", 3.14)
setValue("myString", "Hello, Lua!")
setValue("myInteger", 123)
```


## getValue
`setValue(string key)`

Retrieves the value of a global variable

Returns: The value of the variable, or nil if it doesn't exist.

```lua
print(getValue("myBool"))      --> true
print(getValue("myNumber"))    --> 42
print(getValue("myFloat"))     --> 3.14
print(getValue("myString"))    --> Hello, Lua!
print(getValue("myInteger"))   --> 123
```

## readFile
`readFile(string path)`

Reads the contents of a file specified by the path parameter and returns the content as a string.


```lua
local content = readFile("myfile.txt")
log(content) -- Output: Contents of the file
```


## writeFile
`writeFile(string path,string content)`

Moves the file specified by the src parameter to the destination specified by the dest parameter.

```lua
writeFile("myfile.txt", "Hello, world!")
```


## execute
`execute(string cmd)`

The `execute` function in Lua executes system commands provided as a string argument (`cmd`)

```lua
local powershell_output = execute("powershell Write-Host test")
local cmd_output = execute("cmd /c echo test")
```