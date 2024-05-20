local config = {
	boss = {
		name = "Mazzinor",
		position = Position(1146, 423, 8)
	},
	requiredLevel = 250,
	timeToFightAgain = 20 * 60 * 60,
	timeToDefeatBoss = 20 * 60,
	playerPositions = {
		{pos = Position(1142, 479, 8), teleport = Position(1146, 433, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1143, 479, 8), teleport = Position(1146, 433, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1144, 479, 8), teleport = Position(1146, 433, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1145, 479, 8), teleport = Position(1146, 433, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1146, 479, 8), teleport = Position(1146, 433, 8), effect = CONST_ME_TELEPORT}
	},
	specPos = {
		from = Position(1135, 418, 8),
		to = Position(1156, 436, 8)
	},
	exit = Position(1142, 476, 8),
	storage = Storage.Quest.U11_80.TheSecretLibrary.MazzinorTimer
}

local mazzinorLever = Action()
function mazzinorLever.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if CreateDefaultLeverBoss(player, config) then
		Game.setStorageValue(GlobalStorage.TheSecretLibrary.MazzinorFight, 1)
		Game.createMonster("Wild Knowledge", {x = 1143, y = 423, z = 8}, false, true)
		Game.createMonster("Wild Knowledge", {x = 1147, y = 423, z = 8}, false, true)
		Game.createMonster("Wild Knowledge", {x = 1143, y = 427, z = 8}, false, true)
		Game.createMonster("Wild Knowledge", {x = 1147, y = 427, z = 8}, false, true)
		Game.createMonster("Wild Knowledge", {x = 1145, y = 429, z = 8}, false, true)
		
		return true
	else
		return CreateDefaultLeverBoss(player, config)
	end
	return true
end

mazzinorLever:position({x = 1141, y = 479, z = 8})
mazzinorLever:register()