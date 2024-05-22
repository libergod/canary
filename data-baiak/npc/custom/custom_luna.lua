local internalNpcName = "Lunna the Fooder"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = { }

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 137,
	lookHead = 0,
	lookBody = 100,
	lookLegs = 100,
	lookFeet = 115,
	lookAddons = 0
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{text = 'Selling all kind of foods, mushrooms and more!!'}
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

keywordHandler:addKeyword({'offers'}, StdModule.say, {npcHandler = npcHandler, text = "I'm selling various type of food! Just check it with {trade}."})

npcHandler:setMessage(MESSAGE_GREET, "Greetings, traveller. Maybe you'd like to take a look at my {offers}...")
npcHandler:setMessage(MESSAGE_FAREWELL, "Goodbye, traveller.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Goodbye, traveller.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Of course, just browse through my wares.")
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {-- SELL VENDER AO NPC
				  -- BUY COMPRAR DO NPC
	--{ itemName = "bamboo stick", clientId = 11445, sell = 30 },
	--{ itemName = "brown mushroom", clientId = 3725, buy = 10 }
	
	{ itemName = "fish", clientId = 3578, buy = 6 },
	{ itemName = "ham", clientId = 3582, buy = 15 },
	{ itemName = "dragon ham", clientId = 3583, buy = 25 },
	{ itemName = "meat", clientId = 3577, buy = 10 },
	{ itemName = "Roll", clientId = 3601, buy = 2 },
	{ itemName = "Cherry", clientId = 3590, buy = 1 },
	{ itemName = "Blueberry", clientId = 3588, buy = 1 },
	{ itemName = "Bread", clientId = 3600, buy = 8 },
	{ itemName = "Cheese", clientId = 3607, buy = 12 },
	{ itemName = "Brown Mushroom", clientId = 3725, buy = 10 }
}
-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType)
end

npcType:register(npcConfig)