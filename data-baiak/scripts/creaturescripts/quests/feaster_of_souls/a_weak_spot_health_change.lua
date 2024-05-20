local aWeakeSpotHealth = CreatureEvent("ChangeHealthPaleWorm")
function aWeakeSpotHealth.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)

	local name = creature:getName():lower()
	if name == "a weak spot" then
		local spectators = Game.getSpectators(Position(creature:getPosition().x, creature:getPosition().y, creature:getPosition().z - 1), false, false, 15, 15, 15, 15)
		for i = 1, #spectators do
			local spectator = spectators[i]
			if spectator:getName():lower() == "the pale worm" then
				local creaturedos = Creature(spectator:getId())
				doTargetCombatHealth(attacker:getId(), creaturedos, COMBAT_LIFEDRAIN, -primaryDamage, -secondaryDamage, CONST_ME_POFF, ORIGIN_NONE)
				return primaryDamage, primaryType, secondaryDamage, secondaryType
			end
		end
	end
	return primaryDamage, primaryType, secondaryDamage, secondaryType
end

aWeakeSpotHealth:register()