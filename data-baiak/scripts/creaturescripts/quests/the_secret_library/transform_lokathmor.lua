local transformLokathmor = CreatureEvent("transformLokathmor")
function transformLokathmor.onThink(creature)
	
	local targetMonster = creature:getMonster()
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'lokathmor' then
		return true
	end

	
	addEvent(function()
	
	local storagevalue = Game.getStorageValue(GlobalStorage.TheSecretLibrary.LokathmorFight)
	
	if targetMonster and storagevalue == -1 then

		Game.setStorageValue(GlobalStorage.TheSecretLibrary.LokathmorFight, 1)
	
	end

	end, 30 * 1000)

		
	return true
end
transformLokathmor:register()