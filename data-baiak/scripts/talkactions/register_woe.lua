dofile("./_woe.lua")

local woe_register = TalkAction("!guild")

function woe_register.onSay(player, words, param)	

	local player2 = Player(player)

	local guild = player:getGuild()
	local Guild_ID = guild:getId()
	
	if guild then 
		if not Woe.isRegistered(player2) then
			if Guild_ID > 0 then
				player2:sendTextMessage(MESSAGE_EVENT_DEFAULT,"Success. Registered.")
				player2:getPosition():sendMagicEffect(CONST_ME_ASSASSIN)
				player2:setStorageValue(stor.register, 1)
			else
			player2:sendTextMessage(MESSAGE_EVENT_DEFAULT,"No Guild")
			player2:getPosition():sendMagicEffect(CONST_ME_POFF)
			end
		else
			player2:sendTextMessage(MESSAGE_EVENT_DEFAULT,"Already registered")
			player2:getPosition():sendMagicEffect(CONST_ME_POFF)
		end
	else
		player2:sendTextMessage(MESSAGE_EVENT_DEFAULT,"Not able to find guild")
		player2:getPosition():sendMagicEffect(CONST_ME_POFF)
	end

    return true
end

woe_register:groupType("god")
woe_register:register()
