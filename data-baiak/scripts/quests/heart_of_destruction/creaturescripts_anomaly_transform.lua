local function createSpawnAnomalyRoom(valueGlobalStorage)
	Game.createMonster("Spark of Destruction", Position(1209, 665, 7), false, true)
	Game.createMonster("Spark of Destruction", Position(1216, 665, 7), false, true)
	Game.createMonster("Spark of Destruction", Position(1209, 669, 7), false, true)
	Game.createMonster("Spark of Destruction", Position(1216, 671, 7), false, true)
	Game.createMonster("Charged Anomaly", Position(1213, 665, 7), false, true)
	Game.setStorageValue(GlobalStorage.HeartOfDestruction.ChargedAnomaly, valueGlobalStorage + 1)
end

local anomalyTransform = CreatureEvent("AnomalyTransform")

function anomalyTransform.onThink(creature)
	if not creature then
		return false
	end

	local anomalyGlobalStorage = Game.getStorageValue(GlobalStorage.HeartOfDestruction.ChargedAnomaly)
	local hpPercent = (creature:getHealth() / creature:getMaxHealth()) * 100

	if hpPercent <= 75 and anomalyGlobalStorage == 0 then
		creature:remove()
		createSpawnAnomalyRoom(anomalyGlobalStorage)
	elseif hpPercent <= 50 and anomalyGlobalStorage == 1 then
		creature:remove()
		createSpawnAnomalyRoom(anomalyGlobalStorage)
	elseif hpPercent <= 25 and anomalyGlobalStorage == 2 then
		creature:remove()
		createSpawnAnomalyRoom(anomalyGlobalStorage)
	elseif hpPercent <= 5 and anomalyGlobalStorage == 3 then
		creature:remove()
		createSpawnAnomalyRoom(anomalyGlobalStorage)
	end
	return true
end

anomalyTransform:register()
