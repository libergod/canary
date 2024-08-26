local config = {
	boss = {
		name = "Eradicator",
		position = Position(1251, 699, 7),
	},
	playerPositions = {
		{ pos = Position(1276, 700, 7), teleport = Position(1251, 706, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1276, 701, 7), teleport = Position(1251, 706, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1276, 702, 7), teleport = Position(1251, 706, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1276, 703, 7), teleport = Position(1251, 706, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1276, 704, 7), teleport = Position(1251, 706, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1241, 689, 7),
		to = Position(1261, 711, 7),
	},
	monsters = {
		{ name = "Spark of Destruction", pos = Position(1246, 698, 7) },
		{ name = "Spark of Destruction", pos = Position(1256, 698, 7) },
		{ name = "Spark of Destruction", pos = Position(1247, 703, 7) },
		{ name = "Spark of Destruction", pos = Position(1254, 703, 7) },
	},
	onUseExtra = function()
		Game.setStorageValue(GlobalStorage.HeartOfDestruction.EradicatorReleaseT, -1)
		Game.setStorageValue(GlobalStorage.HeartOfDestruction.EradicatorWeak, -1)

		eradicatorEvent = addEvent(function()
			Game.setStorageValue(GlobalStorage.HeartOfDestruction.EradicatorReleaseT, 1)
		end, 74000)

		local tile = Tile(Position(1260, 700, 7))
		if tile then
			local vortex = tile:getItemById(23482)
			if vortex then
				vortex:transform(23483)
				vortex:setActionId(14348)
			end
		end
	end,
	exit = Position(1279, 701, 7),
}

local lever = BossLever(config)
lever:aid(14330)
lever:register()
