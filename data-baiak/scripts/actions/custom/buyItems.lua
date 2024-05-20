local items = Action()
local levers = {
	[2655] = {id = 8778, count = 1, value = 500000}, -- Addon Doll
	[2656] = {id = 22723, count = 1, value = 2000000}, -- Dodge token
	[2657] = {id = 22724, count = 1, value = 1000000}, --Critical Token
	[2658] = {id = 12305, count = 1, value = 1500000}, -- SuperUP Key
	[2659] = {id = 9170, count = 1, value = 1000000}, -- Stamina Refiller
}

function items.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	local choose = levers[item.actionid]

	if not choose then
		return false
	end

	if player:getStorageValue(77124) >= os.time() then
		player:sendCancelMessage("Você precisa esperar 2 segundos entre uma compra e outa.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end

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
	if player:addItem(buy) == RETURNVALUE_CONTAINERNOTENOUGHROOM then
		sendMailbox(player:getId(), choose.id, choose.count)
		player:sendTextMessage(MESSAGE_STATUS_BLUE_LIGHT, "Você não possui espaço em sua backpack e seu item foi enviado para o mailbox.")
	end

	player:sendCancelMessage("Você comprou ".. choose.count .."x ".. userItem:getName() ..".")
	player:addItem(choose.id,choose.count)
	player:getPosition():sendMagicEffect(29)
	player:setStorageValue(77124, os.time() + 2)

	item:transform(item.itemid == 2773 and 2772 or 2773)

	return true
end

items:aid(2655,2656,2657,2658,2659)
items:register()