local config = {
	boss = {
		name = "Outburst",
		position = Position(1176, 700, 7),
	},
	playerPositions = {
		{ pos = Position(1149, 700, 7), teleport = Position(1176, 708, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1149, 701, 7), teleport = Position(1176, 708, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1149, 702, 7), teleport = Position(1176, 708, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1149, 703, 7), teleport = Position(1176, 708, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1149, 704, 7), teleport = Position(1176, 708, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(32223, 31273, 14),
		to = Position(32246, 31297, 14),
	},
	monsters = {
		{ name = "Spark of Destruction", pos = Position(1171, 698, 7) },
		{ name = "Spark of Destruction", pos = Position(1180, 698, 7) },
		{ name = "Spark of Destruction", pos = Position(1172, 703, 7) },
		{ name = "Spark of Destruction", pos = Position(1179, 703, 7) },
	},
	onUseExtra = function()
		Game.setStorageValue(GlobalStorage.HeartOfDestruction.OutburstStage, 0)
		Game.setStorageValue(GlobalStorage.HeartOfDestruction.OutburstHealth, 290000)

		local tile = Tile(Position(1167, 701, 7))
		if tile then
			local vortex = tile:getItemById(23482)
			if vortex then
				vortex:transform(23483)
				vortex:setActionId(14350)
			end
		end
	end,
	exit = Position(1145, 697, 7),
}

local lever = BossLever(config)
lever:aid(14331)
lever:register()
