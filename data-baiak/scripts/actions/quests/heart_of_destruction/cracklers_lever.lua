local function doCheckArea()
	local upConer = {x = 1145, y = 724, z = 7}       -- upLeftCorner
	local downConer = {x = 1178, y = 756, z = 7}     -- downRightCorner

	for i = upConer.x, downConer.x do
		for j = upConer.y, downConer.y do
        	for k = upConer.z, downConer.z do
				local room = { x = i, y = j, z = k }
				local tile = Tile(room)
				if tile then
					local creatures = tile:getCreatures()
					if creatures and #creatures > 0 then
						for _, creature in pairs(creatures) do
							local player = Player(creature)
							if player then
								return true
							end
						end
					end
				end
			end
		end
	end
	return false
end

local function clearArea()
	local upConer = {x = 1145, y = 724, z = 7}       -- upLeftCorner
	local downConer = {x = 1178, y = 756, z = 7}     -- downRightCorner

	for i = upConer.x, downConer.x do
		for j = upConer.y, downConer.y do
			for k = upConer.z, downConer.z do
				local room = { x = i, y = j, z = k }
				local tile = Tile(room)
				if tile then
					local creatures = tile:getCreatures()
					if creatures and #creatures > 0 then
						for _, creatureUid in pairs(creatures) do
							local creature = Creature(creatureUid)
							if creature then
								if creature:isPlayer() then
									creature:teleportTo({ x = 1208, y = 708, z = 7 })
								elseif creature:isMonster() then
									creature:remove()
								end
							end
						end
					end
				end
			end
		end
	end
	stopEvent(areaCrackler1)
	stopEvent(areaCrackler2)
end

local function createVortex()
	local positions1 = {
		{x = 1150, y = 735, z = 7},
		{x = 1155, y = 741, z = 7},
		{x = 1161, y = 737, z = 7},
		{x = 1163, y = 747, z = 7},
	}

	local positions2 = {
		{x = 1154, y = 747, z = 7},
		{x = 1155, y = 738, z = 7},
		{x = 1161, y = 733, z = 7},
		{x = 1168, y = 745, z = 7},
	}

	local positions3 = {
		{x = 1152, y = 742, z = 7},
		{x = 1161, y = 740, z = 7},
		{x = 1160, y = 748, z = 7},
		{x = 1166, y = 735, z = 7},
	}

	local positions4 = {
		{x = 1156, y = 732, z = 7},
		{x = 1158, y = 738, z = 7},
		{x = 1165, y = 743, z = 7},
		{x = 1172, y = 741, z = 7},
	}
	local tempo = 10
	if vortexPositions == 0 then
		for i = 1, #positions1 do
			local items = Tile(Position(positions1[i])):getGround()
			items:transform(23471)
			addEvent(function()
			items:transform(23051)
			end, tempo * 1000)
		end
		vortexPositions = 1
	elseif vortexPositions == 1 then
		for i = 1, #positions2 do
			local items = Tile(Position(positions2[i])):getGround()
			items:transform(23471)
			addEvent(function()
			items:transform(23051)
			end, tempo * 1000)
		end
		vortexPositions = 2
	elseif vortexPositions == 2 then
		for i = 1, #positions3 do
			local items = Tile(Position(positions3[i])):getGround()
			items:transform(23471)
			addEvent(function()
			items:transform(23051)
			end, tempo * 1000)
		end
		vortexPositions = 3
	elseif vortexPositions == 3 then
		for i = 1, #positions4 do
			local items = Tile(Position(positions4[i])):getGround()
			items:transform(23471)
			addEvent(function()
			items:transform(23051)
			end, tempo * 1000)
		end
		vortexPositions = 0
	end

	cracklerTransform = false
	areaCrackler2 = addEvent(createVortex, tempo * 1000)
end
-- FUNCTIONS END

local heartDestructionCracklers = Action()
function heartDestructionCracklers.onUse(player, item, fromPosition, itemEx, toPosition)
	local config = {
		playerPositions = {
			Position(1209, 701, 7),
			Position(1209, 702, 7),
			Position(1209, 703, 7),
			Position(1209, 704, 7),
			Position(1209, 705, 7)
		},

		newPos = {x = 1172, y = 738, z = 7},
	}

	local pushPos = {x = 1209, y = 701, z = 7}

	if item.actionid == 14326 then
		if item.itemid == 8911 then
			if player:getPosition().x == pushPos.x and player:getPosition().y == pushPos.y and player:getPosition().z == pushPos.z then

				local storePlayers, playerTile = {}
				for i = 1, #config.playerPositions do
					local tile = Tile(Position(config.playerPositions[i]))
					if tile then
						local playerTile = tile:getTopCreature()
						if playerTile and playerTile:isPlayer() then
						storePlayers[#storePlayers + 1] = playerTile
						end
					end
				end

				if #storePlayers < 4 then
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need at least 4 players to this mission.")
					return true
				end

				if doCheckArea() == false then
					clearArea()

					local players

					for i = 1, #storePlayers do
						players = storePlayers[i]
						config.playerPositions[i]:sendMagicEffect(CONST_ME_POFF)
						players:teleportTo(config.newPos)
					end
					Position(config.newPos):sendMagicEffect(11)

					areaCrackler1 = addEvent(clearArea, 15 * 60000)

					Game.createMonster("Crackler", {x = 1153, y = 735, z = 7}, false, true)
					Game.createMonster("Crackler", {x = 1155, y = 740, z = 7}, false, true)
					Game.createMonster("Crackler", {x = 1152, y = 743, z = 7}, false, true)
					Game.createMonster("Crackler", {x = 1154, y = 757, z = 7}, false, true)
					Game.createMonster("Crackler", {x = 1160, y = 748, z = 7}, false, true)
					Game.createMonster("Crackler", {x = 1164, y = 747, z = 7}, false, true)
					Game.createMonster("Crackler", {x = 1161, y = 740, z = 7}, false, true)
					Game.createMonster("Crackler", {x = 1160, y = 736, z = 7}, false, true)
					Game.createMonster("Crackler", {x = 1168, y = 745, z = 7}, false, true)
					Game.createMonster("Crackler", {x = 1166, y = 736, z = 7}, false, true)

					Game.setStorageValue(14323, 0) -- Depolarized Cracklers Count
					vortexPositions = 0
					createVortex()
				else
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Someone is in the area.")
				end
			else
				return true
			end
		end
		item:transform(item.itemid == 8911 and 8912 or 8911)
	end

	return true
end

heartDestructionCracklers:aid(14326)
heartDestructionCracklers:register()
