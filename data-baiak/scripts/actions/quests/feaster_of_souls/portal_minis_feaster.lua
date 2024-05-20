local config = {
	[1] = {
		teleportPosition = {x = 1331, y = 177, z = 8},
		bossName = "Irgix the Flimsy",
		requiredLevel = 250,
		timeToFightAgain = 20, -- In hour
		timeToDefeat = 10, -- In minutes
		destination = Position(1307, 177, 8),
		bossPosition = Position(1307, 182, 8),
		specPos = {
			from = Position(1298, 171, 8),
			to = Position(1317, 189, 8)
		},
		exitPosition = Position(1330, 176, 8),
		storage = Storage.Quest.U12_30.FeasterOfSouls.IrgixTimer
	},
	[2] = {
		teleportPosition = {x = 1406, y = 254, z = 8},
		bossName = "Unaz the Mean",
		requiredLevel = 250,
		timeToFightAgain = 20, -- In hour
		timeToDefeatBoss = 10, -- In minutes
		destination = Position(1404, 271, 8),
		bossPosition = Position(1415, 272, 8),
		specPos = {
			from = Position(1398, 266, 8),
			to = Position(1424, 280, 8)
		},
		exitPosition = Position(1405, 256, 8),
		storage = Storage.Quest.U12_30.FeasterOfSouls.UnazTimer
	},
	[3] = {
		teleportPosition = {x = 1345, y = 224, z = 9},
		bossName = "Vok The Freakish",
		requiredLevel = 250,
		timeToFightAgain = 20, -- In hour
		timeToDefeat = 10, -- In minutes
		destination = Position(1343, 259, 9),
		bossPosition = Position(1344, 265, 9),
		specPos = {
			from = Position(1336, 256, 9),
			to = Position(1352, 272, 9),
		},
		exitPosition = Position(1345, 226, 9),
	},
	[4] = {
		teleportPosition = {x = 1307, y = 175, z = 8},
		exitPosition = Position(1330, 176, 8),
		},
	[5] = {
		teleportPosition = {x = 1402, y = 271, z = 8},
		exitPosition = Position(1405, 256, 8),
		},
	[6] = {
		teleportPosition = {x = 1341, y = 259, z = 9},
		exitPosition = Position(1345, 226, 9),
		},
}

local teleportBoss = MoveEvent()
function teleportBoss.onStepIn(creature, item, position, fromPosition)
	if not creature or not creature:isPlayer() then
		return false
	end
	for index, value in pairs(config) do
		if Tile(position) == Tile(value.teleportPosition) then
			if not value.specPos then
				creature:teleportTo(value.exitPosition)
				creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				return true
			end
			local spec = Spectators()
			spec:setOnlyPlayer(false)
			spec:setRemoveDestination(value.exitPosition)
			spec:setCheckPosition(value.specPos)
			spec:check()
			if spec:getPlayers() > 0 then
				creature:teleportTo(fromPosition, true)
				creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				creature:say("There's someone fighting with " .. value.bossName .. ".", TALKTYPE_MONSTER_SAY)
				return true
			end
			if creature:getLevel() < value.requiredLevel then
				creature:teleportTo(fromPosition, true)
				creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "All the players need to be level " .. value.requiredLevel .. " or higher.")
				return true
			end
			if not creature:canFightBoss(value.bossName) then
				creature:teleportTo(fromPosition, true)
				creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have to wait " .. value.timeToFightAgain .. " hours to face " .. value.bossName .. " again!")
				return true
			end
			spec:removeMonsters()
			local monster = Game.createMonster(value.bossName, value.bossPosition, true, true)
			if not monster then
				return true
			end
			creature:teleportTo(value.destination)
			creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			creature:setBossCooldown(value.bossName, os.time() + value.timeToFightAgain * 3600)
			creature:sendBosstiaryCooldownTimer()
			addEvent(function()
				spec:clearCreaturesCache()
				spec:setOnlyPlayer(true)
				spec:check()
				spec:removePlayers()
			end, value.timeToDefeat * 60 * 1000)
		end
	end
end

for index, value in pairs(config) do
	teleportBoss:position(value.teleportPosition)
end

teleportBoss:type("stepin")
teleportBoss:register()
