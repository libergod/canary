local config = {
	{position = {x = 1324, y = 214, z = 8}, destination = {x = 1319, y = 226, z = 9}},
	{position = {x = 1317, y = 226, z = 9}, destination = {x = 1326, y = 214, z = 8}},
	{position = {x = 1394, y = 241, z = 9}, destination = {x = 1409, y = 241, z = 9}},
	{position = {x = 1406, y = 241, z = 9}, destination = {x = 1391, y = 241, z = 9}},
	{position = {x = 1375, y = 214, z = 9}, destination = {x = 1386, y = 213, z = 9}},
	{position = {x = 1385, y = 214, z = 9}, destination = {x = 1373, y = 214, z = 9}},
	{position = {x = 1367, y = 184, z = 9}, destination = {x = 1377, y = 186, z = 9}},
	{position = {x = 1376, y = 185, z = 9}, destination = {x = 1364, y = 184, z = 9}},
	{position = {x = 1375, y = 223, z = 8}, destination = {x = 1386, y = 223, z = 8}},
	{position = {x = 1384, y = 223, z = 8}, destination = {x = 1373, y = 223, z = 8}},
}

local slab = MoveEvent()
function slab.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end
	for value in pairs(config) do
		if Position(config[value].position) == player:getPosition() then
			player:teleportTo(Position(config[value].destination))
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			return true
		end
	end
end

slab:type("stepin")
for value in pairs(config) do
	slab:position(config[value].position)
end
slab:register()
