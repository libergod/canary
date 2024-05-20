local moveEbbRight1 = MoveEvent()
function moveEbbRight1.onStepIn(creature, item, position, fromPosition)

	local player = creature:getPlayer()
    if not player then
        return true
    end
	
	player:teleportTo(Position(position.x + 3, position.y, position.z), true)
	--player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    --player:getPosition():sendMagicEffect(32)
	return true
end

moveEbbRight1:type("stepin")
moveEbbRight1:aid(7207)
moveEbbRight1:register()

local moveEbbLeft1 = MoveEvent()
function moveEbbLeft1.onStepIn(creature, item, position, fromPosition)

	local player = creature:getPlayer()
    if not player then
        return true
    end
	
	player:teleportTo(Position(position.x - 3, position.y, position.z), true)
	--player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    --player:getPosition():sendMagicEffect(32)
	return true
end

moveEbbLeft1:type("stepin")
moveEbbLeft1:aid(7202)
moveEbbLeft1:register()

local moveEbbUp1 = MoveEvent()
function moveEbbUp1.onStepIn(creature, item, position, fromPosition)

	local player = creature:getPlayer()
    if not player then
        return true
    end
	
	player:teleportTo(Position(position.x, position.y - 3, position.z), true)
	--player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    --player:getPosition():sendMagicEffect(32)
	return true
end

moveEbbUp1:type("stepin")
moveEbbUp1:aid(7204)
moveEbbUp1:register()

local moveEbbDown1 = MoveEvent()
function moveEbbDown1.onStepIn(creature, item, position, fromPosition)

	local player = creature:getPlayer()
    if not player then
        return true
    end
	
	player:teleportTo(Position(position.x, position.y + 3, position.z), true)
	--player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    --player:getPosition():sendMagicEffect(32)
	return true
end

moveEbbDown1:type("stepin")
moveEbbDown1:aid(7205)
moveEbbDown1:register()
