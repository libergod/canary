local bookLokathmor = Action()

function bookLokathmor.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.itemid == 27881 and item.itemid == 28488 then
		item:remove()
		target:transform(27879)
		target:setActionId(21306)
		target:getPosition():sendMagicEffect(CONST_ME_HOLYDAMAGE)
		player:say("THE DARK KNOWLEDGE FILLS THE BOOK WITH RAW POWER - READY TO BE UNLEASHED!", TALKTYPE_MONSTER_YELL)

		return true
	else
		player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end
	return true
end

bookLokathmor:id(28488)
bookLokathmor:register()

