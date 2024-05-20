local config = {
	boss = {
		name = "The Scourge of Oblivion",
		position = Position(1162, 462, 9)
	},
	requiredLevel = 350,
	timeToFightAgain = 20 * 60 * 60,
	timeToDefeatBoss = 20 * 60,
	playerPositions = {
		{pos = Position(1113, 442, 9), teleport = Position(1163, 432, 9), effect = CONST_ME_TELEPORT},
		{pos = Position(1114, 442, 9), teleport = Position(1163, 432, 9), effect = CONST_ME_TELEPORT},
		{pos = Position(1113, 441, 9), teleport = Position(1163, 432, 9), effect = CONST_ME_TELEPORT},
		{pos = Position(1114, 441, 9), teleport = Position(1163, 432, 9), effect = CONST_ME_TELEPORT},
		{pos = Position(1113, 440, 9), teleport = Position(1163, 432, 9), effect = CONST_ME_TELEPORT},
		{pos = Position(1114, 440, 9), teleport = Position(1163, 432, 9), effect = CONST_ME_TELEPORT},
		{pos = Position(1113, 443, 9), teleport = Position(1163, 432, 9), effect = CONST_ME_TELEPORT},
		{pos = Position(1114, 442, 9), teleport = Position(1163, 432, 9), effect = CONST_ME_TELEPORT},
		{pos = Position(1113, 444, 9), teleport = Position(1163, 432, 9), effect = CONST_ME_TELEPORT},
		{pos = Position(1114, 444, 9), teleport = Position(1163, 432, 9), effect = CONST_ME_TELEPORT}
	},
	specPos = {
		from = Position(1132, 404, 9),
		to = Position(1193, 465, 9)
	},
	exit = Position(1111, 437, 9),
	storage = Storage.Quest.U11_80.TheSecretLibrary.ScourgeOfOblivionTimer
}

local scourgeOfOblivionLever = Action()
function scourgeOfOblivionLever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if CreateDefaultLeverBoss(player, config) then
		Game.setStorageValue(GlobalStorage.TheSecretLibrary.SpellsteallerTransform, -1) -- cinza 
		Game.setStorageValue(GlobalStorage.TheSecretLibrary.ScourageInvasionKills, 0) -- kills invasion
		Game.setStorageValue(GlobalStorage.TheSecretLibrary.ScourageBrotherKilled, 0) -- brother kills
		
		local spectators = Game.getSpectators(Position(1163,434,9), false, true, 13, 13, 12, 12)
        if #spectators > 0 then
			for i = 1, #spectators do
				spectators[i]:say("THE MASTERBOOK HAS FILLED UP WITH THE WRATH OF THE LIBRARY!", TALKTYPE_MONSTER_SAY, false, spectators[i], Position(1163,434,9))
			end
        end
		
		addEvent(function()
			Game.setStorageValue(GlobalStorage.TheSecretLibrary.ScourageInvasionLevel, 1) -- nivel invasao			
			Game.createMonster("Imp Intruder", {x = 1158, y = 429, z = 9}, false, true)
			Game.createMonster("Invading Demon", {x = 1167, y = 429, z = 9}, false, true)
			Game.createMonster("Ravenous Beyondling", {x = 1160, y = 432, z = 9}, false, true)
			Game.createMonster("Rift Breacher", {x = 1166, y = 432, z = 9}, false, true)
			Game.createMonster("Rift Minion", {x = 1156, y = 435, z = 9}, false, true)
			Game.createMonster("Rift Spawn", {x = 1170, y = 435, z = 9}, false, true)
			Game.createMonster("Yalahari Despoiler", {x = 1163, y = 427, z = 9}, false, true)
			
			addEvent(function()
				Game.setStorageValue(GlobalStorage.TheSecretLibrary.ScourageInvasionLevel, 2) -- nivel invasao			
				Game.createMonster("Imp Intruder", {x = 1158, y = 429, z = 9}, false, true)
				Game.createMonster("Invading Demon", {x = 1167, y = 429, z = 9}, false, true)
				Game.createMonster("Ravenous Beyondling", {x = 1160, y = 432, z = 9}, false, true)
				Game.createMonster("Rift Breacher", {x = 1166, y = 432, z = 9}, false, true)
				Game.createMonster("Rift Minion", {x = 1156, y = 435, z = 9}, false, true)
				Game.createMonster("Rift Spawn", {x = 1170, y = 435, z = 9}, false, true)
				Game.createMonster("Yalahari Despoiler", {x = 1163, y = 427, z = 9}, false, true)
				
				addEvent(function()
					Game.setStorageValue(GlobalStorage.TheSecretLibrary.ScourageInvasionLevel, 3) -- nivel invasao			
					Game.createMonster("Imp Intruder", {x = 1158, y = 429, z = 9}, false, true)
					Game.createMonster("Invading Demon", {x = 1167, y = 429, z = 9}, false, true)
					Game.createMonster("Ravenous Beyondling", {x = 1160, y = 432, z = 9}, false, true)
					Game.createMonster("Rift Breacher", {x = 1166, y = 432, z = 9}, false, true)
					Game.createMonster("Rift Minion", {x = 1156, y = 435, z = 9}, false, true)
					Game.createMonster("Rift Spawn", {x = 1170, y = 435, z = 9}, false, true)
					Game.createMonster("Yalahari Despoiler", {x = 1163, y = 427, z = 9}, false, true)
					
					addEvent(function()
						Game.setStorageValue(GlobalStorage.TheSecretLibrary.ScourageInvasionLevel, 4) -- nivel invasao			
						Game.createMonster("Imp Intruder", {x = 1158, y = 429, z = 9}, false, true)
						Game.createMonster("Invading Demon", {x = 1167, y = 429, z = 9}, false, true)
						Game.createMonster("Ravenous Beyondling", {x = 1160, y = 432, z = 9}, false, true)
						Game.createMonster("Rift Breacher", {x = 1166, y = 432, z = 9}, false, true)
						Game.createMonster("Rift Minion", {x = 1156, y = 435, z = 9}, false, true)
						Game.createMonster("Rift Spawn", {x = 1170, y = 435, z = 9}, false, true)
						Game.createMonster("Yalahari Despoiler", {x = 1163, y = 427, z = 9}, false, true)
						Game.createMonster("Rift Spawn", {x = 1162, y = 425, z = 9}, false, true)
					end, 25 * 1000)
				
				end, 20 * 1000)
				
			end, 15 * 1000)
		
		end, 10 * 1000)
			
		
		return true
	else
		return CreateDefaultLeverBoss(player, config)
	end
	return true
end

scourgeOfOblivionLever:position({x = 1112, y = 442, z = 9})
scourgeOfOblivionLever:register()