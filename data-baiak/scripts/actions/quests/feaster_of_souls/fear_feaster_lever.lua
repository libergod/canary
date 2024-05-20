local config = {
	boss = {
		name = "The Fear Feaster",
		position = Position(1014, 308, 8)
	},
	requiredLevel = 250,
	timeToFightAgain = 20 * 60 * 60,
	timeToDefeatBoss = 20 * 60,
	playerPositions = {
		{pos = Position(1036, 310, 8), teleport = Position(1014, 314, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1037, 310, 8), teleport = Position(1014, 314, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1038, 310, 8), teleport = Position(1014, 314, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1039, 310, 8), teleport = Position(1014, 314, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1040, 310, 8), teleport = Position(1014, 314, 8), effect = CONST_ME_TELEPORT}
	},
	specPos = {
		from = Position(1004, 300, 8),
		to = Position(1022, 319, 8)
	},
	exit = Position(1044, 310, 8),
	storage = Storage.Quest.U12_30.FeasterOfSouls.FearFeasterTimer
}

local fearFeasterLever = Action()
function fearFeasterLever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	return CreateDefaultLeverBoss(player, config)
end

fearFeasterLever:position({x = 1035, y = 310, z = 8})
fearFeasterLever:register()