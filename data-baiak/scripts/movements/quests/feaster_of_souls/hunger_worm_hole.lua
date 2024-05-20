local hungerWormHole = MoveEvent()

function hungerWormHole.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	
	local position = item:getPosition()

	player:teleportTo(Position(position.x,position.y,position.z + 1))

	return true
end

hungerWormHole:type("stepin")
hungerWormHole:aid(21300)
hungerWormHole:register()
