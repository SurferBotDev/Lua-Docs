# Event Handlers

---

## Table of Contents
- [registerEvent](#registerEvent)
- [Event Handlers](#event-handlers)
  - [OnGameMessage](#ongamemessage)
  - [OnVarlist](#onvarlist)
  - [OnGamePacket](#ongamepacket)
  - [OnModeratorJoin](#onmoderatorjoin)
  - [OnPlayerJoinWorld](#onplayerjoinworld)
  - [OnPlayerExitWorld](#onplayerexitworld)
  - [OnJoinWorld](#onworldjoin)
  - [OnWorldExit](#onworldexit)
  - [OnDisconnect](#ondisconnect)
  - [OnBanned](#onbanned)
  - [OnLevelUp](#onlevelup)
  - [OnInventoryUpdate](#oninventoryupdate)
- [Example](#example)

---

## Register Event 
`registerEvent(hook function,type)`
```lua
bot = getBot()
bot:registerEvent(onMessage, OnGameMessage)
```

## Event Handlers 

### OnGameMessage 

Handles game messages.


```lua
function onMessage(text)
    print("Game Message: " .. text)
end
```


---


### OnVarlist 

Handles variable list updates.


```lua
function onVarlist(varlist)
    if varlist[0] == "OnConsoleMessage" then
        print(varlist[1])
    end
end
```


---


### OnGamePacket 

Handles game packets.


```lua
function onPacket(packet)
    if packet.type == 0 then
        print("Someone moved.")
    end
end
```


---


### OnModeratorJoin 

Detects when a moderator or guardian joins.


```lua
function modDetector(guardian)
    if guardian then
        print("A Guardian has joined the world.")
    else
        print("A Moderator has joined the world.")
    end
end
```


---


### OnPlayerJoinWorld 

Handles when a player joins the world.


```lua
function onPlayerJoinWorld(player)
    local name = player.name
    local netId = player.netid
    print("Player joined: " .. name .. " (NetID: " .. netId .. ")")
end
```


---


### OnPlayerExitWorld 

Handles when a player exits the world.


```lua
function onPlayerExitWorld(player)
    local name = player.name
    local netId = player.netid
    print("Player exited: " .. name .. " (NetID: " .. netId .. ")")
end
```


---


### OnWorldJoin 

Handles when the bot joins a world.


```lua
function OnWorldJoin()
    local world = bot:getWorld()
    print("Joined world: " .. world)
end
```


---


### OnWorldExit 

Handles when the bot exits a world.


```lua
function onWorldExit()
    bot:warp("name")
    print("Warping to world...")
end
```


---


### OnDisconnect 

Handles when the bot disconnects.


```lua
function onDisconnect()
    bot:reConnect()
    print("Reconnecting...")
end
```


---


### OnBanned 

Handles when the bot gets banned.


```lua
function onBanned(days)
    print("Bot banned for " .. days .. " days.")
end
```


---


### OnLevelUp 

Handles level-up events.


```lua
function onLevelUp()
    local newLevel = bot:getLocal().level
    local oldLevel = newLevel - 1
    print("Leveled up! Old Level: " .. oldLevel .. ", New Level: " .. newLevel)
end
```


---


### OnInventoryUpdate 

Handles inventory updates.


```lua
function onInventoryUpdate(itemId, count)
    local itemName = getItemInfo(itemId).name
    if count > 0 then
        print("Added " .. count .. "x " .. itemName)
    else
        print("Removed " .. count .. "x " .. itemName)
    end
end
```
---
### Example 
```lua
local bot = getBot()

function onPlayerJoinWorld(player)
    local name = player.name
    local netId = player.netid
    print("Player joined: " .. name .. " (NetID: " .. netId .. ")")
end

function onWorldExit()
    bot:warp("name")
    print("Warping to world...")
end

function onBanned(days)
    if days > 700 then
        bot:remove()
    end
end

bot:registerEvent(onPlayerJoinWorld, OnPlayerJoinWorld)
bot:registerEvent(onWorldExit, OnWorldExit)
bot:registerEvent(onBanned, OnBanned)

while true do
    sleep(1)
end
```
---