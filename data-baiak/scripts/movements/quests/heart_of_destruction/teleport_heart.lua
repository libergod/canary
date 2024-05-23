local vortex = {
	[14321] = Position(1118, 802, 8), -- Charger TP 1
	[14322] = Position(1135, 771, 7), -- Charger Exit
	[14324] = Position(1148, 769, 7), -- Anomaly Exit
	[14325] = Position(1139, 798, 7), -- Main Room
	[14340] = Position(1048, 914, 5), -- Main Room Exit
	[14341] = Position(1208, 708, 7), -- Cracklers Exit
	[14343] = Position(1218, 709, 7), -- Rupture Exit
	[14345] = Position(1237, 739, 7), -- Realityquake Exit
	[14347] = Position(1232, 728, 7), -- Unstable Sparks Exit
	[14348] = Position(1141, 793, 7), -- Eradicator Exit (Main Room)
	[14350] = Position(1131, 790, 7), -- Outburst Exit (Main Room)
	[14352] = Position(1137, 794, 7), -- World Devourer Exit (Main Room)
	[14354] = Position(1106, 768, 7), -- World Devourer (Reward Room)
}

local accessVortex = {
	-- Anomaly enter
	[14323] = {
		position = Position(1188, 668, 7),
		storage = 14320,
		boss = "Anomaly",
	},
	-- Rupture enter
	[14342] = {
		position = Position(1247, 665, 7),
		storage = 14322,
		boss = "Rupture",
	},
	-- Realityquake enter
	[14344] = {
		position = Position(1123, 656, 7),
		storage = 14324,
		boss = "Realityquake",
	},
}

local finalBosses = {
	-- Eradicator enter
	[14346] = {
		position = Position(1278, 708, 7),
		storage1 = 14326,
		storage2 = 14327,
		storage3 = 14328,
		boss = "Eradicator",
	},
	-- Outburst enter
	[14349] = {
		position = Position(1146, 706, 7),
		storage1 = 14326,
		storage2 = 14327,
		storage3 = 14328,
		boss = "Outburst",
	},
}

local teleportHeart = MoveEvent()

function teleportHeart.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local normalVortex = vortex[item.actionid]
	local bossVortex = accessVortex[item.actionid]
	local uBosses = finalBosses[item.actionid]
	if normalVortex then
		player:teleportTo(normalVortex)
	elseif bossVortex then
		if player:getStorageValue(bossVortex.storage) >= 1 then
			if player:canFightBoss(bossVortex.boss) then
				player:teleportTo(bossVortex.position)
			else
				player:teleportTo(fromPosition)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It's too early for you to endure this challenge again.")
			end
		else
			player:teleportTo(fromPosition)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have access to this portal.")
		end
	elseif uBosses then
		if player:getStorageValue(uBosses.storage1) >= 1 and player:getStorageValue(uBosses.storage2) >= 1 and player:getStorageValue(uBosses.storage3) >= 1 then
			if player:canFightBoss(uBosses.boss) then
				player:teleportTo(uBosses.position)
			else
				player:teleportTo(fromPosition)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It's too early for you to endure this challenge again.")
			end
		else
			player:teleportTo(fromPosition)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have access to this portal.")
		end
	elseif item.actionid == 14351 then
		if player:getStorageValue(14330) >= 1 and player:getStorageValue(14332) >= 1 then
			if player:canFightBoss("World Devourer") then
				player:teleportTo(Position(1204, 809, 7))
			else
				player:teleportTo(fromPosition)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It's too early for you to endure this challenge again.")
			end
		else
			player:teleportTo(fromPosition)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have access to this portal.")
		end
	elseif item.actionid == 14353 then -- Remove storages from mini bosses
		player:teleportTo(Position(1137, 794, 7))
		player:setStorageValue(14334, -1)
		player:setStorageValue(14335, -1)
		player:setStorageValue(14336, -1)
		player:unregisterEvent("DevourerStorage")
	end
	return true
end

teleportHeart:type("stepin")

for index, value in pairs(vortex) do
	teleportHeart:aid(index)
end

teleportHeart:register()
