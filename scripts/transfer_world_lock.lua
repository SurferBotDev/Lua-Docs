local storage = {
    "name|id",
}

local mainStorage = "mainSave|id"

local bot = getBot()
bot:setBool("autoReconnect", true)
bot:setReconnectInterval(5)

-- Utility function to split a string by a delimiter
function split(input, delimiter)
    local result = {}
    for match in (input .. delimiter):gmatch("(.-)" .. delimiter) do
        table.insert(result, match)
    end
    return result
end

-- Converts World Locks if there are more than 99 and fewer than 200 Diamond Locks
function ConvertWL()
    local wlCount = bot:getItemCount(242)  -- World Lock ID
    local dlCount = bot:getItemCount(1796) -- Diamond Lock ID
    if wlCount > 99 and dlCount ~= 200 then
        local packet = {type = PACKET_ITEM_ACTIVATE_REQUEST, int_data = 242}
        bot:sendPacketRaw(packet)
        sleep(150)
    end
end

-- Collects World Locks (ID 242) from the ground if found
function CollectWL()
    for _, object in pairs(bot:getObjects()) do
        local objectX = math.floor(object.pos.x / 32)
        local objectY = math.floor(object.pos.y / 32)
        if object.id == 242 and bot:findPath(objectX, objectY) then
            bot:collectObject(object.uid)
            sleep(450)
            return true
        end
    end
    return false
end

-- Checks if the bot is standing on the main door
function checkMainDoor(world, localPlayer)
    return world.maindoor.x == math.floor(localPlayer.pos.x / 32) and 
           world.maindoor.y == math.floor(localPlayer.pos.y / 32)
end

-- Drops Diamond Locks (ID 1796) to the main storage
function dropToMainStorage()
    local splitData = split(mainStorage, "|")
    local dlCount = bot:getItemCount(1796)

    while dlCount > 0 do
        local world = bot:getWorld()
        local localPlayer = bot:getLocal()

        if splitData[1] == world.name and checkMainDoor(world, localPlayer) then
            bot:drop(1796, dlCount)
            sleep(5000)
        else
            bot:warp(mainStorage)
            sleep(4500)
        end

        dlCount = bot:getItemCount(1796)
    end
    sleep(25)
end

-- Main function for processing each storage location
function processStorage(storageData)
    local splitData = split(storageData, "|")
    local worldName = splitData[1]

    while true do
        if bot:getItemCount(1796) > 199 then
            dropToMainStorage()
        end

        if bot:getEnetStatus() == Connected and bot:getBotStatus() == Success then
            local world = bot:getWorld()
            local localPlayer = bot:getLocal()

            if worldName == world.name then
                if checkMainDoor(world, localPlayer) then
                    bot:warp(storageData)
                    sleep(8500)
                else
                    if bot:inWorld() then
                        ConvertWL()
                        if not CollectWL() and bot:getItemCount(242) < 100 then
                            break
                        end
                        sleep(1500)
                    end
                end
            else
                bot:warp(storageData)
                sleep(7500)
            end
        end
        sleep(25)
    end
end

-- Iterate through all storage locations
for _, storageData in ipairs(storage) do
    processStorage(storageData)
end

-- Drop remaining Diamond Locks to main storage
if bot:getItemCount(1796) > 0 then
    dropToMainStorage()
end
