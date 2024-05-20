local internalNpcName = "[SHOP] - Administrator"
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
	lookType = 128,
	lookHead = 79,
	lookBody = 79,
	lookLegs = 79,
	lookFeet = 79
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
{ itemName = "demon armor", clientId = 3388, buy = 60000, count = 1},{ itemName = "demon shield", clientId = 3420, buy = 15000, count = 1}}
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
