local condition = Condition(CONDITION_REGENERATION, CONDITIONID_DEFAULT)
condition:setParameter(CONDITION_PARAM_SUBID, 88888)
condition:setParameter(CONDITION_PARAM_TICKS, 1 * 1000)
condition:setParameter(CONDITION_PARAM_HEALTHGAIN, 0.01)
condition:setParameter(CONDITION_PARAM_HEALTHTICKS, 1 * 1000)


local brainHeadHeal = CreatureEvent("brainHeadHeal")
function brainHeadHeal.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType)
	if attacker and attacker:isPlayer() then
		if creature:getName():lower() == "brain head" then

			if (primaryType == COMBAT_ENERGYDAMAGE or secondaryType == COMBAT_ENERGYDAMAGE and not creature:getCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT, 88888)) then
				creature:addCondition(condition)
				addEvent(function(cid)
					local creature = Creature(cid)
					if not creature then
						return
					end
					creature:addHealth(300000)
					creature:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
					creature:say("Brain Head heals him self!", TALKTYPE_ORANGE_2)
					return true
				end, 1000, creature:getId())
			end
		
		end
		
	end
	return primaryDamage, primaryType, secondaryDamage, secondaryType
end
brainHeadHeal:register()
