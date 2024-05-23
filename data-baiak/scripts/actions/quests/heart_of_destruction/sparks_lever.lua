local function shuffleTable(t, count, ri, rj)
	ri = ri or 1
	rj = rj or #t
	for x = 1, count or 1 do
		for i = rj, ri + 1, -1 do
			local j = math.random(ri, rj)
			t[i], t[j] = t[j], t[i]
		end
	end
end

local function doCheckArea()
	local upConer = {x = 1097, y = 723, z = 7}       -- upLeftCorner
	local downConer = {x = 1133, y = 749, z = 7}     -- downRightCorner

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
	local upConer = {x = 1097, y = 723, z = 7}       -- upLeftCorner
	local downConer = {x = 1133, y = 749, z = 7}     -- downRightCorner

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
									creature:teleportTo({ x = 1232, y = 728, z = 7 })
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
	stopEvent(areaSparks1)
	stopEvent(areaSparks2)
	stopEvent(areaSparks3)
	stopEvent(areaSparks4)
end

function createSparks()
	local positions = {
		{x = 1103, y = 733, z = 7},
		{x = 1104, y = 736, z = 7},
		{x = 1103, y = 739, z = 7},
		{x = 1107, y = 729, z = 7},
		{x = 1107, y = 734, z = 7},
		{x = 1108, y = 738, z = 7},
		{x = 1109, y = 741, z = 7},
		{x = 1110, y = 731, z = 7},
		{x = 1112, y = 734, z = 7},
		{x = 1112, y = 737, z = 7},
		{x = 1112, y = 742, z = 7},
		{x = 1116, y = 729, z = 7},
		{x = 1116, y = 736, z = 7},
		{x = 1116, y = 744, z = 7},
		{x = 1115, y = 740, z = 7},
		{x = 1120, y = 731, z = 7},
		{x = 1119, y = 742, z = 7},
		{x = 1121, y = 739, z = 7},
		{x = 1123, y = 729, z = 7},
		{x = 1125, y = 732, z = 7},
		{x = 1125, y = 737, z = 7},
		{x = 1124, y = 742, z = 7},
		{x = 1128, y = 729, z = 7},
		{x = 1128, y = 735, z = 7},
		{x = 1128, y = 740, z = 7},
	}

	if unstableSparksCount < 11 then
		shuffleTable(positions, 2, ri, rj)

		for i = 1, 15 do
			Game.createMonster("Unstable Spark", positions[i], false, true)
		end

		areaSparks3 = addEvent(renewSparks, 7000)
	end
end

function renewSparks()
	local upConer = {x = 1097, y = 723, z = 7}       -- upLeftCorner
	local downConer = {x = 1133, y = 749, z = 7}     -- downRightCorner

	for i = upConer.x, downConer.x do
		for j = upConer.y, downConer.y do
			for k = upConer.z, downConer.z do
				local room = { x = i, y = j, z = k }
				local tile = Tile(room)
				if tile then
					local creatures = tile:getCreatures()
					if creatures and #creatures > 0 then
						for _, creature in pairs(creatures) do
							local monster = Monster(creature)
							if monster and monster:getName() == "Unstable Spark" then
								monster:getPosition():sendMagicEffect(3)
								monster:remove()
							end
						end
					end
				end
			end
		end
	end
	areaSparks4 = addEvent(createSparks, 1000)
end

-- FUNCTIONS END
local heartDestructionSparks = Action()
function heartDestructionSparks.onUse(player, item, fromPosition, itemEx, toPosition)
	local config = {
		playerPositions = {
			Position(1234, 724, 7),
			Position(1234, 725, 7),
			Position(1234, 726, 7),
			Position(1234, 727, 7),
			Position(1234, 728, 7),
		},

		newPos = { x = 1122, y = 728, z = 7 },
	}

	local pushPos = {x = 1234, y = 724, z = 7}

	if item.actionid == 14328 then
		if item.itemid == 8911 then
			if player:getPosition().x == pushPos.x and player:getPosition().y == pushPos.y and player:getPosition().z == pushPos.z then
				local storePlayers = {}
				for i = 1, #config.playerPositions do
					local tile = Tile(Position(config.playerPositions[i]))
					if tile then
						local playerTile = tile:getTopCreature()
						if playerTile and playerTile:isPlayer() then
						storePlayers[#storePlayers + 1] = playerTile
						end
					end
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

					areaSparks1 = addEvent(clearArea, 15 * 60000)
					areaSparks2 = addEvent(createSparks, 10000)

					unstableSparksCount = 0
					--Game.createMonster("Crackler", {x = 32200, y = 31322, z = 14}, false, true)
					player:say("The room slowly beginns to crackle. An erruption seems imanent!", TALKTYPE_MONSTER_YELL, isInGhostMode, pid, { x = 1114, y = 735, z = 7 })
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

heartDestructionSparks:aid(14328)
heartDestructionSparks:register()
