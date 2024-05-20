local function transformTeleport(position)
	local id = 385
	local teleportItem = Tile(position):getItemById(id)
	if not teleportItem then
		return
	end

	position:sendMagicEffect(CONST_ME_POFF)
	teleportItem:transform(351)
	teleportItem:setActionId()
	Game.setStorageValue(GlobalStorage.FeasterOfSouls.ThePaleWorm.Battle, 0)

end

local hungerWormKill = CreatureEvent("hungerWormDeath")
function hungerWormKill.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local targetMonster = creature:getMonster()
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'hunger worm' then
		return true
	end
	
	blood = Tile(targetMonster:getPosition()):getItemById(2886)
	if blood then
		blood:remove()
	end
	
	local tp = Game.createItem(385, 1, creature:getPosition())
	if tp then
		tp:setActionId(21300)
	end

	addEvent(transformTeleport, 10 * 1000, tp:getPosition())
	
	addEvent(function()
			Game.createMonster("Greed Worm", {x = 1105, y = 344, z = 8}, false, true)
			Game.createMonster("Greed Worm", {x = 1111, y = 348, z = 8}, false, true)
		end, 10 * 1000)
	return true
end

hungerWormKill:register()
