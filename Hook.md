# Hooking
* [addHook](#addhook)

## addHook
`addHook(function,hookType) `

[hookType](Structs.md#hookType)

Example For Varlist:
```lua
bot = getBot()
function onVarlist(varlist)
    if varlist[0]=="OnConsoleMessage" then
        log(varlist[1])
    end
end

bot:addHook(onVarlist,varlist)
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
```

## RemoveHook
```Here is no function to remove the hook, so you need to stop  this script.```
