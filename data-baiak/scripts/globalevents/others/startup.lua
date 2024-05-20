local serverstartup = GlobalEvent("serverstartup")
function serverstartup.onStartup()
	-- BomberMan
	BlockListBomberman = { }
	BombermanPortal = 0
	BomberTeam1 = { }
	BomberTeam2 = { }
	BombermanOutfit = { }
	
	db.query("UPDATE `players` SET `online_time` = 0")
	db.query("UPDATE `players` SET `onlinetime` = 0")
	
	Game.setStorageValue(STORAGEVALUE_CASTLE_DOMINADO, CASTLE24H:getGuildIdFromCastle())
	Game.setStorageValue(STORAGEVALUE_CASTLE48_WINNER, Castle48H:checkGuildWinner())

	-- Auction System
	local days = 7
	local expires = os.time() - (days * 86400)
	local resultId = db.storeQuery("SELECT * FROM `auction_system` WHERE `date` <= " .. expires)
	if resultId ~= false then
		local offers_deleted = 0
		repeat
			local auctionId = result.getDataInt(resultId, "id")
			db.asyncQuery("DELETE FROM `auction_system` WHERE `id` = " .. id)
			offers_deleted = offers_deleted + 1
		until not result.next(resultId)
		result.free(resultId)
		print("Auction system: ".. offers_deleted .." offers deleted.")
	end
	
	
end
serverstartup:register()