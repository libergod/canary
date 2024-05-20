local config = {
	boss = {
		name = "Ghulosh",
		position = Position(1176, 426, 8)
	},
	requiredLevel = 250,
	timeToFightAgain = 20 * 60 * 60,
	timeToDefeatBoss = 20 * 60,
	playerPositions = {
		{pos = Position(1168, 479, 8), teleport = Position(1177, 434, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1169, 479, 8), teleport = Position(1177, 434, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1170, 479, 8), teleport = Position(1177, 434, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1171, 479, 8), teleport = Position(1177, 434, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1172, 479, 8), teleport = Position(1177, 434, 8), effect = CONST_ME_TELEPORT}
	},
	specPos = {
		from = Position(1166, 418, 8),
		to = Position(1187, 437, 8)
	},
	exit = Position(1169, 476, 8),
	storage = Storage.Quest.U11_80.TheSecretLibrary.GhuloshTimer
}

local ghuloshLever = Action()
function ghuloshLever.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if CreateDefaultLeverBoss(player, config) then
		Game.createMonster("Bone Jaw", {x = 1173, y = 425, z = 8}, false, true)
		Game.createMonster("Bone Jaw", {x = 1181, y = 425, z = 8}, false, true)
		Game.createMonster("Bone Jaw", {x = 1175, y = 428, z = 8}, false, true)
		Game.createMonster("Bone Jaw", {x = 1179, y = 428, z = 8}, false, true)
		Game.createMonster("The Book of Death", {x = 1176, y = 423, z = 8}, false, true)
		return true
	else
		return CreateDefaultLeverBoss(player, config)
	end
	return true
end

ghuloshLever:position({x = 1167, y = 479, z = 8})
ghuloshLever:register()