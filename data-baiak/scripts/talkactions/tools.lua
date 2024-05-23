local ropeshovel = TalkAction("!tools")

function ropeshovel.onSay(player, words, param)
	local usedelay = 5 -- exhaust in seconds 
	if player:getStorageValue(Storage.Tools) < os.time() then
		if player:getItemCount(3457) >= 1 then --shovel
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "you already have an shovel")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'you received an Shovel!')
			player:addItem(3457)
		end
		if player:getItemCount(3003) >= 1 then --rope
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "you already have an rope")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'you received an Rope!')
			player:addItem(3003)
		end
		if player:getItemCount(3456) >= 1 then --pick			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "you already have an pick")		else			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'you received an Pick!')			player:addItem(3456)		end		if player:getItemCount(3308) >= 1 then --machete			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "you already have an machete")		else			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'you received an machete!')			player:addItem(3308)		end
		player:setStorageValue(Storage.Tools, os.time() + usedelay)
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "you need wait 5 seconds to use this command again")
	end
	return false
end

ropeshovel:groupType("normal")
ropeshovel:register()

