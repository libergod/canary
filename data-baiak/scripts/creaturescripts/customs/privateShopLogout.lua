local privateShopLogout = CreatureEvent("privateShopLogout")
function privateShopLogout.onLogout(player)
	
	if (player:getStorageValue(75431) > 0) then
		addEvent(createNPCShop, 1, player:getName(), Creature(player):getOutfit(), getPlayerGUID(player), player:getPosition(), player:getDirection())
	end

	return true
end
--[[
local function aol(cid)
	if (getPlayerSlotItem(cid, CONST_SLOT_NECKLACE).itemid) and (getPlayerSlotItem(cid, CONST_SLOT_NECKLACE).itemid == 2173) then
		return true
	end
return false
end
	
function onPrepareDeath(cid, deathList)
	if (not getPlayerBlessing(cid, 33)) and (not aol(cid)) then
		setPlayerShopItens(getPlayerGUIDByName(getCreatureName(cid)), "{ }")
	end
return true	
end
]]--
privateShopLogout:register()
