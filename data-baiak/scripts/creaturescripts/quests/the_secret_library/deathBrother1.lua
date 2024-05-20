local deathBrother1 = CreatureEvent("deathBrother1")
function deathBrother1.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local targetMonster = creature:getMonster()
	if not targetMonster:isMonster() then
		return true
	end

	if targetMonster:getName():lower() ~= 'brother chill' then
		return true
	end
	
	Game.setStorageValue(GlobalStorage.TheSecretLibrary.ScourageBrotherKilled, Game.getStorageValue(GlobalStorage.TheSecretLibrary.ScourageBrotherKilled) + 1)	
	if Game.getStorageValue(GlobalStorage.TheSecretLibrary.ScourageBrotherKilled) == 2 then
	
		creature:say("After the death of brother chill and brother freeze the invasion on the central chamber continues!", TALKTYPE_MONSTER_YELL)
		
		Game.setStorageValue(GlobalStorage.TheSecretLibrary.ScourageInvasionKills, 0) -- count kills
		
		addEvent(function()
				Game.setStorageValue(GlobalStorage.TheSecretLibrary.ScourageInvasionLevel, 13) -- nivel invasao			
				Game.createMonster("Imp Intruder", {x = 1158, y = 429, z = 9}, false, true)
				Game.createMonster("Invading Demon", {x = 1167, y = 429, z = 9}, false, true)
				Game.createMonster("Ravenous Beyondling", {x = 1160, y = 432, z = 9}, false, true)
				Game.createMonster("Rift Breacher", {x = 1166, y = 432, z = 9}, false, true)
				Game.createMonster("Rift Minion", {x = 1156, y = 435, z = 9}, false, true)
				Game.createMonster("Rift Spawn", {x = 1170, y = 435, z = 9}, false, true)
				Game.createMonster("Yalahari Despoiler", {x = 1163, y = 427, z = 9}, false, true)
				
				addEvent(function()
					Game.setStorageValue(GlobalStorage.TheSecretLibrary.ScourageInvasionLevel, 14) -- nivel invasao			
					Game.createMonster("Imp Intruder", {x = 1158, y = 429, z = 9}, false, true)
					Game.createMonster("Invading Demon", {x = 1167, y = 429, z = 9}, false, true)
					Game.createMonster("Ravenous Beyondling", {x = 1160, y = 432, z = 9}, false, true)
					Game.createMonster("Rift Breacher", {x = 1166, y = 432, z = 9}, false, true)
					Game.createMonster("Rift Minion", {x = 1156, y = 435, z = 9}, false, true)
					Game.createMonster("Rift Spawn", {x = 1170, y = 435, z = 9}, false, true)
					Game.createMonster("Yalahari Despoiler", {x = 1163, y = 427, z = 9}, false, true)
					
					addEvent(function()
						Game.setStorageValue(GlobalStorage.TheSecretLibrary.ScourageInvasionLevel, 15) -- nivel invasao			
						Game.createMonster("Imp Intruder", {x = 1158, y = 429, z = 9}, false, true)
						Game.createMonster("Invading Demon", {x = 1167, y = 429, z = 9}, false, true)
						Game.createMonster("Ravenous Beyondling", {x = 1160, y = 432, z = 9}, false, true)
						Game.createMonster("Rift Breacher", {x = 1166, y = 432, z = 9}, false, true)
						Game.createMonster("Rift Minion", {x = 1156, y = 435, z = 9}, false, true)
						Game.createMonster("Rift Spawn", {x = 1170, y = 435, z = 9}, false, true)
						Game.createMonster("Yalahari Despoiler", {x = 1163, y = 427, z = 9}, false, true)
						
						addEvent(function()
							Game.setStorageValue(GlobalStorage.TheSecretLibrary.ScourageInvasionLevel, 16) -- nivel invasao			
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
	end
			
	return true
end

deathBrother1:register()