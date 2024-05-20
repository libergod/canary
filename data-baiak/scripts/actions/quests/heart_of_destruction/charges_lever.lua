local team = {}

-- FUNCTIONS

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
	--Room 1
	local upConer = {x = 1098, y = 776, z = 8}       -- upLeftCorner
	local downConer = {x = 1151, y = 825, z = 8}     -- downRightCorner

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

	--Room 2
    local upConer2 = {x = 1106, y = 784, z = 9}       -- upLeftCorner
	local downConer2 = {x = 1143, y = 818, z = 9}     -- downRightCorner

	for f = upConer2.x, downConer2.x do
		for g = upConer2.y, downConer2.y do
			for h = upConer2.z, downConer2.z do
				local room = { x = f, y = g, z = h }
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

	if spawningCharge == true then
		return true
	end

	return false
end

local function clearArea()
	--Room 1
	local upConer = {x = 1098, y = 776, z = 8}       -- upLeftCorner
	local downConer = {x = 1151, y = 825, z = 8}     -- downRightCorner

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
								creature:teleportTo({ x = 1135, y = 771, z = 7 })
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

	--Room 2
    local upConer2 = {x = 1106, y = 784, z = 9}       -- upLeftCorner
	local downConer2 = {x = 1143, y = 818, z = 9}     -- downRightCorner

	for f = upConer2.x, downConer2.x do
		for g = upConer2.y, downConer2.y do
			for h = upConer2.z, downConer2.z do
				local room = { x = f, y = g, z = h }
				local tile = Tile(room)
				if tile then
					local creatures = tile:getCreatures()
					if creatures and #creatures > 0 then
						for _, creatureUid in pairs(creatures) do
							local creature = Creature(creatureUid)
							if creature then
								if creature:isPlayer() then
								creature:teleportTo({ x = 1135, y = 771, z = 7 })
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
	team = {}
	stopEvent(areaHeart1)
	stopEvent(areaHeart2)
	stopEvent(areaHeart3)
end

function teleportToCrackler()
	shuffleTable(team, 2, ri, rj) -- Embaralha a tabela para dar um random teleport

	--Room 1
	local upConer = { x = 1098, y = 776, z = 8 }       -- upLeftCorner
	local downConer = { x = 1151, y = 825, z = 8 }     -- downRightCorner

	for i = upConer.x, downConer.x do
		for j = upConer.y, downConer.y do
        	for k = upConer.z, downConer.z do
				local room = { x = i, y = j, z = k }
				local tile = Tile(room)
				if tile then
					local creatures = tile:getCreatures()
					if creatures and #creatures > 0 then
						for _, c in pairs(creatures) do
							if c == team[1] or c == team[2] then
								c:teleportTo({ x = c:getPosition().x, y = c:getPosition().y, z = c:getPosition().z + 1 })
								c:say("A shift in polarity switches creatures with coresponding polarity into another phase of existence!", TALKTYPE_MONSTER_YELL, isInGhostMode, pid, {x = 1127, y = 798, z = 8})
							end
						end
					end
				end
			end
		end
	end
	areaHeart3 = addEvent(teleportToCharger, 10000)
end

function teleportToCharger()
	--Room 2
    local upConer = { x = 1106, y = 784, z = 9 }       -- upLeftCorner
	local downConer = { x = 1143, y = 818, z = 9 }     -- downRightCorner

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
								player:teleportTo({ x = player:getPosition().x, y = player:getPosition().y, z = player:getPosition().z - 1 })
							end
						end
					end
				end
			end
		end
	end
	areaHeart2 = addEvent(teleportToCrackler, 25000)
end

-- FUNCTIONS END

local heartDestructionCharges = Action()
function heartDestructionCharges.onUse(player, item, fromPosition, itemEx, toPosition)
	local config = {
		playerPositions = {
			Position(1136, 767, 7),
			Position(1137, 767, 7),
			Position(1138, 767, 7),
			Position(1139, 767, 7),
			Position(1140, 767, 7),
		},

		newPos = {x = 1104, y = 806, z = 8},
	}

	local pushPos = {x = 1136, y = 767, z = 7}

	if item.actionid == 14320 then
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
						table.insert(team, players) -- Insert players on table to get a random teleport
						config.playerPositions[i]:sendMagicEffect(CONST_ME_POFF)
						players:teleportTo(config.newPos)
						Position(config.newPos):sendMagicEffect(11)
					end

					areaHeart1 = addEvent(clearArea, 15 * 60000)
					areaHeart2 = addEvent(teleportToCrackler, 25000)

					Game.setStorageValue(14321, 0) -- Overcharge Count

					spawningCharge = false

					Game.createMonster("Charger", { x = 1120, y = 799, z = 8 }, false, true)
					Game.createMonster("Charger", { x = 1122, y = 804, z = 8 }, false, true)
					Game.createMonster("Charger", { x = 1127, y = 805, z = 8 }, false, true)
					Game.createMonster("Charger", { x = 1130, y = 803, z = 8 }, false, true)
					Game.createMonster("Charger", { x = 1132, y = 799, z = 8 }, false, true)
					Game.createMonster("Charger", { x = 1125, y = 800, z = 8 }, false, true)
					Game.createMonster("Charger", { x = 1128, y = 797, z = 8 }, false, true)
					Game.createMonster("Charger", { x = 1131, y = 795, z = 8 }, false, true)
					Game.createMonster("Charger", { x = 1127, y = 793, z = 8 }, false, true)
					Game.createMonster("Charger", { x = 1123, y = 796, z = 8 }, false, true)

					Game.createMonster("Overcharge", { x = 1121, y = 798, z = 9 }, false, true)
					Game.createMonster("Overcharge", { x = 1123, y = 803, z = 9 }, false, true)
					Game.createMonster("Overcharge", { x = 1129, y = 803, z = 9 }, false, true)
					Game.createMonster("Overcharge", { x = 1131, y = 799, z = 9 }, false, true)
					Game.createMonster("Overcharge", { x = 1127, y = 795, z = 9 }, false, true)
				else
					player:sendTextMessage(19, "Someone is in the area.")
				end
			else
				return true
			end
		end
		item:transform(item.itemid == 8911 and 8912 or 8911)
	end

	return true
end

heartDestructionCharges:aid(14320)
heartDestructionCharges:register()
