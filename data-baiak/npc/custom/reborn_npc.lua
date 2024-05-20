local internalNpcName = "The Master Reborned"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = { }

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 321
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

local function greetCallback(npc, creature, message)
	local player = Player(creature)
	local playerId = player:getId()
	local levelToReborn = 50
	
	--Spdlog.info("[REBORN NPC] - Level To Reborn: "..levelToReborn.. " Player Level: "..player:getLevel())
	
	if player:getLevel() >= levelToReborn then
		npcHandler:setMessage(MESSAGE_GREET, {
			'Hey ! I can teach you the {reborn} technique !!'
		})
	else
		npcHandler:setMessage(MESSAGE_GREET, 'You are week, cant teach you the reborn technique.')
		npcHandler:setTopic(playerId, 0)
				npcHandler:removeInteraction(npc, creature)
				npcHandler:resetNpc(creature)
	end
	return true
end



local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()
	local levelToReborn = 50

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	if MsgContains(message, "reborn") or MsgContains(message, "rebirth") then
		if player:getLevel() >= levelToReborn then
			npcHandler:say("So you wanna learn the reborn technique {yes} / {no}", npc, creature)
			npcHandler:setTopic(playerId, 1)
		else
			npcHandler:say(
				"Come back when you're stronger!!", npc, creature)
				player:getPosition():sendMagicEffect(CONST_ME_POFF)
				npcHandler:setTopic(playerId, 0)
				npcHandler:removeInteraction(npc, creature)
				npcHandler:resetNpc(creature)
		end
	elseif MsgContains(message, "yes") and npcHandler:getTopic(playerId) == 1 then
			npcHandler:say("Are you sure? Accepting this technique will increase you damage and stats but will reset you current level. {yes} / {no}", npc, creature)
			npcHandler:setTopic(playerId, 2)
			if npcHandler:getTopic(playerId) == 2 and MsgContains(message, "yes") then
				player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
				npcHandler:say(
				"Great! Technique being cast... You are now Reborning in a new way, stronger than before and weaker then later.",
				npc, creature)
				--player:addAchievement("Allow Cookies?")
				player:teleportTo(player:getTown():getTemplePosition())
				player:doRebirth()
				npcHandler:removeInteraction(npc, creature)
				npcHandler:resetNpc(creature)
			elseif npcHandler:getTopic(playerId) == 2 and MsgContains(message, "no") then
			npcHandler:say(
				"Come back here when you decide to Improve!!", npc, creature)
				player:getPosition():sendMagicEffect(CONST_ME_POFF)
				npcHandler:setTopic(playerId, 0)
				npcHandler:removeInteraction(npc, creature)
				npcHandler:resetNpc(creature)
			end
	elseif npcHandler:getTopic(playerId) == 1 and MsgContains(message, "no") then
			npcHandler:say(
				"Come back here when you decide to Improve!!", npc, creature)
				player:getPosition():sendMagicEffect(CONST_ME_POFF)
				npcHandler:setTopic(playerId, 0)
				npcHandler:removeInteraction(npc, creature)
				npcHandler:resetNpc(creature)
	end
	return true
end

npcHandler:setMessage(MESSAGE_FAREWELL, 'Good bye, |PLAYERNAME|.')
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcType:register(npcConfig)
