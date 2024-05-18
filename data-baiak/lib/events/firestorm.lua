local DEBUG_ON = true
local RELOAD_LIB_ON = true
local SHOW_COPYRIGHT = false

if RELOAD_LIB_ON or not FSE then
---@Fire Storm Event
FSE = { }

FSE.storages = { }
FSE.storages.started = 13336

---@Room Properties
FSE.room = { }
FSE.room.from = Position(1817, 858, 7)
FSE.room.rangeX = 62
FSE.room.rangeY = 49

---@Temple Position
FSE.getTemplePosition = Position(991, 1210, 7)

---@Attack Properties
FSE.attackSignalEffect = CONST_ME_HITBYFIRE
FSE.attackEffect = CONST_ME_FIREAREA
FSE.attackDistEffect = CONST_ANI_FIRE

---@Player Counts
FSE.players = { }
FSE.players.min = 5
FSE.players.max = 50
FSE.players.win = 1 -- always less than FSE.players.min
FSE.players.levelMin = 200

---@Timers in seconds
FSE.timer = { }
FSE.timer.removeTp = 5 -- em minutos
FSE.timer.checking = 2
FSE.timer.signal = { }
FSE.timer.signal.min = 0.1
FSE.timer.signal.max = 0.5
FSE.timer.events = { }

---@Game Dificulty
FSE.dificulty = { }
FSE.dificulty.attacks = 40
FSE.dificulty.increment = 1
FSE.dificulty.D_attacks = FSE.dificulty.attacks
FSE.dificulty.D_increment = FSE.dificulty.increment

---@Teleport Properties
FSE.teleport = { }
FSE.teleport.itemid = 1949
FSE.teleport.position = Position(1003, 1217, 7)
FSE.teleport.destination = Position(1849, 881, 7)
FSE.teleport.actionid = 64500

FSE.status = [[Stoped]]

FSE.rewards = {9058, 2}

FSE.msg = {
	prefix = "[FIRESTORM] ",
	openTp = "O evento foi aberto e espera por jogadores. Você tem %d minuto(s) para entrar.",
	forceStop = "O evento foi forçado a parar.",
	noPlayers = "Não foi possível iniciar o evento por falta de jogadores.",
	playerRemoved = "O player %s foi atingido.",
	eventFinish = "O evento foi encerrado e o jogador vencedor foi %s.",
	eventFinishNoWin = "O evento foi encerrado sem jogadores.",
	entranceNew = "Você entrou no evento. Boa Sorte!",
}
FSE.days = {--Day-Hour
				"Monday-16:40",
				"Monday-20:40",

				"Wednesday-09:40",
				"Wednesday-12:40",
				
				"Friday-16:40",
				"Friday-20:40",
				
				"Saturday-09:40",
				"Saturday-12:40",
}

function FSE:removeTp(seconds)
	local piso = Tile (FSE.teleport.position)
	local teleport = piso:getItemById(FSE.teleport.itemid)
	if teleport then
		teleport:remove()
		FSE.teleport.position:sendMagicEffect(CONST_ME_POFF)
	end
	FSE:CheckControl()
end

function FSE:Init()
	if FSE.status == [[Stoped]] then
		FSE.status = [[Waiting]]
		local teleport = Game.createItem(FSE.teleport.itemid, 1, FSE.teleport.position)
		if not teleport then
			FSE:Stoped()
			return DEBUG_ON
		else
			teleport:setActionId(FSE.teleport.actionid)
		end
		addEvent(FSE.removeTp, FSE.timer.removeTp * 60 * 1000)
		Game.broadcastMessage(FSE.msg.prefix .. string.format(FSE.msg.openTp, FSE.timer.removeTp))
		addEvent(Game.broadcastMessage, (FSE.timer.removeTp - 3) * 60 * 1000, FSE.msg.prefix .. (FSE.msg.openTp):format(FSE.timer.removeTp - 2))
		addEvent(Game.broadcastMessage, (FSE.timer.removeTp - 1) * 60 * 1000, FSE.msg.prefix .. (FSE.msg.openTp):format(FSE.timer.removeTp - 4))
			
	else
		return DEBUG_ON
	end
end

function FSE:Stoped(players, causeMessage, forceStoped)
	FSE.status = [[Stoped]]
	for index, eventID in pairs(FSE.timer.events) do
		stopEvent(eventID)
	end
	FSE.timer.events = { }
	for index, player in pairs(players) do
		player:teleportTo(FSE.getTemplePosition, false)
		player:setStorageValue(STORAGEVALUE_EVENTS, 0)
	end
	FSE.getTemplePosition:sendMagicEffect(CONST_ME_TELEPORT)
	if forceStoped then
		Game.broadcastMessage(FSE.msg.prefix .. FSE.msg.forceStop)
	elseif causeMessage then
		Game.broadcastMessage(causeMessage)
	end
	FSE.dificulty.attacks = FSE.dificulty.D_attacks
	FSE.dificulty.increment = FSE.dificulty.D_increment
	return true
end

function FSE:Started(startMessage)
	FSE.status = [[Started]]
	if startMessage then
		Game.broadcastMessage(startMessage)
	end
	FSE:CheckControl()
end

function FSE:AddEvent(eventID)
	table.insert(FSE.timer.events, eventID)
	return eventID
end

local function getWinNames(players)
	local names = [[]]
	for index, player in pairs(players) do
		names = string.format([[%s%s]], names, player:getName())
	end
	return names
end

function FSE:CheckControl()
	if FSE.status == [[Stoped]] then
		-- Break Control
	elseif FSE.status == [[Waiting]] then
		local players = FSE:GetPlayers()
		if #players < FSE.players.min then
			FSE:Stoped(players, FSE.msg.prefix .. FSE.msg.noPlayers)
			-- FINISHED EVENT
			Game.setStorageValue(FSE.storages.started, 0)
			Spdlog.info("[FIRESTORM EVENT] - Ended Firestorm Event!")
			return true
		else
			FSE:Started()
		end
	elseif FSE.status == [[Started]] then
		local players = FSE:GetPlayers()
		if #players <= FSE.players.win then
			if #players == 0 then
				FSE:Stoped(players, FSE.msg.prefix .. FSE.msg.eventFinishNoWin)
				-- FINISHED EVENT
				Game.setStorageValue(FSE.storages.started, 0)
				Spdlog.info("[FIRESTORM EVENT] - Ended Firestorm Event!")
				return true
			else
				for _, player in pairs(players) do
					player:addItem(FSE.rewards[1], FSE.rewards[2])
					player:addTransferableCoins(300)
					db.query(string.format("INSERT INTO `store_history`(`account_id`, `mode`, `description`, `coin_type`, `coin_amount`, `time`) VALUES (%s, %s, %s, %s, %s, %s)", player:getAccountId(), "0", db.escapeString("[FireStorm Event] - Winner"), "0", "300", os.time()))
				end
				FSE:Stoped(players, FSE.msg.prefix .. string.format(FSE.msg.eventFinish, getWinNames(players)))
				-- FINISHED EVENT
				Game.setStorageValue(FSE.storages.started, 0)
				Spdlog.info("[FIRESTORM EVENT] - Ended Firestorm Event!")
				return true
			end
		else
			for index = 1, FSE.dificulty.attacks do
				addEvent(FSE.AttackSignal, math.random(FSE.timer.signal.min * 1000, FSE.timer.signal.max * 1000))
			end
			FSE.dificulty.attacks = FSE.dificulty.attacks + FSE.dificulty.increment
			FSE:AddEvent(addEvent(FSE.CheckControl, FSE.timer.checking * 1000))
		end
	end
end

function FSE:GetPlayers()
	local spectators = Game.getSpectators(FSE.room.from, false, true, 1, FSE.room.rangeX, 1, FSE.room.rangeY)
	local players = { }
	if spectators and #spectators > 0 then
		for index, player in pairs(spectators) do
			if not player:getGroup():getAccess() then
				players[#players + 1] = player
			end
		end
	end
	return players
end

local function getRewardNames(items)
	local names = [[]]
	for index, item in pairs(items) do
		local it = ItemType(item.id)
		names = string.format([[%s%u %s%s]], names, item.count, it:getName(), next(items, index) == nil and '.' or [[, ]])
	end
	return names
end

function FSE:GetRandomTile()
	local foundTile = Tile(FSE.room.from + Position(math.random(0, FSE.room.rangeX), math.random(0, FSE.room.rangeY), 0))
	while not foundTile or not foundTile:getGround() or foundTile:hasProperty(CONST_PROP_BLOCKSOLID) do
		foundTile = Tile(FSE.room.from + Position(math.random(0, FSE.room.rangeX), math.random(0, FSE.room.rangeY), 0))
	end
	return foundTile
end

function FSE:AttackSignal()
	local foundTile = FSE:GetRandomTile()
	if not foundTile then
		return DEBUG_ON and print([[Not tile could be found in the Firestorm Event area.]])
	end
	local position = foundTile:getPosition()
	position:sendMagicEffect(FSE.attackSignalEffect)
	return addEvent(FSE.AttackTile, 500, self, { x = position.x, y = position.y, z = position.z })
end

function FSE:AttackTile(tpos)
	local position = Position(tpos)
	local pisoTile = Tile(position)
	local creatures = pisoTile:getCreatures()
	local fromposdist = (position-Position(5, 5, 0))
	fromposdist:sendDistanceEffect(position, FSE.attackDistEffect)
	position:sendMagicEffect(FSE.attackEffect)
	if creatures and #creatures > 0 then
		for index, creature in pairs(creatures) do
			local player = creature:getPlayer()
			if player and not player:getGroup():getAccess() then
				position:sendMagicEffect(CONST_ME_POFF)
				player:teleportTo(FSE.getTemplePosition, false)
				player:setStorageValue(STORAGEVALUE_EVENTS, 0)
				FSE.getTemplePosition:sendMagicEffect(CONST_ME_TELEPORT)
				Game.broadcastMessage(FSE.msg.prefix .. string.format(FSE.msg.playerRemoved, player:getName()))
			end
		end
	end
end

end