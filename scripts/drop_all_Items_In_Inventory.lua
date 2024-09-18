bot = getBot()

if bot:inWorld() then
    for _, item in pairs(bot:getInventory()) do
        bot:sendPacket("action|drop\n|itemID|" .. item.id, 2)
        Sleep(bot:getMs() * 1.5)
        bot:sendPacket("action|dialog_return\ndialog_name|drop_item\nitemID|" .. item.id .. "|\ncount|" .. item.count, 2)
        Sleep(bot:getMs() * 1.5)
    end
end
