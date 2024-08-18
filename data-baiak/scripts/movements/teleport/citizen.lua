local config = {
	[9059] = TOWNS_LIST.REAL_CITY,
	[9056] = TOWNS_LIST.JAH_ISLAND,
	[9060] = TOWNS_LIST.KRAVHZI,
	[9057] = TOWNS_LIST.AL_NAHF,
	[9058] = TOWNS_LIST.BKRIANZ,
	[9061] = TOWNS_LIST.ICELAND,
	[9062] = TOWNS_LIST.WOODZBROCK,
	[9063] = TOWNS_LIST.PREMIA_ISLAND,
}

local citizen = MoveEvent()

function citizen.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local townId = config[item.uid]
	if not townId then
		return true
	end

	local town = Town(townId)
	if not town then
		return true
	end

--[[
	if town:getId() == TOWNS_LIST.SVARGROND and player:getStorageValue(Storage.Quest.U8_0.BarbarianTest.Questline) < 8 then
		player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, "You first need to absolve the Barbarian Test Quest to become citizen!")
		player:teleportTo(town:getTemplePosition())
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end
]]--
	player:setTown(town)
	player:teleportTo(town:getTemplePosition())
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are now a citizen of " .. town:getName() .. ".")
	return true
end

citizen:type("stepin")

for index, value in pairs(config) do
	citizen:uid(index)
end

citizen:register()
