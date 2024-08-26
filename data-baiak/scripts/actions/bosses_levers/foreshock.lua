local config = {
	boss = {
		name = "Foreshock",
		position = Position(1150, 664, 7),
	},
	playerPositions = {
		{ pos = Position(1124, 660, 7), teleport = Position(1150, 672, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1124, 661, 7), teleport = Position(1150, 672, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1124, 662, 7), teleport = Position(1150, 672, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1124, 663, 7), teleport = Position(1150, 672, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1124, 664, 7), teleport = Position(1150, 672, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1140, 653, 7),
		to = Position(1161, 675, 7),
	},
	monsters = {
		{ name = "Spark of Destruction", pos = Position(1145, 662, 7) },
		{ name = "Spark of Destruction", pos = Position(1154, 662, 7) },
		{ name = "Spark of Destruction", pos = Position(1147, 667, 7) },
		{ name = "Spark of Destruction", pos = Position(1152, 667, 7) },
	},
	onUseExtra = function()
		Game.setStorageValue(GlobalStorage.HeartOfDestruction.ForeshockHealth, 105000)
		Game.setStorageValue(GlobalStorage.HeartOfDestruction.AftershockHealth, 105000)
		Game.setStorageValue(GlobalStorage.HeartOfDestruction.ForeshockStage, -1)
		Game.setStorageValue(GlobalStorage.HeartOfDestruction.AftershockStage, -1)
		local tile = Tile(Position(1141, 664, 7))
		if tile then
			local vortex = tile:getItemById(23482)
			if vortex then
				vortex:transform(23483)
				vortex:setActionId(14345)
			end
		end
	end,
	exit = Position(1121, 660, 7),
}

local lever = BossLever(config)
lever:aid(14329)
lever:register()
