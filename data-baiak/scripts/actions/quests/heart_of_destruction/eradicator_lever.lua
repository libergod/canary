-- FUNCTIONS
local function doCheckArea()
	local upConer = {x = 1239, y = 688, z = 7}       -- upLeftCorner
	local downConer = {x = 1263, y = 712, z = 7}     -- downRightCorner

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
	local upConer = {x = 1239, y = 688, z = 7}       -- upLeftCorner
	local downConer = {x = 1263, y = 712, z = 7}     -- downRightCorner

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
								c:teleportTo({x = 1141, y = 793, z = 7})
							elseif isMonster(c) then
								c:remove()
							end
						end
					end
				end
			end
		end
	end
	stopEvent(areaEradicator1)
	stopEvent(areaEradicator2)
end
-- FUNCTIONS END

local heartDestructionEradicator = Action()
function heartDestructionEradicator.onUse(player, item, fromPosition, itemEx, toPosition)

	local config = {
		playerPositions = {
			Position(1276, 700, 7),
			Position(1276, 701, 7),
			Position(1276, 702, 7),
			Position(1276, 703, 7),
			Position(1276, 704, 7)
		},

		newPos = {x = 1250, y = 706, z = 7},
	}

	local pushPos = {x = 1276, y = 700, z = 7}

	if item.actionid == 14330 then
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
						players:setStorageValue(14329, os.time() + 20*60*60)
					end
					Position(config.newPos):sendMagicEffect(11)

					eradicatorReleaseT = false -- Liberar Spell
					eradicatorWeak = 0 -- Eradicator Form
					areaEradicator1 = addEvent(clearArea, 15 * 60000)
					areaEradicator2 = addEvent(function() eradicatorReleaseT = true end, 74000)

					Game.createMonster("Spark of Destruction", {x = 1246, y = 698, z = 7}, false, true)
					Game.createMonster("Spark of Destruction", {x = 1247, y = 703, z = 7}, false, true)
					Game.createMonster("Spark of Destruction", {x = 1254, y = 703, z = 7}, false, true)
					Game.createMonster("Spark of Destruction", {x = 1256, y = 698, z = 7}, false, true)
					Game.createMonster("Eradicator", {x = 1251, y = 699, z = 7}, false, true)

					local vortex = Tile({x = 1260, y = 700, z = 7}):getItemById(23482)
					if vortex then
						vortex:transform(23483)
						vortex:setActionId(14348)
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

heartDestructionEradicator:aid(14330)
heartDestructionEradicator:register()