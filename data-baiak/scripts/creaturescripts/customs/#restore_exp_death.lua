local restoreExpEnabled = true

local playerDeathRestoreExp = CreatureEvent("playerDeathRestoreExp")
function playerDeathRestoreExp.onDeath(player, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)

	if not restoreExpEnabled then
		return
	end

	local byPlayer = 0
	local killerName
	if killer ~= nil then
		if killer:isPlayer() then
			byPlayer = 1
		else
			local master = killer:getMaster()
			if master and master ~= killer and master:isPlayer() then
				killer = master
				byPlayer = 1
			end
		end
		killerName = killer:isMonster() and killer:getType():getNameDescription() or killer:getName()
	else
		killerName = 'field item'
	end

	local byPlayerMostDamage = 0
	local mostDamageKillerName
	if mostDamageKiller ~= nil then
		if mostDamageKiller:isPlayer() then
			byPlayerMostDamage = 1
		else
			local master = mostDamageKiller:getMaster()
			if master and master ~= mostDamageKiller and master:isPlayer() then
				mostDamageKiller = master
				byPlayerMostDamage = 1
			end
		end
		mostDamageName = mostDamageKiller:isMonster() and mostDamageKiller:getType():getNameDescription() or mostDamageKiller:getName()
	else
		mostDamageName = 'field item'
	end


	if byPlayer ~= 1 then
		
		-- RESTORE EXP SYSTEM
		local usrExist = db.storeQuery("SELECT `id` FROM `player_exp_restore` WHERE `id_player` = " .. player:getGuid() .. " LIMIT 1")
		if usrExist ~= false then
			local iduser = result.getDataInt(usrExist, 'id')
			result.free(usrExist)
			-- iduser (Id do user ja existente na tabela)
			db.query('UPDATE `player_exp_restore` SET `expBefore` = '..player:getExperience()..' where `id`='..iduser)
			db.query('UPDATE `player_exp_restore` SET `canRestore` = 1 where `id`='..iduser)
		else
			db.query(string.format("INSERT INTO `player_exp_restore`(`id_player`, `expBefore`, `expAfter`, `canRestore`) VALUES (%s, %s, %s, %s)", player:getGuid(), player:getExperience(), "-1", "1"))
		end

	
	else
		-- DIED FOR PLAYER, SO CANT RESTORE EXP
		db.query('UPDATE `player_exp_restore` SET `expAfter` = -1 where `id_player`='..player:getGuid())
		db.query('UPDATE `player_exp_restore` SET `expBefore` = -1 where `id_player`='..player:getGuid())
		db.query('UPDATE `player_exp_restore` SET `canRestore` = -1 where `id_player`='..player:getGuid())
	end
end
playerDeathRestoreExp:register()
--player:addExperience(1000, true)