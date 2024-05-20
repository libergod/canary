dofile("./_woe.lua")



local woe_tiles = MoveEvent()

function woe_tiles.onStepIn(creature, item, position, fromPosition)
	
	if item:getActionId() == Castle.tiles then
		Woe.getInfo()
		if not creature:getGuild() then
			Woe.moveBack(creature, fromPosition, "You are not member of a guild.")
			return true
		end
		
		
		local guild = creature:getGuild()
		local Guild_ID = guild:getId()
		if creature:isPlayer() then
			if Woe.isTime() then
				if Guild_ID ~= 0 then
					if Woe.isRegistered(creature) then
						creature:sendTextMessage(MESSAGE_ADMINISTRADOR,"Good Luck ".. creature:getName() .."!.")
					else
						Woe.moveBack(creature, fromPosition, "you are not registered use !guild")
					end			
				else
					Woe.moveBack(creature, fromPosition, "only players with guild can enter.")
				end
			elseif Guild_ID == infoLua[2] then
				if Woe.isRegistered(creature) then
					creature:sendTextMessage(MESSAGE_ADMINISTRADOR,"Welcome ".. creature:getName() ..".")
				else
					Woe.moveBack(creature, fromPosition, "you are not registered use !guild")
				end			
			else
				Woe.moveBack(creature, fromPosition, "its not woe time and you are not member of ".. Woe.guildName() ..".")
			end
		end
	elseif item:getActionId() == Castle.portals then
		creature:teleportTo(Castle.PreToPos[math.random(1, 2)], true)
	elseif item:getActionId() == Castle.bases then
		if creature:isPlayer() then
			Woe.moveBack(creature, fromPosition, "you cant step there.")
		end
	end
	return true
end

woe_tiles:type("stepin")
woe_tiles:aid(3131, 3132, 3134)
woe_tiles:register()
