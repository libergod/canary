local superUpCreature = CreatureEvent("superUpCreature")


function superUpCreature.onThink(creature)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	local storIndex = player:getStorageValue(STORAGEVALUE_SUPERUP_INDEX)
	local storTime = player:getStorageValue(STORAGEVALUE_SUPERUP_TEMPO)
	
	if storIndex ~= -1 and storIndex >= 20000 then
		local resultCave = db.storeQuery("SELECT guid_player, to_time FROM exclusive_hunts WHERE `hunt_id` = " .. storIndex .. " and `guid_player` = " .. player:getGuid())
		if not resultCave then
			player:setStorageValue(STORAGEVALUE_SUPERUP_TEMPO, -1)
			player:setStorageValue(STORAGEVALUE_SUPERUP_INDEX, -1)
			result.free(resultCave)
			return false
		end
	end

	for a, b in pairs(SUPERUP.areas) do
		-- need to change isInArea for another function
		if storIndex == a and isInArea(player:getPosition(), b.from, b.to) then
			if storTime <= os.time() then
				player:teleportTo(player:getTown():getTemplePosition())
				player:getPosition():sendMagicEffect(CONST_ME_POFF)
				db.query(string.format("UPDATE exclusive_hunts SET `guid_player` = %d, `time` = %s, `to_time` = %s WHERE `hunt_id` = %d", 0, 0, 0, storIndex))
				player:setStorageValue(STORAGEVALUE_SUPERUP_TEMPO, -1)
				player:setStorageValue(STORAGEVALUE_SUPERUP_INDEX, -1)
				player:sendTextMessage(MESSAGE_LOGIN, SUPERUP.msg.tempoAcabou)
			end
		end
		if storIndex == a and storTime <= os.time() then
			db.query(string.format("UPDATE exclusive_hunts SET `guid_player` = %d, `time` = %s, `to_time` = %s WHERE `hunt_id` = %d", 0, 0, 0, storIndex))
			player:setStorageValue(STORAGEVALUE_SUPERUP_TEMPO, -1)
			player:setStorageValue(STORAGEVALUE_SUPERUP_INDEX, -1)
			player:sendTextMessage(MESSAGE_LOGIN, SUPERUP.msg.tempoAcabou)
		end
	end

	return true
end

--superUpCreature:interval(1000*60) -- Once per second
superUpCreature:register()
