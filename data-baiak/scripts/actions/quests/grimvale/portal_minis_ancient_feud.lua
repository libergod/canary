local config = {
	[1] = {
		teleportPosition = {x = 1375, y = 341, z = 9},
		bossName = "Yirkas Blue Scales",
		requiredLevel = 250,
		timeToFightAgain = 10, -- In hour
		timeToDefeat = 10, -- In minutes
		destination = Position(1406, 348, 9),
		bossPosition = Position(1406, 354, 9),
		specPos = {
			from = Position(1402, 344, 9),
			to = Position(1417, 364, 9),
		},
		exitPosition = Position(1375, 342, 9),
	},
	[2] = {
		teleportPosition = {x = 1383, y = 354, z = 9},
		bossName = "Srezz Yellow Eyes",
		requiredLevel = 250,
		timeToFightAgain = 10, -- In hour
		timeToDefeat = 10, -- In minutes
		destination = Position(1372, 380, 9),
		bossPosition = Position(1373, 386, 9),
		specPos = {
			from = Position(1367, 377, 9),
			to = Position(1380, 394, 9),
		},
		exitPosition = Position(1382, 354, 9),
	},
	[3] = {
		teleportPosition = {x = 1375, y = 367, z = 9},
		bossName = "Utua Stone Sting",
		requiredLevel = 250,
		timeToFightAgain = 10, -- In hour
		timeToDefeat = 10, -- In minutes
		destination = Position(1339, 342, 9),
		bossPosition = Position(1339, 347, 9),
		specPos = {
			from = Position(1334, 339, 9),
			to = Position(1344, 356, 9),
		},
		exitPosition = Position(1375, 366, 9),
	},
	[4] = {
		teleportPosition = {x = 1366, y = 354, z = 9},
		bossName = "Katex Blood Tongue",
		requiredLevel = 250,
		timeToFightAgain = 10, -- In hour
		timeToDefeat = 10, -- In minutes
		destination = Position(1401, 385, 9),
		bossPosition = Position(1404, 390, 9),
		specPos = {
			from = Position(1396, 381, 9),
			to = Position(1412, 397, 9),
		},
		exitPosition = Position(1367, 354, 9),
	},
	[5] = {
		teleportPosition = {x = 1406, y = 347, z = 9},
		exitPosition = Position(1375, 342, 9),
	},
	[6] = {
		teleportPosition = {x = 1400, y = 385, z = 9},
		exitPosition = Position(1367, 354, 9),
	},
	[7] = {
		teleportPosition = {x = 1371, y = 380, z = 9},
		exitPosition = Position(1382, 354, 9),
	},
	[8] = {
		teleportPosition = {x = 1339, y = 341, z = 9},
		exitPosition = Position(1375, 366, 9),
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
