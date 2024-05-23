local lang = TalkAction("!lang")

function lang.onSay(player, words, param)	
	if param == "" then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Need parameter!")
		return true
	end
	
	
	if param == "en" then
		if getPlayerLanguage(player) == 2 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Language System] Your language is already set to english.")
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			return true
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Language System] You set your language as english.")
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
			doPlayerSetLanguage(player, 2)
			return true
		end
	end
	
	if param == "pt" then
		if getPlayerLanguage(player) == 0 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Language System] Sua lingua ja está setada para portugues.")
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			return true
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Language System] Voce setou sua lingua para portugues.")
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
			doPlayerSetLanguage(player, 0)
			return true
		end
	end
	
	if param == "es" then
		if getPlayerLanguage(player) == 1 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Language System] Su lengua ya esta definida como español.")
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			return true
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Language System] Tu definistes el español como tu lengua.")
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
			doPlayerSetLanguage(player, 1)
			return true
		end
	end
	
end

lang:groupType("normal")
lang:separator(" ")
lang:register()
