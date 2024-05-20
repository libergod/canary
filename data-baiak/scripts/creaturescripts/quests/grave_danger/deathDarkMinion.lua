local deathDarkMinion = CreatureEvent("deathDarkMinion")
function deathDarkMinion.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local targetMonster = creature:getMonster()
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() == 'dark sorcerer' then
		local tp = Game.createItem(31206, 1, creature:getPosition())
		if tp then
			tp:setActionId(21308)
		end
		return true
		
	elseif targetMonster:getName():lower() == 'dark druid' then
		local tp = Game.createItem(31205, 1, creature:getPosition())
		if tp then
			tp:setActionId(21308)
		end
		return true
		
	elseif targetMonster:getName():lower() == 'dark paladin' then
		local tp = Game.createItem(31204, 1, creature:getPosition())
		if tp then
			tp:setActionId(21308)
		end
		return true
		
	elseif targetMonster:getName():lower() == 'dark knight' then
		local tp = Game.createItem(31203, 1, creature:getPosition())
		if tp then
			tp:setActionId(21308)
		end
		return true
	end


	
	return true
end

deathDarkMinion:register()
