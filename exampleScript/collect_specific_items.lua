bot = getBot()

function collectObject(itemId)
    for i, object in pairs(bot:getObjects()) do
        if object.id == itemId then
            local posX = math.floor(object.pos.x / 32)
            local posY = math.floor(object.pos.y / 32)
            if bot:isInside(posX, posY,10) then
                bot:collectObject(object.uid)
            else
                if bot:findPath(posX, posY) then
                    sleep(50)
                    bot:collectObject(object.uid)
                end
            end
            sleep(50)
        end
    end
end

collectObject()