local onDamageIfBooks = CreatureEvent("onDamageIfBooks")
function onDamageIfBooks.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
	local storage = Game.getStorageValue(GlobalStorage.TheSecretLibrary.GorzindelFight)
	
	if storage < 5 then
		return false
	else
		return primaryDamage, primaryType, secondaryDamage, secondaryType
	end
end
onDamageIfBooks:register()