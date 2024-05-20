local function doCheckAreaPlayer(upConer, downConer)
	for i=upConer.x, downConer.x do
		for j=upConer.y, downConer.y do
        	for k = upConer.z, downConer.z do
		        local room = {x=i, y=j, z=k}
				local tile = Tile(room)
				if tile then
					local creatures = tile:getCreatures()
					if creatures and #creatures > 0 then
						for _, c in pairs(creatures) do
							if isPlayer(c) then
								local player = Player(c)
								player:teleportTo(Position(1170,395,8))
							end
						end
					end
				end
			end
		end
	end
	return false
end

local lokathmorTransform = CreatureEvent("lokathmorTransform")
function lokathmorTransform.onThink(creature)
	
	local targetMonster = creature:getMonster()
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'lokathmor' and targetMonster:getName():lower() ~= 'lokathmor2' then
		return true
	end
	
	
	local storagevalue = Game.getStorageValue(GlobalStorage.TheSecretLibrary.LokathmorFight)
	
	if storagevalue == 1 then
		Game.setStorageValue(GlobalStorage.TheSecretLibrary.LokathmorHealth, creature:getHealth())
		
		local creaturePosition = creature:getPosition()
			creature:remove()
			
			-- create summons
			Game.createMonster("Knowledge Raider", {x = 1169, y = 400, z = 8}, false, true)
			Game.createMonster("Knowledge Raider", {x = 1174, y = 400, z = 8}, false, true)
			Game.createMonster("Knowledge Raider", {x = 1177, y = 390, z = 8}, false, true)
			Game.createMonster("Knowledge Raider", {x = 1167, y = 390, z = 8}, false, true)
			Game.createMonster("Knowledge Raider", {x = 1171, y = 389, z = 8}, false, true)
			
			-- add Force Fields
			Game.createMonster("Force Field", {x = 1171, y = 392, z = 8}, false, true)
			Game.createMonster("Force Field", {x = 1172, y = 392, z = 8}, false, true)
			Game.createMonster("Force Field", {x = 1173, y = 392, z = 8}, false, true)
			
			Game.createMonster("Force Field", {x = 1175, y = 394, z = 8}, false, true)
			Game.createMonster("Force Field", {x = 1175, y = 395, z = 8}, false, true)
			Game.createMonster("Force Field", {x = 1175, y = 396, z = 8}, false, true)
			
			Game.createMonster("Force Field", {x = 1171, y = 398, z = 8}, false, true)
			Game.createMonster("Force Field", {x = 1172, y = 398, z = 8}, false, true)
			Game.createMonster("Force Field", {x = 1173, y = 398, z = 8}, false, true)
			
			Game.createMonster("Force Field", {x = 1169, y = 394, z = 8}, false, true)
			Game.createMonster("Force Field", {x = 1169, y = 395, z = 8}, false, true)
			Game.createMonster("Force Field", {x = 1169, y = 396, z = 8}, false, true)
			
			Game.createMonster("Dark Knowledge", {x = 1168, y = 391, z = 8}, false, true)
			
			
		doCheckAreaPlayer(Position(1164,387,8), Position(1181,403,8))
		
		-- criar Lokathmor 100% forte a tudo
		local monster = Game.createMonster("Lokathmor2", Position(1172, 395, 8), false, true)
		monster:setHealth(Game.getStorageValue(GlobalStorage.TheSecretLibrary.LokathmorHealth), COMBAT_PHYSICALDAMAGE)
		monster:setMoveLocked(true)
		
		--Spdlog.warn("[TEST Lokathmor] - Transform. Storage: " .. storagevalue)
			
	elseif storagevalue == -1 then
		--Spdlog.warn("[TEST Lokathmor] - entered if - 1. Storage: " .. storagevalue)
		if monster then
			monster:remove()
			
			local creatureBack = Game.createMonster("Lokathmor", Position(1172, 395, 8), false, true)
			creatureBack:setHealth(Game.getStorageValue(GlobalStorage.TheSecretLibrary.LokathmorHealth), COMBAT_PHYSICALDAMAGE)
		
		
			Game.setStorageValue(GlobalStorage.TheSecretLibrary.LokathmorFight, 2)
			addEvent(function()

				Game.setStorageValue(GlobalStorage.TheSecretLibrary.LokathmorFight, 1)


			end, 30 * 1000)
		else
			--Spdlog.warn("[TEST Lokathmor] - entered ELSE STATEMENT. Storage: " .. storagevalue)
			Game.setStorageValue(GlobalStorage.TheSecretLibrary.LokathmorFight, 2)
			--Spdlog.warn("[TEST Lokathmor] - set storage to 2. Storage: " .. storagevalue)
			addEvent(function()

				Game.setStorageValue(GlobalStorage.TheSecretLibrary.LokathmorFight, 1)


			end, 30 * 1000)
		end
		
	end
	
	return true
end

lokathmorTransform:register()
