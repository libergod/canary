local internalNpcName = "[SHOP] - Teste Ms"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = { }

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 9999999
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 0

npcConfig.outfit = {
	lookType = 128,
	lookHead = 94,
	lookBody = 94,
	lookLegs = 94,
	lookFeet = 94
}
npcConfig.flags = {
	floorchange = false
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
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
}
-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	--npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)

	
	local PlayerN = getCreatureName(npc.uid):sub(8, #getCreatureName(npc.uid))
	
	Spdlog.info("[PRIVATE SHOP] - PlayerN value: "..PlayerN)
	local shop = getPlayerShopItens(getPlayerGUID(PlayerN))
	local It = shop[itemId]

	if (tabletama(shop) < 1) then
		return false
	end

	local qntit = tonumber(It[1])

	if (amount <= qntit) then
		if (player:removeMoneyBank(It[2] * amount) or player:removeMoney(It[2] * amount)) then

			player:addItem(itemId, amount)

			for a = 1, amount do
				doShopAddLucro(getPlayerGUID(PlayerN), itemId, It[2])
			end

			doRemoveItemFromPlayerShop(getPlayerGUID(PlayerN), itemId, amount)

			--FECHAR A JANELA DO NPC?
			
			--selfSay("Thank's there are your item.", player)
			npcHandler:say("Thank's there are your item.", npc, player)

			if (tabletama(getPlayerShopItens(getPlayerGUID(PlayerN))) < 1) then
				local pos = getThingPos(npc.uid)
				addEvent(function()
					local npc = pos.getTopCreature()
					doSendMagicEffect(pos, CONST_ME_POFF)
					npc:remove()
					--deleteNPCFile(PlayerN)
				end, 1500)
				return npcHandler:say("Oh! I don't have items to sell! Bye bye!", npc, player)
			end
			player:setStorageValue(74123, 20)
		else
			--selfSay("You haven't enought money! To buy this item you must have ".. It[2] * amount.." gold coins.", cid)
			npcHandler:say("You haven't enought money! To buy this item you must have ".. It[2] * amount.." gold coins.", npc, player)
		end
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

npcType:register(npcConfig)


