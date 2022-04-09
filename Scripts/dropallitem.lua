for _,cur in pairs(getInventory()) do
sendPacket("action|drop\n|itemID|"..cur.id,2)
sendPacket("action|dialog_return\ndialog_name|drop_item\nitemID|"..cur.id.."|\ncount|"..cur.count,2)
Sleep(150)
end