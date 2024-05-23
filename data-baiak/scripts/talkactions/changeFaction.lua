local changeFaction = TalkAction("/faction")

function changeFaction.onSay(player, words, param)
	if not player:getGroup():getAccess() or player:getAccountType() < ACCOUNT_TYPE_GOD then
		return true
	end

	local split = param:split(",")
	
	if split[1] == "" or split[2] == "" or split[2] == 0 then
		player:sendCancelMessage("User Name or param required.")
		return false
	end

	local creature = Player(split[1])
	if not creature then
		player:sendCancelMessage("A creature with that name could not be found.")
		return false
	end

	local playerPosition = creature:getPosition()
	creature:setFaction(split[2])
	creature:sendTextMessage(MESSAGE_EVENT_DEFAULT,"Now you are member of faction: "..creature:getFaction())
	player:sendTextMessage(MESSAGE_EVENT_DEFAULT,"Successfully changed the faction of "..creature:getName().. " to "..creature:getFaction())
	return true
end

changeFaction:groupType("god")
changeFaction:separator(" ")
changeFaction:register()
