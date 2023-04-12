bot = getBot("growid")

for _,cur in pairs(bot:getInventory()) do
bot:sendPacket("action|drop\n|itemID|"..cur.id,2)
bot:sendPacket("action|dialog_return\ndialog_name|drop_item\nitemID|"..cur.id.."|\ncount|"..cur.count,2)
Sleep(150)
end
