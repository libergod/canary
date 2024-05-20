local config = {
	boss = {
		name = "The Dread Maiden",
		position = Position(1010, 349, 8)
	},
	requiredLevel = 250,
	timeToFightAgain = 20 * 60 * 60,
	timeToDefeatBoss = 20 * 60,
	playerPositions = {
		{pos = Position(1037, 352, 8), teleport = Position(1009, 356, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1038, 352, 8), teleport = Position(1009, 356, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1039, 352, 8), teleport = Position(1009, 356, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1040, 352, 8), teleport = Position(1009, 356, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1041, 352, 8), teleport = Position(1009, 356, 8), effect = CONST_ME_TELEPORT}
	},
	specPos = {
		from = Position(997, 338, 8),
		to = Position(1024, 361, 8)
	},
	exit = Position(1044, 352, 8),
	storage = Storage.Quest.U12_30.FeasterOfSouls.DreadMaidenTimer
}

local dreadMaidenLever = Action()
function dreadMaidenLever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	return CreateDefaultLeverBoss(player, config)
end

dreadMaidenLever:position({x = 1036, y = 352, z = 8})
dreadMaidenLever:register()