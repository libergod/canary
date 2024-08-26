function clearDevourer()
	local upConer = { x = 32260, y = 31336, z = 14 } -- upLeftCorner
	local downConer = { x = 32283, y = 31360, z = 14 } -- downRightCorner
	for i = upConer.x, downConer.x do
		for j = upConer.y, downConer.y do
			for k = upConer.z, downConer.z do
				local tile = Tile(i, j, k)
				if tile then
					local creatures = tile:getCreatures()
					if creatures and #creatures > 0 then
						for _, creature in pairs(creatures) do
							if creature:isMonster() then -- éMonstro
								creature:remove()
							end
						end
					end
				end
			end
		end
	end
	stopEvent(areaDevourer4)
	stopEvent(areaDevourer5)
	stopEvent(areaDevourer6)
end

local function setStorageDevourer()
	local upConer = { x = 32260, y = 31336, z = 14 } -- upLeftCorner
	local downConer = { x = 32283, y = 31360, z = 14 } -- downRightCorner

	for i = upConer.x, downConer.x do
		for j = upConer.y, downConer.y do
			for k = upConer.z, downConer.z do
				local tile = Tile(i, j, k)
				if tile then
					local creatures = tile:getCreatures()
					if creatures and #creatures > 0 then
						for _, creature in pairs(creatures) do
							if creature:isPlayer() then -- éPlayer
								creature:setStorageValue(60835, 1)
								creature:setStorageValue(60814, 1)
								creature:setStorageValue(60828, 1)
							end
						end
					end
				end
			end
		end
	end
end

local function setStorage(fromPos, toPos, storage)
	local upConer = fromPos -- upLeftCorner
	local downConer = toPos -- downRightCorner

	for i = upConer.x, downConer.x do
		for j = upConer.y, downConer.y do
			for k = upConer.z, downConer.z do
				local room = { x = i, y = j, z = k }
				local tile = Tile(room)
				if tile then
					local creatures = tile:getCreatures()
					if creatures and #creatures > 0 then
						for _, creature in pairs(creatures) do
							if creature:isPlayer() and creature:getStorageValue(storage) < 1 then
								creature:setStorageValue(storage, 1) -- Access to boss Anomaly
							end
						end
					end
				end
			end
		end
	end
end

local bosses = {
	["anomaly"] = {
		tile = { x = 1203, y = 666, z = 7 }, -- 1203, 666, 7
		actionId = 14325,
		fromPos = { x = 1201, y = 653, z = 7 }, -- 1201, 653, 7
		toPos = { x = 1226, y = 677, z = 7 }, -- 1226, 677, 7
		storage = 14326,
	},
	["rupture"] = {
		tile = { x = 1268, y = 666, z = 7 }, -- 1268, 666, 7
		actionId = 14325,
		fromPos = { x = 1267, y = 656, z = 7 }, -- 1267, 656, 7
		toPos = { x = 1287, y = 677, z = 7 }, -- 1287, 677, 7
		storage = 14327,
	},
	["realityquake"] = {
		tile = { x = 1141, y = 664, z = 7 }, -- 1141, 664, 7
		actionId = 14325,
		fromPos = { x = 1140, y = 653, z = 7 }, -- 1140, 653, 7
		toPos = { x = 1161, y = 675, z = 7 }, -- 1161, 675, 7
		storage = 14328,
	},
	["eradicator"] = {
		tile = { x = 1260, y = 700, z = 7 }, -- 1260, 700, 7
		actionId = 14325,
		fromPos = { x = 1241, y = 689, z = 7 }, -- 1241, 689, 7
		toPos = { x = 1262, y = 711, z = 7 }, -- 1262, 711, 7
		storage = 14330,
	},
	["outburst"] = {
		tile = { x = 1167, y = 701, z = 7 }, -- 1167, 701, 7
		actionId = 14325,
		fromPos = { x = 1166, y = 690, z = 7 }, -- 1166, 690, 7
		toPos = { x = 1187, y = 712, z = 7 }, -- 1187, 712, 7
		storage = 14332,
	},
}

local heartBossDeath = CreatureEvent("HeartBossDeath")

function heartBossDeath.onDeath(creature)
	if not creature or not creature:getMonster() then
		return true
	end

	local monsterName = creature:getName():lower()
	local bossName = bosses[monsterName]
	-- if bossName then
	-- 	local vortex = Tile(bossName.tile):getItemById(23483)
	-- 	if vortex then
	-- 		vortex:transform(23482)
	-- 		vortex:setActionId(bossName.actionId)
	-- 	end
	-- 	setStorage(bossName.fromPos, bossName.toPos, bossName.storage)
	-- elseif monsterName == "world devourer" then
	if monsterName == "world devourer" then
		local vortex = Tile({ x = 1213, y = 773, z = 7 }):getItemById(23483)
		if vortex then
			vortex:transform(23482)
			vortex:setActionId(14354)
		end
		setStorageDevourer()
		clearDevourer()
	end
	return true
end

heartBossDeath:register()
