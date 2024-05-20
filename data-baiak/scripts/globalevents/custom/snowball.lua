local function startGame(rounds)
	if rounds == 0 then
		if #CACHE_GAMEPLAYERS < SNOWBALL.minPlayers then
			for _, players in ipairs(CACHE_GAMEPLAYERS) do
				Player(players):teleportTo(Player(players):getTown():getTemplePosition())
			end
			Game.broadcastMessage(SNOWBALL.prefixo .. (SNOWBALL.mensagemEventoFaltaPlayer):format(SNOWBALL.minPlayers))
			Game.setStorageValue(SNOWBALL.storages.started, 0)
			Spdlog.info("[SNOWBALL EVENT] - Canceled due to missing players!")
		else
			carregarEvento()
			for _, players in ipairs(CACHE_GAMEPLAYERS) do
				local player = Player(players)
                if player then
                    player:setStorageValue(10109, 0)
                    player:setStorageValue(10108, SNOWBALL.muniInicial)
                    player:setStorageValue(STORAGEVALUE_EVENTS, 1)
                    player:teleportTo(CACHE_GAMEAREAPOSITIONS[math.random(1, #CACHE_GAMEAREAPOSITIONS)])
                end
			end
			Game.broadcastMessage(SNOWBALL.prefixo .. SNOWBALL.mensagemInicioEvento)
			addEvent(terminarEvento, SNOWBALL.duracaoEvento * 60 * 1000)
		end

		Item(getTileItemById(SNOWBALL.posTpEntrarEvento, 1949).uid):remove(1)
		return true
	end

	if #CACHE_GAMEPLAYERS < SNOWBALL.minPlayers then
		Game.broadcastMessage(SNOWBALL.prefixo .. (SNOWBALL.mensagemEsperandoIniciar):format(rounds, SNOWBALL.minPlayers - #CACHE_GAMEPLAYERS))
	else
		Game.broadcastMessage(SNOWBALL.prefixo .. (SNOWBALL.mensagemEsperandoIniciar2):format(rounds))
	end
	return addEvent(startGame, 60 * 1000, rounds - 1)
end

local snowballStart = GlobalEvent("snowballStart")
function snowballStart.onThink(interval, lastExecution)

	if Game.getStorageValue(SNOWBALL.storages.started) == 1 then
		--Spdlog.info("[SNOWBALL EVENT] - Already Running!!")
		return true
	end

	if table.find(SNOWBALL.days, tostring(os.date("%A-%H:%M"))) then
		Spdlog.info("[SNOWBALL EVENT] - Started Snowball Event at "..tostring(os.date("%A-%H:%M")))
		Game.setStorageValue(SNOWBALL.storages.started, 1)
		CACHE_GAMEPLAYERS = { }
		Game.broadcastMessage(SNOWBALL.prefixo .. SNOWBALL.mensagemEventoAberto)
		local EventTeleport = Game.createItem(1949, 1, SNOWBALL.posTpEntrarEvento)
		EventTeleport:setActionId(10101)
		EventTeleport:setDestination(SNOWBALL.posEspera)
		addEvent(startGame, 60 * 1000, SNOWBALL.duracaoEspera)
	end
	return true
end
snowballStart:interval(60000) -- how often
snowballStart:register()