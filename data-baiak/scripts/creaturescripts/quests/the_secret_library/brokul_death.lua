local brokulDeath = CreatureEvent("brokulDeath")
function brokulDeath.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local targetMonster = creature:getMonster()
	if not targetMonster:isMonster() then
		return true
	end

	if targetMonster:getName():lower() ~= 'brokul' then
		return true
	end
	
	setGlobalStorageValue(35000, 0)
	return true
end

brokulDeath:register()