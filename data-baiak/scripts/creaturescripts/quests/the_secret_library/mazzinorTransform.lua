local mazzinorTransform = CreatureEvent("mazzinorTransform")
function mazzinorTransform.onThink(creature)
	
	local targetMonster = creature:getMonster()
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'mazzinor' then
		return true
	end
	
	
	local storagevalue = Game.getStorageValue(GlobalStorage.TheSecretLibrary.MazzinorFight)
	
	if storagevalue == 1 then
		Game.setStorageValue(GlobalStorage.TheSecretLibrary.MazzinorHealth, creature:getHealth())
		
		local creaturePosition = creature:getPosition()
			creature:remove()
			Game.createMonster("Wild Knowledge", {x = 1141, y = 424, z = 8}, false, true)
			Game.createMonster("Wild Knowledge", {x = 1148, y = 424, z = 8}, false, true)
		local monster = Game.createMonster("Supercharged Mazzinor", creaturePosition, false, true)
		--monster:setHealth(Game.getStorageValue(GlobalStorage.TheSecretLibrary.MazzinorHealth), COMBAT_PHYSICALDAMAGE)
		
		addEvent(function()
				Game.createMonster("Wild Knowledge", {x = 1143, y = 425, z = 8}, false, true)
				Game.createMonster("Wild Knowledge", {x = 1145, y = 425, z = 8}, false, true)
				Game.createMonster("Wild Knowledge", {x = 1148, y = 425, z = 8}, false, true)
				Game.createMonster("Wild Knowledge", {x = 1144, y = 428, z = 8}, false, true)
				Game.createMonster("Wild Knowledge", {x = 1146, y = 428, z = 8}, false, true)
				
			if monster then
			
				monster:remove()
				
				local creatureBack = Game.createMonster("Mazzinor", creaturePosition, false, true)
				creatureBack:setHealth(Game.getStorageValue(GlobalStorage.TheSecretLibrary.MazzinorHealth), COMBAT_PHYSICALDAMAGE)
				Game.setStorageValue(GlobalStorage.TheSecretLibrary.MazzinorFight, -1)

				addEvent(function()			
					Game.setStorageValue(GlobalStorage.TheSecretLibrary.MazzinorFight, 1)
				end, 15 * 1000)
				
				return true

			else
				local creatureBack = Game.createMonster("Mazzinor", creaturePosition, false, true)
				creatureBack:setHealth(0, COMBAT_PHYSICALDAMAGE)
				return true
				
			end


			end, 9 * 1000)
		return true
	end
	
	return true
end

mazzinorTransform:register()
