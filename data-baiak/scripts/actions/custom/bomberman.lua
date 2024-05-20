local config = {
	levers = {
		[2772] = 2773,
		[2773] = 2772
	},

	fromPositions = {
	-- aqui colocar os 5 sqm de entrada do time A
		[1] = Position(1719, 937, 7),
		[2] = Position(1720, 937, 7),
		[3] = Position(1721, 937, 7),
		[4] = Position(1722, 937, 7),
		[5] = Position(1723, 937, 7),
	--aqui colocar os 5 sqm de entrada do time B
		[6] = Position(1719, 939, 7),
		[7] = Position(1720, 939, 7),
		[8] = Position(1721, 939, 7),
		[9] = Position(1722, 939, 7),
		[10] = Position(1723, 939, 7)
	},

	toPositions = {
	-- aqui colocar os 5 sqm do time A na arena
		[1] = Position(1709, 903, 7),
		[2] = Position(1709, 915, 7),
		[3] = Position(1709, 927, 7),
		[4] = Position(1715, 921, 7),
		[5] = Position(1715, 909, 7),
	-- aqui colocar os 5 sqm do time B na arena
		[6] = Position(1735, 903, 7),
		[7] = Position(1735, 915, 7),
		[8] = Position(1735, 927, 7),
		[9] = Position(1727, 921, 7),
		[10] = Position(1727, 909, 7)
	}

}

local function endGame()
	exitPosition = Position(1721, 942, 7)
	Game.broadcastMessage("[BOMBERMAN] - A partida acabou sem vencedores.", MESSAGE_GAME_HIGHLIGHT)
	for i = 1, #BomberTeam1 do
		if isPlayer(BomberTeam1[i]) then
			resetplayerbomberman(BomberTeam1[i])
			BomberTeam1[i]:setOutfit(BombermanOutfit[BomberTeam1[i]:getGuid()])
		end
		BomberTeam1[i]:teleportTo(Position(exitPosition))
	end
	for i = 1, #BomberTeam2 do
		if isPlayer(BomberTeam2[i]) then
			resetplayerbomberman(BomberTeam2[i])
			BomberTeam2[i]:setOutfit(BombermanOutfit[BomberTeam2[i]:getGuid()])
		end
		BomberTeam2[i]:teleportTo(Position(exitPosition))
	end

	for i = 1, #BlockListBomberman do
			local powerItens = {32115, 32116, 32117}
			for pointer = 1, 3 do
				if Tile(BlockListBomberman[i]):getItemById(powerItens[pointer]) then
					remover = Tile(BlockListBomberman[i]):getItemById(powerItens[pointer])
					remover:remove()
				end
			end

			if not Tile(BlockListBomberman[i]):getItemById(8505) then
				Game.createItem(8505, 1, BlockListBomberman[i])
			end

		end
	BomberTeam1, BomberTeam2 = { }, { }
	BlockListBomberman = { }
	BombermanPortal = 0
end

local function resetplayerbomberman(player)
	local player = Player(player)
	player:setStorageValue(STORAGEVALUE_MINIGAME_BOMBERMAN_ACTIVEBOMB, -1)
	player:setStorageValue(STORAGEVALUE_MINIGAME_BOMBERMAN_MAXBOMB, -1)
	player:setStorageValue(STORAGEVALUE_MINIGAME_BOMBERMAN_SPEED, -1)
	doChangeSpeed(player, getCreatureBaseSpeed(player)-player:getSpeed())
end


local bombermanAct = Action()

function bombermanAct.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if #BomberTeam1 > 0 or #BomberTeam2 > 0 then
		player:sendCancelMessage("Existe uma partida em andamento.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end


	local players = { }

	for pos = 1, 10 do
		local creature = Tile(config.fromPositions[pos]):getTopCreature()
		if creature and creature:isPlayer() then
			table.insert(players, creature)
			player:sendCancelMessage("� necess�rio 10 jogadores para iniciar o bomberman.")
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
		end
	end

	if #players == 10 then -- precisa de 10 jogadores
		for i = 1, 10 do -- de 1 a 10 jogadores
		if players[i]:isPlayer() then
			BombermanOutfit[players[i]:getGuid()] = players[i]:getOutfit()
	    end
			players[i]:teleportTo(config.toPositions[i])
			if isPlayer(players[i]) then
				getPlayerPosition(players[i]):sendMagicEffect(CONST_ME_TELEPORT)
				if i <= 1 then -- 5
					players[i]:setOutfit({lookBody = 88, lookAddons = 0, lookType = 128, lookHead = 114, lookMount = 0, lookLegs = 114, lookFeet = 114})
				else
					players[i]:setOutfit({lookBody = 94, lookAddons = 0, lookType = 128, lookHead = 114, lookMount = 0, lookLegs = 114, lookFeet = 114})
				end
				elseif isMonster(players[i]) then
				getCreaturePosition(players[i]):sendMagicEffect(CONST_ME_TELEPORT)
			end
			if i <= 1 then -- 5
				table.insert(BomberTeam1, players[i])
				else
				table.insert(BomberTeam2, players[i])
			end
			if isPlayer(players[i]) then
				players[i]:setStorageValue(STORAGEVALUE_MINIGAME_BOMBERMAN_SIZE, 1)
				players[i]:setStorageValue(STORAGEVALUE_MINIGAME_BOMBERMAN_MAXBOMB, 1)
				players[i]:setStorageValue(STORAGEVALUE_MINIGAME_BOMBERMAN_SPEED, 1)
			end
		end

		bombermanEnd = addEvent(endGame, 60 * 10 * 1000)
		Game.broadcastMessage("[BOMBERMAN] - A partida acabar� em 10 minutos.", MESSAGE_GAME_HIGHLIGHT)
	end

	item:transform(config.levers[item.itemid])
	item:decay()
	return true
end

bombermanAct:aid(19876)
bombermanAct:register()
