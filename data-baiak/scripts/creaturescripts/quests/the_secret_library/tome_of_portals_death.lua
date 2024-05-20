local function transformTeleport(position)
	local id = 1949
	local teleportItem = Tile(position):getItemById(id)
	if not teleportItem then
		return
	end

	position:sendMagicEffect(CONST_ME_POFF)
	teleportItem:remove()
	teleportItem:setActionId()
	
	if Game.getStorageValue(GlobalStorage.TheSecretLibrary.GorzindelFight) < 5 then
		Game.createMonster("Stolen Tome of Portals", {x = 1109, y = 421, z = 8}, false, true)
	end
end

local tomeOfPortalsDeath = CreatureEvent("tomeOfPortalsDeath")
function tomeOfPortalsDeath.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local targetMonster = creature:getMonster()
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'stolen tome of portals' then
		return true
	end

	if Game.getStorageValue(GlobalStorage.TheSecretLibrary.GorzindelFight) < 5 then
		local tp = Game.createItem(1949, 1, creature:getPosition())
		if tp then
			tp:setActionId(21302)
		end

		addEvent(transformTeleport, 5 * 1000, tp:getPosition())
	end
	
	return true
end

tomeOfPortalsDeath:register()
