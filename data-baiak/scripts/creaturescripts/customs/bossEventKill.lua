local bossEventMonsterKill = CreatureEvent("bossEventMonsterKill")
function bossEventMonsterKill.onKill(player, creature, lastHit)

	if Game.getStorageValue(Bosses.storageAlive) ~= 1 then
	
	return true
	end

	if not player:isPlayer() or not creature:isMonster() or creature:hasBeenSummoned() or creature:isPlayer() then
		return true
	end
	
	if creature:isMonster() and creature:getName():lower() == BOSS_EVENT_NAME:lower() then
		Game.setStorageValue(Bosses.storageAlive, 0)
		Bosses:closeTp()
		Game.broadcastMessage(Bosses.msgFinalBoss)
		BOSS_EVENT_NAME = nil
		Spdlog.info("[BOSSES EVENT] - Ended Event!")
	end
	
	return true
end
bossEventMonsterKill:register()
