local bot = getBot()
local playerList = bot:getPlayers()
local currentWorld = bot:getWorld()

for _, adminID in ipairs(currentWorld.access) do
    log("The ", adminID, " (UserID) has access to the world.")
end

for _, player in ipairs(playerList) do
    log("Player Name: ", player.name, " (UserID): ", player.userid)
end

for _, player in ipairs(playerList) do
    for _, adminID in ipairs(currentWorld.access) do
        if player.userid == adminID then
            log("Admin currently in the world: ", player.name)
        end
    end
end