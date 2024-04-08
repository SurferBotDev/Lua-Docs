botWork = {
    bot_growid = {
        text = "hello",
        delay = 5,
        currentTime = os.time()
    }
}

function processBot(botName)
    bot = getBot(botName)
    if bot:inWorld() then
        bot:say(botWork[botName].text)
    end
end

while true do
    currentTime = os.time()
    for botName, bot in pairs(botWork) do
        if bot.currentTime + bot.delay < currentTime then
            bot.currentTime = currentTime
            processBot(botName)
        end
    end
    sleep(1)
end