local fireStorm = GlobalEvent("fireStorm")
function fireStorm.onThink(interval, lastExecution)

	if table.find(FSE.days, tostring(os.date("%A-%H:%M"))) then
		Spdlog.info("[FIRESTORM EVENT] - Started FireStorm Event at "..tostring(os.date("%A-%H:%M")))
		Game.setStorageValue(FSE.storages.started, 1)
		FSE:Init()
	end
	return true
end

fireStorm:interval(60000) -- how often
fireStorm:register()