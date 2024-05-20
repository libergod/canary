local monsterHuntKill = CreatureEvent("monsterHuntKill")
function monsterHuntKill.onKill(player, creature, lastHit)

	if not Game.getStorageValue(MONSTER_HUNT.storages.started) == 1 or (Game.getStorageValue(MONSTER_HUNT.storages.monster) == -1) or (Game.getStorageValue(MONSTER_HUNT.storages.monster) == 0) then
	
	return true
	end

	if not player:isPlayer() or not creature:isMonster() or creature:hasBeenSummoned() or creature:isPlayer() then
		return true
	end
	
	if Game.getStorageValue(MONSTER_HUNT.storages.monster) == nil then
		return true
	end
	
	if player:getStorageValue(MONSTER_HUNT.storages.player) == -1 then
		player:setStorageValue(MONSTER_HUNT.storages.player, 0)
	end
	
	

	if creature:isMonster() and creature:getName():lower() == (MONSTER_HUNT.list[Game.getStorageValue(MONSTER_HUNT.storages.monster)]):lower() then
		player:setStorageValue(MONSTER_HUNT.storages.player, player:getStorageValue(MONSTER_HUNT.storages.player) + 1)
		player:sendTextMessage(MESSAGE_EVENT_DEFAULT,MONSTER_HUNT.messages.prefix .. MONSTER_HUNT.messages.kill:format(player:getStorageValue(MONSTER_HUNT.storages.player), creature:getName()))
		table.insert(MONSTER_HUNT.players, {player:getId(), player:getStorageValue(MONSTER_HUNT.storages.player)})
	end
	
	return true
end
monsterHuntKill:register()
