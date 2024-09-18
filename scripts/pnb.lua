-- Initialize bot and item details
local bot = getBot()
local x, y = 52, 22
local itemID = 4584
local breakHits = getItemInfo(itemID).breakHits
local botBreak = 6
local delay_ms = 175
local pickaxeID = 98

-- Function to equip an item
local function equipItem(itemID)
    local packet = {
        type = 10,
        int_data = itemID
    }
    bot:sendPacketRaw(packet)
    sleep(200)
end

-- Equip pickaxe if exists and not equipped
if bot:itemExist(pickaxeID) and not bot:isEquipped(pickaxeID) then
    equipItem(pickaxeID)
    botBreak = 8
end

-- Calculate break hits based on breakHits and bot's tool
if breakHits < 0 then
    botBreak = (botBreak == 6) and 10.5 or botBreak
    breakHits = math.ceil(-breakHits * botBreak)
else
    breakHits = math.ceil(breakHits / botBreak)
end

-- Main loop for breaking and placing tiles
while true do
    -- Break tile if solid, otherwise place new tile
    if bot:isSolid(x, y) then
        for i = breakHits, 1, -1 do
            bot:hitTile(x, y)
            sleep(delay_ms)
        end
        sleep(15)
    else
        if bot:itemExist(itemID) then
            bot:placeTile(x, y, itemID)
            sleep(delay_ms)
        else
            break -- Exit loop if no item available
        end
    end
    sleep(1)
end
