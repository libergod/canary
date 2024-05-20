local exitEvents = MoveEvent()

function exitEvents.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	-- Battlefield
	BATTLEFIELD:removePlayer(player:getId())

	-- SafeZone
	player:setStorageValue(SAFEZONE.storage, 0)
	SAFEZONE:removePlayer(player:getId())
	
	-- SnowBall
	for pos, players in ipairs(CACHE_GAMEPLAYERS) do
		if player:getId() == players then
			table.remove(CACHE_GAMEPLAYERS, pos)
			return true
		end
	end

	-- Geral
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você saiu do evento.")
	player:setStorageValue(STORAGEVALUE_EVENTS, 0)
	player:teleportTo(player:getTown():getTemplePosition())
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
end

exitEvents:type("stepin")
exitEvents:aid(1436)
exitEvents:register()