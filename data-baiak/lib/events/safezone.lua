SAFEZONE = {
	teleportTimeClose = 5,
	eventTimeTotal = 5,
	positionTeleportOpen = Position(1003, 1217, 7),
	positionEnterEvent = Position(1545, 957, 7),
	storage = 12149,
	started = 13334,
	playing = 13335,
	actionId = 6412,
	protectionTileId = {8276, 8276, 8276, 8276},
	levelMin = 150,
	minPlayers = 3,
	maxPlayers = 50,
	reward = {9058, 2},
	players = { },
	days = {--Day-Hour
				"Tuesday-16:40",
				"Tuesday-20:40",

				"Thursday-09:40",
				"Thursday-14:40",
				
				"Saturday-14:40",
				"Saturday-18:40",
				
				"Sunday-12:40",
				"Sunday-18:40",
	},
	messages = {
		prefix = "[SAFEZONE] ",
		messageEntrou = "Você entrou no evento. Boa Sorte!",
		messageStart = "O evento irá começar agora com %d participantes! Boa sorte!",
		messageNoStart = "O evento foi cancelado por falta de participantes!",
		messageTime = "O evento foi cancelado por limite de tempo!",
		messageOpen = "O evento foi aberto, você tem %d minutos para entrar no portal do evento que se encontra no templo!",
		messageWait = "O teleporte para o evento está aberto, você tem %d minuto(s) para entrar!",
		messageFinish = "O evento foi finalizado e o ganhador foi o %s! Parabéns!",
		messageWinner = "Você ganhou %d %s como premiação e 300 Tournaments Coins.",
		messageLooser = "Você perdeu suas vidas e foi eliminado do Evento.",
		messageDraw = "O evento foi finalizado sem ganhador! Todos os players morreram!"
	},
	lifeColor = {
		[1] = 94, -- red
		[2] = 77, -- orange
		[3] = 79 -- yellow
	},
	positionEvent = {firstTile = {x = 1538, y = 951, z = 7}, tilesX = 15, tilesY = 11}
}

function SAFEZONE:teleportCheck()
	local tile = Tile(SAFEZONE.positionTeleportOpen)
	if tile then
		local item = tile:getItemById(1949)
		if item then
			item:remove()

			local totalPlayers = SAFEZONE:totalPlayers()
			if totalPlayers >= SAFEZONE.minPlayers then
				Game.broadcastMessage(SAFEZONE.messages.prefix .. SAFEZONE.messages.messageStart:format(totalPlayers), MESSAGE_STATUS_WARNING)
				SAFEZONE:createProtectionTiles()
				SAFEZONE:finalizaAoTempo()
			else
				Game.broadcastMessage(SAFEZONE.messages.prefix .. SAFEZONE.messages.messageNoStart, MESSAGE_STATUS_WARNING)
				Game.setStorageValue(SAFEZONE.started, 0)			
				Spdlog.info("[SAFEZONE EVENT] - Canceled due to missing players!")
				SAFEZONE:removePlayers()
				return true
			end
		else
			Game.broadcastMessage(SAFEZONE.messages.prefix .. SAFEZONE.messages.messageOpen:format(SAFEZONE.teleportTimeClose), MESSAGE_STATUS_WARNING)
			addEvent(Game.broadcastMessage, (SAFEZONE.teleportTimeClose - 3) * 60 * 1000, SAFEZONE.messages.prefix .. (SAFEZONE.messages.messageWait):format(SAFEZONE.teleportTimeClose - 2))
			addEvent(Game.broadcastMessage, (SAFEZONE.teleportTimeClose - 1) * 60 * 1000, SAFEZONE.messages.prefix .. (SAFEZONE.messages.messageWait):format(SAFEZONE.teleportTimeClose - 4))
			
			local teleport = Game.createItem(1949, 1, SAFEZONE.positionTeleportOpen)
			if teleport then
				teleport:setActionId(SAFEZONE.actionId)
				teleport:setDestination(SAFEZONE.positionEnterEvent)
			end
			addEvent(function()
				SAFEZONE:teleportCheck()
			end, SAFEZONE.teleportTimeClose * 60000)
		end
	end
end

function SAFEZONE:finalizaAoTempo()

	addEvent(function()
		if SAFEZONE:totalPlayers() > 1 and Game.getStorageValue(SAFEZONE.started) == 1 then
			Game.broadcastMessage(SAFEZONE.messages.prefix .. SAFEZONE.messages.messageTime, MESSAGE_STATUS_WARNING)
			SAFEZONE:removePlayers()
			Game.setStorageValue(SAFEZONE.started, 0)
			Spdlog.info("[SAFEZONE EVENT] - Canceled due to maximum time!")
			return true
		elseif Game.getStorageValue(SAFEZONE.started) == 0 then
			Spdlog.info("[SAFEZONE EVENT] - Already Finished!")
			return true
		end
	end, SAFEZONE.eventTimeTotal * 60 * 1000)
				
end


function SAFEZONE:removePlayers()
	for _, a in ipairs(SAFEZONE.players) do
		local player = Player(a)
		player:setStorageValue(SAFEZONE.storage, 0)
		player:setStorageValue(STORAGEVALUE_EVENTS, 0)
		player:teleportTo(player:getTown():getTemplePosition())
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		SAFEZONE.players[a] = nil
		table.remove(SAFEZONE.players,_)
		--SAFEZONE:removePlayer(player:getId())
	end
end


function SAFEZONE:removePlayer(playerId)
	for i, v in pairs(SAFEZONE.players) do
	--Spdlog.info("[SAFEZONE EVENT] - Valor i: "..i.. " valor v: "..v)
		if(v == playerId) then
			--Spdlog.info("[SAFEZONE EVENT] - Valor v: "..v.. " valor playerId: "..playerId)
			--Spdlog.info("[SAFEZONE EVENT] - User excluído com sucesso. ")
			SAFEZONE.players[v] = nil
			table.remove(SAFEZONE.players,i)
		else
			--Spdlog.error("[SAFEZONE EVENT] - Não excluído. ")
		end
	end
end	
--[[
function SAFEZONE:removePlayer(playerId)
		for _, b in ipairs(SAFEZONE.players) do
			local player = Player(b)
			if player:getId() == playerId then
				SAFEZONE.players[b] = nil
			else
				Spdlog.error("[SAFEZONE EVENT] - Not found: Removing ID: "..playerId.. " number searched: " ..player:getId().. "in table: " .. SAFEZONE.players[b])
			end
		end
end		
]]--

function SAFEZONE:insertPlayer(playerId)
	if not table.find(SAFEZONE.players, playerId) then
		table.insert(SAFEZONE.players, playerId)
	end
end

function SAFEZONE:totalPlayers()	
	return #SAFEZONE.players
end

function SAFEZONE:totalProtectionTile()
	local totalPlayers = SAFEZONE:totalPlayers()
	if totalPlayers >= 10 then
		return totalPlayers - 3
	else
		return totalPlayers - 1
	end
end

function SAFEZONE:createProtectionTiles()
	local totalPlayers = #SAFEZONE.players
	if #SAFEZONE.players == 1 then
	--Spdlog.info(SAFEZONE.messages.prefix .. "CreateProtectionTiles: Cond IF: Players Jogando: " .. #SAFEZONE.players)
		for _, a in ipairs(SAFEZONE.players) do
			local player = Player(a)
				player:setStorageValue(SAFEZONE.storage, 0)
				SAFEZONE:removePlayer(player:getId())
				player:setStorageValue(STORAGEVALUE_EVENTS, 0)
				player:teleportTo(player:getTown():getTemplePosition())
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)

				local itemType = ItemType(SAFEZONE.reward[1])
				if itemType:getId() ~= 0 then
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, SAFEZONE.messages.prefix .. SAFEZONE.messages.messageWinner:format(SAFEZONE.reward[2],itemType:getName()))
					player:addItem(itemType:getId(), SAFEZONE.reward[2])
					player:addTransferableCoins(300)
					db.query(string.format("INSERT INTO `store_history`(`account_id`, `mode`, `description`, `coin_type`, `coin_amount`, `time`) VALUES (%s, %s, %s, %s, %s, %s)", player:getAccountId(), "0", db.escapeString("[SafeZone Event] - Winner"), "0", "300", os.time()))
					Game.setStorageValue(SAFEZONE.started, 0)				
					Spdlog.info("[SAFEZONE EVENT] - Ended SafeZone Event!")
					return true
				end
			Game.broadcastMessage(SAFEZONE.messages.prefix .. SAFEZONE.messages.messageFinish:format(player:getName()), MESSAGE_STATUS_WARNING)
		end

	elseif #SAFEZONE.players >= SAFEZONE.minPlayers then
	--Spdlog.info(SAFEZONE.messages.prefix .. "CreateProtectionTiles: Cond ELSE: Players Jogando: " .. #SAFEZONE.players .. "Min Players: " ..SAFEZONE.minPlayers)
		local createTiles, totalTiles = 0, SAFEZONE:totalProtectionTile()
		local tileX = SAFEZONE.positionEvent.firstTile.x
		local tileY = SAFEZONE.positionEvent.firstTile.y
		local tileZ = SAFEZONE.positionEvent.firstTile.z
		local tilesX = SAFEZONE.positionEvent.tilesX
		local tilesY = SAFEZONE.positionEvent.tilesY
		local protectionTileId = SAFEZONE.protectionTileId
		while createTiles < totalTiles do
			local randomX = math.random(tileX, tileX + tilesX)
			local randomY = math.random(tileY, tileY + tilesY)
			local newPosition = Position({x = randomX, y = randomY, z = tileZ})
			local tile = Tile(newPosition)
			if tile then
				local item1 = tile:getItemById(protectionTileId[1])
				local item2 = tile:getItemById(protectionTileId[2])
				local item3 = tile:getItemById(protectionTileId[3])
				local item4 = tile:getItemById(protectionTileId[4])
				if not item1 and not item2 and not item3 and not item4 then
					local randomTile = math.random(protectionTileId[1], protectionTileId[4])
					local tileBefore = Tile(newPosition)
					local tileBeforeGround = tileBefore:getGround()
					local tileBeforeGround2 = tileBeforeGround:getId()
					local tileProtection = Game.createItem(randomTile, 1, newPosition)
					if tileProtection then
						tileProtection:getPosition():sendMagicEffect(CONST_ME_ENERGYHIT)
						addEvent(function()
							SAFEZONE:deleteProtectionTiles(newPosition, randomTile, tileBeforeGround2)
						end, 5000)
						createTiles = createTiles + 1
					end
				end
			end
		end
		addEvent(function()
			SAFEZONE:effectArea(SAFEZONE.positionEvent.firstTile, SAFEZONE.positionEvent.tilesX, SAFEZONE.positionEvent.tilesY)
		end, 6000)
		addEvent(function()
			SAFEZONE:checkPlayersinProtectionTiles()
		end, 4000)
		addEvent(function()
			SAFEZONE:createProtectionTiles()
		end, 7000)
	else
	--Adicionar logica para caso todos percam o safezone, finalizar o game e limpar tabela de participantes
	end
end

function SAFEZONE:deleteProtectionTiles(position, tileId, beforeTile)
	local tile = Tile(position)
	if tile then
		local item = tile:getItemById(tileId)
		if item then
			item:getPosition():sendMagicEffect(CONST_ME_POFF)
			item:transform(beforeTile)
		end
	end
end

function SAFEZONE:checkPlayersinProtectionTiles()
	local protectionTileId = SAFEZONE.protectionTileId
	for _, a in ipairs(SAFEZONE.players) do
		local player = Player(a)
		if player then
			if player:getStorageValue(SAFEZONE.storage) > 0 then
				local tile = Tile(player:getPosition())
				if tile then
					local item1 = tile:getItemById(protectionTileId[1])
					local item2 = tile:getItemById(protectionTileId[2])
					local item3 = tile:getItemById(protectionTileId[3])
					local item4 = tile:getItemById(protectionTileId[4])
					if not item1 and not item2 and not item3 and not item4 then
						if player:getStorageValue(SAFEZONE.storage) > 1 then
							player:setStorageValue(SAFEZONE.storage, player:getStorageValue(SAFEZONE.storage) - 1)
							local lifes = player:getStorageValue(SAFEZONE.storage)
							player:getPosition():sendMagicEffect(CONST_ME_FIREAREA)
							player:sendTextMessage(MESSAGE_EVENT_ADVANCE, SAFEZONE.messages.prefix .. "Você perdeu uma vida, cuidado na próxima SafeZone!")							
							local outfit = player:getSex() == 0 and 136 or 128
							if lifes == 1 then
								local lifeColor = SAFEZONE.lifeColor[1]
								player:setOutfit({lookType = outfit, lookHead = lifeColor, lookBody = lifeColor, lookLegs = lifeColor, lookFeet = lifeColor})
							elseif lifes == 2 then
								local lifeColor = SAFEZONE.lifeColor[2]
								player:setOutfit({lookType = outfit, lookHead = lifeColor, lookBody = lifeColor, lookLegs = lifeColor, lookFeet = lifeColor})
							end							
							player:setStorageValue(SAFEZONE.storage, lifes)
						else
							player:setStorageValue(SAFEZONE.storage, 0)
							player:setStorageValue(STORAGEVALUE_EVENTS, 0)
							player:getPosition():sendMagicEffect(CONST_ME_FIREAREA)
							player:teleportTo(player:getTown():getTemplePosition())
							player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
							SAFEZONE:removePlayer(player:getId())
							player:sendTextMessage(MESSAGE_EVENT_ADVANCE, SAFEZONE.messages.prefix .. SAFEZONE.messages.messageLooser)
						end
					else
						player:sendTextMessage(MESSAGE_EVENT_ADVANCE, SAFEZONE.messages.prefix .. "Você Acertou a SafeZone !!")
					end
				end
			end
		end
	end
end

function SAFEZONE:effectArea(firstTile, tilesX, tilesY)
	local fromPosition = firstTile
	local toPositionX = fromPosition.x + tilesX
	local toPositionY = fromPosition.y + tilesY
	for x = fromPosition.x, toPositionX do
		for y = fromPosition.y, toPositionY do
			local position = Position({x = x, y = y, z = fromPosition.z})
			if position then
				position:sendMagicEffect(CONST_ME_SMALLPLANTS)
			end
		end
	end
end