local config = {
	boss = {
		name = "Gorzindel",
		position = Position(1108, 422, 8)
	},
	requiredLevel = 250,
	timeToFightAgain = 20 * 60 * 60,
	timeToDefeatBoss = 20 * 60,
	playerPositions = {
		{pos = Position(1168, 455, 8), teleport = Position(1107, 431, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1169, 455, 8), teleport = Position(1107, 431, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1170, 455, 8), teleport = Position(1107, 431, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1171, 455, 8), teleport = Position(1107, 431, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1172, 455, 8), teleport = Position(1107, 431, 8), effect = CONST_ME_TELEPORT}
	},
	specPos = {
		from = Position(1091, 409, 8),
		to = Position(1123, 442, 8)
	},
	exit = Position(1169, 452, 8),
	storage = Storage.Quest.U11_80.TheSecretLibrary.GorzindelTimer
}

local gorzindelLever = Action()
function gorzindelLever.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if CreateDefaultLeverBoss(player, config) then
		Game.setStorageValue(GlobalStorage.TheSecretLibrary.GorzindelFight, 0)
		Game.createMonster("Mean Minion", {x = 1105, y = 422, z = 8}, false, true)
		Game.createMonster("Mean Minion", {x = 1112, y = 422, z = 8}, false, true)
		Game.createMonster("Mean Minion", {x = 1104, y = 428, z = 8}, false, true)
		Game.createMonster("Mean Minion", {x = 1111, y = 428, z = 8}, false, true)
		Game.createMonster("Malicious Minion", {x = 1105, y = 425, z = 8}, false, true)
		Game.createMonster("Malicious Minion", {x = 1111, y = 425, z = 8}, false, true)
		Game.createMonster("Stolen Knowledge Of Armor", {x = 1108, y = 413, z = 8}, false, true)
		Game.createMonster("Malicious Minion", {x = 1106, y = 413, z = 8}, false, true)
		Game.createMonster("Stolen Knowledge Of Healing", {x = 1120, y = 421, z = 8}, false, true)
		Game.createMonster("Malicious Minion", {x = 1118, y = 422, z = 8}, false, true)
		Game.createMonster("Stolen Knowledge Of Lifesteal", {x = 1114, y = 436, z = 8}, false, true)
		Game.createMonster("Malicious Minion", {x = 1116, y = 435, z = 8}, false, true)
		Game.createMonster("Stolen Knowledge Of Spells", {x = 1102, y = 436, z = 8}, false, true)
		Game.createMonster("Malicious Minion", {x = 1101, y = 436, z = 8}, false, true)
		Game.createMonster("Stolen Knowledge Of Summoning", {x = 1096, y = 421, z = 8}, false, true)
		Game.createMonster("Malicious Minion", {x = 1096, y = 422, z = 8}, false, true)
		Game.createMonster("Stolen Tome of Portals", {x = 1109, y = 421, z = 8}, false, true)
		return true
	else
		return CreateDefaultLeverBoss(player, config)
	end
	return true
end

gorzindelLever:position({x = 1167, y = 455, z = 8})
gorzindelLever:register()