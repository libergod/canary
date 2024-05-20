local transformMazzinor = CreatureEvent("transformMazzinor")
function transformMazzinor.onThink(creature)
	
	local targetMonster = creature:getMonster()
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'mazzinor' then
		return true
	end

	
	addEvent(function()
	
	local storagevalue = Game.getStorageValue(GlobalStorage.TheSecretLibrary.MazzinorFight)
	
	if targetMonster and storagevalue == -1 then

		Game.setStorageValue(GlobalStorage.TheSecretLibrary.MazzinorFight, 1)
	
	end

	end, 15 * 1000)

		
	return true
end
transformMazzinor:register()