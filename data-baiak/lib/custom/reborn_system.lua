
-- REBORN SYSTEM - GUSTAVO LIBER 17/02/2023
-- ALTER TABLE `PLAYERS` ADD `rebirth` INT(11) NOT NULL DEFAULT 0;


-- player:getReborn()
function Player.getReborn(self)
	local resultId = db.storeQuery("SELECT `rebirth` FROM `players` WHERE `id` = '".. self:getGuid() .."';")
	local rebirths = resultId ~= false and result.getNumber(resultId, "rebirth") or 0
	result.free(resultId)
	return rebirths
end