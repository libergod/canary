local restoreExpPot = Action()

function restoreExpPot.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	local canRestoreTst = db.storeQuery("SELECT `canRestore` FROM `player_exp_restore` WHERE `id_player` = " .. player:getGuid() .. " LIMIT 1")
	if canRestoreTst ~= false then
		local canRestoreTsts = result.getDataInt(canRestoreTst, 'canRestore')
		result.free(canRestoreTst)
		if canRestoreTsts == 1 then
			local sqlExpBefore = db.storeQuery("SELECT `expBefore` FROM `player_exp_restore` WHERE `id_player` = " .. player:getGuid() .. " LIMIT 1")
			if sqlExpBefore ~= false then
				local expBefore = result.getDataInt(sqlExpBefore, 'expBefore')
				result.free(sqlExpBefore)
				local sqlExpAfter = db.storeQuery("SELECT `expAfter` FROM `player_exp_restore` WHERE `id_player` = " .. player:getGuid() .. " LIMIT 1")
				if sqlExpAfter ~= false then
					local expAfter = result.getDataInt(sqlExpAfter, 'expAfter')
					result.free(sqlExpAfter)
					if expAfter ~= -1 then
						if expAfter > expBefore then
							player:sendTextMessage(MESSAGE_LOGIN,"You have gained more exp than lost. Unable to restore exp.")
							player:getPosition():sendMagicEffect(CONST_ME_POFF)
							db.query('UPDATE `player_exp_restore` SET `expAfter` = -1 where `id_player`='..player:getGuid())
							db.query('UPDATE `player_exp_restore` SET `expBefore` = -1 where `id_player`='..player:getGuid())
							db.query('UPDATE `player_exp_restore` SET `canRestore` = -1 where `id_player`='..player:getGuid())
							return false
						else
							local expcalc = math.floor(expBefore - expAfter)
							player:addExperience(expcalc, true)
							item:remove()
							db.query('UPDATE `player_exp_restore` SET `expAfter` = -1 where `id_player`='..player:getGuid())
							db.query('UPDATE `player_exp_restore` SET `expBefore` = -1 where `id_player`='..player:getGuid())
							db.query('UPDATE `player_exp_restore` SET `canRestore` = -1 where `id_player`='..player:getGuid())
							player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
							player:sendTextMessage(MESSAGE_LOGIN,"You have restored some EXP from last Death.")	
							return true
						end
					else
						player:sendTextMessage(MESSAGE_LOGIN,"You have exp to restore but need to relog first.")
						player:getPosition():sendMagicEffect(CONST_ME_POFF)
						return false
					end
				else
					player:sendTextMessage(MESSAGE_LOGIN,"You don't have the Exp restore potion.")	
					player:getPosition():sendMagicEffect(CONST_ME_POFF)
					return false
				end
			else
				player:sendTextMessage(MESSAGE_LOGIN,"You don't have the Exp restore potion.")	
				player:getPosition():sendMagicEffect(CONST_ME_POFF)
				return false
			end
		else
			player:sendTextMessage(MESSAGE_LOGIN,"You don't have the Exp restore potion.")
			player:getPosition():sendMagicEffect(CONST_ME_POFF)			
			return false
		end
	else
	-- Nao foi encontrado o user na tabela
		player:sendTextMessage(MESSAGE_LOGIN,"User not found to restore, try login again or report to administrator.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end
	
	return true
end

restoreExpPot:id(21554)
restoreExpPot:register()
