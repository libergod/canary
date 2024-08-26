Bosses ={
	bosses = {
		["Ferumbras"] = {dia = "08/19/24", horario = 11, minuto = 35, tempoMatar = 1}, -- mes/dia/ano - somente a hora - em horas
	},
	posNasceBoss = Position(1646, 975, 9),
	posTpOpen = Position(1003, 1217, 7),
	posDestino = Position(1646, 960, 8),
	fromPos = Position(1635, 965, 9),
	toPos = Position(1658, 985, 9),
	northRange = 12, eastRange = 12, southRange = 12, westRange = 12,
	centroSala = Position(1646,975,9),
	level = {
		active = true,
		levelMin = 80,
	},
	tempoTpAberto = 5, -- Em minutos
	mensagemUm = "[Boss Event] Thunders hit Enara's land!",  -- 15 min
	mensagemDois = "[Boss Event] Looks like something is shinning, a teleport maybe.", -- 10 min
	mensagemTres = "[Boss Event] A creature has been spoted sneaking around, take care citizens!", -- 5 min
	mensagemTpFechar = "[Boss Event] The teleport is being closed, magicians estimate in 5 minutes to close it.",
	msgTpFechado = "[Boss Event] The elder magicians finally closed the teleport.",
	msgFinalBoss = "[Boss Event] The strongest creature in Enara had been vanish from this world!",
	msgacabouTempo = "[Boss Event] Time just ran out and the creature escaped!",
	actionIdTp = 4247,
	storage = 13337,
	storageAlive = 13338,
}

function Bosses:getMonsterNameToCreature()
	return BOSS_EVENT_NAME
end

function Bosses:setMonsterNameToCreature(index)

	BOSS_EVENT_NAME = index

end

function Bosses:getBossName()
	for index, v in pairs(Bosses.bosses) do
		if v.dia == os.date("%x") and v.horario  == tonumber(os.date("%H")) and v.minuto  == tonumber(os.date("%M")) then
			return index
		end
	end
	return nil
end


function Bosses:closeTp()
	local tile = Tile(Bosses.posTpOpen)
	if tile then
		local item = tile:getItemById(1949)
		if item then
			item:getPosition():sendMagicEffect(CONST_ME_POFF)
			item:remove()
			Game.setStorageValue(Bosses.storage, 0)
			Game.broadcastMessage(Bosses.msgTpFechado)
			Spdlog.info("[BOSSES EVENT] - Teleports Closed!")
		else
			Spdlog.error("[BOSSES EVENT] - Trying to Close but Event not Running or Teleport not Found!")
		end
	end
end


function Bosses:openTp()
	local tile = Tile(Bosses.posTpOpen)
	if tile then
		local item = tile:getItemById(1949)
		if not item then
			local teleport = Game.createItem(1949, 1, Bosses.posTpOpen)
			if teleport then
				teleport:setActionId(Bosses.actionIdTp)
			end
			
			addEvent(function()
				Bosses:closeTp()
			end, Bosses.tempoTpAberto * 60 * 1000)
			
			addEvent(Game.broadcastMessage, (Bosses.tempoTpAberto - 5) * 60 * 1000, (Bosses.mensagemTpFechar))			
		end
	end
end

function Bosses:checkTime()
	for index, v in pairs(Bosses.bosses) do
		if v.dia == os.date("%x") and v.horario  == tonumber(os.date("%H")) and v.minuto  == tonumber(os.date("%M")) and Game.getStorageValue(Bosses.storage) ~= 1 and Game.getStorageValue(Bosses.storageAlive) ~= 1 then
			Game.setStorageValue(Bosses.storage, 1)
			Bosses.storageMonsterName = index
			addEvent(function()
				local monster = Game.createMonster(index, Bosses.posNasceBoss)
				Game.setStorageValue(Bosses.storageAlive, 1)
				Bosses:setMonsterNameToCreature(index)
				-- ADICIONAR LOGICA PARA CREATURE MORTA, FINALIZAR O EVENTO!
				
				
				--monster:setEmblem(GUILDEMBLEM_ENEMY)
				local idMonster = monster:getId()
			end, 2 * 60 * 1000) -- 10
			--[[
			addEvent(function()
				Bosses:removeMonstersInArea(Bosses.fromPos, Bosses.toPos)
			--end, v.tempoMatar * 60 * 60 * 1000)
			end, 5 * 60 * 1000) -- 5 Minutos
			]]--
			Bosses:sendMessages()
			Bosses:openTp()
			Spdlog.info("[BOSSES EVENT] - Event Started!")
		end
	end
end

function Bosses:sendMessages()
	Game.broadcastMessage(Bosses.mensagemUm)
	addEvent(Game.broadcastMessage, 1 * 60 * 1000, Bosses.mensagemDois)--5
	addEvent(Game.broadcastMessage, 2 * 60 * 1000, Bosses.mensagemTres)--10
end

--[[
function Bosses:removeMonster(id)
	monstro = Monster(id)
	if monstro and Game.getStorageValue(Bosses.storageAlive) == 1 then
		monstro:getPosition():sendMagicEffect(CONST_ME_POFF)
		monstro:remove()
		Bosses.storageMonsterName = nil
		Game.setStorageValue(Bosses.storage, 0)
		Game.setStorageValue(Bosses.storageAlive, 0)
		Spdlog.info("[BOSSES EVENT] - Event Ended!")
	end
end
]]--

function Bosses:removeMonstersInArea(fromPos,toPos)

	local spectators = Game.getSpectators(Bosses.centroSala, false, true, Bosses.westRange, Bosses.eastRange, Bosses.northRange, Bosses.southRange)
	
	if #spectators > 0 then
		return false
	else
        --local monsters = { } 
        for Px = fromPos.x, toPos.x do
                for Py = fromPos.y, toPos.y do
                    --local monster = Monster(getThingFromPos(Position(x,y,8)))
					local monster = Monster(getThingfromPos({x=Px, y=Py, z=9, stackpos=253}))
					--if isMonster(monster.uid) then
					if isMonster(monster) then
						monster:remove()
						monster:getPosition():sendMagicEffect(CONST_ME_POFF)
						--table.insert(monsters, monster.uid)
					end
                end
        end
		Game.broadcastMessage(Bosses.msgacabouTempo)
		Bosses.storageMonsterName = nil
		Game.setStorageValue(Bosses.storage, 0)
		Game.setStorageValue(Bosses.storageAlive, 0)
		Spdlog.info("[BOSSES EVENT] - Event Ended!")
		return true	
	end	
	return true
end
