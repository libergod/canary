local dodgeCriticalOne = CreatureEvent("dodgeCriticalOne")

function dodgeCriticalOne.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType)

    if (not attacker or not creature) then  
    	return primaryDamage, primaryType, secondaryDamage, secondaryType 
    end

    if primaryType == COMBAT_HEALING then
    	return primaryDamage, primaryType, secondaryDamage, secondaryType 
    end

	if (attacker:isMonster() or attacker:isCreature()) and creature:isPlayer() then

		if ((creature:getDodgeLevel() * 1) >= math.random (0, 1000) and creature:isPlayer()) then
			primaryDamage = 0
			secondaryDamage = 0
			--creature:say("DODGE!", TALKTYPE_MONSTER_SAY)
			creature:getPosition():sendMagicEffect(CONST_ME_DODGE)
		end

	end

    return primaryDamage, primaryType, secondaryDamage, secondaryType
end
dodgeCriticalOne:register()

local dodgeCriticalTwo = CreatureEvent("dodgeCriticalTwo")

function dodgeCriticalTwo.onManaChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType)
    
    if (not attacker or not creature) then  
        return primaryDamage, primaryType, secondaryDamage, secondaryType 
    end
    
    if ((creature:getDodgeLevel() * 1) >= math.random (0, 1000) and creature:isPlayer())  then
        primaryDamage = 0
        secondaryDamage = 0
        --creature:say("DODGE!", TALKTYPE_MONSTER_SAY)
        creature:getPosition():sendMagicEffect(CONST_ME_DODGE)
    end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end
dodgeCriticalTwo:register()