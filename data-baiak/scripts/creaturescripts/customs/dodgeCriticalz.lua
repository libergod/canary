local dodgeCriticalThree = CreatureEvent("dodgeCriticalThree")

function dodgeCriticalThree.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType)

    if (not attacker or not creature) then  
    	return primaryDamage, primaryType, secondaryDamage, secondaryType 
    end

    if primaryType == COMBAT_HEALING then
    	return primaryDamage, primaryType, secondaryDamage, secondaryType 
    end

	if attacker:isPlayer() then
		--Spdlog.info("Critical level: ".. attacker:getCriticalLevel())
		if (attacker:getCriticalLevel() * 1) >= math.random (0, 1000) then
			--primaryDamage = primaryDamage + math.ceil(primaryDamage * CRITICAL.PERCENT)
			primaryDamage = primaryDamage + math.ceil(primaryDamage * (attacker:getCriticalLevel() / 1000))
			--(player:getCriticalLevel() / 1000)
			--attacker:say("CRITICAL!", TALKTYPE_MONSTER_SAY)
			creature:getPosition():sendMagicEffect(CONST_ME_CRITICAL_DAMAGE)
		end
	end

    return primaryDamage, primaryType, secondaryDamage, secondaryType
end
dodgeCriticalThree:register()