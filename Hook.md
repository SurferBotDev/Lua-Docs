# Hooking
* [AddHook](#addhook)

## AddHook
`AddHook(function)`

Example For Varlist:
```lua
bot = getBot("growid")
function OnVarlist(varlist)
if varlist[0]=="OnConsoleMessage"
then
log(varlist[1])
end
end

bot:AddHook(OnVarlist)
```

## RemoveHook
```Here no function for remove hook, you need Stop This Script.```
