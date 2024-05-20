dofile("./_woe.lua")

local config = woe_config

function isInTable(t, val)
	if (type(t) == "table") then
		for k, v in ipairs(t) do
			if v == val then
				return true
			end
		end
	end
    return false
end

local lastDay = false

local start_woe = GlobalEvent("Start_Woe")
function start_woe.onThink(interval, lastExecution)

	local day = string.lower(os.date("%A", os.time()))
	if isInTable(config.dias, day) == true and lastday ~= day then
		local Hora = tonumber(os.date("%H", os.time()))
		local Min = tonumber(os.date("%M", os.time()))
		if Hora == config.horaPartida and Min == config.minPartida then
			if not Woe.isTime() then
				broadcastMessage("War of Emperium will start in next 5 minutes...", MESSAGE_ADMINISTRADOR)
				broadcastMessage("will have a duration of " .. config.timeToEnd .. " minutes.", MESSAGE_ADMINISTRADOR)
				Game.setStorageValue(stor.WoeTime, 1)
				lastDay = day
			end
		end
	end
    return true
end

start_woe:interval(60000) --1 minutes
start_woe:register()