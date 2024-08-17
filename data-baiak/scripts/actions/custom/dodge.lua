local dodge = Action()

function dodge.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getDodgeLevel() < DODGE.LEVEL_MAX then
		item:remove(1)
		player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
		player:setDodgeLevel(player:getDodgeLevel() + 1)
		player:sendCancelMessage("Voce aumentou sua skill de dodge para [" .. player:getDodgeLevel() .. "/" .. DODGE.LEVEL_MAX .. "].")
	elseif player:getDodgeLevel() >= DODGE.LEVEL_MAX then
		player:sendTextMessage(MESSAGE_ATTENTION, "Voce alcancou o maximo de Dodge.")
		return false
    end
	return true
end

dodge:id(22723)
dodge:register()