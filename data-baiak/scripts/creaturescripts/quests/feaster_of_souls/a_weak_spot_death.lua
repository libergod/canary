local weakSpotDeath = CreatureEvent("weakSpotDeathPale")
function weakSpotDeath.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local targetMonster = creature:getMonster()
	if not targetMonster:isMonster() then
		return true
	end

	if targetMonster:getName():lower() ~= 'a weak spot' then
		return true
	end
	
	local spectators = Game.getSpectators(Position(targetMonster:getPosition().x, targetMonster:getPosition().y, targetMonster:getPosition().z - 1), false, false, 15, 15, 15, 15)
		for i = 1, #spectators do
			local spectator = spectators[i]
			if spectator:getName():lower() == "the pale worm" then
				local creaturedos = Creature(spectator:getId())
				local health = creaturedos:getMaxHealth()
				creaturedos:addHealth(-health)
				return true
			end
		end
	return true
end

weakSpotDeath:register()