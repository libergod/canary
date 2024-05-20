local gorzindelDeath = CreatureEvent("gorzindelDeath")
function gorzindelDeath.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local targetMonster = creature:getMonster()
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'gorzindel' then
		return true
	end

	Game.setStorageValue(GlobalStorage.TheSecretLibrary.GorzindelFight, -1)
	
	return true
end

gorzindelDeath:register()
