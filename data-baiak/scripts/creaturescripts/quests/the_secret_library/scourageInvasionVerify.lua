local scourageInvasionVerify = CreatureEvent("scourageInvasionVerify")
function scourageInvasionVerify.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local targetMonster = creature:getMonster()
	if not creature or not targetMonster or targetMonster:getMaster() then
		return true
	end

	if targetMonster:getName():lower() == 'imp intruder' or 
		targetMonster:getName():lower() == 'invading demon' or
		targetMonster:getName():lower() == 'ravenous beyondling' or
		targetMonster:getName():lower() == 'rift breacher' or
		targetMonster:getName():lower() == 'rift minion' or
		targetMonster:getName():lower() == 'rift spawn' or
		targetMonster:getName():lower() == 'yalahari despoiler' then
		
		local storageLevel = Game.getStorageValue(GlobalStorage.TheSecretLibrary.ScourageInvasionLevel)
		
		if Game.getStorageValue(GlobalStorage.TheSecretLibrary.ScourageInvasionKills) < 28 then
			Game.setStorageValue(GlobalStorage.TheSecretLibrary.ScourageInvasionKills, Game.getStorageValue(GlobalStorage.TheSecretLibrary.ScourageInvasionKills) + 1)
		elseif Game.getStorageValue(GlobalStorage.TheSecretLibrary.ScourageInvasionKills) >= 28 and storageLevel == 4 then
			Game.createMonster("The Spellstealer", {x = 1181, y = 416, z = 9}, false, true)
			local spectators = Game.getSpectators(Position(1163,434,9), false, true, 13, 13, 12, 12)
			if #spectators > 0 then
				for i = 1, #spectators do
					spectators[i]:say("THE NORTH EASTERN WING HAS BEEN BREACHED! RUSH TO CRUSH THE INTRUDERS!", TALKTYPE_MONSTER_SAY, false, spectators[i], Position(1163,434,9))
				end
			end
		elseif Game.getStorageValue(GlobalStorage.TheSecretLibrary.ScourageInvasionKills) >= 28 and storageLevel == 8 then
			Game.createMonster("The Scion Of Havoc", {x = 1181, y = 451, z = 9}, false, true)
			addEvent(function()
				Game.createMonster("Spawn of Havoc", {x = 1179, y = 450, z = 9}, false, true)
				Game.createMonster("Spawn of Havoc", {x = 1184, y = 450, z = 9}, false, true)
				Game.createMonster("Spawn of Havoc", {x = 1179, y = 453, z = 9}, false, true)
				Game.createMonster("Spawn of Havoc", {x = 1184, y = 453, z = 9}, false, true)
				Game.createMonster("Spawn of Havoc", {x = 1179, y = 455, z = 9}, false, true)
				Game.createMonster("Spawn of Havoc", {x = 1184, y = 455, z = 9}, false, true)
				Game.createMonster("Spawn of Havoc", {x = 1183, y = 447, z = 9}, false, true)
			end, 5 * 1000)
			
			
			local spectators = Game.getSpectators(Position(1163,434,9), false, true, 13, 13, 12, 12)
			if #spectators > 0 then
				for i = 1, #spectators do
					spectators[i]:say("THE SOUTH EASTERN WING HAS BEEN BREACHED! RUSH TO CRUSH THE INTRUDERS!", TALKTYPE_MONSTER_SAY, false, spectators[i], Position(1163,434,9))
				end
			end
		elseif Game.getStorageValue(GlobalStorage.TheSecretLibrary.ScourageInvasionKills) >= 28 and storageLevel == 12 then
			Game.setStorageValue(GlobalStorage.TheSecretLibrary.ScourageBrotherKilled, 0)
			Game.createMonster("Brother Chill", {x = 1143, y = 452, z = 9}, false, true)
			Game.createMonster("Brother Freeze", {x = 1144, y = 452, z = 9}, false, true)
			
			addEvent(function()
				Game.createMonster("Biting Cold", {x = 1140, y = 452, z = 9}, false, true)
				Game.createMonster("Biting Cold", {x = 1143, y = 452, z = 9}, false, true)
				Game.createMonster("Biting Cold", {x = 1145, y = 452, z = 9}, false, true)
				Game.createMonster("Biting Cold", {x = 1147, y = 452, z = 9}, false, true)
				Game.createMonster("Biting Cold", {x = 1143, y = 454, z = 9}, false, true)
				Game.createMonster("Biting Cold", {x = 1144, y = 454, z = 9}, false, true)
				Game.createMonster("Biting Cold", {x = 1144, y = 449, z = 9}, false, true)
			end, 5 * 1000)
			
			local spectators = Game.getSpectators(Position(1163,434,9), false, true, 13, 13, 12, 12)
			if #spectators > 0 then
				for i = 1, #spectators do
					spectators[i]:say("THE SOUTH WESTERN WING HAS BEEN BREACHED! RUSH TO CRUSH THE INTRUDERS!", TALKTYPE_MONSTER_SAY, false, spectators[i], Position(1163,434,9))
				end
			end
		elseif Game.getStorageValue(GlobalStorage.TheSecretLibrary.ScourageInvasionKills) >= 28 and storageLevel == 16 then
			Game.createMonster("The Devourer of Secrets", {x = 1142, y = 413, z = 9}, false, true)
			
			addEvent(function()
				Game.createMonster("The Book Of Secrets", {x = 1142, y = 411, z = 9}, false, true)
				Game.createMonster("The Book Of Secrets", {x = 1139, y = 415, z = 9}, false, true)
				Game.createMonster("The Book Of Secrets", {x = 1148, y = 415, z = 9}, false, true)
				Game.createMonster("The Book Of Secrets", {x = 1141, y = 421, z = 9}, false, true)
				Game.createMonster("War Servant", {x = 1139, y = 415, z = 9}, false, true)
				Game.createMonster("War Servant", {x = 1148, y = 415, z = 9}, false, true)
				Game.createMonster("War Servant", {x = 1139, y = 418, z = 9}, false, true)
				Game.createMonster("War Servant", {x = 1148, y = 418, z = 9}, false, true)
				Game.createMonster("War Servant", {x = 1143, y = 423, z = 9}, false, true)
				Game.createMonster("War Servant", {x = 1146, y = 408, z = 9}, false, true)
			end, 5 * 1000)
			
			local spectators = Game.getSpectators(Position(1163,434,9), false, true, 13, 13, 12, 12)
			if #spectators > 0 then
				for i = 1, #spectators do
					spectators[i]:say("THE NORTH WESTERN WING HAS BEEN BREACHED! RUSH TO CRUSH THE INTRUDERS!", TALKTYPE_MONSTER_SAY, false, spectators[i], Position(1163,434,9))
				end
			end
		elseif Game.getStorageValue(GlobalStorage.TheSecretLibrary.ScourageInvasionKills) >= 28 and storageLevel == 20 then
			Game.setStorageValue(GlobalStorage.TheSecretLibrary.ScourageTransform, -1)
			Game.createMonster("The Scourge Of Oblivion", {x = 1162, y = 425, z = 9}, false, true)
			local spectators = Game.getSpectators(Position(1163,434,9), false, true, 13, 13, 12, 12)
			if #spectators > 0 then
				for i = 1, #spectators do
					spectators[i]:say("THE LEADER OF THE INVASION FINALLY JOINS THE BATTLE! BEWARE, THE SCOURGE OF OBLIVION ENTERS THE FRAY!", TALKTYPE_MONSTER_SAY, false, spectators[i], Position(1163,434,9))
				end
			end
		end
	end

	return true
end

scourageInvasionVerify:register()
