--action 7538
local castle24h2 = MoveEvent()

function castle24h2.onStepIn(creature, item, position, fromPosition)

	local player = creature:getPlayer()
	if not player then
		return true
	end
	
	local templo = player:getTown()
	local temploPos = templo:getTemplePosition()
	local guild = player:getGuild()

    if not guild then
  	player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:teleportTo(temploPos)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "".. CASTLE24H.castleNome .." ".. CASTLE24H.mensagemPrecisaGuild .."")
        return false
    end

	local guildId = guild:getId()
	local guildName = guild:getName()

	if guildId == Game.getStorageValue(STORAGEVALUE_CASTLE_DOMINADO) or guildId == CASTLE24H:getGuildIdFromCastle() then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "".. CASTLE24H.castleNome .." ".. CASTLE24H.mensagemGuildDominante .."")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:teleportTo(fromPosition, true)
	else
		Game.setStorageValue(STORAGEVALUE_CASTLE_DOMINADO, guildId)
		CASTLE24H:setGuildOwnerCastle(guildId)
		Game.broadcastMessage("".. CASTLE24H.castleNome .." O castelo foi dominado pelo player ".. player:getName() .." da guild ".. guildName ..".", MESSAGE_STATUS_WARNING)
		player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
		return true
	end
end

castle24h2:type("stepin")
castle24h2:aid(7538)
castle24h2:register()
