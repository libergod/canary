local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))

local monsters = {
	"the scion of havoc",
}

function onTargetTile(cid, pos)
	local tile = Tile(pos)
	if tile then
		local target = tile:getTopCreature()
		if target and target ~= cid then
			targetName = target:getName():lower()
			if table.contains(monsters, targetName) then
				local max = math.random(950,1200)
				target:addHealth(max * 2, COMBAT_FIREDAMAGE)
			else
				local max = math.random(950,1200)
				target:addHealth(-max, COMBAT_FIREDAMAGE)
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

local onDeathSpawOfHavoc = CreatureEvent("onDeathSpawOfHavoc")
function onDeathSpawOfHavoc.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local targetMonster = creature:getMonster()
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'spawn of havoc' then
		return true
	end

	addEvent(boom, 1, targetMonster:getId(), targetMonster:getPosition())

	addEvent(function()
			Game.createMonster("spawn of havoc", {x = 1180, y = 450, z = 9}, false, true)
		end, 3 * 1000)
		
	return true
end

onDeathSpawOfHavoc:register()