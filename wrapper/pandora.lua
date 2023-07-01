-- Pandora Wrapper For SurferBot
-- Download the Lua script to the same folder as the SurferBot , and then add the line dofile("pandora.lua") as the first line
local mainGetBot = getBot

function getStatusAsString(bot)
    local status = ""
    local botStatus = bot:getBotStatus()
    if botStatus == Disconnected then
        status = "Disconnected"
    elseif botStatus == Connected then
        status = "Connected"
    elseif botStatus == Banned then
        status = "Banned"
    elseif botStatus == Suspended then
        status = "Suspended"
    elseif botStatus == Wrong_Password then
        status = "Wrong_Password"
    elseif botStatus == Update_Required then
        status = "Update_Required"
    elseif botStatus == Maintenance then
        status = "Maintenance"
    elseif botStatus == AAP then
        status = "AAP"
    elseif botStatus == LogonATTEMPTS then
        status = "LogonATTEMPTS"
    elseif botStatus == OnSendToServer then
        status = "OnSendToServer"
    elseif botStatus == Captcha then
        status = "Captcha"
    elseif botStatus == Success then
        status = "Success"
    elseif botStatus == SERVER_OVERLOADED then
        status = "SERVER_OVERLOADED"
    elseif botStatus == BypassTutorial then
        status = "BypassTutorial"
    end
    return status
end

function getBot(id)
    local bot
    if id == nil then
        bot = mainGetBot()
    elseif type(id) == "userdata" then
        bot = id
    else
        bot = mainGetBot(id)
    end


    botInfo = {}
    botInfo.name = bot:getLocal().name
    botInfo.world = bot:getWorld().name
    botInfo.status = getStatusAsString(bot)
    botInfo.x = math.floor(bot:getLocal().pos.x / 32)
    botInfo.y = math.floor(bot:getLocal().pos.y / 32)
    botInfo.level = bot:getLocal().level
    botInfo.slots = bot:getLocal().slot
    botInfo.captcha = 1

    botInfo.say = function(text)
        bot:say(text)
    end

    botInfo.getTile = function(x, y)
        local tile = bot:getTile(x, y)
        local tileInfo = {
            fg = tile.fg,
            bg = tile.bg,
            x = tile.x,
            y = tile.y,
            flags = tile.flags,
            ready = bot:canHarvest(x, y)
        }
        return tileInfo
    end

    botInfo.getTiles = function()
        local tiles = bot:getTiles()
        local tileInfoList = {}
        for _, tile in pairs(tiles) do
            local tileInfo = {
                fg = tile.fg,
                bg = tile.bg,
                x = tile.x,
                y = tile.y,
                flags = tile.flags,
                ready = bot:canHarvest(tile.x, tile.y)
            }
            table.insert(tileInfoList, tileInfo)
        end
        return tileInfoList
    end

    botInfo.sendPacketRaw = function(pkt)
        bot:sendPacketRaw(pkt)
    end

    botInfo.getClothes = function()
        local clothesList = {}
        for _, cur in pairs(bot:getInventory()) do
            if bot:isEquipped(cur.id) then
                local clothesInfo = {
                    name = getItemInfo(cur.id).name,
                    id = cur.id
                }
                table.insert(clothesList, clothesInfo)
            end
        end
        return clothesList
    end

    botInfo.getInventory = function()
        local inventoryList = {}
        for _, cur in pairs(bot:getInventory()) do
            local inventoryInfo = {
                name = getItemInfo(cur.id).name,
                id = cur.id,
                count = cur.count
            }
            table.insert(inventoryList, inventoryInfo)
        end
        return inventoryList
    end

    botInfo.getPlayers = function()
        local PlayersList = {}
        for netid, player in pairs(bot:getPlayers()) do
            local PlayerInfo = {
                name = player.name,
                netid = player.netid,
                userid = player.userid,
                country = player.country,
                x = player.pos.x,
                y = player.pos.y
            }
            table.insert(PlayersList, PlayerInfo)
        end
        return PlayersList
    end

    botInfo.getObjects = function()
        local objectList = {}
        for id, object in pairs(bot:getObjects()) do
            local objectInfo = {
                id = object.id,
                count = object.count,
                x = object.pos.x,
                y = object.pos.y,
                oid = object.uid
            }
            table.insert(objectList, objectInfo)
        end
        return objectList
    end

    botInfo.move = function(x, y)
        local currentPosX = math.floor(bot:getLocal().pos.x / 32)
        local currentPosY = math.floor(bot:getLocal().pos.y / 32)
        return bot:findPath(currentPosX + x, currentPosY + y)
    end

    botInfo.findItem = function(id)
        return bot:getItemCount(id)
    end

    botInfo.findClothes = function(id)
        return bot:isEquipped(id)
    end

    botInfo.punch = function(x, y)
        return bot:hitTile(bot:getLocal().pos.x + x, bot:getLocal().pos.y + y)
    end

    botInfo.place = function(id, x, y)
        return bot:placeTile(bot:getLocal().posx + x, bot:getLocal().posy + y, id)
    end

    botInfo.wrench = function(x, y)
        return bot:wrenchTile(bot:getLocal().posx + x, bot:getLocal().posy + y)
    end

    botInfo.drop = function(id, count)
        count = count or bot:getItemCount(id)
        return bot:drop(id, count)
    end

    botInfo.wear = function(id)
        local packet = {}
        packet.type = 10
        packet.int_data = id -- Clothing ID (Jeans)
        bot:sendPacketRaw(packet)
    end

    botInfo.collect = function(range, itemId)
        for _, object in pairs(bot:getObjects()) do
            local posX = math.floor(object.pos.x / 32)
            local posY = math.floor(object.pos.y / 32)
            if bot:isInside(posX, posY, range) then
                if itemId == nil or object.id == itemId then
                    bot:collectObject(object.uid)
                end
            end
        end
    end

    botInfo.collectSet = function(status, range)
        bot:autoCollect(range, status)
    end

    botInfo.sendPacket = function(type, text)
        bot:sendPacket(text, type)
    end

    botInfo.connnect = function()
        bot:reConnect()
    end

    botInfo.disconnect = function()
        bot:disconnect()
    end

    botInfo.getPing = function()
        return bot:getMs()
    end

    botInfo.getSignal = function()
        local currentSignal = bot:getSignal()
        if currentSignal == GREEN then
            return "green"
        elseif currentSignal == YELLOW then
            return "yellow"
        else
            return "red"
        end
    end

    botInfo.setBool = function(type, status)
        if type == "Ignore Gems" then
            bot:setBool("ignoreGem", status)
        elseif type == "Auto Reconnect" then
            bot:setBool("autoReconnect", status)
        elseif type == "Auto Leave" then
            bot:setBool("modLeave", status)
        elseif type == "Auto Access" then
            bot:setBool("autoAccess", status)
        end
    end

    return botInfo
end

if #getAllBot() ~= 0 then
    local currentBot = getBot()
    for funcName, func in pairs(currentBot) do
        _G[funcName] = func
    end
end

function getBots()
    local botTable = {}
    for k, v in pairs(getAllBot()) do
        botTable[k] = getBot(v)
    end
    return botTable
end

function removeBot(id)
    mainGetBot(id):remove()
end

function addBot(id, pass, proxy)
    local proxyTable = {}
    if proxy ~= nil then
        local ip, port, username, password = proxy:match("([^:]+):([^:]+):([^:]+):([^:]+)")
        proxyTable.HostName = ip .. ":" .. port
        proxyTable.Username = username
        proxyTable.Password = password
        proxyTable.Type = "SOCKS5"
    end
    if pass == "" then
        if proxy == nil then
            addGuest(id)
        else
            addGuest(id, proxyTable)
        end
    else
        if proxy == nil then
            connect(id, pass)
        else
            connect(id, pass, proxyTable)
        end
    end
end

function request(method, URL)
    local requestInfo = {}
    requestInfo.url = URL
    if method == "POST" then
        requestInfo.method = POST
    elseif method == "PUT" then
        requestInfo.method = PUT
    elseif method == "GET" then
        requestInfo.method = GET
    end
    return httpReq(requestInfo).body
end
