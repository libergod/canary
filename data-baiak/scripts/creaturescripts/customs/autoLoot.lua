local autoloot = CreatureEvent("autoLoot")

function autoloot.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)

	
	if not killer:isPlayer() or not creature:isMonster() or creature:hasBeenSummoned() or creature:isPlayer() or killer:getMaster() then
		return true
	end
	
	
	local killerId = killer:getId()
	
	if corpse:getType():isCorpse() and corpse:getAttribute(ITEM_ATTRIBUTE_CORPSEOWNER) == killerId then
        for i = corpse:getSize() - 1, 0, -1 do
            local containerItem = corpse:getItem(i)
            if containerItem then
                for i = AUTOLOOT_STORAGE_START, AUTOLOOT_STORAGE_END do
                    if killer:getStorageValue(i) == containerItem:getId() then
                        containerItem:moveTo(killer)
						--creature:say("AUTOLOOT!", TALKTYPE_ORANGE_1)
                    end
                end
            end
        end
    end

return true
end


autoloot:register()
