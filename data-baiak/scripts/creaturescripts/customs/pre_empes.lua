dofile("./_woe.lua")

local config = woe_config

local pre_empes = CreatureEvent("Pre_Empes")

function pre_empes.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	
	if creature:isMonster() then
		creature:remove()
		corpse:remove()
		else
		corpse:remove()
	end
	
	
	
	if Woe.isTime() then
		if Woe.checkPre() then

			local item = Game.createItem(5023, 1, Castle.PrePortalsPos[1])
			item:setActionId(Castle.portals)

			--Game.createItem(5023, 1, Castle.PrePortalsPos[1])
			--local tile = Tile(Castle.PrePortalsPos[1])
			--local teleport1 = Item(tile:getItemById(5023, -1))
			--teleport1:setActionId(Castle.portals)
			
			local item2 = Game.createItem(5023, 1, Castle.PrePortalsPos[2])
			item2:setActionId(Castle.portals)

			--Game.createItem(5023, 1, Castle.PrePortalsPos[2])
			--local tile2 = Tile(Castle.PrePortalsPos[2])
			--local teleport2 = Item(tile2:getItemById(5023, -1))
			--teleport2:setActionId(Castle.portals)

			broadcastMessage("Both Pre-Empes have been broken, portals opened.", MESSAGE_ADMINISTRADOR)

		else
			broadcastMessage("one of Pre-Empes have been broken...", MESSAGE_ADMINISTRADOR)
		end
	end
	return true
end

pre_empes:register()


