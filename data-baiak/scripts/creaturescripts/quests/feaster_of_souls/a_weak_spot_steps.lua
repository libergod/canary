local stepsWeakSpot = CreatureEvent("stepsWeakSpot")
function stepsWeakSpot.onThink(creature)
	if creature:isMonster() then
		return true
	end
	
	local contadorMultiplier = creature:getStorageValue(Storage.Quest.U12_30.FeasterOfSouls.PaleWormSteps)
	local iconType = 21
	local position = creature:getPosition()
		
	
	
	if position.x >= 1092 and position.x <= 1118 and position.y >= 342 and position.y <= 363 and position.z == 9 then
		if contadorMultiplier >= 0 and contadorMultiplier < 100 then
			contadorMultiplier = contadorMultiplier + 1
			Karin:setCreatureIcon(creature:getId(), iconType, contadorMultiplier)
			creature:setStorageValue(Storage.Quest.U12_30.FeasterOfSouls.PaleWormSteps, contadorMultiplier)
			local hp = (creature:getHealth() * 0.10) + ((creature:getHealth() * 0.10) * contadorMultiplier/100)
			doTargetCombatHealth(ORIGIN_NONE, creature, COMBAT_LIFEDRAIN, -hp, -hp, CONST_ME_POFF, ORIGIN_NONE)
		else
			Karin:setCreatureIcon(creature:getId(), iconType, 1)
			creature:setStorageValue(Storage.Quest.U12_30.FeasterOfSouls.PaleWormSteps, 1)
		end
	else
		Karin:setCreatureIcon(creature:getId(), 0, 0)
		creature:setStorageValue(Storage.Quest.U12_30.FeasterOfSouls.PaleWormSteps, -1)
	end


	return true
end

stepsWeakSpot:register()