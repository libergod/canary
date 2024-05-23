local config = {
	{name = "durable exercise sword", itemId = 35279, charges = 2000},
	{name = "durable exercise axe", itemId = 35280, charges = 2000},
	{name = "durable exercise club", itemId = 35281, charges = 2000},
	{name = "durable exercise bow", itemId = 35282, charges = 2000},
	{name = "durable exercise rod", itemId = 35283, charges = 2000},
	{name = "durable exercise wand", itemId = 35284, charges = 2000}
}

local cooldown ={
	waitTime = 1 * 24 * 60 * 60
}

local exercise_reward_modal = TalkAction("!reward")
function exercise_reward_modal.onSay(player, words, param)
	local window = ModalWindow {
		title = "Exercise Reward",
		message = 'Choose a item'
	}
	for i, info in pairs(config) do
		window:addChoice(string.format("%s", info.name), function (player, button, choice)
			if button.name ~= "Select" then
				return true
			end

			local lastRewardTime = player:getStorageValue(STORAGEVALUE_REWARD_DAILY_EXERCISE) or 0
			local timeSinceLastReward = os.time() - lastRewardTime
			if timeSinceLastReward >= cooldown.waitTime then
				window:sendToPlayer(player)
			else
				local timeLeft = cooldown.waitTime - timeSinceLastReward
				local daysLeft = math.floor(timeLeft / (60 * 60 * 24))
					timeLeft = timeLeft - daysLeft * 60 * 60 * 24
				local hoursLeft = math.floor(timeLeft / (60 * 60))
					timeLeft = timeLeft - hoursLeft * 60 * 60
				local minutesLeft = math.floor(timeLeft / 60)
				local secondsLeft = timeLeft % 60
				local message = string.format("You must wait %d days, %d hours, %d minutes and %d seconds before claiming your next reward.", daysLeft, hoursLeft, minutesLeft, secondsLeft)
				player:sendTextMessage(MESSAGE_INFO_DESCR, message)
				return false
			end
			
			local inbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)
			if inbox and inbox:getEmptySlots() > 0 then
				local item = inbox:addItem(info.itemId, info.charges)
				if item then
					item:setActionId(IMMOVABLE_ACTION_ID)
					player:setStorageValue(STORAGEVALUE_REWARD_DAILY_EXERCISE, os.time())
					player:sendTextMessage(MESSAGE_INFO_DESCR, "Congratulations, you just received a [".. info.name .."].")
				end
			else
				player:sendTextMessage(MESSAGE_INFO_DESCR, "You need to have capacity and empty slots to receive.")
				return true
			end
		end)
	end
	window:addButton("Select")
	window:addButton("Close")
	window:setDefaultEnterButton(0)
	window:setDefaultEscapeButton(1)
	window:sendToPlayer(player)
	return false
end
exercise_reward_modal:groupType("normal")
exercise_reward_modal:separator(" ")
exercise_reward_modal:register()
