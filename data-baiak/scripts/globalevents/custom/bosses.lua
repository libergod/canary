local bossesEvent = GlobalEvent("bossesEvent")
function bossesEvent.onThink(interval, lastExecution)
	if Game.getStorageValue(Bosses.storage) ~= 1 then
		Bosses:checkTime()
	end
	return true
end

bossesEvent:interval(60000) -- how often
bossesEvent:register()