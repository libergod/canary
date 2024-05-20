local monsterHunt = GlobalEvent("monsterHunt")
function monsterHunt.onThink(interval, lastExecution)

--Spdlog.warn("[HUNT EVENT] - Debug: ".. tostring(os.date("%A-%H")))
	if Game.getStorageValue(MONSTER_HUNT.storages.started) == 1 then
	
	return true
	end

	if table.find(MONSTER_HUNT.days, tostring(os.date("%A-%H"))) then
		--if isInArray(MONSTER_HUNT.days[os.date("%A")], hrs) then
			Spdlog.info("[HUNT EVENT] - Started Hunt Event at "..tostring(os.date("%A-%H")))
			Game.setStorageValue(MONSTER_HUNT.storages.started, 1)
			MONSTER_HUNT:initEvent()
	end
return true
end


monsterHunt:interval(60000) --1 minutes
monsterHunt:register()