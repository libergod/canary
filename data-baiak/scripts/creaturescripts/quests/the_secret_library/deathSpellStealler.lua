local deathSpellStealler = CreatureEvent("deathSpellStealler")
function deathSpellStealler.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local targetMonster = creature:getMonster()
	if not targetMonster:isMonster() then
		return true
	end

	if targetMonster:getName():lower() ~= 'the spellstealer' then
		return true
	end
	
	creature:say("After the death of the spellstealer the invasion on the central chamber continues!", TALKTYPE_MONSTER_YELL)
	
	Game.setStorageValue(GlobalStorage.TheSecretLibrary.ScourageInvasionKills, 0) -- count kills
	
	addEvent(function()
			Game.setStorageValue(GlobalStorage.TheSecretLibrary.ScourageInvasionLevel, 5) -- nivel invasao			
			Game.createMonster("Imp Intruder", {x = 1158, y = 429, z = 9}, false, true)
			Game.createMonster("Invading Demon", {x = 1167, y = 429, z = 9}, false, true)
			Game.createMonster("Ravenous Beyondling", {x = 1160, y = 432, z = 9}, false, true)
			Game.createMonster("Rift Breacher", {x = 1166, y = 432, z = 9}, false, true)
			Game.createMonster("Rift Minion", {x = 1156, y = 435, z = 9}, false, true)
			Game.createMonster("Rift Spawn", {x = 1170, y = 435, z = 9}, false, true)
			Game.createMonster("Yalahari Despoiler", {x = 1163, y = 427, z = 9}, false, true)
			
			addEvent(function()
				Game.setStorageValue(GlobalStorage.TheSecretLibrary.ScourageInvasionLevel, 6) -- nivel invasao			
				Game.createMonster("Imp Intruder", {x = 1158, y = 429, z = 9}, false, true)
				Game.createMonster("Invading Demon", {x = 1167, y = 429, z = 9}, false, true)
				Game.createMonster("Ravenous Beyondling", {x = 1160, y = 432, z = 9}, false, true)
				Game.createMonster("Rift Breacher", {x = 1166, y = 432, z = 9}, false, true)
				Game.createMonster("Rift Minion", {x = 1156, y = 435, z = 9}, false, true)
				Game.createMonster("Rift Spawn", {x = 1170, y = 435, z = 9}, false, true)
				Game.createMonster("Yalahari Despoiler", {x = 1163, y = 427, z = 9}, false, true)
				
				addEvent(function()
					Game.setStorageValue(GlobalStorage.TheSecretLibrary.ScourageInvasionLevel, 7) -- nivel invasao			
					Game.createMonster("Imp Intruder", {x = 1158, y = 429, z = 9}, false, true)
					Game.createMonster("Invading Demon", {x = 1167, y = 429, z = 9}, false, true)
					Game.createMonster("Ravenous Beyondling", {x = 1160, y = 432, z = 9}, false, true)
					Game.createMonster("Rift Breacher", {x = 1166, y = 432, z = 9}, false, true)
					Game.createMonster("Rift Minion", {x = 1156, y = 435, z = 9}, false, true)
					Game.createMonster("Rift Spawn", {x = 1170, y = 435, z = 9}, false, true)
					Game.createMonster("Yalahari Despoiler", {x = 1163, y = 427, z = 9}, false, true)
					
					addEvent(function()
						Game.setStorageValue(GlobalStorage.TheSecretLibrary.ScourageInvasionLevel, 8) -- nivel invasao			
						Game.createMonster("Imp Intruder", {x = 1158, y = 429, z = 9}, false, true)
						Game.createMonster("Invading Demon", {x = 1167, y = 429, z = 9}, false, true)
						Game.createMonster("Ravenous Beyondling", {x = 1160, y = 432, z = 9}, false, true)
						Game.createMonster("Rift Breacher", {x = 1166, y = 432, z = 9}, false, true)
						Game.createMonster("Rift Minion", {x = 1156, y = 435, z = 9}, false, true)
						Game.createMonster("Rift Spawn", {x = 1170, y = 435, z = 9}, false, true)
						Game.createMonster("Yalahari Despoiler", {x = 1163, y = 427, z = 9}, false, true)
						Game.createMonster("Rift Spawn", {x = 1162, y = 425, z = 9}, false, true)
					end, 15 * 1000)
				
				end, 15 * 1000)
				
			end, 15 * 1000)
		
		end, 15 * 1000)
		
	return true
end

deathSpellStealler:register()