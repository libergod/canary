local function clearArea()
	--Room 1
	local upConer = {x = 1092, y = 338, z = 8}       -- upLeftCorner
	local downConer = {x = 1122, y = 365, z = 9}     -- downRightCorner

	for i=upConer.x, downConer.x do
		for j=upConer.y, downConer.y do
        	for k= upConer.z, downConer.z do
		        local room = {x=i, y=j, z=k}
				local tile = Tile(room)
				if tile then
					local creatures = tile:getCreatures()
					if creatures and #creatures > 0 then
						for _, c in pairs(creatures) do
							if isPlayer(c) then
								c:teleportTo({x = 1081, y = 350, z = 8})
							elseif isMonster(c) then
								c:remove()
							end
						end
					end
				end
			end
		end
	end
end

local config = {
	bossName = "The Pale Worm",
	subBossName = "A Weak Spot",
	requiredLevel = 250,
	timeToFightAgain = 20, -- In hour
	timeToDefeatBoss = 20, -- In minutes
	playerPositions = {
		{pos = Position(1072, 350, 8), teleport = Position(1109, 360, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1073, 350, 8), teleport = Position(1109, 360, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1074, 350, 8), teleport = Position(1109, 360, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1075, 350, 8), teleport = Position(1109, 360, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1073, 349, 8), teleport = Position(1109, 360, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1074, 349, 8), teleport = Position(1109, 360, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1073, 351, 8), teleport = Position(1109, 360, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1074, 351, 8), teleport = Position(1109, 360, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1075, 351, 8), teleport = Position(1109, 360, 8), effect = CONST_ME_TELEPORT}
	},
	bossPosition = Position(1105, 350, 8),
	subBossPosition = Position(1105, 351, 9),
	specPos = {
		from = Position(1092, 338, 8),
		to = Position(1122, 365, 9)
	},
	exit = Position(1081, 350, 8),
	storage = Storage.Quest.U12_30.FeasterOfSouls.PaleWormTimer
}

local paleWormBossLever = Action()
function paleWormBossLever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if config.playerPositions[1].pos ~= player:getPosition() then
		return false
	end
	local spec = Spectators()
	spec:setOnlyPlayer(false)
	spec:setRemoveDestination(config.exit)
	spec:setCheckPosition(config.specPos)
	spec:check()
	if spec:getPlayers() > 0 then
		player:say("There's someone fighting with " .. config.bossName .. ".", TALKTYPE_MONSTER_SAY)
		return true
	end
	local lever = Lever()
	lever:setPositions(config.playerPositions)
	lever:setCondition(function(creature)
		if not creature or not creature:isPlayer() then
			return true
		end
		if creature:getLevel() < config.requiredLevel then
			creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "All the players need to be level " .. config.requiredLevel .. " or higher.")
			return false
		end
		if creature:getStorageValue(config.storage) > os.time() then
			local info = lever:getInfoPositions()
			for _, v in pairs(info) do
				local newPlayer = v.creature
				if newPlayer then
					newPlayer:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You or a member in your team have to wait to face ".. config.bossName .. " again!")
					if newPlayer:getStorageValue(config.storage) > os.time() then
						newPlayer:getPosition():sendMagicEffect(CONST_ME_POFF)
					end
				end
			end
			return false
		end
		return true
	end)
	lever:checkPositions()
	if lever:checkConditions() then
		spec:removeMonsters()
		clearArea()
		local monster = Game.createMonster(config.bossName, config.bossPosition, true, true)
		if not monster then
			return true
		end
		
		local monster2 = Game.createMonster(config.subBossName, config.subBossPosition, true, true)
		if not monster2 then
			return true
		end
		
		Game.createMonster("Greed Worm", {x = 1100, y = 347, z = 8}, false, true)
		Game.createMonster("Greed Worm", {x = 1100, y = 355, z = 8}, false, true)
		Game.createMonster("Greed Worm", {x = 1111, y = 347, z = 8}, false, true)
		Game.createMonster("Greed Worm", {x = 1111, y = 355, z = 8}, false, true)
		Game.createMonster("Greed Worm", {x = 1105, y = 356, z = 8}, false, true)
		Game.createMonster("Greed Worm", {x = 1105, y = 344, z = 8}, false, true)
					
		lever:teleportPlayers()
		lever:setStorageAllPlayers(config.storage, os.time() + config.timeToFightAgain * 3600)
		addEvent(function()
			local old_players = lever:getInfoPositions()
			spec:clearCreaturesCache()
			spec:setOnlyPlayer(true)
			spec:check()
			local player_remove = {}
			for i, v in pairs(spec:getCreatureDetect()) do
				for _, v_old in pairs(old_players) do
					if v_old.creature == nil or v_old.creature:isMonster() then
						break
					end
					if v:getName() == v_old.creature:getName() then
						table.insert(player_remove, v_old.creature)
						break
					end
				end
			end
			spec:removePlayers(player_remove)
		end, config.timeToDefeatBoss * 60 * 1000)
	end
end

paleWormBossLever:position({x = 1071, y = 350, z = 8})
paleWormBossLever:register()