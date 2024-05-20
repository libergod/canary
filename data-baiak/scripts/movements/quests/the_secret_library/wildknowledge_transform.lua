local function removeVortex(position)
	local id = 7804
	local teleportItem = Tile(position):getItemById(id)
	if not teleportItem then
		return
	end

	position:sendMagicEffect(CONST_ME_POFF)
	teleportItem:remove()
	teleportItem:setActionId()
	
end

local condition = Condition(CONDITION_OUTFIT)
condition:setOutfit({lookType = 1065})
condition:setTicks(-1)

local wildKnowledgeTransform = MoveEvent()

function wildKnowledgeTransform.onStepIn(creature, item, position, fromPosition)
	if not creature:isPlayer() then
		return false
	end
	
	item:remove()
	creature:addCondition(condition)
	creature:setStorageValue(Storage.Quest.U11_80.TheSecretLibrary.MazzinorProtection, 1)
	
	addEvent(function()
		creature:removeCondition(CONDITION_OUTFIT)
		creature:setStorageValue(Storage.Quest.U11_80.TheSecretLibrary.MazzinorProtection, 0)
	end, 8 * 1000)	
		
	return true
end

wildKnowledgeTransform:type("stepin")
wildKnowledgeTransform:aid(21304)
wildKnowledgeTransform:register()
