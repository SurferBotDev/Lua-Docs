local Deposit = require("surferWalletApi")
local saveWorld, saveID, bot, api = "", "", nil, nil
local lastWorldLockAmount, currentLogID, saveAt, totalTp = -1, 0, nil, 0
local depositInformation, response, botReadyToWarp = nil, nil, false
local logData, bannedEveryone = {}, false

-- Set the log ID
local function setLogId(logID)
    currentLogID = logID
end

local alt_logger = log
local function log(...)
    local timestamp = os.date("[%Y-%m-%d %H:%M:%S]")
    local args = {...}
    for i, arg in ipairs(args) do
        if type(arg) == "boolean" then
            args[i] = tostring(arg)
        end
    end
    local logEntry = timestamp .. " - " .. table.concat(args, " ")
    table.insert(logData, logEntry)
    print(logEntry)
    alt_logger(logEntry)
end

-- Save log data to file and reset log ID
local function logDone()
    if currentLogID == 0 then
        print("No log ID set. Cannot save log.")
        return
    end

    local filepath = "deposits/" .. currentLogID .. ".txt"
    os.execute("mkdir -p deposits")

    local file = io.open(filepath, "w")
    if file then
        for _, entry in ipairs(logData) do
            file:write(entry .. "\n")
        end
        file:close()
        print("Log saved to " .. filepath)
    else
        print("Error: Unable to open file for writing.")
    end

    currentLogID = 0
    logData = {}
end

-- Handle spawn and world interactions
function onSpawn(packet)
    if packet[0] == "onSpawn" then
        local name = packet[1]:match("name|([^|\n]+)"):sub(3, -3)
        if name ~= depositInformation.targetGrowID then
            sleep(100)
            bot:say("/ban " .. name)
        end
    elseif packet[0] == "OnRequestWorldSelectMenu" or packet[0] == "OnSetClothing" then
        botReadyToWarp = true
    end
end

-- Collect locks from nearby objects
function collectLocks()
    for _, object in pairs(bot:getObjects()) do
        if bot:isInside(object.pos.x / 32, object.pos.y / 32, 10) and
           (object.id == 1796 or object.id == 242 or object.id == 7188) then
            bot:collectObject(object.uid)
            sleep(bot:getMs() * 1.5)
        end
    end
end

-- Log and ban all players in the world
function banEveryone()
    if not bot:inWorld() then return end

    for _, player in pairs(bot:getPlayers()) do
        local playerName = player.name:sub(3, -3)
        bot:say("/ban " .. playerName)
        sleep(bot:getMs() * 3)
    end
    log("Banned everyone in the world")
end

-- Check and update current world lock amount
function checkCurrentWorldLockAmount()
    if lastWorldLockAmount == -1 then return false end

    local current = 0
    for _, item in pairs(bot:getInventory()) do
        if item.id == 1796 or item.id == 242 or item.id == 7188 then
            if item.id == 1796 then
                current = current + (item.count * 100)
            elseif item.id == 242 then
                current = current + item.count
            elseif item.id == 7188 then
                current = current + (item.count * 10000)
            end
        end
    end

    if lastWorldLockAmount ~= current then
        api:addBalance(current - lastWorldLockAmount)
        api:setDepositStatus("Success")
        log("Added Balance: ", current - lastWorldLockAmount, " ID: ", api.depositID)
        lastWorldLockAmount = current
    end

    return false
end

-- Convert World Locks to Diamond Locks
function convertWL_TO_DL()
    if bot:getItemCount(242) > 99 and bot:getItemCount(1796) ~= 200 then
        bot:sendPacketRaw({ type = PACKET_ITEM_ACTIVATE_REQUEST, int_data = 242 })
        log("Changed WL TO DL")
        sleep(1000)
    end
end

-- Main loop
while true do
    ::handleNewDeposit::

    response, depositInformation = retriveDepositRequest()
    local sendWaitingResponse, saveMode, receivedAnyLock = false, false, false
    botReadyToWarp, bannedEveryone = false, false

    if currentLogID ~= 0 then
        logDone()
        setLogId(0)
    end

    if response then
        setLogId(depositInformation.depositID)
        log("depositID: ", depositInformation.depositID)

        lastWorldLockAmount, receivedAnyLock, bannedEveryone = -1, false, false
        local expireAt, saveAt = os.time() + 120, os.time() + 999

        api = Deposit.new(depositInformation.depositID)

        local botID = addBot(depositInformation.botName, depositInformation.botPass)
        if botID >= 0 then
            bot = getBot(botID)
            bot:setBool("autoreconnect", true)
            bot:setReconnectInterval(5)
            bot:addHook(onSpawn, varlist)

            sleep(5000)
            bot:setBool("autocollect", false)

            ::handleBot::

            if bot:getEnetStatus() == Connected and bot:getBotStatus() == Success then
                if #bot:getInventory() == 0 then
                    sleep(100)
                    goto handleBot
                elseif lastWorldLockAmount == -1 then
                    setCurrentWorldLock()
                end

                local world = bot:getWorld()
                if bot:inWorld() and world.name == depositInformation.worldName and not saveMode then
                    if checkCurrentWorldLockAmount() then
                        expireAt, saveAt = os.time() + 30, os.time() + 15
                        receivedAnyLock = true
                    end

                    collectLocks()
                    convertWL_TO_DL()

                    if os.time() > saveAt and not bannedEveryone then
                        saveAt, expireAt, saveMode, bannedEveryone = os.time() + 5, os.time() + 120, true, true
                        banEveryone()
                        goto handleBot
                    end
                elseif bot:inWorld() and world.name == saveWorld and saveMode then
                    if not receivedAnyLock then
                        api:setDepositStatus("timeout")
                        receivedAnyLock = true
                    end

                    while true do
                        local whiteDoor = bot:getWorld().maindoor
                        if bot:isInside(whiteDoor.x, whiteDoor.y, 1) then
                            bot:warp(saveWorld .. "|" .. saveID)
                            sleep(4000)
                            log("Bot in White Door trying to teleport to door ID.")
                        else
                            log("Successfully bot is in saveWorld; now starting to drop the DLS")
                            for _, itemID in ipairs({242, 1796, 7188}) do
                                local itemCount = bot:getItemCount(itemID)
                                if itemCount > 0 then
                                    log("Dropped ", itemCount, "x ", getItemInfo(itemID).name)
                                    bot:drop(itemID, itemCount)
                                    sleep(5500)
                                end
                            end
                            bot:sendPacket("action|quit_to_exit", 3)
                            sleep(500)
                            bot:remove()
                            goto handleNewDeposit
                        end
                    end
                else
                    if saveMode then
                        if not bot:itemExist(242) and not bot:itemExist(1796) and not bot:itemExist(7188) then
                            sleep(1500)
                            api:setDepositStatus("timeout")
                            sleep(2000)
                            bot:warp(saveWorld .. "|" .. saveID)
                        end
                    end
                    bot:say("/warp "..saveWorld.."|"..saveID)
                end
            else
                log("Failed to log in the bot")
            end
        else
            log("Failed to create the bot")
        end
    end
end