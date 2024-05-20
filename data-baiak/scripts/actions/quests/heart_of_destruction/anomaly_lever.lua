-- FUNCTIONS
local function doCheckArea()
	local upConer = {x = 1200, y = 653, z = 7}       -- upLeftCorner
	local downConer = {x = 1226, y = 678, z = 7}     -- downRightCorner

	for i=upConer.x, downConer.x do
		for j=upConer.y, downConer.y do
        	for k = upConer.z, downConer.z do
		        local room = {x=i, y=j, z=k}
				local tile = Tile(room)
				if tile then
					local creatures = tile:getCreatures()
					if creatures and #creatures > 0 then
						for _, c in pairs(creatures) do
							if isPlayer(c) then
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
	local upConer = {x = 1200, y = 653, z = 7}       -- upLeftCorner
	local downConer = {x = 1226, y = 678, z = 7}     -- downRightCorner

	for i=upConer.x, downConer.x do
		for j=upConer.y, downConer.y do
        	for k= upConer.z, downConer.z do
		        local room = {x=i, y=j, z=k}
				local tile = Tile(room)
				if tile then
					local creatures = tile:getCreatures()
					if creatures and #creatures > 0 then
						for _, c in pairs(creatures) do
							if isPlayer(c) then
								c:teleportTo({x = 1149, y = 769, z = 7})
							elseif isMonster(c) then
								c:remove()
							end
						end
					end
				end
			end
		end
	end
end
-- FUNCTIONS END

local heartDestructionAnomaly = Action()
function heartDestructionAnomaly.onUse(player, item, fromPosition, itemEx, toPosition)

	local config = {
		playerPositions = {
			Position(1187, 661, 7),
			Position(1187, 662, 7),
			Position(1187, 663, 7),
			Position(1187, 664, 7),
			Position(1187, 665, 7)
		},

		newPos = {x = 1213, y = 673, z = 7},
	}

	local pushPos = {x = 1187, y = 661, z = 7}

	if item.actionid == 14325 then
		if item.itemid == 8911 then
			if player:getPosition().x == pushPos.x and player:getPosition().y == pushPos.y and player:getPosition().z == pushPos.z then

				local storePlayers, playerTile = {}
				for i = 1, #config.playerPositions do
					playerTile = Tile(config.playerPositions[i]):getTopCreature()
					if isPlayer(playerTile) then
						storePlayers[#storePlayers + 1] = playerTile
					end
				end

				if doCheckArea() == false then
					clearArea()

					local players

					for i = 1, #storePlayers do
						players = storePlayers[i]
						config.playerPositions[i]:sendMagicEffect(CONST_ME_POFF)
						players:teleportTo(config.newPos)
						players:setStorageValue(14321, os.time() + 20*60*60)
					end
					Position(config.newPos):sendMagicEffect(11)

					areaAnomaly1 = addEvent(clearArea, 15 * 60000)

					Game.setStorageValue(14322, 0) -- Anomaly Stages

					Game.createMonster("Spark of Destruction", {x = 1209, y = 665, z = 7}, false, true)
					Game.createMonster("Spark of Destruction", {x = 1209, y = 669, z = 7}, false, true)
					Game.createMonster("Spark of Destruction", {x = 1216, y = 671, z = 7}, false, true)
					Game.createMonster("Spark of Destruction", {x = 1216, y = 665, z = 7}, false, true)
					Game.createMonster("Anomaly", {x = 1213, y = 665, z = 7}, false, true)

					local vortex = Tile({x = 1203, y = 666, z = 7}):getItemById(23482)
					if vortex then
						vortex:transform(23483)
						vortex:setActionId(14324)
					end
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

heartDestructionAnomaly:aid(14325)
heartDestructionAnomaly:register()