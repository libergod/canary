SNOWBALL = {
	-- Configurações de texto
	comandoAtirar = "atirar", -- !snowball atirar
	prefixo = "[SNOWBALL] ",
	mensagemFoiAcertado = "Você acabou ser acertado pelo jogador %s e perdeu -%d ponto(s).\nTotal de: %d ponto(s)",
	mensagemAcertei = "Você acabou de acertar o jogador %s e ganhou +%d ponto(s).\nTotal de: %d ponto(s)",
	mensagemLider = "Você agora é o lider do ranking do SnowBall, parabéns!",
	mensagemPerdeuLider = "Você acaba de perder a primeira colocação!",
	mensagemAcabouEvento = "O Evento acabou.",
	mensagemQntBolas = "Ainda restam %d bolas de neve.",
	mensagemNaoTemBola = "Você não possui bolas de neve.",
	mensagemEventoFaltaPlayer = "O evento foi cancelado por conta de não ter no minimo %d jogadores.",
	mensagemInicioEvento = "O evento foi fechado. O jogo começou.",
	mensagemEsperandoIniciar = "Faltam %d minuto(s) e %d jogador(es) para o jogo começar.",
	mensagemEsperandoIniciar2 = "Mínimo de Players no evento OK! Aguardando %d minuto(s) para o jogo começar.",
	mensagemMinutosFaltam = "Faltam %d minuto(s) para o jogo começar.",
	mensagemEventoAberto = "O evento foi aberto, vá até o templo para participar.",
	mensagemComprou = "Você acaba de comprar %d bolas de neve por %d\nVocê tem %d bolas de neve\nVocê tem %d ponto(s).",
	mensagemFalhaComprar = "Você não tem %d ponto(s).",
	mensagemMinComprar = "Você só pode comprar bolas de neve com o minimo de 30 bolas.",
	mensagemExausted = "You are exhausted. Wait 1 second to throw another snowball.",
	-- Configurações de posições
	posArena = {{x = 1525, y = 884, z = 7}, {x = 1580, y = 930, z = 7}},
	posEspera = {x = 1553, y = 855, z = 7},
	posTpEntrarEvento = Position(1003, 1217, 7),
	-- Configurações de munição
	muniPreco = 1,
	muniQuant = 100, -- Quantidade de ganho a cada compra.
	muniInicial = 100, -- Começa com 100
	muniMorreu = 100, -- Caso queira desativar deixa 0
	muniVelocidade = 150, -- Velocidade de cada tiro
	muniInfinito = false,
	muniExhaust = 1, -- Segundos de espera pra usar snowball atirar
	muniDistancia = 5,
	-- Configurações de prêmios
	premios = {
	[1] = {[9058] = 5}, -- Primeiro Lugar
	},
	-- Configurações gerais
	duracaoEvento = 20,
	duracaoEspera = 5,
	minPlayers = 3,
	maxPlayers = 50,
	level = {
		active = true,
		levelMin = 200,
	},
	storages = {
		started = 13333,
	},
	pontosAcerto = 1,
	pontosPerda = 1,
	days = {--Day-Hour
				"Wednesday-16:40",
				"Wednesday-20:40",

				"Friday-09:40",
				"Friday-12:40",
				
				"Saturday-16:40",
				"Saturday-20:40",
				
				"Sunday-09:40",
				"Sunday-14:40",
	},
	-- Não mexa daqui pra baixo
	-- Configurações de corpos congelados
	corposCongelados = {
	[0] = { [0] = {7303}, [1] = {7306}, [2] = {7303}, [3] = {7306} },
	[1] = { [0] = {7305, 7307, 7309, 7311}, [1] = {7308, 7310, 7312}, [2] = {7305, 7307, 7309, 7311}, [3] = {7308, 7310, 7312} },
	},
	direcoes = { 
	[0] = {dirPos = {x = 0, y = -1}}, 
	[1] = {dirPos = {x = 1, y = 0}}, 
	[2] = {dirPos = {x = 0, y = 1}}, 
	[3] = {dirPos = {x = -1, y = 0}} 
	}
}

CACHE_GAMEPLAYERS = { }
CACHE_GAMEAREAPOSITIONS = { }

function carregarEvento()
	for newX = SNOWBALL.posArena[1].x, SNOWBALL.posArena[2].x do
		for newY = SNOWBALL.posArena[1].y, SNOWBALL.posArena[2].y do
			local AreaPos = Position(newX,newY,SNOWBALL.posArena[1].z)
			--local AreaPos = {x = newX, y = newY, z = SNOWBALL.posArena[1].z}
			if isWalkable(AreaPos) then
				table.insert(CACHE_GAMEAREAPOSITIONS, AreaPos)
			end
		end
	end
	
	if getTileThingByPos(SNOWBALL.posEspera).itemid == 0 then
		print("".. SNOWBALL.prefixo .."There was a problem checking the position of the waiting room, please check the conditions.")
		return false
	end

	if getTileThingByPos(SNOWBALL.posTpEntrarEvento).itemid == 0 then
		print("".. SNOWBALL.prefixo .."There was a problem when checking the existence of the position to create the event teleport, please check the conditions.")
		return false
	end
	return true
end

function enviarSnowball(cid, pos, rounds, dir)
	local player = Player(cid)
	
	if rounds == 0 then
		return true
	end
	
	if player then
		local dirConfig = SNOWBALL.direcoes[dir]
		if dirConfig then
			local novaPos = Position(pos.x + dirConfig.dirPos.x, pos.y + dirConfig.dirPos.y, pos.z)
			if isWalkable(novaPos) then
				if Tile(novaPos):getTopCreature() then
					local killed = Tile(novaPos):getTopCreature()
					if Player(killed:getId()) then
						if SNOWBALL.corposCongelados[killed:getSex()] then
							local killed_corpse = SNOWBALL.corposCongelados[killed:getSex()][killed:getDirection()][math.random(1, #SNOWBALL.corposCongelados[killed:getSex()][killed:getDirection()])]
							Game.createItem(killed_corpse, 1, killed:getPosition())
							local item = Item(getTileItemById(killed:getPosition(), killed_corpse).uid)
							addEvent(function() item:remove(1) end, 3000)
						end
					killed:getPosition():sendMagicEffect(3)
					killed:teleportTo(CACHE_GAMEAREAPOSITIONS[math.random(1, #CACHE_GAMEAREAPOSITIONS)])
					killed:getPosition():sendMagicEffect(50)
					killed:setStorageValue(10109, (killed:getStorageValue(10109) - SNOWBALL.pontosPerda))
					killed:setStorageValue(10108, SNOWBALL.muniMorreu)
					killed:sendTextMessage(29, (SNOWBALL.mensagemFoiAcertado):format(player:getName(), SNOWBALL.pontosPerda, killed:getStorageValue(10109)))
					player:setStorageValue(10109, player:getStorageValue(10109) + SNOWBALL.pontosAcerto)
					player:sendTextMessage(29, (SNOWBALL.mensagemAcertei):format(killed:getName(), SNOWBALL.pontosAcerto, player:getStorageValue(10109)))
					
					if(CACHE_GAMEPLAYERS[2] == player:getId()) and player:getStorageValue(10109) >= Player(CACHE_GAMEPLAYERS[1]):getStorageValue(10109) then
						player:getPosition():sendMagicEffect(CONST_ME_FIREAREA)
						player:sendTextMessage(29, SNOWBALL.mensagemLider)
						Player(CACHE_GAMEPLAYERS[1]):getPosition():sendMagicEffect(CONST_ME_ENERGYHIT)
						Player(CACHE_GAMEPLAYERS[1]):sendTextMessage(29, SNOWBALL.mensagemPerdeuLider)
					end
					
					table.sort(CACHE_GAMEPLAYERS, function(a, b) return Player(a):getStorageValue(10109) > Player(b):getStorageValue(10109) end)
				else
					novaPos:sendMagicEffect(CONST_ME_POFF)
				end
				return true
			end
				pos:sendDistanceEffect(novaPos, CONST_ANI_SNOWBALL)
				pos = novaPos
				return addEvent(enviarSnowball, SNOWBALL.muniVelocidade, player:getId(), pos, rounds - 1, dir)
			end
			novaPos:sendMagicEffect(CONST_ME_POFF)
			return true
		end
	end
	return true
end

function terminarEvento()
	local str = "       ## -> SnowBall Ranking <- ##\n\n"

	for rank, players in ipairs(CACHE_GAMEPLAYERS) do
		if SNOWBALL.premios[rank] then
			for item_id, item_ammount in pairs(SNOWBALL.premios[rank]) do

				Player(players):addItem(item_id, item_ammount)
				Player(players):setStorageValue(STORAGEVALUE_EVENTS, 0)
				Player(players):addTransferableCoins(300)
				db.query(string.format("INSERT INTO `store_history`(`account_id`, `mode`, `description`, `coin_type`, `coin_amount`, `time`) VALUES (%s, %s, %s, %s, %s, %s)", Player(players):getAccountId(), "0", db.escapeString("[Snowball Event] - Winner"), "0", "300", os.time()))
			end
		end

		str = str .. rank .. ". " .. Player(players):getName() .. ": " .. Player(players):getStorageValue(10109) .. " ponto(s)\n"
		Player(players):teleportTo(Player(players):getTown():getTemplePosition())
	end

	for _, cid in ipairs(CACHE_GAMEPLAYERS) do
		Player(cid):showTextDialog(2111, str)
	end

	Game.broadcastMessage(SNOWBALL.prefixo .. SNOWBALL.mensagemAcabouEvento)
	Spdlog.info("[SNOWBALL EVENT] - Ended Snowball Event!")
	
	return true
end

function isWalkable(pos)
	for i = 0, 255 do
		pos.stackpos = i

		local item = Item(getTileThingByPos(pos).uid)
		if item ~= nil then
			if item:hasProperty(2) or item:hasProperty(3) or item:hasProperty(7) then
				return false
			end
		end
	end
	return true
end

function isInArena(player)
	local pos = player:getPosition()

	if pos.z == SNOWBALL.posArena[1].z then
		if pos.x >= SNOWBALL.posArena[1].x and pos.y >= SNOWBALL.posArena[1].y then
			if pos.x <= SNOWBALL.posArena[2].x and pos.y <= SNOWBALL.posArena[2].y then
				return true
			end
		end
	end
	return false
end
