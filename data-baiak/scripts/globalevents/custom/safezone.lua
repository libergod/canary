local safezone = GlobalEvent("safeZone")
function safezone.onThink(interval, lastExecution)
	if table.find(SAFEZONE.days, tostring(os.date("%A-%H:%M"))) then
		Spdlog.info("[SAFEZONE EVENT] - Started SafeZone Event at "..tostring(os.date("%A-%H:%M")))
		Game.setStorageValue(SAFEZONE.started, 1)
		SAFEZONE:teleportCheck()
	end
	return true
end

safezone:interval(60000) -- how often
safezone:register()