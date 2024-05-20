local function spawnSouless(pos)
	Game.createMonster("soulless minion", pos, false, true)
	spawningSoul = false
	return true
end

local deathSoullessMinion = CreatureEvent("deathSoullessMinion")
function deathSoullessMinion.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local targetMonster = creature:getMonster()
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'soulless minion' then
		return true
	end


	local positions = {
		{x = 703, y = 446, z = 7},
		{x = 709, y = 446, z = 7},
		{x = 705, y = 450, z = 7},
		{x = 711, y = 451, z = 7},
		{x = 700, y = 452, z = 7},
		{x = 705, y = 440, z = 7},
	}

	local pos = positions[math.random(1, #positions)]
	addEvent(spawnSouless, 2000, pos)
	spawningSoul = true
	
	return true
end

deathSoullessMinion:register()
