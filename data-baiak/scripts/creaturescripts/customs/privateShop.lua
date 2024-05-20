local privateShopLogin = CreatureEvent("privateShopLogin")

function privateShopLogin.onLogin(player)

	if (player:getStorageValue(75431) > 0) then
		local playerguid = getPlayerGUID(player)
		local ddec = 0

		for a, b in pairs(getPlayerShopLucro(playerguid)) do
			player:sendCancelMessage("You sold ".. b[1] .. "x ".. getItemName(a) .. getPrefix(b[1]) ..".")
		
		if (player:getStorageValue(21147) < 0) then
			player:setStorageValue(21147, 0)
		end

		player:setStorageValue(21147, player:getStorageValue(21147) + b[2])
		end
		
		-- before login, remove NPC and delete file
		local playerguid = getPlayerGUID(player)
		--deleteNPCFile(player:getName(), player:getPosition())
		deleteNPCuser(player:getName(), player:getPosition())
		player:setStorageValue(75431, -1)
		player:sendCancelMessage("Private Shop disabled.")
		
	end	

	if (player:getStorageValue(21147) > 0) then
		player:sendCancelMessage("Total Gain: ".. player:getStorageValue(21147) .. " gold bar" .. getPrefix(player:getStorageValue(21147)) .. ".")
		player:setBankBalance(player:getBankBalance() + player:getStorageValue(21147))
		player:setStorageValue(21147, -1)
	end

	--local playerguid = getPlayerGUID(player)
	--deleteNPCFile(player:getName())
	
	
	--setPlayerShopLucro(playerguid, "{ }")
	--player:setStorageValue(75431, -1)
	--player:sendCancelMessage("Private Shop disabled.")

	--player:registerEvent("PvShopLOGOUT")
	--player:registerEvent("PvShopDEATH")

return true
end
privateShopLogin:register()