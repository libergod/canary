local brotherWormDeath = CreatureEvent("brotherWormDeath")
function brotherWormDeath.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local targetMonster = creature:getMonster()
	if not targetMonster:isMonster() then
		return true
	end

	if targetMonster:getName():lower() ~= 'brother worm' then
		return true
	end
	
	local position = Position(1013,388,8)
	local spectators = Game.getSpectators(position, false, false, 15, 15, 15, 15)
		for i = 1, #spectators do
			local spectator = spectators[i]
			if spectator:getName():lower() == "the unwelcome" then
				local creaturedos = Creature(spectator:getId())
				local health = creaturedos:getMaxHealth()
				creaturedos:addHealth(-health)
				Game.setStorageValue(GlobalStorage.FeasterOfSouls.TheUnWelcome.BrotherBattle, -1)
				return true
			end
		end
		
	Game.setStorageValue(GlobalStorage.FeasterOfSouls.TheUnWelcome.BrotherBattle, -1)
	return true
end

brotherWormDeath:register()