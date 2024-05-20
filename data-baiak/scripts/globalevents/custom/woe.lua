dofile("./_woe.lua")

local config = woe_config

local reward = 200000 -- 200k

local function EndWoe()
	Woe.getInfo()
		
	--Game.setStorageValue(stor.Started, 0)
	--Game.setStorageValue(stor.WoeTime, 0)
	setGlobalStorageValue(stor.WoeTime, 0)
	setGlobalStorageValue(stor.Started, 0)
	
	Woe.expulsar(infoLua[2], Castle.salas.a.fromx, Castle.salas.a.tox, Castle.salas.a.fromy, Castle.salas.a.toy, Castle.salas.a.z, Castle._exit)
	Woe.expulsar(infoLua[2], Castle.salas.b.fromx, Castle.salas.b.tox, Castle.salas.b.fromy, Castle.salas.b.toy, Castle.salas.b.z, Castle._exit)
	Woe.expulsar(infoLua[2], Castle.salas.c.fromx, Castle.salas.c.tox, Castle.salas.c.fromy, Castle.salas.c.toy, Castle.salas.c.z, Castle._exit)
	
	broadcastMessage("WoE is finished", MESSAGE_ADMINISTRADOR)
	broadcastMessage("The castle " .. Castle.name .. " is owned by ".. Woe.guildName() ..".", MESSAGE_ADMINISTRADOR)
	
	Woe.removePre()
	Woe.removePortals()
	Woe.removeEntry()		
	Woe.save()
	
	for _, targetPlayer in ipairs(Game.getPlayers()) do
	
	local playerId = Player(targetPlayer)
	
		local guild = Guild(playerId:getGuild())
		
		if not guild == nil then
			if infoLua[2] == guild:getId() then
				playerId:addMoney(reward)
			end
			return true
		else
			return false
		end
	end
	
	
	Woe.remove()
	Game.setStorageValue(24503, -1)
	
end

local woeGlobal = GlobalEvent("woeGlobal")
function woeGlobal.onThink(interval, lastExecution)

	Woe.getInfo()
	if Woe.isTime() then
		if not Woe.isStarted() then
			Game.createMonster("Emperium", Castle.empePos, false, true)
			Game.createMonster("PreEmpes", Castle.PreEmpes[1], false, true)
			Game.createMonster("PreEmpes2", Castle.PreEmpes[2], false, true)
			broadcastMessage("War has started...", MESSAGE_ADMINISTRADOR)
			Game.setStorageValue(stor.Started, 1)
			Woe.updateInfo({os.time(), infoLua[2], infoLua[3], infoLua[4]})
			--doCreateTeleport(5023, Castle.pos, Castle.desde)
			local item = Game.createItem(5023, 1, Castle.desde)
			item:setDestination(Castle.pos)
			Woe.summon()
			addEvent(EndWoe, config.timeToEnd * 60 * 1000)
		end
	end
	return true
end

woeGlobal:interval(72000) --5 minutos, alterar aqui!!
--woeGlobal:interval(360000) --5 minutos, alterar aqui!!
woeGlobal:register()
