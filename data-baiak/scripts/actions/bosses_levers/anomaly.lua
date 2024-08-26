local config = {
	boss = {
		name = "Anomaly",
		position = Position(1213, 665, 7),
	},
	playerPositions = {
		{ pos = Position(1187, 661, 7), teleport = Position(1213, 673, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1187, 662, 7), teleport = Position(1213, 673, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1187, 663, 7), teleport = Position(1213, 673, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1187, 664, 7), teleport = Position(1213, 673, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1187, 665, 7), teleport = Position(1213, 673, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1202, 654, 7),
		to = Position(1225, 677, 7),
	},
	monsters = {
		{ name = "Spark of Destruction", pos = Position(1209, 665, 7) },
		{ name = "Spark of Destruction", pos = Position(1216, 665, 7) },
		{ name = "Spark of Destruction", pos = Position(1209, 669, 7) },
		{ name = "Spark of Destruction", pos = Position(1216, 671, 7) },
	},
	onUseExtra = function()
		Game.setStorageValue(GlobalStorage.HeartOfDestruction.ChargedAnomaly, 0)
		local tile = Tile(Position(1203, 666, 7))
		if tile then
			local vortex = tile:getItemById(23482)
			if vortex then
				vortex:transform(23483)
				vortex:setActionId(14324)
			end
		end
	end,
	exit = Position(1184, 663, 7),
}

local lever = BossLever(config)
lever:aid(14325)
lever:register()
