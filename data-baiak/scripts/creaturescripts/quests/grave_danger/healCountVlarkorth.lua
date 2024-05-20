local condition = Condition(CONDITION_REGENERATION, CONDITIONID_DEFAULT)
condition:setParameter(CONDITION_PARAM_SUBID, 88888)
condition:setParameter(CONDITION_PARAM_TICKS, 3 * 1000)
condition:setParameter(CONDITION_PARAM_HEALTHGAIN, 0.1)
condition:setParameter(CONDITION_PARAM_HEALTHTICKS, 3 * 1000)

local healCountVlarkorth = CreatureEvent("healCountVlarkorth")
function healCountVlarkorth.onThink(creature)
	if not creature:isMonster() then
		return true
	end
	
	local pos = creature:getPosition()
	
	local spectators = Game.getSpectators(pos, false, false, 2, 2, 2, 2)
	for i = 1, #spectators do
		local spectator = spectators[i]
		if spectator:getName():lower() == "count vlarkorth" then
			local creaturedos = Creature(spectator:getId())
			if not creaturedos:getCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT, 88888) then
				--creaturedos:say("The Minions heal's me !!", TALKTYPE_MONSTER_YELL)
				creaturedos:addCondition(condition)
				creaturedos:addHealth(math.random(200,550))
				return true
			end
		end
	end
	return true
end

healCountVlarkorth:register()
