dofile("./var.woe")

local config = woe_config

--SALVAR DADOS NO ARQUIVO OU NA DB?
fileStore = false

infoFile = 'tmp.woe'
infoLua = { }

Woe = { }
Woe.__index = Woe

function Woe.setup()
	db.query("DROP TABLE IF EXISTS `woe`;")
	db.query("CREATE TABLE `woe` (`id` INT( 11 ) NOT NULL AUTO_INCREMENT ,`started` INT( 11 ) NOT NULL ,`guild` INT( 11 ) NOT NULL ,`breaker` INT( 11 ) NOT NULL ,`time` INT( 11 ) NOT NULL ,PRIMARY KEY ( `id` ) ,UNIQUE (`id`)) ENGINE = MYISAM")
	--doBroadcastMessage("DB Added [...]", config.bcType)
	Game.broadcastMessage('DB Added [...]')
	if fileStore then
		local newFile = io.open(infoFile, "w")
		for _, i in ipairs({'started', 'guild', 'breaker', 'time'}) do
			newFile:write(i .. ' = 0 ;end;\n')
		end
		newFile:close()
	else
		db.query("DROP TABLE IF EXISTS `tmpwoe`;")
		db.query("CREATE TABLE `tmpwoe` (`started` INT( 11 ) NOT NULL ,`guild` INT( 11 ) NOT NULL ,`breaker` INT( 111 ) NOT NULL ,`time` INT( 1 ) NOT NULL) ENGINE = MYISAM ;")
		db.query("ALTER TABLE `tmpwoe` ADD `indexer` INT NOT NULL ")
		db.query("INSERT INTO `tmpwoe` (`started` ,`guild` ,`breaker` ,`time`, `indexer`)VALUES ('0', '0', '0', '0', '1');")
	end
end

function Woe.getInfo()
	if fileStore then
		local open = io.open(infoFile, "r")
		if open then
			for i in io.lines(infoFile) do 
				for v, k in ipairs({'started', 'guild', 'breaker', 'time'}) do
					if (i:find(k)) then
						n = i:match(k .. '.*')
						infoLua[v] = tonumber(n:sub(n:find('=') + 2, n:find(';end;') - 2))
					end
				end
			end
			open:close()
		end
	else
		for v, k in ipairs({'started', 'guild', 'breaker', 'time'}) do
			local tmp = db.storeQuery("SELECT " .. k .. " FROM `tmpwoe` WHERE `indexer` = '1';")
			local infoK = result.getDataInt(tmp, k)
			infoLua[v] = infoK
			result.free(tmp)
		end
	end
end

function Woe.updateInfo(tab)
	if fileStore then
		local open = io.open(infoFile, "w")
		if open then
			for k, i in ipairs({'started', 'guild', 'breaker', 'time'}) do
				open:write(i .. ' = ' .. tab[k] .. ' ;end;\n')
			end
			open:close()
		end
	else
		for v, k in ipairs({'started', 'guild', 'breaker', 'time'}) do
			db.query("UPDATE `tmpwoe` SET " .. k .. " =  " .. tab[v] .. " WHERE `indexer` = 1;")
		end
	end
end

function Woe.save()
	Woe.getInfo()
	db.query("INSERT INTO `woe` (`started`, `guild`, `breaker`, `time`) VALUES (" .. infoLua[1] .. ", " .. infoLua[2] .. ", " .. infoLua[3] .. ", " .. infoLua[4] .. ");")
end

function Woe.getGuildName(id)
	local resultId = db.storeQuery("SELECT `name` FROM `guilds` WHERE `id` = " .. id .. ";")
	local name = result.getDataString(resultId, 'name')
	if resultId ~= false then
		result.free(resultId)
		return name
	end
	return 'Nones'
end


function Woe.breakerName()
	Woe.getInfo()
	local player = Player(infoLua[3])
	return infoLua[3] ~= 0 and player:getName() or 'None'
end

function Woe.guildName()
	Woe.getInfo()
	return infoLua[2] ~= 0 and Woe.getGuildName(infoLua[2]) or 'Nones'
end

function Woe.startTime()
	Woe.getInfo()
	return os.date("%d %B %Y %X ", infoLua[1])
end

function Woe.breakTime()
	Woe.getInfo()
	return os.date("%d %B %Y %X ", infoLua[4])
end

function Woe.timeToEnd()
	Woe.getInfo()
	local myTable = { }
	for k, i in ipairs({"%M", "%S"}) do
		myTable[k] = os.date(i, os.difftime(os.time(), infoLua[1]))
	end
	return {mins = ((config.timeToEnd - 1) - myTable[1]), secs = (60 - myTable[2])}
end

function Woe.moveBack(cid, fromPosition, text)
	cid:teleportTo(fromPosition, true)
	cid:sendTextMessage(config.bcType,text)
	cid:getPosition():sendMagicEffect(CONST_ME_POFF)
end

function Woe.getGuildMembers(id)
	local members = { }
	local players = Game.getPlayers()
	
	if #players == 0 then
			return true
		end
		
	for _, i in ipairs(players) do
		local player = Player(players[i])
		
		local guild = player:getGuild()
		local Guild_ID = guild:getId()
		if id == Guild_ID then
			table.insert(members, i)
		end
	end
	return members
end

function Woe.deco(text)
	for _, i in ipairs(Castle.decoraciones) do
		doItemSetAttribute(i, "description", text)
	end
end

function Woe.removePortals()

	for _, i in ipairs(Castle.PrePortalsPos) do

		local tile = Tile(i)
		local thing = tile:getTopTopItem()
		
		if thing == nil then
			return false
		end

		if thing:isCreature() then
			thing:remove()
		elseif thing:isItem() then
			if thing == tile:getGround() then
				player:sendCancelMessage("You may not remove a ground tile.")
				return false
			end
			thing:remove(tonumber(param) or -1)
		end	
	end
end

function Woe.removeEntry()

		local tile = Tile(Castle.desde)
		local thing = tile:getTopTopItem()

		if thing:isCreature() then
			thing:remove()
		elseif thing:isItem() then
			if thing == tile:getGround() then
				player:sendCancelMessage("You may not remove a ground tile.")
				return false
			end
			thing:remove(tonumber(param) or -1)
		end
end

function Woe.removePre()
	for _, i in ipairs(Castle.PreEmpes) do
		local tile = Tile(i)
		local top = tile:getTopCreature()
		
		local creature = Creature(top)
		
		if creature ~= nil then
			if (creature:isMonster() == true) then
				creature:remove()
			end
		end
	end
end

function Woe.checkPre()
	local Count = 0


	for _, i in ipairs(Castle.PreEmpes) do
		--local thing = getThingfromPos(i)
		local tile = Tile(i)
		local top = tile:getTopTopItem()
		
		if top ~= nil then
						
			if (top:isCreature() == false or top == nil or top:isMonster()) then
				Count = Count + 1
			end
		end
	end
	return (Count == 2)
end

function Woe.isTime()
	return (getGlobalStorageValue(stor.WoeTime) == 1)
end

function Woe.isStarted()
	return (getGlobalStorageValue(stor.Started) == 1)
end

function Woe.isRegistered(cid)
	return (getPlayerStorageValue(cid, stor.register) == 1)
end

function Woe.isInCastle(cid)
	--local myPos = getCreaturePosition(cid)
	local myPos = cid:getPosition()
	if (myPos.x >= Castle.salas.a.fromx and myPos.x <= Castle.salas.a.tox) then
		if (myPos.y >= Castle.salas.a.fromy and myPos.y <= Castle.salas.a.toy) then
			if isInArray({Castle.salas.a.z, Castle.salas.b.z, Castle.salas.c.z}, myPos.z) then
				return true
			end
		end
	end
	return false
end

function Woe.expulsar(guild, fromx, tox, fromy, toy, z, outpos)
	for _x = fromx, tox do
		for _y = fromy, toy do
			local tile = Tile({x = _x, y = _y, z = z, stackpos = 253})
			
			if tile ~= nil then 
				local player = Player(tile:getTopCreature())
				
				--local thing = getThingfromPos({x = _x, y = _y, z = z, stackpos = 253})
					if player ~= nil then 
						if (player:isPlayer() == true) then
							if (player:getGuild():getId() ~= guild) then
								player:teleportTo(outpos, true)
							end
						end
					end
			end
		end
	end
end

-- extras

function doSetItemActionId(uid, action)
	doItemSetAttribute(uid, "aid", action)
end

function exhaust(cid, storevalue, exhausttime)
-- Exhaustion function by Alreth, v1.1 2006-06-24 01:31
-- Returns 1 if not exhausted and 0 if exhausted
    newExhaust = os.time()
	local player = Player(cid)
    oldExhaust = player:getStorageValue(storevalue)
    if (oldExhaust == nil or oldExhaust < 0) then
        oldExhaust = 0
    end
    if (exhausttime == nil or exhausttime < 0) then
        exhausttime = 1
    end
    diffTime = os.difftime(newExhaust, oldExhaust)
    if (diffTime >= exhausttime or diffTime < 0) then
		player:setStorageValue(storevalue,newExhaust)
        return 1
    else
        return 0
    end
end

--new
guard_pos = 
	{
		{x = 1332, y = 1149, z = 5},
		{x = 1332, y = 1152, z = 5},
		{x = 1335, y = 1142, z = 5},
		{x = 1341, y = 1142, z = 5},
		{x = 1344, y = 1149, z = 5},
		{x = 1344, y = 1152, z = 5},
		{x = 1338, y = 1153, z = 5}
	}
	
posNasceUm = Position(1646, 975, 9)
	
function Woe.check()
	-- Arrumar logica, precisa inicializar as storages dos guardas.
	--[[
	for storage = 24504, 24511 do
		local pid = Game.getStorageValue(storage)
		local monster = Monster(pid)
		
		if monster:isCreature() then
			return false
		end
	end
	]]--
	return true
end

function Woe.summon()
	local monster = Game.createMonster("Guard", posNasceUm)
	--Game.setStorageValue(24503 + 1, pid)
	--Game.createMonster(index, Bosses.posNasceBoss)
	
	--[[
	for k, i in ipairs(guard_pos) do
		--local pid = doSummonCreature("guard", i)
		local pid = Game.createMonster("Guard", i)
		Game.setStorageValue(24503 + k, pid)
	end
	]]--
end

function Woe.remove()
	for storage = 24504, 24511 do
		local pid = Game.getStorageValue(storage)
		local monster = Monster(pid)
		
		if monster == nil then
			return false
		end
		if monster:isMonster() then
			monster:remove()
		end
	end
end
