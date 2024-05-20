local noDamageSpellStealler = CreatureEvent("noDamageSpellStealler")
function noDamageSpellStealler.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)

	local targetMonster = creature:getMonster()
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'the spellstealer' then
		return true
	end
	
	local storagevalue = Game.getStorageValue(GlobalStorage.TheSecretLibrary.SpellsteallerTransform)
	
	if targetMonster:getName():lower() == "the spellstealer" and storagevalue == 3 then
		return 0, primaryType, 0, secondaryType
	elseif targetMonster:getName():lower() == "the spellstealer" and storagevalue ~= 3 then
		return primaryDamage, primaryType, secondaryDamage, secondaryType
	end

	return primaryDamage, primaryType, secondaryDamage, secondaryType
end

noDamageSpellStealler:register()