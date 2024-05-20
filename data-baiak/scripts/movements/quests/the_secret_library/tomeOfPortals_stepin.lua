local function doCheckAreaPlayer(upConer, downConer)
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

local function doCheckAreaMonster(upConer, downConer)
	for i=upConer.x, downConer.x do
		for j=upConer.y, downConer.y do
        	for k = upConer.z, downConer.z do
		        local room = {x=i, y=j, z=k}
				local tile = Tile(room)
				if tile then
					local creatures = tile:getCreatures()
					if creatures and #creatures > 0 then
						for _, c in pairs(creatures) do
							if isMonster(c) then
								local monst = Monster(c)
								if monst:getName():lower() == "stolen knowledge of armor" or
									monst:getName():lower() == "stolen knowledge of healing" or
									monst:getName():lower() == "stolen knowledge of lifesteal" or
									monst:getName():lower() == "stolen knowledge of spells" or
									monst:getName():lower() == "stolen knowledge of summoning" then
									return true
								end
							end
						end
					end
				end
			end
		end
	end
	return false
end

local teleports = {
	{teleportPosition = {x = 1108, y = 414, z = 8}, from = Position(1105, 410, 8), to = Position(1112, 417, 8)},
	{teleportPosition = {x = 1118, y = 421, z = 8}, from = Position(1116, 418, 8), to = Position(1123, 425, 8)},
	{teleportPosition = {x = 1114, y = 434, z = 8}, from = Position(1111, 433, 8), to = Position(1118, 438, 8)},
	{teleportPosition = {x = 1102, y = 434, z = 8}, from = Position(1099, 432, 8), to = Position(1106, 438, 8)},
	{teleportPosition = {x = 1098, y = 421, z = 8}, from = Position(1094, 418, 8), to = Position(1100, 424, 8)},
}

local centerRoom = {x = 1108, y = 425, z = 8}


local tomeOfPortalsStepIn = MoveEvent()

function tomeOfPortalsStepIn.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	
	for a = 1, #teleports do
		local retornoPlayer = doCheckAreaPlayer(teleports[a].from, teleports[a].to) -- SE TRUE, tem player SE FALSE entao verificar se existe Monstros
		local retornoMonster = doCheckAreaMonster(teleports[a].from, teleports[a].to) -- SE TRUE, tem monstro entao teleportar
		if not retornoPlayer and retornoMonster then
			player:teleportTo(teleports[a].teleportPosition)
		end
	end
	
	addEvent(function()
				player:teleportTo(centerRoom)
			end, 5 * 1000)	
	
	return true
end

tomeOfPortalsStepIn:type("stepin")
tomeOfPortalsStepIn:aid(21302)
tomeOfPortalsStepIn:register()
