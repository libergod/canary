--action 7539
local castle24h4 = MoveEvent()

function castle24h4.onStepIn(creature, item, position, fromPosition)

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
	
	local guildId = guild:getId()
	local guildName = guild:getName()
	
	if guildId == Game.getStorageValue(STORAGEVALUE_CASTLE_DOMINADO) or guildId == CASTLE24H:getGuildIdFromCastle() then
		creature:sendCancelMessage(CASTLE24H.castleNome .." " .. CASTLE24H.mensagemBemvindo)
		return true
	else
		creature:sendCancelMessage(CASTLE24H.castleNome .." " .. CASTLE24H.mensagemGuildNaoDominante .." (".. guildName ..")")
		creature:teleportTo(fromPosition)
		creature:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end
	
    return true
end


castle24h4:type("stepin")
castle24h4:aid(7540)
castle24h4:register()