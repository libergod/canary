local config = {
	boss = {
		name = "Lokathmor",
		position = Position(1172, 395, 8)
	},
	requiredLevel = 250,
	timeToFightAgain = 20 * 60 * 60,
	timeToDefeatBoss = 20 * 60,
	playerPositions = {
		{pos = Position(1142, 455, 8), teleport = Position(1172, 401, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1143, 455, 8), teleport = Position(1172, 401, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1144, 455, 8), teleport = Position(1172, 401, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1145, 455, 8), teleport = Position(1172, 401, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1146, 455, 8), teleport = Position(1172, 401, 8), effect = CONST_ME_TELEPORT}
	},
	specPos = {
		from = Position(1162, 385, 8),
		to = Position(1182, 405, 8)
	},
	exit = Position(1143, 452, 8),
	storage = Storage.Quest.U11_80.TheSecretLibrary.LokathmorTimer
}

local lokathmorLever = Action()
function lokathmorLever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if CreateDefaultLeverBoss(player, config) then
		Game.setStorageValue(GlobalStorage.TheSecretLibrary.LokathmorFight, -1) -- Lokathmor solto 
		
		Game.createMonster("Knowledge Raider", {x = 1169, y = 400, z = 8}, false, true)
		Game.createMonster("Knowledge Raider", {x = 1174, y = 400, z = 8}, false, true)
		Game.createMonster("Knowledge Raider", {x = 1177, y = 390, z = 8}, false, true)
		Game.createMonster("Knowledge Raider", {x = 1167, y = 390, z = 8}, false, true)
		Game.createMonster("Knowledge Raider", {x = 1171, y = 389, z = 8}, false, true)
		
		return true
	else
		return CreateDefaultLeverBoss(player, config)
	end
	return true
end

lokathmorLever:position({x = 1141, y = 455, z = 8})
lokathmorLever:register()