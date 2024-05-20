local transformOnChangeHealth = CreatureEvent("transformOnChangeHealth")
function transformOnChangeHealth.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
	local storage = Game.getStorageValue(GlobalStorage.TheSecretLibrary.GhuloshFight)
	if creature:getHealth() <= 280000 and creature:getHealth() >= 275000 and storage ~= 1 then
		Game.setStorageValue(GlobalStorage.TheSecretLibrary.GhuloshFight, 1)
	elseif creature:getHealth() < 225000 and creature:getHealth() >= 220000 and storage ~= 1 then
		Game.setStorageValue(GlobalStorage.TheSecretLibrary.GhuloshFight, 1)
	elseif creature:getHealth() < 180000 and creature:getHealth() >= 175000 and storage ~= 1 then
		Game.setStorageValue(GlobalStorage.TheSecretLibrary.GhuloshFight, 1)
	elseif creature:getHealth() < 130000 and creature:getHealth() >= 125000 and storage ~= 1 then
		Game.setStorageValue(GlobalStorage.TheSecretLibrary.GhuloshFight, 1)
	elseif creature:getHealth() < 80000 and creature:getHealth() >= 75000 and storage ~= 1 then
		Game.setStorageValue(GlobalStorage.TheSecretLibrary.GhuloshFight, 1)		
	end
	return primaryDamage, primaryType, secondaryDamage, secondaryType
end
transformOnChangeHealth:register()