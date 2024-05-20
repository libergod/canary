local condition = Condition(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_TICKS, 10 * 1000) -- 10 segundos
condition:setParameter(CONDITION_PARAM_BUFF_DAMAGERECEIVED, 85) -- sofrendo 15% a menos de dano (total de 100 para neutro)

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
combat:setArea(createCombatArea(AREA_CIRCLE5X5))

local monsters = {
	"the devourer of secrets"
}

function onTargetTile(cid, pos)
	local tile = Tile(pos)
	if tile then
		local target = tile:getTopCreature()
		if target and target ~= cid then
			targetName = target:getName():lower()
			if table.contains(monsters, targetName) then
				target:addCondition(condition)
				--target:say("BECAME STRONGER!!", TALKTYPE_MONSTER_SAY)
			else
				if target:isPlayer() then
					return false
				end
				if target:getMaster() then
					return true
				end
			end
		end
	end
	return true
end

combat:setCallback(CALLBACK_PARAM_TARGETTILE, "onTargetTile")

function boom(cid, corpsePosition)
	local creature = Creature(cid)
	if not creature then
		return combat:execute(corpsePosition, positionToVariant(corpsePosition))
	end
		
	return combat:execute(creature, positionToVariant(corpsePosition))
end

local onDeathBookOfSecrets = CreatureEvent("onDeathBookOfSecrets")
function onDeathBookOfSecrets.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local targetMonster = creature:getMonster()
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'the book of secrets' then
		return true
	end

	addEvent(function()
			Game.createMonster("The Book of Secrets", creature:getPosition(), false, true)
		end, 1)
		
	addEvent(boom, 1, targetMonster:getId(), targetMonster:getPosition())
		
	return true
end

onDeathBookOfSecrets:register()