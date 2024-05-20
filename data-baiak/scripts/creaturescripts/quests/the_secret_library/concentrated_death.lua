local concentratedDeath = CreatureEvent("concentratedDeath")
function concentratedDeath.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local targetMonster = creature:getMonster()
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'concentrated death' then
		return true
	end

	Game.createMonster("The Book of Death", {x = 1176, y = 423, z = 8}, false, true)
	
	return true
end

concentratedDeath:register()
