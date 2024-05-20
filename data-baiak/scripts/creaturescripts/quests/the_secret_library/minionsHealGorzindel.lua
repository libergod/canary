local minionHealGorzindel = CreatureEvent("minionHealGorzindel")
function minionHealGorzindel.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local targetMonster = creature:getMonster()
	if not targetMonster then
		return false
	end

	local targetName = targetMonster:getName():lower()
	if targetName ~= 'mean minion' and targetName ~= 'malicious minion' then
		return false
	end

	local pos = creature:getPosition()
	
	local spectators = Game.getSpectators(pos, false, false, 2, 2, 2, 2)
	for i = 1, #spectators do
		local spectator = spectators[i]
		if spectator:getName():lower() == "gorzindel" then
			local creaturedos = Creature(spectator:getId())
			creaturedos:addHealth(creaturedos:getMaxHealth() * 0.05)
			creaturedos:say("THE STOLEN POWERS HEAL GORZINDEL!", TALKTYPE_ORANGE_1)
			return true
		end
	end
	
	return true
end
minionHealGorzindel:register()