local noDamageSourceOfOblivion = CreatureEvent("noDamageSourceOfOblivion")
function noDamageSourceOfOblivion.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)

	local targetMonster = creature:getMonster()
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'the scourge of oblivion' then
		return true
	end
	
	local storagevalue = Game.getStorageValue(GlobalStorage.TheSecretLibrary.ScourageTransform)
	
	if targetMonster:getName():lower() == "the scourge of oblivion" and storagevalue == 3 then -- blue, nao recebe dano
		Game.setStorageValue(GlobalStorage.TheSecretLibrary.ScourageTransform2, -1)
		addEvent(function()

			Game.setStorageValue(GlobalStorage.TheSecretLibrary.ScourageTransform, -1)

		end, 5 * 1000)
		return 0, primaryType, 0, secondaryType
		
	elseif targetMonster:getName():lower() == "the scourge of oblivion" and storagevalue == 2 then	-- red, nao recebe dano e da reflect
		Game.setStorageValue(GlobalStorage.TheSecretLibrary.ScourageTransform2, -1)
		addEvent(function()

			Game.setStorageValue(GlobalStorage.TheSecretLibrary.ScourageTransform, -1)

		end, 5 * 1000)
		--doTargetCombatHealth(creature, attacker, primaryType, -primaryDamage, -secondaryDamage, CONST_ME_NONE, ORIGIN_NONE)
		doTargetCombatHealth(creature, attacker, primaryType, -primaryDamage, -primaryDamage, CONST_ME_NONE)
		return 0, primaryType, 0, secondaryType
		
	elseif targetMonster:getName():lower() == "the scourge of oblivion" and storagevalue == -1 then
		return primaryDamage, primaryType, secondaryDamage, secondaryType
		
	end

	--return primaryDamage, primaryType, secondaryDamage, secondaryType
end

noDamageSourceOfOblivion:register()