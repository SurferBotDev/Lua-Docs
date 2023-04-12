worldList = {}
-- growID,WorldName
worldList["1.BOT"] = "World 1" -- key : GrowID , Value : World Name
worldList["2.BOT"] = "World 2"
worldList["3.BOT"] = "World 3"
bot = getBot()
growid = bot:getLocal().name

while true do
    bot:warp(worldList[growid])
end

bot = getBot()
growid = bot:getLocal().name

while true do
    if growid == "1.BOT" or growid == "X.BOT" then
        -- Bot 1 feature: spamming
        -- Code for spamming goes here
    end

    -- Bot 2
    if growid == "2.BOT" then
        -- Bot 2 feature: spamming and teleporting
        -- Code for spamming and teleporting goes here
    end

    -- Bot 3
    if growid == "3.BOT" then
        -- Bot 3 feature: harvesting seeds
        -- Code for harvesting seeds goes here
    end
end
