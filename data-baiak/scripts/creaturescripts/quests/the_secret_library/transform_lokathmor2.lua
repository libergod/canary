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
								if monst:getName():lower() == "force field" then
									monst:remove()
									--return true
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


local transformLokathmorDois = CreatureEvent("transformLokathmor2")
function transformLokathmorDois.onThink(creature)
	
	if not creature or not creature:isMonster() then
		return false
	end

	local storagevalue = Game.getStorageValue(GlobalStorage.TheSecretLibrary.LokathmorFight)
	
	if storagevalue == -1 then

		--Spdlog.warn("[TEST Lokathmor2] - entered if -1. Storage: " .. storagevalue)
		creature:remove()
		doCheckAreaMonster(Position(1169,392,8),Position(1175,398,8))
		local creatureBack = Game.createMonster("Lokathmor", Position(1172, 395, 8), false, true)
		creatureBack:setHealth(Game.getStorageValue(GlobalStorage.TheSecretLibrary.LokathmorHealth), COMBAT_PHYSICALDAMAGE)
		creatureBack:say("THE DISCHARGE OF THE BOOK BREAKS LOKATHOMORS STANCE!", TALKTYPE_MONSTER_YELL)
		return true
	else
		--Spdlog.warn("[TEST Lokathmor2] - not entered if -1. Storage: " .. storagevalue)
		return false
	end
	
end
transformLokathmorDois:register()