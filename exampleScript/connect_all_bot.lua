for k, bot in pairs(getAllBot) do
    if bot:getEnetStatus() == Disconnected then
        bot:reConnect()
        sleep(200)
    end
end
-- Connect all disconnected bots with a 200ms delay
