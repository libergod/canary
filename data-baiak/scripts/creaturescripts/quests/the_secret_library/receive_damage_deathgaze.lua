local receiveDamageDeathGaze = CreatureEvent("receiveDamageDeathGaze")
function receiveDamageDeathGaze.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)

	local name = creature:getName():lower()
	if name == "concentrated death" then
		local spectators = Game.getSpectators(Position(1177, 426, 8), false, false, 15, 15, 15, 15)
		for i = 1, #spectators do
			local spectator = spectators[i]
			if spectator:getName():lower() == "ghulosh' deathgaze" and attacker:getName():lower() == "ghulosh' deathgaze" then
				local creaturedos = Creature(spectator:getId())
				creaturedos:addHealth(-(creaturedos:getMaxHealth() * 0.15), COMBAT_PHYSICALDAMAGE)
			end
		end
	end
	return primaryDamage, primaryType, secondaryDamage, secondaryType
end

receiveDamageDeathGaze:register()