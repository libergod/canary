--action 7539
local castle24h3 = MoveEvent()

function castle24h3.onStepIn(creature, item, position, fromPosition)

	if not creature:isPlayer() then
		return true
	end
		
	local guild = creature:getGuild()
	
	if guild == nil then
        creature:teleportTo(fromPosition, true)
        creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "".. CASTLE24H.castleNome .." ".. CASTLE24H.mensagemPrecisaGuild .."")
        creature:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end
	
	local Guild_ID = guild:getId()
	
		
    if guild == nil then
        creature:teleportTo(fromPosition, true)
        creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "".. CASTLE24H.castleNome .." ".. CASTLE24H.mensagemPrecisaGuild .."")
        creature:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end
	
	if Guild_ID == Game.getStorageValue(STORAGEVALUE_CASTLE_DOMINADO) or Guild_ID == CASTLE24H:getGuildIdFromCastle() then
		creature:teleportTo(fromPosition, true)
		creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "".. CASTLE24H.castleNome .." ".. CASTLE24H.mensagemGuildDominante .."")
        creature:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end

	local guildId = guild:getId()
	local guildName = guild:getName()
    local tempo = CASTLE24H.tempoAvisar

    if CASTLE24H.levelParaDominar == true and creature:getLevel() < CASTLE24H.level then
        creature:teleportTo(fromPosition, true)
        creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "".. CASTLE24H.castleNome .." ".. CASTLE24H.mensagemLevelMinimo .." (".. CASTLE24H.level .."+)")
        creature:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
    end

    if creature:getStorageValue(STORAGEVALUE_CASTLE_SPAM) > os.time() and guild then
        return true
    end

	if (guild) and (guildId == CASTLE24H:getGuildIdFromCastle()) then
		if Game.getStorageValue(STORAGEVALUE_CASTLE_DOMINADO) == nil or not Game.getStorageValue(STORAGEVALUE_CASTLE_DOMINADO) then
			creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "".. CASTLE24H.castleNome .." ".. CASTLE24H.mensagemBemvindo .."")
			return true
		end
	end

    if guildId ~= Game.getStorageValue(STORAGEVALUE_CASTLE_DOMINADO) or guildId ~= CASTLE24H:getGuildIdFromCastle() then
        Game.broadcastMessage("".. CASTLE24H.castleNome .." O castelo está sendo invadido pelo player ".. creature:getName() .." da guild ".. guildName ..".", MESSAGE_STATUS_WARNING)
        creature:setStorageValue(STORAGEVALUE_CASTLE_SPAM, (os.time() + tempo))
    else
        creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "".. CASTLE24H.castleNome .." ".. CASTLE24H.mensagemBemvindo .."")
    end

    return true
end


castle24h3:type("stepin")
castle24h3:aid(7539)
castle24h3:register()