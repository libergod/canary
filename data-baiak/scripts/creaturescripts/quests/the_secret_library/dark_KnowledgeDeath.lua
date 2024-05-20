local darkKnowledgeDeath = CreatureEvent("darkKnowledgeDeath")
function darkKnowledgeDeath.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local targetMonster = creature:getMonster()
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'dark knowledge' then
		return true
	end
	
	local tp = Game.createItem(28488, 1, creature:getPosition())
	if tp then
		tp:setActionId(21305)
	end
	
	return true
end

darkKnowledgeDeath:register()
