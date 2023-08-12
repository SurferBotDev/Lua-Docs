# Hooking
* [addHook](#addhook)

## addHook
`addHook(function,hookType) `

The AddHook function has been updated: It is now necessary to add a loop to the code for the hook to continue.

[hookType](Structs.md#hookType)


Example For GameMessage:
```lua
bot = getBot()
function onMessage(text)
    log("gameMessage: ",text)
end

bot:addHook(onMessage,gameMessage)

while true do
    -- We need an infinite loop to continue the hook
    -- ..code
    sleep(1)
  end
```

Example For Varlist:
```lua
bot = getBot()
function onVarlist(varlist)
    if varlist[0]=="OnConsoleMessage" then
        log(varlist[1])
    end
end

bot:addHook(onVarlist,varlist)

while true do
    -- We need an infinite loop to continue the hook
    -- ..code
    sleep(1)
  end
```

Example For gamePacket:

[GamePacket](Structs.md#GamePacket)

```lua
bot = getBot()
function onPacket(packet) 
    if packet.type == 0 then
        log("Someone moved")
    end
end

bot:addHook(onPacket,gamePacket)

while true do
    -- We need an infinite loop to continue the hook
    -- ..code
    sleep(1)
  end
```


Example For moderatorJoined:
```lua
bot = getBot()
function modDetector(guardian)
    if guardian then
        log("A Guardian has joined the world")
    else
        log("A Moderator has joined the world")
    end
end

bot:addHook(modDetector,moderatorJoined)

while true do
    -- We need an infinite loop to continue the hook
    -- ..code
    sleep(1)
  end
```

## RemoveHook
```Here is no function to remove the hook, so you need to stop  this script.```
