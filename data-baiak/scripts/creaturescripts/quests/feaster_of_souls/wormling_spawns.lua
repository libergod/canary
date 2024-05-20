local spawnWormling = CreatureEvent("spawnWormling")
function spawnWormling.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local targetMonster = creature:getMonster()
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'wormling' then
		return true
	end


	addEvent(function()
			Game.createMonster("Wormling", {x = 1008, y = 389, z = 8}, false, true)
		end, 5 * 1000)
		
	return true
end

spawnWormling:register()
