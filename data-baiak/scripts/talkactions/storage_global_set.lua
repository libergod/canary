local storageSetGlobal = TalkAction("/setglobal")

function storageSetGlobal.onSay(cid, words, param)
	local player = Player(cid)
	if not player:getGroup():getAccess() or player:getAccountType() < ACCOUNT_TYPE_GOD then
		return true
	end

	local split = param:split(",")
	if split[2] == nil then
		player:sendCancelMessage("Insufficient values.")
		return false
	end

	local key = split[1]
	if key == nil then
		player:sendCancelMessage("Need storage number to check.")
		return false
	end

	Game.setStorageValue(tonumber(split[1]), split[2])
	
	doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Storage value set to: "..split[2]..".")
	return false
end

storageSetGlobal:groupType("god")
storageSetGlobal:separator(" ")
storageSetGlobal:register()
