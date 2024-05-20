dofile("./_woe.lua")

local config = woe_config


local fromPosition = MoveEvent()
function fromPosition.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()

    if not player then
        return false
    end


	if Game.getStorageValue(SNOWBALL.storages.started) == 1 or
	Game.getStorageValue(SAFEZONE.started) == 1 or
	Game.getStorageValue(FSE.storages.started) == 1 or
	Game.getStorageValue(stor.Started) == 1
	then
		return true
	else
		player:teleportTo(fromPosition, true)
	end

	return true
end

fromPosition:type("stepin")
fromPosition:aid(8294)
fromPosition:register()
