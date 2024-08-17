local config = {
	boss = {
		name = "Grand Master Oberon",
		position = Position(1106, 500, 8),
	},
	playerPositions = {
		{ pos = Position(1104, 529, 8), teleport = Position(1106, 507, 8) },
		{ pos = Position(1105, 529, 8), teleport = Position(1106, 507, 8) },
		{ pos = Position(1106, 529, 8), teleport = Position(1106, 507, 8) },
		{ pos = Position(1107, 529, 8), teleport = Position(1106, 507, 8) },
		{ pos = Position(1108, 529, 8), teleport = Position(1106, 507, 8) },
	},
	specPos = {
		from = Position(1085, 492, 8),
		to = Position(1116, 513, 8),
	},
	exit = Position(1106, 526, 8),
}

local lever = BossLever(config)
lever:aid(57605)
lever:register()
