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
* [getItemInfo](#getiteminfo)
* [isSolid](#issolid)
* [isSeed](#isseed)
* [canHarvest](#canharvest)
* [placeTile](#placetile)
* [hitTile](#hittile)
* [wrenchTile](#wrenchtile)
* [Warp](#warp)
* [Move](#move)
* [setPos](#setpos)
* [Say](#say)
* [RunThread](#runthread)
* [GetAllBot](#getallbot)
* [Connect](#connect)

## getBot
`getBot(string botname)`

Return bots from list

Example:
```lua
bot = getBot("growid")
bot:sendPacket("action|respawn", 2)
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
findPath(0, 0)
```

## getLocal
`getLocal()`

Returns local [NetAvatar](#Structs.md#netavatar) struct

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
log(tile.header.fg)
```

## getTiles
`getTiles()`

Returns table of [Tiles](Structs.md#tile)

Example:
```lua
-- Logs current worlds all foreground block id's
for _,tile in pairs(getTiles()) do
log(tile.header.fg)
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

## Warp
`Warp(string x)`

Warp To x

Example:
```lua
warp("BUYGHC")

```

## Move
`Move(string MOVE,int speed)`

Example:
```lua
-- Speed Default Value 1, Max Value 4
Move("RIGHT",1)
Move("LEFT",1)
Move("UP",1)
Move("DOWN",1)
```

## setPos
`setPos(int x,int y)`

Example:
```lua
--- Sets bot position
setPos(0,0)
```
## Say
`Say(string text)`

Example:
```lua
-- Send chat message
Say("Hello")
```

## RunThread
`RunThread(function() 
//code here
end)`

Example:
```lua
RunThread(function()
while true do
log("New Thread")
end
end)

while true do
log("Normal Thread")
end
```
## GetAllBot

Example:
```lua
for k,v in pairs(GetAllBot) do 
v:Say("hi")
end
```

## Connect
`Connect(string growid,string password)`

Example:
```lua
Connect("mygrowid","mypassword")
```
