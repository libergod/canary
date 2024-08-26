local config = {
	[1] = {
		teleportPosition = { x = 797, y = 453, z = 7 },
		bossName = "Bloodback",
		timeToFightAgain = 10, -- In hour
		timeToDefeat = 10, -- In minutes
		destination = Position(797, 485, 7),
		bossPosition = Position(802, 488, 7),
		specPos = {
			from = Position(789, 480, 7),
			to = Position(809, 494, 7),
		},
		exitPosition = Position(797, 455, 7),
	},
	[2] = {
		teleportPosition = { x = 783, y = 406, z = 7 },
		bossName = "Darkfang",
		timeToFightAgain = 10, -- In hour
		timeToDefeat = 10, -- In minutes
		destination = Position(807, 411, 7),
		bossPosition = Position(813, 412, 7),
		specPos = {
			from = Position(799, 403, 7),
			to = Position(821, 420, 7),
		},
		exitPosition = Position(783, 407, 7),
	},
	[3] = {
		teleportPosition = { x = 757, y = 347, z = 7 },
		bossName = "Shadowpelt",
		timeToFightAgain = 10, -- In hour
		timeToDefeat = 10, -- In minutes
		destination = Position(775, 324, 7),
		bossPosition = Position(763, 325, 7),
		specPos = {
			from = Position(753, 315, 7),
			to = Position(781, 333, 7),
		},
		exitPosition = Position(758, 347, 7),
	},
	[4] = {-- need to fix positions
		teleportPosition = { x = 780, y = 377, z = 7 },
		bossName = "Sharpclaw",
		timeToFightAgain = 10, -- In hour
		timeToDefeat = 10, -- In minutes
		destination = Position(807, 375, 7),
		bossPosition = Position(808, 381, 7),
		specPos = {
			from = Position(797, 372, 7),
			to = Position(816, 386, 7),
		},
		exitPosition = Position(780, 379, 7),
	},
	[5] = {
		teleportPosition = { x = 848, y = 450, z = 7 },
		bossName = "Black Vixen",
		timeToFightAgain = 10, -- In hour
		timeToDefeat = 10, -- In minutes
		destination = Position(853, 437, 7),
		bossPosition = Position(855, 432, 7),
		specPos = {
			from = Position(846, 424, 7),
			to = Position(864, 442, 7),
		},
		exitPosition = Position(848, 451, 7),
	},
	[6] = {
		teleportPosition = {x = 796, y = 484, z = 7},
		exitPosition = Position(797, 454, 7),
	},
	[7] = {
		teleportPosition = {x = 806, y = 410, z = 7},
		exitPosition = Position(783, 407, 7),
	},
	[8] = {
		teleportPosition = {x = 806, y = 374, z = 7},
		exitPosition = Position(778, 379, 7),
	},
	[9] = {
		teleportPosition = {x = 887, y = 407, z = 7},
		exitPosition = Position(847, 406, 7),
	},
	[10] = {
		teleportPosition = {x = 852, y = 439, z = 7},
		exitPosition = Position(848, 451, 7),
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
