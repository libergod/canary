local becomeDeathgaze = CreatureEvent("becomeDeathgaze")
function becomeDeathgaze.onThink(creature)
	if not creature:isMonster() then
		return true
	end
	local storagevalue = Game.getStorageValue(GlobalStorage.TheSecretLibrary.GhuloshFight)
	
	if storagevalue == 1 then
	
		Game.setStorageValue(GlobalStorage.TheSecretLibrary.GhuloshHealth, creature:getHealth())
		
		local creaturePosition = creature:getPosition()
			creature:remove()
			Game.createMonster("Bone Jaw", {x = 1145, y = 662, z = 8}, false, true)
			Game.createMonster("Bone Jaw", {x = 1147, y = 667, z = 8}, false, true)
		local monster = Game.createMonster("Ghulosh' Deathgaze", creaturePosition, false, true)
		monster:setHealth(Game.getStorageValue(GlobalStorage.TheSecretLibrary.GhuloshHealth), COMBAT_PHYSICALDAMAGE)
		
		addEvent(function()
				Game.createMonster("Bone Jaw", {x = 1173, y = 425, z = 8}, false, true)
				Game.createMonster("Bone Jaw", {x = 1179, y = 428, z = 8}, false, true)
				Game.createMonster("Bone Jaw", {x = 1177, y = 429, z = 8}, false, true)
				Game.createMonster("Bone Jaw", {x = 1181, y = 425, z = 8}, false, true)
				
				
			if monster then
			
				local deathsHp = monster:getHealth()
				
				monster:remove()
				
				local creatureBack = Game.createMonster("Ghulosh", creaturePosition, false, true)
				creatureBack:setHealth((deathsHp), COMBAT_PHYSICALDAMAGE)
				Game.setStorageValue(GlobalStorage.TheSecretLibrary.GhuloshFight, -1)
			else
				local creatureBack = Game.createMonster("Ghulosh", creaturePosition, false, true)
				creatureBack:setHealth(0, COMBAT_PHYSICALDAMAGE)
				
			end


			end, 30 * 1000)
	
	end

	return true
end

becomeDeathgaze:register()
