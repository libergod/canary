
-- TOURNAMENTS COIN FUNCTIONS

-- player:getTournamentsCoins()
function Player.getTournamentsCoins(self)
	local resultId = db.storeQuery("SELECT `coins_tournaments` FROM `accounts` WHERE `id` = '".. self:getAccountId() .."';")
	local time = resultId ~= false and result.getNumber(resultId, "coins_tournaments") or 0
	result.free(resultId)
	return time
end

-- player:hasTournamentsCoins()
function Player.hasTournamentsCoins(self)
	return self:getTournamentsCoins() > 0 and true or false
end


-- player:addTournamentsCoins(coins)
function Player.addTournamentsCoins(self, coins)
	return self:hasTournamentsCoins() and db.query("UPDATE `accounts` SET `coins_tournaments` = '".. (self:getTournamentsCoins() + coins) .."' WHERE `id` ='".. self:getAccountId() .."' LIMIT 1 ;") or db.query("UPDATE `accounts` SET `coins_tournaments` = '".. coins .."' WHERE `id` ='".. self:getAccountId() .."' LIMIT 1 ;")
end

-- player:removeTournamentsCoins(coins)
function Player.removeTournamentsCoins(self, coins)
	return self:hasTournamentsCoins() and db.query("UPDATE `accounts` SET `coins_tournaments` = '".. (self:getTournamentsCoins() - coins) .."' WHERE `id` ='".. self:getAccountId() .."' LIMIT 1 ;") or db.query("UPDATE `accounts` SET `coins_tournaments` = '".. coins .."' WHERE `id` ='".. self:getAccountId() .."' LIMIT 1 ;")
end

-- player:setTournamentsCoins(coins)
function Player.setTournamentsCoins(self, coins)
	return db.query("UPDATE `accounts` SET `coins_tournaments` = '".. coins .."' WHERE `id` ='".. self:getAccountId() .."' LIMIT 1 ;")
end

-- player:resetTournamentsCoins()
function Player.resetTournamentsCoins(self)
	db.query("UPDATE `accounts` SET `coins_tournaments` = '0' WHERE `id` ='".. self:getAccountId() .."' LIMIT 1 ;")
end

-- FIM TOURNAMENTS COIN FUNCTIONS