local onDeathWarServant = CreatureEvent("onDeathWarServant")
function onDeathWarServant.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local targetMonster = creature:getMonster()
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'war servant' then
		return true
	end

	addEvent(function()
			Game.createMonster("War Servant", creature:getPosition(), false, true)
		end, 1)
		
	return true
end

onDeathWarServant:register()