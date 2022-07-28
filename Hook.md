# Hooking
* [addHook](#addhook)

## addHook
`addHook(function)`

Example For Varlist:
```lua
bot = getBot("growid")
function OnVarlist(varlist)
if varlist.get(0)=="OnConsoleMessage"
then
log(varlist.get(1))
end
end

bot:addHook(OnVarlist)
```

## RemoveHook
```Here no function for remove hook, you need Stop This Script.```
