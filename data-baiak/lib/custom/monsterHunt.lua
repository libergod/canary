MONSTER_HUNT = {
	list = {"Demon", "Juggernaut", "Frost Dragon", "Nightmare", "Hellspawn", "Warlock", "Serpent Spawn", "Defiler", "Grim Reaper"},
	days = {--Day-Hour

                "Monday-10",
				"Monday-22",

				"Wednesday-10",
				"Wednesday-22",

				"Friday-10", 
				"Friday-22",
				
				"Saturday-10",
				"Saturday-22",
				
				"Sunday-11",
				"Sunday-23",
	},
	messages = {
		prefix = "[Monster Hunt] ",
		warnInit = "O evento irá começar em %d minuto%s. Seu objetivo será matar a maior quantidade de monstros escolhidos pelo sistema.",
		init = "O monstro escolhido pelo sistema foi %s. Você tem 1 hora para matar a maior quantidade desse monstro.",
		warnEnd = "Faltam %d minuto%s para acabar o evento. Se apressem!",
		final = "O jogador %s foi o ganhador do evento! Parabéns.",
		noWinner = "Não houve ganhadores no evento.",
		noWinnerOnline = "O Ganhador não estava online, evento finalizado!",
		reward = "Você recebeu o seu prêmio!",
		tournaments_reward = "Você recebeu 100 Tournaments Coin! Verifique a Store!",
		kill = "Você já matou {%d} %s do evento.",
	},
	rewards = {
		{id = 3043, count = 100},
	},
	storages = {
		monster = 891641,
		player = 891642,
		started = 891643,
	},
	players = { },
}

function MONSTER_HUNT:initEvent()


	-- SET STORAGE OF ONLINE PLAYERS TO 0
	local players = Game.getPlayers()
	if #players > 0 then

		for i = 1, #players do
			local player = Player(players[i])
			player:setStorageValue(MONSTER_HUNT.storages.player, 0)
		end
	
	end
	
	-- ADD QUERY TO SET 0 
	db.query(string.format("UPDATE `player_storage` SET `value` = %d WHERE `key` = %d", 0, MONSTER_HUNT.storages.player))
	
	Game.setStorageValue(MONSTER_HUNT.storages.monster, 0)
	Game.broadcastMessage(MONSTER_HUNT.messages.prefix .. MONSTER_HUNT.messages.warnInit:format(5, "s"))
	addEvent(function()
		Game.broadcastMessage(MONSTER_HUNT.messages.prefix .. MONSTER_HUNT.messages.warnInit:format(3, "s"))
	end, 2 * 60 * 1000)
	addEvent(function()
		Game.broadcastMessage(MONSTER_HUNT.messages.prefix .. MONSTER_HUNT.messages.warnInit:format(1, ""))
	end, 4 * 60 * 1000)
	addEvent(function()
		local rand = math.random(#MONSTER_HUNT.list)
		Game.setStorageValue(MONSTER_HUNT.storages.monster, rand)
		Game.broadcastMessage(MONSTER_HUNT.messages.prefix .. MONSTER_HUNT.messages.init:format(MONSTER_HUNT.list[rand]))
	end, 5 * 60 * 1000)
	
	-- FINALIZAR EVENTO 
	
	addEvent(function()
		MONSTER_HUNT:endEvent() -- 15 min * 60 seg * 1000 milesimos = (15 min)
	end, 55 * 60 * 1000) -- Para durar 20min de evento, adicionar 15. Sistema sempre leva 5 min a mais do que o tempo setado aqui.
	
	return true
end

function MONSTER_HUNT:endEvent()
	Game.broadcastMessage(MONSTER_HUNT.messages.prefix .. MONSTER_HUNT.messages.warnEnd:format(5, "s"))
	addEvent(function()
		Game.broadcastMessage(MONSTER_HUNT.messages.prefix .. MONSTER_HUNT.messages.warnEnd:format(3, "s"))
	end, 2 * 60 * 1000)
	addEvent(function()
		Game.broadcastMessage(MONSTER_HUNT.messages.prefix .. MONSTER_HUNT.messages.warnEnd:format(1, ""))
	end, 4 * 60 * 1000)
	addEvent(function()
		if MONSTER_HUNT.players == nil then
			Game.broadcastMessage(MONSTER_HUNT.messages.prefix .. MONSTER_HUNT.messages.noWinner)
				-- ADD QUERY TO SET 0 
			db.query(string.format("UPDATE `player_storage` SET `value` = %d WHERE `key` = %d", 0, MONSTER_HUNT.storages.player))
		
			-- RESTART AND RESET STARTED STORAGE
			Game.setStorageValue(MONSTER_HUNT.storages.monster, -1)
			Game.setStorageValue(MONSTER_HUNT.storages.started, 0)
			Spdlog.info("[HUNT EVENT] - Ended Hunt Event!")
			return true
		end
		table.sort(MONSTER_HUNT.players, function(a,b) return a[2] > b[2] end)
		
		if #MONSTER_HUNT.players == nil or #MONSTER_HUNT.players <= 0 then
			Game.broadcastMessage(MONSTER_HUNT.messages.prefix .. MONSTER_HUNT.messages.noWinner)
			Spdlog.info("[HUNT EVENT] - Ended Hunt Event!")
			return true
		end

		local player = Player(MONSTER_HUNT.players[1][1])
		if player then
			Game.broadcastMessage(MONSTER_HUNT.messages.prefix .. MONSTER_HUNT.messages.final:format(player:getName()))
			player:setStorageValue(MONSTER_HUNT.storages.player, -1)
			
			if player:addTournamentsCoins(300) then
			player:getPosition():sendMagicEffect(30)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, MONSTER_HUNT.messages.prefix .. MONSTER_HUNT.messages.tournaments_reward)
			db.query(string.format("INSERT INTO `store_history`(`account_id`, `mode`, `description`, `coin_type`, `coin_amount`, `time`) VALUES (%s, %s, %s, %s, %s, %s)", player:getAccountId(), "0", db.escapeString("[Monster Hunt] - Winner"), "2", "300", os.time()))
			end
			
			--[[for c, d in ipairs(MONSTER_HUNT.rewards) do
				local item = Game.createItem(d.id, d.count)
				player:addItemEx(item)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, MONSTER_HUNT.messages.prefix .. MONSTER_HUNT.messages.reward)
				player:getPosition():sendMagicEffect(30)
			end
			]]--
		else
			Game.broadcastMessage(MONSTER_HUNT.messages.prefix .. MONSTER_HUNT.messages.noWinnerOnline)
		end
		for a, b in pairs(MONSTER_HUNT.players) do
			local player = Player(b[1])
			if player then
				player:setStorageValue(MONSTER_HUNT.storages.player, 0)
				MONSTER_HUNT.players[a] = nil
			end
		end
		-- ADD QUERY TO SET 0 
		db.query(string.format("UPDATE `player_storage` SET `value` = %d WHERE `key` = %d", 0, MONSTER_HUNT.storages.player))
		
		-- RESTART AND RESET STARTED STORAGE
		Game.setStorageValue(MONSTER_HUNT.storages.monster, -1)
		Game.setStorageValue(MONSTER_HUNT.storages.started, 0)
		Spdlog.info("[HUNT EVENT] - Ended Hunt Event!")
	end, 5 * 60 * 1000)
	return true
end