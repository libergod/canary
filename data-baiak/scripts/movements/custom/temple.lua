local lista = {"Movie"}

local templer = MoveEvent()

function templer.onStepIn(creature, item, position, fromPosition)


local base = position
local positions = {
	--[1] = Position(base.x-1, base.y-1, base.z),
	[1] = Position(base.x, base.y-1, base.z),
	--[3] = Position(base.x+1, base.y-1, base.z),
	[2] = Position(base.x+1, base.y, base.z),
	[3] = Position(base.x+1, base.y+1, base.z),
	[4] = Position(base.x, base.y+1, base.z),
	[5] = Position(base.x-1, base.y+1, base.z),
	[6] = Position(base.x-1, base.y, base.z)
}

	local rand = positions[math.random(#positions)]
	local player = creature:getPlayer()
    if not player then
        return false
    end
	
	if isInArray(lista, player:getName()) then
		return true
	end

    player:teleportTo(rand, true)

	return true
end

templer:type("stepin")
templer:aid(4537)
templer:register()