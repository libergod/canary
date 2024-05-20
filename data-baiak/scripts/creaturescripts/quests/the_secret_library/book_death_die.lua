local onBookOfDeathDie = CreatureEvent("onBookOfDeathDie")
function onBookOfDeathDie.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local targetMonster = creature:getMonster()
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'the book of death' then
		return true
	end

	Game.createMonster("Concentrated Death", {x = 1177, y = 424, z = 8}, false, true)
	
	return true
end

onBookOfDeathDie:register()
