local castle48 = GlobalEvent("castle48")
function castle48.onThink(interval, lastExecution)

	if Castle48H.days[os.date("%A")] then
		local hrs = tostring(os.date("%X")):sub(1, 5)
		if isInArray(Castle48H.days[os.date("%A")], hrs) then
			Castle48H.open()
		end
	end
	
	return true
end

castle48:interval(60000) -- how often
castle48:register()