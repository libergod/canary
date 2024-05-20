local KarinLogout = CreatureEvent("KarinLogout")
function KarinLogout.onLogout(player)
	local playerId = player:getId()

	Karin.EventCoin[player:getId()] = nil

	player:setStorageValue(17101,0)
	return true
end
KarinLogout:register()
