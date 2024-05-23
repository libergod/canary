dofile("./_woe.lua")
local recallWoe = TalkAction("!recall")

function recallWoe.onSay(player, words, param)

		local guild = player:getGuild()
		local Guild_ID = guild:getId()
		Woe.getInfo()
		
		if Woe.isStarted() == true then
			if infoLua[2] == Guild_ID then
			--if player:getGUID() == guild:getOwnerGUID() then
				if Woe.isInCastle(player) == true then
					local members = Woe.getGuildMembers(Guild_ID)
					if #members > 1 then
						if(exhaust(cid, stor.recall, config.recallTime) == 1) then
							for _, i in ipairs(members) do
								if i:getGUID() ~= guild:getOwnerGUID() then
									--local pos = getClosestFreeTile(cid, getCreaturePosition(cid), FALSE, TRUE)
									local pos = player:getClosestFreePosition()
									i:teleportTo(pos, true)
								end
							end
							player:sendTextMessage(config.bcType,"Emergency Recall")
							player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)	
						else
							player:sendTextMessage(config.bcType,"You can only use this every " .. config.recallTime / 60 .. " minutes.")
							player:getPosition():sendMagicEffect(CONST_ME_POFF)	
						end		
					else
						player:sendTextMessage(config.bcType,"No members online.")
						player:getPosition():sendMagicEffect(CONST_ME_POFF)	
					end
				else
					player:sendTextMessage(config.bcType,"only can be used in the castle.")
					player:getPosition():sendMagicEffect(CONST_ME_POFF)		
				end
			else
				player:sendTextMessage(config.bcType,"You are not the leader.")
				player:getPosition():sendMagicEffect(CONST_ME_POFF)				
			end
		else
			player:sendTextMessage(config.bcType,"WoE is not running.")
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
		end
end
recallWoe:groupType("normal")
recallWoe:register()
