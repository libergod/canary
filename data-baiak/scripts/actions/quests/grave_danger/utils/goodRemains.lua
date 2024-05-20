local goodRemains = Action()

function goodRemains.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not target or not target:isMonster() then
		return false
	end

	if player:isSorcerer() and item.itemid == 31206 and target:getName():lower() == 'count vlarkorth' then
		local creature = Creature(target:getId())
		creature:say("Used the Good Remains of Sorcerer !!", TALKTYPE_MONSTER_YELL)
		Game.setStorageValue(GlobalStorage.GraveDanger.CountVlarkorthCounting, Game.getStorageValue(GlobalStorage.GraveDanger.CountVlarkorthCounting) - 1)
		item:remove()
		creature:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
	elseif player:isDruid() and item.itemid == 31205 and target:getName():lower() == 'count vlarkorth' then
		local creature = Creature(target:getId())
		creature:say("Used the Good Remains of Druid !!", TALKTYPE_MONSTER_YELL)
		Game.setStorageValue(GlobalStorage.GraveDanger.CountVlarkorthCounting, Game.getStorageValue(GlobalStorage.GraveDanger.CountVlarkorthCounting) - 1)
		item:remove()
		creature:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
	elseif player:isPaladin() and item.itemid == 31204 and target:getName():lower() == 'count vlarkorth' then
		local creature = Creature(target:getId())
		creature:say("Used the Good Remains of Paladin !!", TALKTYPE_MONSTER_YELL)
		Game.setStorageValue(GlobalStorage.GraveDanger.CountVlarkorthCounting, Game.getStorageValue(GlobalStorage.GraveDanger.CountVlarkorthCounting) - 1)
		item:remove()
		creature:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
	elseif player:isKnight() and item.itemid == 31203 and target:getName():lower() == 'count vlarkorth' then
		local creature = Creature(target:getId())
		creature:say("Used the Good Remains of Knight !!", TALKTYPE_MONSTER_YELL)
		Game.setStorageValue(GlobalStorage.GraveDanger.CountVlarkorthCounting, Game.getStorageValue(GlobalStorage.GraveDanger.CountVlarkorthCounting) - 1)
		item:remove()
		creature:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
	end
	
	return true
end

goodRemains:aid(21308)
goodRemains:register()
