local function clearArea()
	--Room 1
	local upConer = {x = 697, y = 437, z = 7}       -- upLeftCorner
	local downConer = {x = 716, y = 458, z = 7}     -- downRightCorner

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
								c:teleportTo({x = 706, y = 420, z = 7})
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
	bossName = "Count Vlarkorth",
	requiredLevel = 250,
	timeToFightAgain = 20, -- In hour
	timeToDefeatBoss = 20, -- In minutes
	playerPositions = {
		{pos = Position(705, 423, 7), teleport = Position(704, 455, 7), effect = CONST_ME_TELEPORT},
		{pos = Position(706, 423, 7), teleport = Position(704, 455, 7), effect = CONST_ME_TELEPORT},
		{pos = Position(707, 423, 7), teleport = Position(704, 455, 7), effect = CONST_ME_TELEPORT},
		{pos = Position(708, 423, 7), teleport = Position(704, 455, 7), effect = CONST_ME_TELEPORT},
		{pos = Position(709, 423, 7), teleport = Position(704, 455, 7), effect = CONST_ME_TELEPORT}
	},
	bossPosition = Position(706, 447, 7),
	specPos = {
		from = Position(697, 437, 7),
		to = Position(716, 458, 7)
	},
	exit = Position(706, 420, 7),
	storage = Storage.Quest.U12_20.GraveDanger.Bosses.CountVlarkorthTimer
}

local countVlarkorthLever = Action()
function countVlarkorthLever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
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
		
		Game.setStorageValue(GlobalStorage.GraveDanger.CountVlarkorthHealth, -1)
		Game.setStorageValue(GlobalStorage.GraveDanger.CountVlarkorthCounting, 0)
		
		Game.createMonster("Soulless Minion", {x = 703, y = 446, z = 7}, false, true)
		Game.createMonster("Soulless Minion", {x = 709, y = 446, z = 7}, false, true)
		Game.createMonster("Soulless Minion", {x = 705, y = 450, z = 7}, false, true)
		Game.createMonster("Soulless Minion", {x = 711, y = 451, z = 7}, false, true)
		Game.createMonster("Soulless Minion", {x = 700, y = 452, z = 7}, false, true)
		Game.createMonster("Soulless Minion", {x = 705, y = 440, z = 7}, false, true)
					
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

countVlarkorthLever:position({x = 704, y = 423, z = 7})
countVlarkorthLever:register()