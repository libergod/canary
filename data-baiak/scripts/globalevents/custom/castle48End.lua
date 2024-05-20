local Castle48h2 = GlobalEvent("Castle48h2")
function Castle48h2.onTime(interval)
    Castle48H.close()
	return true
end
Castle48h2:interval(48 * 60 * 60 * 1000) -- a cada 2hr
Castle48h2:register()