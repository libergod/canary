local boats = {
	{pos = {x = 1234, y = 1157, z = 7}, destination = Position(1036, 912, 5)},
	{pos = {x = 1263, y = 1117, z = 7}, destination = Position(1267, 1109, 7)},
	{pos = {x = 1267, y = 1110, z = 7}, destination = Position(1264, 1118, 7)}
}

local boat = Action()

function boat.onUse(player, item, fromPosition, itemEx, toPosition)
	for b = 1, #boats do
		if item:getPosition() == Position(boats[b].pos) then
			if boats[b].unlockShortcut then
				if player:getStorageValue(boats[b].unlockShortcut) < 1 then
					player:setStorageValue(boats[b].unlockShortcut, 1)
				end
			end
			if boats[b].access then
				if player:getStorageValue(boats[b].access) == 1 then
					player:teleportTo(boats[b].destination)
					player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
					return true
				end
			else
				player:teleportTo(boats[b].destination)
				player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
				return true
			end
		end
	end
end

for a = 1, #boats do
	boat:position(boats[a].pos)
end
boat:register()
