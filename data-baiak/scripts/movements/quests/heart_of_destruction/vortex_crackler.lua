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

local vortexCrackler = MoveEvent()

function vortexCrackler.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if item.itemid == 23471 then
		if vortexPositions == 1 then
			local storePlayers, playerTile = {}
			for i = 1, #positions1 do
				playerTile = Tile(positions1[i]):getTopCreature()
				if playerTile:isPlayer() then
					storePlayers[#storePlayers + 1] = playerTile
				end
			end
			if #storePlayers == #positions1 then
				cracklerTransform = true
			end
		elseif vortexPositions == 2 then
			local storePlayers, playerTile = {}
			for i = 1, #positions2 do
				playerTile = Tile(positions2[i]):getTopCreature()
				if playerTile:isPlayer() then
					storePlayers[#storePlayers + 1] = playerTile
				end
			end
			if #storePlayers == #positions2 then
				cracklerTransform = true
			end
		elseif vortexPositions == 3 then
			local storePlayers, playerTile = {}
			for i = 1, #positions3 do
				playerTile = Tile(positions3[i]):getTopCreature()
				if playerTile:isPlayer() then
					storePlayers[#storePlayers + 1] = playerTile
				end
			end
			if #storePlayers == #positions3 then
				cracklerTransform = true
			end
		elseif vortexPositions == 0 then
			local storePlayers, playerTile = {}
			for i = 1, #positions4 do
				playerTile = Tile(positions4[i]):getTopCreature()
				if playerTile:isPlayer() then
					storePlayers[#storePlayers + 1] = playerTile
				end
			end
			if #storePlayers == #positions4 then
				cracklerTransform = true
			end
		end
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your presence begins to polarize the area!")
		player:getPosition():sendMagicEffect(48)
	end
	return true
end

vortexCrackler:type("stepin")
vortexCrackler:id(23471)
vortexCrackler:register()

vortexCrackler = MoveEvent()

function vortexCrackler.onStepOut(creature, item, position, fromPosition)
	cracklerTransform = false
	return true
end

vortexCrackler:type("stepout")
vortexCrackler:id(23471)
vortexCrackler:register()
