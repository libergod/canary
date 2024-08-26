local positions = {
	Position(1206, 661, 7),
	Position(1212, 656, 7),
	Position(1208, 665, 7),
	Position(1213, 664, 7),
	Position(1217, 661, 7),
	Position(1206, 669, 7),
	Position(1211, 669, 7),
	Position(1218, 666, 7),
	Position(1211, 674, 7),
	Position(1217, 671, 7),
	Position(1222, 669, 7),
}

local function createVortex()
	local tile = Tile(positions[math.random(#positions)])
	if tile then
		local ground = tile:getGround()
		if ground then
			ground:transform(22894)
			addEvent(function(positionInAddEvent)
				local tile = Tile(positionInAddEvent)
				if tile then
					local ground = tile:getGround()
					if ground then
						ground:transform(23049)
					end
				end
			end, 10 * 1000, tile:getPosition()) -- 10 seconds
		end
	end
end

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	createVortex()
end

spell:name("charge vortex")
spell:words("###451")
spell:blockWalls(true)
spell:needLearn(true)
spell:register()
