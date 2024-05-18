
-- REBORN SYSTEM - GUSTAVO LIBER 17/02/2023
-- ALTER TABLE `PLAYERS` ADD `rebirth` INT(11) NOT NULL DEFAULT 0;


-- player:getReborn()
function Player.getReborn(self)
	local resultId = db.storeQuery("SELECT `rebirth` FROM `players` WHERE `id` = '".. self:getGuid() .."';")
	local rebirths = resultId ~= false and result.getNumber(resultId, "rebirth") or 0
	result.free(resultId)
	return rebirths
end

--[[
function Player.doReborn(self)
	local rebirths = self:getReborn()
		
	local levelRebirth = configManager.getNumber(configKeys.REBORN_LEVEL)
	--local bonusRebirth = configManager.getNumber(configKeys.REBORN_STATBONUS)
	local bonusDamageRebirth = configManager.getNumber(configKeys.REBORN_DMGBONUS)
	
	local bonusRebirth = 5 / 100
	
	local bonusMana = 90 * bonusRebirth
	local manaTotal = 90 + (bonusMana * rebirths)
	
	local bonusHealth = 185 * bonusRebirth
	local healthTotal = 185 + (bonusHealth * rebirths)
	
	local gainMana = self:getVocation():getManaGain() * bonusRebirth
	local gainHp = self:getVocation():getHealthGain() * bonusRebirth
	local supposedcap = (47000 + (vocation:getCapacityGain() * (level-8))) / 100

	db.query(string.format("UPDATE `players` SET `rebirth` = `rebirth` + 1 WHERE `id` = %d", self:getGuid()))
	db.query(string.format("UPDATE `players` SET `level` = 8 WHERE `id` = %d", self:getGuid()))
	db.query(string.format("UPDATE `players` SET `mana` = %d WHERE `id` = %d", manaTotal, self:getGuid()))
	db.query(string.format("UPDATE `players` SET `manamax` = %d WHERE `id` = %d", manaTotal, self:getGuid()))
	db.query(string.format("UPDATE `players` SET `health` = %d WHERE `id` = %d", healthTotal, self:getGuid()))
	db.query(string.format("UPDATE `players` SET `healthmax` = %d WHERE `id` = %d", healthTotal, self:getGuid()))
	db.query(string.format("UPDATE `players` SET `cap` = %d WHERE `id` = %d", supposedcap, self:getGuid()))
end
]]--