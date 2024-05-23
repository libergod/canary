local storageGetGlobal = TalkAction("/getglobal")

function storageGetGlobal.onSay(cid, words, param)
	local player = Player(cid)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end

	local target = param
	if target == nil then
		player:sendCancelMessage("Need storage number to check.")
		return false
	end


	--sto=getPlayerStorageValue(getPlayerByName(split[1]), tonumber(ch))
	sto = Game.getStorageValue(tonumber(param))
	
	doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "The storage with id: "..param.." is: "..sto..".")
	return false
end

storageGetGlobal:groupType("god")
storageGetGlobal:separator(" ")
storageGetGlobal:register()
