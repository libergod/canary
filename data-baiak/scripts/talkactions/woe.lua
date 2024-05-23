dofile("./_woe.lua")

local config = woe_config

local woeConfig = TalkAction("/woe")

function woeConfig.onSay(player, words, param)
	--if not player:getGroup():getAccess() or player:getAccountType() < ACCOUNT_TYPE_GOD then
	--	return true
	--end

	if param == "" then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Need parameter!")
		return true
	end
	
	if param == "/!/SETUP" then
	
		if not player:getGroup():getAccess() or player:getAccountType() < ACCOUNT_TYPE_GOD then
			return true
		else
			Woe.setup()
		return true
		end
	end

	

	Woe.getInfo()
	
	local myTable = { }
	
	for _, i in ipairs({"%d", "%B", "%Y", "%X"}) do
		table.insert(myTable, os.date(i, infoLua[4]))
	end
	
	--[[	
	if Woe.isStarted() then
		text = "time left = " ..  Woe.timeToEnd().mins .. ":" .. Woe.timeToEnd().secs .. "\nActually the castle " .. Castle.name .. " is owned by " .. Woe.guildName() .. ".\n" .. Woe.breakerName() .. " broke the empe at "..myTable[1].." / "..myTable[2].." / "..myTable[3].." at time "..myTable[4].."."
	else
		text = "the last woe was won by " .. Woe.guildName() .. ".\n" .. Woe.breakerName() .. " broke the empe at "..myTable[1].." / "..myTable[2].." / "..myTable[3].." at time "..myTable[4].."."
	end
]]--
--if player:getGroup():getAccess() >= config.accessToStar then
		--if player:getGroup():getAccess() or player:getAccountType() >= ACCOUNT_TYPE_GOD or player:getGroup():getAccess() >= config.accessToStar then
			if param == "on" then
			
				if not player:getGroup():getAccess() or player:getAccountType() < ACCOUNT_TYPE_GOD then
					return true
				end
	
				--player:sendTextMessage(config.bcType,"WoE is already running.")
				if Game.getStorageValue(stor.WoeTime) == 1 then
					player:sendTextMessage(config.bcType,"WoE is already running.")
					player:getPosition():sendMagicEffect(CONST_ME_POFF)
					return false
				end
				
				if Woe.isTime() ~= true then					
					broadcastMessage("War of Emperium will start in next 5 minutes...", config.bcType)
					broadcastMessage("will have a duration of " .. config.timeToEnd .. " Minutes.", config.bcType)
					Game.setStorageValue(stor.WoeTime, 1)
					--Game.setStorageValue(stor.Started, 1)
				else
					player:sendTextMessage(config.bcType,"WoE is already running.")
					player:getPosition():sendMagicEffect(CONST_ME_POFF)
				end
			elseif param == "off" then
				if Woe.isTime() == true then
					broadcastMessage("WoE was canceled...", config.bcType)
					Game.setStorageValue(stor.WoeTime, 0)
					Game.setStorageValue(stor.Started, 0)
					
					--[[
					local tile = Tile(Castle.empePos)
					local monster1 = tile:getTopCreature().uid
					
					if monster1:isMonster() then
						monster1:remove()
					end
					]]--
					Woe.removeEntry()
					Woe.removePre()
					Woe.removePortals()
				else
					player:sendTextMessage(config.bcType,"WoE is not running.")
					player:getPosition():sendMagicEffect(CONST_ME_POFF)
				end
			elseif param == "empe" then
				Game.createMonster("empe", Castle.empePos, false, true)
			elseif param == "go" then
				local newPos = Castle.empePos
				newPos.y = newPos.y + 1
				player:teleportTo(newPos, true)
			else
				player:sendTextMessage(config.bcType,"not valid param.")
				player:getPosition():sendMagicEffect(CONST_ME_POFF)
			end
	return true
end
woeConfig:groupType("god")
woeConfig:separator(" ")
woeConfig:register()
