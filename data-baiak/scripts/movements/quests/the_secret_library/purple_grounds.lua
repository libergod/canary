local purpleGroundsBosses = MoveEvent()

function purpleGroundsBosses.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	
	player:addHealth(-math.random(950,1230))
	player:getPosition():sendMagicEffect(CONST_ME_HOLYDAMAGE)
	
	return true
end

purpleGroundsBosses:type("stepin")
purpleGroundsBosses:aid(21303)
purpleGroundsBosses:register()
