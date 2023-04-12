local bot = getBot()
local targetWorldName = "start" -- Target world name
local targetX = 0 -- Target X coordinate
local targetY = 0 -- Target Y coordinate

while true do -- Continuous loop
    
    if bot:inWorld() and bot:getCurrentWorld() == targetWorldName then -- If bot is in target world
        local x = math.floor(bot:getLocal().pos.x / 32) -- Get current X coordinate
        local y = math.floor(bot:getLocal().pos.y / 32) -- Get current Y coordinate
        
        if not bot:isInside(targetX, targetY, 0) then -- If not at target location
            bot:findPath(targetX, targetY) -- Move towards target location
        end
    else -- If bot is not in target world
        log("[", bot:getLocal().name, "] Not in world, warping to ", targetWorldName)
        bot:warp(targetWorldName) -- Warp to target world
        sleep(4500) -- Wait for warp to complete
    end

    sleep(500) 
end