-- ########################################################
-- #####        Name: Private Shop System             #####
-- #####        Version: 2.0                          #####
-- ########################################################
-- #####  Developed by Maxwell Alcantara[MaXwEllDeN]  #####
-- #####  Contact: maxwellmda@gmail.com               #####
-- #####           maxwellden@hotmail.com             #####
-- ########################################################


function tabletama(tb)
	local tam = 0
	for i, v in pairs(tb) do
		tam = tam + 1
	end
	return tam
end

function fileExist(file)
	return (io.open(file, "r")) and true or false
end

function getUidsInArea(ext1, ext2)
	local uids = { }
	for a = 0, ext2.x-ext1.x do
		for b = 0, ext2.y-ext1.y do
			for c = 1, 255 do
				local pos = {x = ext1.x+a, y = ext1.y+b, z = ext1.z, stackpos = c}

				local cid = getTopCreature(pos).uid
				if (isCreature(cid)) then
					table.insert(uids, cid)
				end
			end
		end
   end

   return uids
end

function checkSidesNpcs(fromPos,toPos, name)
	local uids = { }
	for Px = fromPos.x, toPos.x do
			for Py = fromPos.y, toPos.y do
				local monster = getThingfromPos({x=Px, y=Py, z=8, stackpos=253})
				if isMonster(monster.uid) then					--and monster:getName() == name 
					table.insert(uids, cid)
					Spdlog.error("[PRIVATE SHOP] - Inserted CID: " ..cid)
				end
			end
	end
	--Spdlog.error("[PRIVATE SHOP] - checkSidesNPcs")
return uids

end

function printTableM(aff)
	local s = "{"
    for a, b in pairs(aff) do
        local index = "[".. a .. "]"

		if (type(a) == "string") then
           index = '["'.. a ..'"]'
        end

        if (type(b) == "table") then
           value = printTableM(b)
        elseif (type(b) == "string") then
           value = '"'.. b .. '"'
        else
           value = b
        end

        s = s .. index .. " = " .. value .. ", "
    end

    s = "{" .. s:sub(2, #s)
    return (#s < 3) and "{ }" or (s:sub(1, #s-2) .. "}")
end


function removeNpcPlayer(name,pos)
	local target = Npc("[SHOP] - "..name)
	
	local concatName = ("[SHOP] - "..name) 
	local tile = Tile(pos)
	local tile2 = Tile(Position(pos.x - 1, pos.y,pos.z)) -- OK
	local tile3 = Tile(Position(pos.x - 1, pos.y - 1 ,pos.z)) -- OK
	local tile4 = Tile(Position(pos.x, pos.y - 1,pos.z)) -- OK
	local tile5 = Tile(Position(pos.x + 1, pos.y - 1 ,pos.z)) -- OK
	local tile6 = Tile(Position(pos.x + 1, pos.y,pos.z)) -- OK
	local tile7 = Tile(Position(pos.x + 1, pos.y + 1,pos.z)) -- OK
	local tile8 = Tile(Position(pos.x - 1, pos.y + 1,pos.z)) -- OK
	local tile9 = Tile(Position(pos.x, pos.y + 1,pos.z)) -- OK
	
	
	if not tile then
		Spdlog.error("[PRIVATE SHOP] - Tile not found.")
		return false
	end

	local thing = tile:getBottomCreature()
	local thing2 = tile2:getTopCreature()
	local thing3 = tile3:getTopCreature()
	local thing4 = tile4:getTopCreature()
	local thing5 = tile5:getTopCreature()
	local thing6 = tile6:getTopCreature()
	local thing7 = tile7:getTopCreature()
	local thing8 = tile8:getTopCreature()
	local thing9 = tile9:getTopCreature()
	--tile:getBottomCreature--getBottomVisibleCreature()--getTopVisibleThing
	if not thing then
		Spdlog.error("[PRIVATE SHOP] - NPC Not found to remove.")
		return false
	end
	--[[
	if thing ~= nil then
		if thing:isCreature() and thing:getName() == ("[SHOP] - "..name) and (not thing:isPlayer()) then
			thing:remove()
			Spdlog.info("[PRIVATE SHOP] - Removed in POS: 1")
			return true	
		end
	else]]--
	if thing2 ~= nil then
		if thing2:isCreature() and thing2:getName() == ("[SHOP] - "..name) and (not thing2:isPlayer()) then
			thing2:remove()
			--Spdlog.info("[PRIVATE SHOP] - Removed in POS: 2")
			return true
		end
	elseif thing3 ~= nil then
		if thing3:isCreature() and thing3:getName() == ("[SHOP] - "..name) and (not thing3:isPlayer()) then
			thing3:remove()
			--Spdlog.info("[PRIVATE SHOP] - Removed in POS: 3")
			return true
		end
	elseif thing4 ~= nil then
		if thing4:isCreature() and thing4:getName() == ("[SHOP] - "..name) and (not thing4:isPlayer()) then
			thing4:remove()
			--Spdlog.info("[PRIVATE SHOP] - Removed in POS: 4")
			return true
		end
	elseif thing5 ~= nil then
		if thing5:isCreature() and thing5:getName() == ("[SHOP] - "..name) and (not thing5:isPlayer()) then
			thing5:remove()
			--Spdlog.info("[PRIVATE SHOP] - Removed in POS: 5")
			return true
		end
	elseif thing6 ~= nil then
		if thing6:isCreature() and thing6:getName() == ("[SHOP] - "..name) and (not thing6:isPlayer()) then
			thing6:remove()
			--Spdlog.info("[PRIVATE SHOP] - Removed in POS: 6")
			return true
		end
	elseif thing7 ~= nil then
		if thing7:isCreature() and thing7:getName() == ("[SHOP] - "..name) and (not thing7:isPlayer()) then
			thing7:remove()
			--Spdlog.info("[PRIVATE SHOP] - Removed in POS: 7")
			return true
		end
	elseif thing8 ~= nil then
		if thing8:isCreature() and thing8:getName() == ("[SHOP] - "..name) and (not thing8:isPlayer()) then
			thing8:remove()
			--Spdlog.info("[PRIVATE SHOP] - Removed in POS: 8")
			return true
		end
	elseif thing9 ~= nil then
		if thing9:isCreature() and thing9:getName() == ("[SHOP] - "..name) and (not thing9:isPlayer()) then
			thing9:remove()
			--Spdlog.info("[PRIVATE SHOP] - Removed in POS: 9")
			return true
		end
	else
		--Spdlog.error("[PRIVATE SHOP] - NPC Not found to remove or Name incorrect." .."[SHOP] - "..name)
		--Quando cair o servidor, entrará aqui qnd o user não logar antes de cair o server.
		return false
	end
	
	--[[
	local check = checkSidesNpcs(Position(pos.x - 1, pos.y - 1, pos.z),Position(pos.x + 1, pos.y + 1, pos.z), concatName)
	if #check then
		
		for _, b in pairs(check) do
		local monster = Monster(b)
			Spdlog.info("[PRIVATE SHOP] - Monster name: "..monster:getName())
			monster:remove()
			return true
		end
	end

	if thing:isCreature() and thing:getName() == ("[SHOP] - "..name) and (not thing:isPlayer()) then
		thing:remove()
		return true	
	else
		Spdlog.error("[PRIVATE SHOP] - NPC Not found to remove or Name incorrect." .."[SHOP] - "..name .. " Thing Name: " ..thing:getName().. " Target: "..target:getName())
		return false
	end
]]--
end

--[[
function removeNpcPlayer(name,pos)
	local target = Npc("[SHOP] - "..name)
		if not target then
			--return Spdlog.error("[PRIVATE SHOP] - NPC of user not found.")
			return true
		end
		if target then
			Spdlog.info("NPC " .. name .. " removed.")
			target:getPosition():sendMagicEffect(CONST_ME_POFF)
			target:remove()
			return true
		end
	--return true
end
]]--


function deleteNPCuser(name,pos)
	return removeNpcPlayer(name,pos)
	--return os.remove ("data-baiak/npc/private_shop/ZSHOP - ".. name ..".lua")
end

function deleteNPCFile(name,pos)
	removeNpcPlayer(name,pos)
	return os.remove ("data-baiak/npc/private_shop/ZSHOP - ".. name ..".lua")
end


function createNPCFile(name, looktype, playerguid)
   if (fileExist("data-baiak/npc/private_shop/ZSHOP - ".. name .. ".lua")) then
      local fili = io.open("data-baiak/npc/private_shop/ZSHOP - ".. name .. ".lua", "w+")
      fili:close()
   end
   
   if not fileExist("data-baiak/npc/private_shop/ZSHOP - ".. name .. ".lua") then
		local fili = io.open("data-baiak/npc/private_shop/ZSHOP - ".. name .. ".lua", "w+")
		fili:close()
   end
   
   
   local fili = io.open("data-baiak/npc/private_shop/ZSHOP - ".. name .. ".lua", "a+")
	--Game.reload(RELOAD_TYPE_NPCS)
   local nam = _PV_SHOP_CONFIG.prefix_shop and "[SHOP] - " or ""
   local example = [[
local internalNpcName = "%s"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = { }
local talkState = { }

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 9999999
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 0

npcConfig.outfit = {
	lookType = %d,
	lookHead = %d,
	lookBody = %d,
	lookLegs = %d,
	lookFeet = %d
}
npcConfig.flags = {
	floorchange = false
}

local focus = nil
local talk_start = 0
local talkState = { }

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	Game.setStorageValue(npc:getName():sub(10, #npc:getName()), -1)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {
]]
local example2 = doReadActualSellings(playerguid)


--[[
	{ itemName = "basket", clientId = 2855, buy = 6 },
	{ itemName = "bottle", clientId = 2875, buy = 3 },
	{ itemName = "bucket", clientId = 2873, buy = 4 },
	{ itemName = "candelabrum", clientId = 2912, buy = 8 },
	{ itemName = "candlestick", clientId = 2917, buy = 2 },
	{ itemName = "closed trap", clientId = 3481, buy = 280, sell = 75 },
	{ itemName = "crowbar", clientId = 3304, buy = 260, sell = 50 },
	{ itemName = "document", clientId = 2818, buy = 12 },
	{ itemName = "fishing rod", clientId = 3483, buy = 40, sell = 40 },
	{ itemName = "grey backpack", clientId = 2870, buy = 10 },
	{ itemName = "grey bag", clientId = 2862, buy = 4 },
	{ itemName = "hand auger", clientId = 31334, buy = 25 },
	{ itemName = "machete", clientId = 3308, buy = 6, sell = 6 },
	{ itemName = "net", clientId = 31489, buy = 50 },
	{ itemName = "parchment", clientId = 2817, buy = 8 },
	{ itemName = "pick", clientId = 3456, buy = 50, sell = 15 },
	{ itemName = "present", clientId = 2856, buy = 10 },
	{ itemName = "rope", clientId = 3003, buy = 50, sell = 15 },
	{ itemName = "scroll", clientId = 2815, buy = 5 },
	{ itemName = "scythe", clientId = 3453, buy = 50, sell = 10 },
	{ itemName = "shovel", clientId = 3457, buy = 10, sell = 8 },
	{ itemName = "torch", clientId = 2920, buy = 2 },
	{ itemName = "vial", clientId = 2874, sell = 5 },
	{ itemName = "vial of oil", clientId = 2874, buy = 20, count = 7 },
	{ itemName = "watch", clientId = 2906, buy = 20, sell = 6 },
	{ itemName = "waterskin of water", clientId = 2901, buy = 40, count = 1 },
	{ itemName = "wooden hammer", clientId = 3459, sell = 15 },
	{ itemName = "worm", clientId = 3492, buy = 1 }
]]--

local example3 =
[[
}
-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	--npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
	local PlayerN = npc:getName():sub(10, #npc:getName())
	Spdlog.info("[PRIVATE SHOP] - PlayerN value: "..PlayerN)
	
	local guidNpc = getPlayerGUIDByName(PlayerN)
	local shop = getPlayerShopItens(guidNpc) 
	local It = shop[itemId]

	if (tabletama(shop) < 1) then
		return false
	end

	local qntit = tonumber(It[1])

	if (amount <= qntit) then
		if (player:removeMoneyBank(It[2] * amount) or player:removeMoney(It[2] * amount)) then

			player:addItem(itemId, amount)
			
			for a = 1, amount do
				doShopAddLucro(guidNpc, itemId, It[2])
			end

			doRemoveItemFromPlayerShop(guidNpc, itemId, amount)

			--FECHAR A JANELA DO NPC?
			
			--selfSay("Thank's there are your item.", player)
			npcHandler:say("Thank's there are your item.", npc, player)

			if (tabletama(getPlayerShopItens(guidNpc)) < 1) then
				--local pos = npc:getPosition()
				local tile = Tile(npc:getPosition())
				local thing = tile:getTopCreature()
				addEvent(function()
					local npc = tile:getTopCreature()
					doSendMagicEffect(npc:getPosition(), CONST_ME_POFF)
					thing:remove()
					--deleteNPCFile(npc.uid)
				end, 1500)
				return npcHandler:say("Oh! I don't have items to sell! Bye bye!", npc, player)
			end
			player:setStorageValue(74123, 20)
		else
			--selfSay("You haven't enought money! To buy this item you must have ".. It[2] * amount.." gold coins.", cid)
			npcHandler:say("You haven't enought money! To buy this item you must have ".. It[2] * amount.." gold coins.", npc, player)
		end
		--Game.reload(RELOAD_TYPE_NPCS)
	else
		npcHandler:say("I just have ".. qntit .. " " .. getItemNameById(itemId) .. getPrefix(amount) .. ".", npc, player)
		--selfSay("I just have ".. qntit .. " " .. getItemNameById(item) .. getPrefix(amount) .. ".",cid)
	end
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType)
end

-- Function called by the callback "npcHandler:setCallback(CALLBACK_GREET, greetCallback)" in end of file
local function greetCallback(npc, creature)
	local playerId = creature:getId()
	
	if Game.getStorageValue(npc:getName():sub(10, #npc:getName())) ~= 1 then
		npcHandler:setFocus(playerId)
		Game.setStorageValue(npc:getName():sub(10, #npc:getName()), 1)
		npcHandler:setMessage(MESSAGE_GREET, "Hi |PLAYERNAME|, I sell items check it with {trade}.")
		Spdlog.error("[PRIVATE SHOP] - FOCUS 2: "..npcHandler:getFocus().. " creatureId: "..playerId.. " Storage: "..Game.getStorageValue(npc:getName():sub(10, #npc:getName())))
	else
		npcHandler:say({
				"Im busy, wait your turn."
			}, npc, creature, 3000)
	end
	return true
end

local function farewellCallBack(npc, player)
Game.setStorageValue(npc:getName():sub(10, #npc:getName()), -1)
return true
end


-- Set to local function "greetCallback"
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_FAREWELL, farewellCallBack)
-- Bye message
npcHandler:setMessage(MESSAGE_FAREWELL, "Yeah, good bye and don't come again!")
-- Walkaway message
npcHandler:setMessage(MESSAGE_WALKAWAY, "You not have education?")

npcType:register(npcConfig)
]]

   --local mount = looktype.lookMount and "mount = \"".. looktype.lookMount .. "\"" or ""
   fili:write(example:format(nam .. name, looktype.lookType, looktype.lookHead, looktype.lookBody, looktype.lookLegs, looktype.lookFeet))
   fili:write(example2)
   fili:write(example3)   
   fili:close()
end

function createNPCShop(name, outfit, playerguid, pos, dir)
   createNPCFile(name, outfit, playerguid)

	addEvent(function() 
	
	local group = getPlayerAccessToCreate(playerguid)
	
	if group > 1 then
		local newPosition = Position(pos.x -1,pos.y,pos.z)
		local mons = doCreateNpc("[SHOP] - ".. name, newPosition)
	else
		local mons = doCreateNpc("[SHOP] - ".. name, pos)
	end
	setPlayerShopLucro(playerguid, "{ }")
	
	end, 1)

	--doCreatureSetLookDir(mons, dir)
	--mons:setStorageValue(277531, "{x = ".. pos.x ..", y = ".. pos.y ..", z = ".. pos.z .."}")
end

function getValueFromString(str)
   return loadstring("return ".. str)()
end

_MAXSHOP_STOSHOP = 52337

function doRemoveItemFromPlayerShop(playerguid, itemid, quant)

   local shop = getPlayerShopItens(playerguid)
   local newshop = { }
   for a, b in pairs(shop) do
      if (a == itemid) then
         if (b[1]-quant > 0) then
            newshop[a] = {b[1]-quant, b[2]}
         end
      else
         newshop[a] = {b[1], b[2]}
      end
   end
   return (setPlayerShopItens(playerguid, printTableM(newshop))) and true or false
end



function doReadActualSellings(playerguid)

   local shop = getPlayerShopItens(playerguid)
   local newshop = { }
   local sellingString = { }
   local lastText = { }
   dd = 0
   
   for a, b in pairs(shop) do
		if dd == 0 then
			if dd == #shop then
				sellingString = "{ itemName = \""..getItemName(a).."\", clientId = "..a..", buy = "..b[2]..", count = "..b[1].."},"
			--Spdlog.info("[PRIVATE SHOP] - LIST: "..sellingString)
			else
			sellingString = "{ itemName = \""..getItemName(a).."\", clientId = "..a..", buy = "..b[2]..", count = "..b[1].."}"
			end
		 else
			if dd == #shop then
				sellingString = sellingString .."{ itemName = \""..getItemName(a).."\", clientId = "..a..", buy = "..b[2]..", count = "..b[1].."},"
			else
				sellingString = sellingString .."{ itemName = \""..getItemName(a).."\", clientId = "..a..", buy = "..b[2]..", count = "..b[1].."}"
			end
			--Spdlog.info("[PRIVATE SHOP] - LIST: "..sellingString)
		 end
		 
		 
		 
		 
		 dd = dd+1
   end

   Spdlog.info("[PRIVATE SHOP] - Final TABLE: "..sellingString)
      
   return sellingString
end

--FUNCIONA PORÉM NÃO MONTA A STRING NO FINAL
--[[
function doReadActualSellings(playerguid)

   local shop = getPlayerShopItens(playerguid)
   local newshop = { }
   local sellingString = { }
   local lastText = { }
   dd = 0
   
   for a, b in pairs(shop) do
		 sellingString[a] = "{ itemName = \""..getItemName(a).."\", clientId = "..a..", buy = "..b[2]..", count = "..b[1].."},"
		 Spdlog.info("[PRIVATE SHOP] - LIST: "..sellingString[a])
   end

   Spdlog.info("[PRIVATE SHOP] - Table with Concat: "..table.concat(sellingString,"\n"))
      
   return table.concat(sellingString,",")  
end
]]--

function doAddItemForPlayerShop(playerguid, itemid, quant, money)

   local shop = getPlayerShopItens(playerguid)
   local newshop = { }
   dd = 0
   
   --EXAMPLE
   --[[
   '{
	[3388] =  // ITEM ID
	{
		[1] = "1", //QNTIDADE
		[2] = "60000" //PREÇO
	}, 
	[3420] =  //ITEM ID
	{
		[1] = "1", //QNTIDADE
		[2] = "15000" //PREÇO
	}
	}'
]]--
   for a, b in pairs(shop) do
      dd = 1
      if (a == itemid) then -- se [a] Item ID, entao soma a quantidade e seja o valor
         newshop[a] = {b[1]+quant, money}
      else
         newshop[a] = {b[1], b[2]} -- se nao, seta a quantidade e o valor
      end
   end
   if not(newshop[itemid]) then
      newshop[itemid] = {quant, money}
   elseif (dd == 0) then
      newshop[itemid] = {quant, money}
   end
   
   return (setPlayerShopItens(playerguid, printTableM(newshop))) and true or false
end

function installSHOPSystem()
   if not(INSTALLED) then

      if not (db.query("ALTER TABLE `players` ADD COLUMN `shopitens` VARCHAR( 255 )  NOT NULL DEFAULT '''{ }''';")) then
	 error("###@!#!@$#!#@ FALHA CRÍTICA AO INSTALAR O PRIVATE SHOP SYSTEM!\n     Não foi possível criar a coluna: players.shopitens")
      end
      print("              Instalação Shop System: Coluna players.shopitens criada com sucesso")      
      
      if not(db.query("ALTER TABLE `players` ADD COLUMN `shoplucro` VARCHAR( 255 )  NOT NULL DEFAULT '''{ }''';")) then
	 error("###@!#!@$#!#@ FALHA CRÍTICA AO INSTALAR O PRIVATE SHOP SYSTEM!\n     Não foi possível criar a coluna: players.shoplucro")
      end
         print("              Instalação Shop System: Coluna players.shoplucro criada com sucesso.")      
   end
end

function getPlayerShopItens(playerguid)
    local get = db.storeQuery("SELECT `shopitens` FROM `players` WHERE `id` = '".. playerguid.."';")
	--if not get then
     --   return 0
    --end
	local value = result.getString(get, "shopitens")
    result.free(get)
	
    --local resultado = get:getDataString('shopitens')
   return (value) and loadstring("return " .. (value:sub(2, #value-1)))() or nil
end

function getPlayerAccessToCreate(playerguid)
    local get = db.storeQuery("SELECT `group_id` FROM `players` WHERE `id` = '".. playerguid.."';")
	
	local value = result.getNumber(get, "group_id")
    result.free(get)

    return value
end

function getPlayerShopLucro(playerguid)
    local get = db.storeQuery("SELECT `shoplucro` FROM `players` WHERE `id` = '".. playerguid.."';")
	
	local value = result.getString(get, "shoplucro")
    result.free(get)

   return (value) and loadstring("return " .. (value:sub(2, #value-1)))() or nil
end

function getPrefix(val)
   if (type("val") ~= number) then
	return ""
   end
   return (val > 1) and "s" or ""
end

function valid(f, val)
	return function(...)
		if val then
			return f(...)
		end
	end
end

function doShopAddLucro(playerguid, itemid, money)
   local shop = getPlayerShopLucro(playerguid)
   local newshop = { }
   c = 0
   for a, b in pairs(shop) do
      c = 1
      if (a == itemid) then
         newshop[a] = {b[1]+1, b[2]+money}
      else
         newshop[a] = {b[1], b[2]}
      end
   end
   if not(newshop[itemid]) then
      newshop[itemid] = {1, money}
   elseif (c == 0) then
      newshop[itemid] = {1, money}
   end
   return (setPlayerShopLucro(playerguid, printTableM(newshop))) and true or false
end

function setPlayerShopItens(playerguid, shop)
   return (db.query("UPDATE `players` SET `shopitens` = '''".. shop .."''' WHERE `id` = '".. playerguid .."';")) and true or false
end

function setPlayerShopLucro(playerguid, shop)
   return (db.query("UPDATE `players` SET `shoplucro` = '''".. shop .."''' WHERE `id` = '".. playerguid .."';")) and true or false
end

local file = io.open("PrivateShopInstall.lua", "r")
	local t = loadstring("return ".. file:read("*all"))() file:close()

if not(t) then
	installSHOPSystem()
	local file = io.open("PrivateShopInstall.lua", "w+") file:write("true") file:close()
end
