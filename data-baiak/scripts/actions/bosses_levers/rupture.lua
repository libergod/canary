local config = {
	boss = {
		name = "Rupture",
		position = Position(1274, 666, 7),
	},
	playerPositions = {
		{ pos = Position(1251, 664, 7), teleport = Position(1277, 673, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1251, 665, 7), teleport = Position(1277, 673, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1251, 666, 7), teleport = Position(1277, 673, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1251, 667, 7), teleport = Position(1277, 673, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1251, 668, 7), teleport = Position(1277, 673, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1266, 655, 7),
		to = Position(1288, 677, 7), 
	},
	monsters = {
		{ name = "Spark of Destruction", pos = Position(1280, 670, 7) },
		{ name = "Spark of Destruction", pos = Position(1273, 670, 7) },
		{ name = "Spark of Destruction", pos = Position(1280, 666, 7) },
		{ name = "Spark of Destruction", pos = Position(1272, 666, 7) },
	},
	onUseExtra = function()
		Game.setStorageValue(GlobalStorage.HeartOfDestruction.RuptureResonanceStage, -1)
		Game.setStorageValue(GlobalStorage.HeartOfDestruction.RuptureResonanceActive, -1)

		local tile = Tile(Position(1268, 666, 7))
		if tile then
			local vortex = tile:getItemById(23482)
			if vortex then
				vortex:transform(23483)
				vortex:setActionId(14343)
			end
		end
	end,
	exit = Position(1248, 660, 7),
}

local lever = BossLever(config)
lever:aid(14327)
lever:register()
