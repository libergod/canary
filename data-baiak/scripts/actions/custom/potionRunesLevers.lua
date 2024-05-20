local items = Action()
local levers = {
	[1523] = {id = 3180, count = 100, value = 45}, -- magic wall rune
	[1524] = {id = 3165, count = 100, value = 50}, -- paralyze rune
	[1525] = {id = 3192, count = 100, value = 100}, -- firebomb rune
	[1526] = {id = 3160, count = 100, value = 0}, -- ultimate healing rune
	[1527] = {id = 3161, count = 100, value = 190}, -- avalanche rune
	[1528] = {id = 3155, count = 100, value = 190}, -- sudden death rune
	[1517] = {id = 236, count = 100, value = 190}, -- strong health potion
	[1518] = {id = 237, count = 100, value = 190}, -- strong mana potion
	[1519] = {id = 239, count = 100, value = 190}, -- great health potion
	[1520] = {id = 238, count = 100, value = 190}, -- great mana potion
	[1522] = {id = 7642, count = 100, value = 190}, -- great spirit potion
	[1521] = {id = 7643, count = 100, value = 190}, -- ultimate health potion
	[1529] = {id = 23373, count = 100, value = 190}, -- ultimate mana potion
	[1530] = {id = 23375, count = 100, value = 190}, -- supreme health potion
	[1531] = {id = 23374, count = 100, value = 190} -- ultimate spirit potion
}

function items.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	local choose = levers[item.actionid]

	if not choose then
		return false
	end

	--[[if player:getStorageValue(77124) >= os.time() then
		player:sendCancelMessage("Você precisa esperar 1 segundo entre uma compra e outra.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end]]--

	local userItem = ItemType(choose.id)
	local itemWeight = userItem:getWeight() * choose.count

	if player:getFreeCapacity() < itemWeight then
		player:sendCancelMessage("Você não tem espaço suficiente.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end

	if not player:removeMoney(choose.value) then
		player:sendCancelMessage("Você não tem dinheiro suficiente.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end
	
	local buy = Game.createItem(choose.id, choose.count)
	if player:addItemEx(buy) == RETURNVALUE_CONTAINERNOTENOUGHROOM then
		sendMailbox(player:getId(), choose.id, choose.count)
		player:sendTextMessage(MESSAGE_STATUS_BLUE_LIGHT, "Você não possui espaço em sua backpack e seu item foi enviado para o mailbox.")
	end

	player:sendCancelMessage("Você comprou ".. choose.count .."x ".. userItem:getName() ..".")
	player:addItem(choose.id,choose.count)
	player:getPosition():sendMagicEffect(29)
	--player:setStorageValue(77124, os.time() + 1)

	item:transform(item.itemid == 2773 and 2772 or 2773)

	return true
end

items:aid(1522,1523,1524,1525,1526,1527,1528,1517,1518,1519,1520,1521,1529,1530,1531)
items:register()
