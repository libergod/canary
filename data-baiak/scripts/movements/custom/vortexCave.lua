local pos = Position(940, 1063, 8)

local vortexCave = MoveEvent()

function vortexCave.onStepIn(creature, item, position, fromPosition)
	if not creature:isPlayer() then
		creature:teleportTo(fromPosition, true)
		return false
	end

	creature:teleportTo(pos)
	creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)

	return true
end

vortexCave:type("stepin")
vortexCave:aid(7731)
vortexCave:register()