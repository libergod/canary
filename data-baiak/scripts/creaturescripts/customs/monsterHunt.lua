local monsterHuntKill = CreatureEvent("monsterHuntKill")

function monsterHuntKill.onDeath(creature, corpse, killer, mostDamage, unjustified, mostDamageUnjustified)

	if creature and creature:isMonster() then
		
		if not Game.getStorageValue(MONSTER_HUNT.storages.started) == 1 or (Game.getStorageValue(MONSTER_HUNT.storages.monster) == -1) or (Game.getStorageValue(MONSTER_HUNT.storages.monster) == 0) then
			return true
		end
		
		if Game.getStorageValue(MONSTER_HUNT.storages.monster) == nil then
			return true
		end
		
		if killer:getStorageValue(MONSTER_HUNT.storages.killer) == -1 then
			killer:setStorageValue(MONSTER_HUNT.storages.killer, 0)
		end
		
		
			if not killer:isPlayer() or not creature:isMonster() or creature:hasBeenSummoned() or creature:isPlayer() then
				return true
			end
		
		--Spdlog.warn("[MonsterHunt] - Debug: ".. (MONSTER_HUNT.list[Game.getStorageValue(MONSTER_HUNT.storages.monster)]):lower())
		if creature:isMonster() and creature:getName():lower() == (MONSTER_HUNT.list[Game.getStorageValue(MONSTER_HUNT.storages.monster)]):lower() then
			killer:setStorageValue(MONSTER_HUNT.storages.killer, killer:getStorageValue(MONSTER_HUNT.storages.killer) + 1)
			killer:sendTextMessage(MESSAGE_EVENT_ADVANCE,MONSTER_HUNT.messages.prefix .. MONSTER_HUNT.messages.kill:format(killer:getStorageValue(MONSTER_HUNT.storages.killer), creature:getName()))
			table.insert(MONSTER_HUNT.players, {killer:getId(), killer:getStorageValue(MONSTER_HUNT.storages.killer)})		
		end

	end	
	
	return true
end
monsterHuntKill:register()
