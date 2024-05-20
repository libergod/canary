local greeWormKill = CreatureEvent("GreeWormKill")
function greeWormKill.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local targetMonster = creature:getMonster()
	if not targetMonster then
		return false
	end

	local targetName = targetMonster:getName():lower()
	if targetName ~= 'greed worm' then
		return false
	end

	local pos = creature:getPosition()
	
	local spectators = Game.getSpectators(pos, false, false, 2, 2, 2, 2)
	for i = 1, #spectators do
		local spectator = spectators[i]
		if spectator:getName():lower() == "the pale worm" then
			local creaturedos = Creature(spectator:getId())
			if Game.getStorageValue(GlobalStorage.FeasterOfSouls.ThePaleWorm.Battle) ~= 1 then
				creature:say("The roar of anger summons another worm to the feast!", TALKTYPE_ORANGE_1)
				Game.createMonster("hunger worm", { x=1105, y=350, z=8 })
				Game.setStorageValue(GlobalStorage.FeasterOfSouls.ThePaleWorm.Battle, 1)
				return true
			end
		end
	end
	
	return true
end

greeWormKill:register()
