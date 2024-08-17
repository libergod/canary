local config = {
	boss = {
		name = "Ghulosh`",
		position = Position(1215, 512, 7)
	},
	requiredLevel = 250,
	playerPositions = {
		{pos = Position(1206, 567, 7), teleport = Position(1214, 521, 7), effect = CONST_ME_TELEPORT},
		{pos = Position(1207, 567, 7), teleport = Position(1214, 521, 7), effect = CONST_ME_TELEPORT},
		{pos = Position(1208, 567, 7), teleport = Position(1214, 521, 7), effect = CONST_ME_TELEPORT},
		{pos = Position(1209, 567, 7), teleport = Position(1214, 521, 7), effect = CONST_ME_TELEPORT},
		{pos = Position(1210, 567, 7), teleport = Position(1214, 521, 7), effect = CONST_ME_TELEPORT}
	},
	specPos = {
		from = Position(1204, 504, 7),
		to = Position(1225, 525, 7)
	},
	exit = Position(1205, 564, 7),
}

local ghuloshLever = Action()
function ghuloshLever.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if BossLever(config) then
		Game.createMonster("Bone Jaw", {x = 1210, y = 512, z = 7}, false, true)
		Game.createMonster("Bone Jaw", {x = 1220, y = 512, z = 7}, false, true)
		Game.createMonster("Bone Jaw", {x = 1213, y = 518, z = 7}, false, true)
		Game.createMonster("Bone Jaw", {x = 1217, y = 518, z = 7}, false, true)
		Game.createMonster("The Book of Death", {x = 1213, y = 510, z = 7}, false, true)
		return true
	else
		return BossLever(config)
	end
	return true
end

ghuloshLever:position({x = 1205, y = 567, z = 7})
ghuloshLever:register()