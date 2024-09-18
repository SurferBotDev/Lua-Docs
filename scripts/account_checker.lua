-- Sleep for a random duration
sleep(math.random(100, 5000))

-- Function to generate a random proxy
local function getRandomProxy()
    local startPort, endPort = 10466, 19466
    local randomPort = math.random(startPort, endPort)
    return string.format("ip:%d", randomPort)
end

-- Function to convert boolean to number (1 or 0)
local function bool_to_number(value)
    return value and 1 or 0
end

-- Define server URL
local serverUrl = "serverUrl"

-- Function to fetch account details from server
local function getAccount()
    local requestInfo = { url = serverUrl }
    local response = httpReq(requestInfo)

    if response.success then
        local responseBody = response.body
        return responseBody:match("([^|]+)|([^|]+)")
    else
        log("Request Failed. Error Message:", response.failInfo)
        return nil, nil
    end
end

-- Function to send a message to a webhook
local function sendWebhook(text, webhookURL)
    local requestInfo = {
        url = webhookURL,
        method = POST,
        postData = "content=" .. text
    }
    httpReq(requestInfo)
end

-- Function to send account details to server
local function sendAccount(data)
    local requestInfo = {
        url = serverUrl .. "endpoint",
        method = POST,
        postData = "data=" .. data
    }
    httpReq(requestInfo)
end

-- Function to handle bot connection and status
local function handleBot(bot, growid, password)
    local totalTempTry = 0
    while true do
        local botStatus = bot:getBotStatus()

        if botStatus == Banned or botStatus == Suspended or botStatus == Wrong_Password or botStatus == AAP or botStatus == InvalidEmail then
            print("Account: " .. growid .. " | " .. password .. " is banned/suspended/wrong password/aap")
            bot:remove()
            return false
        end

        if botStatus == temporaryBan then
            totalTempTry = totalTempTry + 1
            if totalTempTry > 15 then
                print("Account: " .. growid .. " | " .. password .. " is temporarily banned")
                bot:remove()
                return false
            else
                sleep(5000)
                bot:remove()
                return true
            end
        end

        if botStatus == failedToFetchMeta or botStatus == LogonATTEMPTS then
            bot:remove()
            return true
        end

        if botStatus == Disconnected then
            bot:setBool("autoReconnect", true)
        end

        local botInfo = bot:getLocal()
        if bot:getEnetStatus() == Connected and botStatus == Success and botInfo.slot > 1 and botInfo.level > 0 then
            sleep(2000)
            botInfo = bot:getLocal()
            local level = botInfo.level
            local gems = botInfo.gems
            local wlAmount = bot:getItemCount(242) + (bot:getItemCount(7188) * 10000) + (bot:getItemCount(1796) * 100)
            local playtime, age, supporter = botInfo.playtime, botInfo.age, botInfo.supporter
            sendAccount(
                string.format("%s|%s|%d|%d|%d|%d|%d|%d",
                    growid, password, level, gems, wlAmount, playtime, age, bool_to_number(supporter))
            )
            print("Account: " .. growid .. " | " .. password .. " has been added to the database")
            bot:remove()
            return false
        else
            sleep(500)
        end
    end
end

-- Main loop to connect accounts and handle bot logic
while true do
    local growid, password = getAccount()

    if growid == nil or password == nil then
        sleep(1000)
    else
        local proxy = { HostName = getRandomProxy(), Type = SOCKS5 }
        local botId = connect(growid, password, proxy)

        if botId >= 0 then
            local bot = getBot(botId)
            bot:setBool("autoReconnect", true)
            bot:setReconnectInterval(1)
            
            if not handleBot(bot, growid, password) then
                sleep(1000)
            end
        else
            sleep(5000)
        end
    end
end