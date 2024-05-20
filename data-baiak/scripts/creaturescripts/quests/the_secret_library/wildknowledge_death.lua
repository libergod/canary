local function removeVortex(position)
	local id = 7804
	local teleportItem = Tile(position):getItemById(id)
	if not teleportItem then
		return
	end

	position:sendMagicEffect(CONST_ME_POFF)
	teleportItem:remove()
	teleportItem:setActionId()
	
end

local wildKnowledgeDeath = CreatureEvent("wildKnowledgeDeath")
function wildKnowledgeDeath.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local targetMonster = creature:getMonster()
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'wild knowledge' then
		return true
	end

	
	blood = Tile(targetMonster:getPosition()):getItemById(2886)
	if blood then
		blood:remove()
	end
	
	local tp = Game.createItem(7804, 1, creature:getPosition())
	if tp then
		tp:setActionId(21304)
	end

	addEvent(removeVortex, 16 * 1000, tp:getPosition())
	
	return true
end

wildKnowledgeDeath:register()
