-- FUNCTIONS
local function doCheckArea()
	local upConer = {x = 1266, y = 655, z = 7}       -- upLeftCorner
	local downConer = {x = 1289, y = 679, z = 7}     -- downRightCorner

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
	local upConer = {x = 1266, y = 655, z = 7}       -- upLeftCorner
	local downConer = {x = 1289, y = 679, z = 7}     -- downRightCorner

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
								c:teleportTo({x = 1218, y = 709, z = 7})
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

local heartDestructionRupture = Action()
function heartDestructionRupture.onUse(player, item, fromPosition, itemEx, toPosition)

	local config = {
		playerPositions = {
			Position(1251, 664, 7),
			Position(1251, 665, 7),
			Position(1251, 666, 7),
			Position(1251, 667, 7),
			Position(1251, 668, 7)
		},

		newPos = {x = 1277, y = 673, z = 7},
	}

	local pushPos = {x = 1251, y = 664, z = 7}

	if item.actionid == 14327 then
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
						players:setStorageValue(14323, os.time() + 20*60*60)
					end
					Position(config.newPos):sendMagicEffect(11)

					areaRupture1 = addEvent(clearArea, 15 * 60000)

					ruptureResonanceStage = 0
					resonanceActive = false

					Game.createMonster("Spark of Destruction", {x = 1272, y = 666, z = 7}, false, true)
					Game.createMonster("Spark of Destruction", {x = 1273, y = 670, z = 7}, false, true)
					Game.createMonster("Spark of Destruction", {x = 1280, y = 670, z = 7}, false, true)
					Game.createMonster("Spark of Destruction", {x = 1280, y = 666, z = 7}, false, true)
					Game.createMonster("Rupture", {x = 1274, y = 666, z = 7}, false, true)

					local vortex = Tile({x = 1268, y = 666, z = 7}):getItemById(23482)
					if vortex then
						vortex:transform(23483)
						vortex:setActionId(14343)
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

heartDestructionRupture:aid(14327)
heartDestructionRupture:register()