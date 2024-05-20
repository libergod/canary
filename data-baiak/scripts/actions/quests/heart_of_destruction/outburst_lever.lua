-- FUNCTIONS
local function doCheckArea()
	local upConer = {x = 1165, y = 689, z = 7}       -- upLeftCorner
	local downConer = {x = 1188, y = 713, z = 7}     -- downRightCorner

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
	local upConer = {x = 1165, y = 689, z = 7}       -- upLeftCorner
	local downConer = {x = 1188, y = 713, z = 7}     -- downRightCorner

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
								c:teleportTo({x = 1131, y = 791, z = 7})
							elseif isMonster(c) then
								c:remove()
							end
						end
					end
				end
			end
		end
	end
	stopEvent(areaOutburst1)
end
-- FUNCTIONS END

local heartDestructionOutburst = Action()
function heartDestructionOutburst.onUse(player, item, fromPosition, itemEx, toPosition)

	local config = {
		playerPositions = {
			Position(1149, 700, 7),
			Position(1149, 701, 7),
			Position(1149, 702, 7),
			Position(1149, 703, 7),
			Position(1149, 704, 7)
		},

		newPos = {x = 1176, y = 708, z = 7},
	}

	local pushPos = {x = 1149, y = 700, z = 7}

	if item.actionid == 14331 then
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
						if players:getStorageValue(14331) >= os.time() then
							return players:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need wait to fight again")
						end
						config.playerPositions[i]:sendMagicEffect(CONST_ME_POFF)
						players:teleportTo(config.newPos)
						players:setStorageValue(14331, os.time() + 20*60*60)
					end
					Position(config.newPos):sendMagicEffect(11)

					areaOutburst1 = addEvent(clearArea, 15 * 60000)

					Game.createMonster("Spark of Destruction", {x = 1171, y = 698, z = 7}, false, true)
					Game.createMonster("Spark of Destruction", {x = 1172, y = 703, z = 7}, false, true)
					Game.createMonster("Spark of Destruction", {x = 1179, y = 703, z = 7}, false, true)
					Game.createMonster("Spark of Destruction", {x = 1180, y = 698, z = 7}, false, true)
					Game.createMonster("Outburst", {x = 1176, y = 700, z = 7}, false, true)

					outburstStage = 0
					outburstHealth = 290000

					local vortex = Tile({x = 1167, y = 701, z = 7}):getItemById(23482)
					if vortex then
						vortex:transform(23483)
						vortex:setActionId(14350)
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

heartDestructionOutburst:aid(14331)
heartDestructionOutburst:register()