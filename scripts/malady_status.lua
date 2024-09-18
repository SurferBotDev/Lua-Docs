local malady_count = {}

for _, bot in ipairs(getBots()) do
    local bot_data = bot:getLocal()
    local malady = bot_data.malady

    if malady then
        malady_count[malady] = (malady_count[malady] or 0) + 1
    end
end

for malady, count in pairs(malady_count) do
    print(string.format("%s: %d", malady, count))
end
