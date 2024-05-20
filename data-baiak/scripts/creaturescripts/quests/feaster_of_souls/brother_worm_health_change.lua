local changeHealthBrotherWorm = CreatureEvent("ChangeHealthBrotherWorm")
function changeHealthBrotherWorm.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)

	local position = Position(1013,388,8)
	local name = creature:getName():lower()
	if name == "brother worm" then
		local spectators = Game.getSpectators(position, false, false, 15, 15, 15, 15)
		for i = 1, #spectators do
			local spectator = spectators[i]
			if spectator:getName():lower() == "the unwelcome" then
				local creaturedos = Creature(spectator:getId())
				--creaturedos:addHealth(-hpdeft)
				doTargetCombatHealth(attacker:getId(), creaturedos, COMBAT_LIFEDRAIN, -primaryDamage, -secondaryDamage, CONST_ME_POFF, ORIGIN_NONE)
				return primaryDamage, primaryType, secondaryDamage, secondaryType
			end
		end
	end
	return primaryDamage, primaryType, secondaryDamage, secondaryType
end

changeHealthBrotherWorm:register()



local brotherWormOutIn = CreatureEvent("brotherWormOutIn")
function brotherWormOutIn.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
	local storage = Game.getStorageValue(GlobalStorage.FeasterOfSouls.TheUnWelcome.BrotherBattle)
	if creature:getHealth() <= 280000 and storage <= 0 then
		creature:teleportTo(Position({x = 1013, y = 388, z = 9}))		
		addEvent(function()
			local boss = Tile(Position({x = 1013, y = 388, z = 9})):getTopCreature()
			if boss and boss:isMonster() then
				boss:teleportTo(Position({x = 1011, y = 386, z = 8}))
				Game.setStorageValue(GlobalStorage.FeasterOfSouls.TheUnWelcome.BrotherBattle, 1)
			end
		end, 10 * 1000)
		
	elseif creature:getHealth() <= 230000 and storage == 1 then
		creature:teleportTo(Position({x = 1013, y = 388, z = 9}))		
		addEvent(function()
			local boss = Tile(Position({x = 1013, y = 388, z = 9})):getTopCreature()
			if boss and boss:isMonster() then
				boss:teleportTo(Position({x = 1011, y = 386, z = 8}))
				Game.setStorageValue(GlobalStorage.FeasterOfSouls.TheUnWelcome.BrotherBattle, 2)
			end
		end, 10 * 1000)
		
	elseif creature:getHealth() <= 160000 and storage == 2 then
		creature:teleportTo(Position({x = 1013, y = 388, z = 9}))		
		addEvent(function()
			local boss = Tile(Position({x = 1013, y = 388, z = 9})):getTopCreature()
			if boss and boss:isMonster() then
				boss:teleportTo(Position({x = 1011, y = 386, z = 8}))
				Game.setStorageValue(GlobalStorage.FeasterOfSouls.TheUnWelcome.BrotherBattle, 3)
			end
		end, 10 * 1000)
	
	elseif creature:getHealth() <= 110000 and storage == 3 then
		creature:teleportTo(Position({x = 1013, y = 388, z = 9}))		
		addEvent(function()
			local boss = Tile(Position({x = 1013, y = 388, z = 9})):getTopCreature()
			if boss and boss:isMonster() then
				boss:teleportTo(Position({x = 1011, y = 386, z = 8}))
				Game.setStorageValue(GlobalStorage.FeasterOfSouls.TheUnWelcome.BrotherBattle, 4)
			end
		end, 10 * 1000)
		
	elseif creature:getHealth() <= 60000 and storage == 4 then
		creature:teleportTo(Position({x = 1013, y = 388, z = 9}))		
		addEvent(function()
			local boss = Tile(Position({x = 1013, y = 388, z = 9})):getTopCreature()
			if boss and boss:isMonster() then
				boss:teleportTo(Position({x = 1011, y = 386, z = 8}))
				Game.setStorageValue(GlobalStorage.FeasterOfSouls.TheUnWelcome.BrotherBattle, 5)
			end
		end, 10 * 1000)	
		
	elseif creature:getHealth() <= 40000 and storage == 5 then
		creature:teleportTo(Position({x = 1013, y = 388, z = 9}))		
		addEvent(function()
			local boss = Tile(Position({x = 1013, y = 388, z = 9})):getTopCreature()
			if boss and boss:isMonster() then
				boss:teleportTo(Position({x = 1011, y = 386, z = 8}))
				Game.setStorageValue(GlobalStorage.FeasterOfSouls.TheUnWelcome.BrotherBattle, 6)
			end
		end, 10 * 1000)	
	
	elseif creature:getHealth() <= 20000 and storage == 6 then
		creature:teleportTo(Position({x = 1013, y = 388, z = 9}))		
		addEvent(function()
			local boss = Tile(Position({x = 1013, y = 388, z = 9})):getTopCreature()
			if boss and boss:isMonster() then
				boss:teleportTo(Position({x = 1011, y = 386, z = 8}))
				Game.setStorageValue(GlobalStorage.FeasterOfSouls.TheUnWelcome.BrotherBattle, 7)
			end
		end, 10 * 1000)	
	
	elseif creature:getHealth() <= 10000 and storage == 7 then
		creature:teleportTo(Position({x = 1013, y = 388, z = 9}))		
		addEvent(function()
			local boss = Tile(Position({x = 1013, y = 388, z = 9})):getTopCreature()
			if boss and boss:isMonster() then
				boss:teleportTo(Position({x = 1011, y = 386, z = 8}))
				Game.setStorageValue(GlobalStorage.FeasterOfSouls.TheUnWelcome.BrotherBattle, 8)
			end
		end, 10 * 1000)	
	end
	return primaryDamage, primaryType, secondaryDamage, secondaryType
end
brotherWormOutIn:register()