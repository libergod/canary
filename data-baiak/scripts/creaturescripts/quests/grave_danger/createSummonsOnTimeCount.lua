local manageLifeCountVlarkorth = CreatureEvent("manageLifeCountVlarkorth")
function manageLifeCountVlarkorth.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)

	local storage = Game.getStorageValue(GlobalStorage.GraveDanger.CountVlarkorthHealth)
	
	if creature:getHealth() <= 280000 and storage == -1 then -- Entrou aqui primeira vez, nao leva dano até mecanica ser feita. Dps transforma Storage em -2
		return 0, primaryType, 0, secondaryType
	elseif creature:getHealth() <= 180000 and storage == -2 then -- Entrou aqui segunda vez, nao leva dano até mecanica ser feita. Dps transforma Storage em 1
		return 0, primaryType, 0, secondaryType
	elseif storage == -3 then
		return 0, primaryType, 0, secondaryType
	end
	
	return primaryDamage, primaryType, secondaryDamage, secondaryType
end
manageLifeCountVlarkorth:register()

--1) criar think para ler a sala e pegar as vocations a fim de sumonar bixos;

local manageSummonCountVlarkorth = CreatureEvent("manageSummonCountVlarkorth")
function manageSummonCountVlarkorth.onThink(creature)

	local monster = creature:getMonster()
	if not monster then
		return true
	end

	if monster:getName():lower() ~= 'count vlarkorth' then
		return true
	end
	
	local storage = Game.getStorageValue(GlobalStorage.GraveDanger.CountVlarkorthHealth)
	local healthBoss = creature:getHealth()
	
	if storage == -1 and healthBoss <= 280000 then
	
	Game.setStorageValue(GlobalStorage.GraveDanger.CountVlarkorthHealth, -3)
	
	local position = Position(706,447,7)
	local spectators = Game.getSpectators(position, false, false, 10, 10, 10, 10)
		for i = 1, #spectators do
			local spectator = spectators[i]
			if spectator:isPlayer() then
				local player = Player(spectator:getId())
				if player:isSorcerer() then
					Game.createMonster("Dark Sorcerer", monster:getPosition(), false, true)
					Game.setStorageValue(GlobalStorage.GraveDanger.CountVlarkorthCounting, Game.getStorageValue(GlobalStorage.GraveDanger.CountVlarkorthCounting) + 1)
				elseif player:isDruid() then
					Game.createMonster("Dark Druid", monster:getPosition(), false, true)
					Game.setStorageValue(GlobalStorage.GraveDanger.CountVlarkorthCounting, Game.getStorageValue(GlobalStorage.GraveDanger.CountVlarkorthCounting) + 1)
				elseif player:isPaladin() then
					Game.createMonster("Dark Paladin", monster:getPosition(), false, true)
					Game.setStorageValue(GlobalStorage.GraveDanger.CountVlarkorthCounting, Game.getStorageValue(GlobalStorage.GraveDanger.CountVlarkorthCounting) + 1)
				elseif player:isKnight() then
					Game.createMonster("Dark Knight", monster:getPosition(), false, true)
					Game.setStorageValue(GlobalStorage.GraveDanger.CountVlarkorthCounting, Game.getStorageValue(GlobalStorage.GraveDanger.CountVlarkorthCounting) + 1)
				end
			end
		end
	end
	
	return true
end

manageSummonCountVlarkorth:register()


--2) criar think para setar storage -2 
