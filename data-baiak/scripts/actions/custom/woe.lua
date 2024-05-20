dofile("./_woe.lua")

local delays = 60

local guards_price = 30000	--30k

local woe1 = Action()
function woe1.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	
	local guild = player:getGuild()
	local Guild_ID = guild:getId()
	
	Woe.getInfo()
	if item:getActionId() == Castle.banderas then
		if Woe.isTime() then
			if Woe.isStarted() then
				if infoLua[2] == Guild_ID then
					player:teleportTo(Castle.guildEntry, true)
					player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				else
					player:sendTextMessage(MESSAGE_EVENT_DEFAULT,"You are not member of ".. Woe.guildName() ..".")
					player:getPosition():sendMagicEffect(CONST_ME_POFF)
				end
			end
			
		else
			if infoLua[2] == Guild_ID then
				player:teleportTo(Castle.guildEntry, true)
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			else
				player:sendTextMessage(MESSAGE_EVENT_DEFAULT,"You are not member of ".. Woe.guildName() ..".")
				player:getPosition():sendMagicEffect(CONST_ME_POFF)
			end
		end
		
	--[[
	elseif item:getActionId() == 3135 then
		if Woe.isTime() then
			if Woe.isStarted() then
				if infoLua[2] == Guild_ID then
					if (player:getMoney() + player:getBankBalance() < guards_price) then
							player:sendTextMessage(MESSAGE_EVENT_DEFAULT,"Not enough money.")
							return true
					end
					
					Game.setStorageValue(24503,-1)
					local varDelay = Game.getStorageValue(24503)
					if (varDelay < 0) or ((os.time() - varDelay) >= delays) then
						if Woe.check() then
							if item:getId() == 2772 then
								item:transform(2772)
								else
								item:transform(2773)
							end
							Woe.summon()
							player:removeMoney(guards_price)
						else
							player:sendTextMessage(MESSAGE_EVENT_DEFAULT,"There are still guards alive.")
							player:getPosition():sendMagicEffect(CONST_ME_POFF)
						end
					else
						player:sendTextMessage(MESSAGE_EVENT_DEFAULT,"Delay not set.")
						player:getPosition():sendMagicEffect(CONST_ME_POFF)
					end
				end
			end
		end		
	]]--
	end
	return true
end
woe1:aid(3133)
--3135
woe1:register()
