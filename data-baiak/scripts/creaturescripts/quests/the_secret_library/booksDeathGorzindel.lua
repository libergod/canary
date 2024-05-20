local onBookGorzindelDeath = CreatureEvent("onBookGorzindelDeath")
function onBookGorzindelDeath.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local targetMonster = creature:getMonster()
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'stolen knowledge of armor' and
		targetMonster:getName():lower() ~= 'stolen knowledge of healing' and
		targetMonster:getName():lower() ~= 'stolen knowledge of lifesteal' and
		targetMonster:getName():lower() ~= 'stolen knowledge of spells' and
		targetMonster:getName():lower() ~= 'stolen knowledge of summoning' then
		return true
	end

	Game.setStorageValue(GlobalStorage.TheSecretLibrary.GorzindelFight, Game.getStorageValue(GlobalStorage.TheSecretLibrary.GorzindelFight) + 1)
	
	return true
end

onBookGorzindelDeath:register()
