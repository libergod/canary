local table = {
	[50] = {type = "bank", id = {100000, 0}, msg = "Foi depositado em seu bank 100k de gold coins por alcançar o level 50!"},
	[300] = {type = "bank", id = {1000000, 0}, msg = "Foi depositado em seu bank 1kk de gold coins por alcançar o level 300!"},
	[600] = {type = "item", id = {9170, 1}, msg = "Você ganhou uma Stamina Refiller por alcançar o level 600!"},
	[800] = {type = "addon", id = {619, 620}, msg = "Você ganhou o addon Jersey por alcançar o level 800!"},
	[1000] = {type = "addon", id = {324, 325}, msg = "Você ganhou o addon Yalaharian full por alcançar o level 1000!"},
}

local storage = 15000

local advanceRewardLevel = CreatureEvent("advanceRewardLevel")

function advanceRewardLevel.onAdvance(player, skill, oldLevel, newLevel)

	if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
		return true
	end

	for level, _ in pairs(table) do
		if newLevel >= level and player:getStorageValue(storage) < level then
			if table[level].type == "item" then
				player:addItem(table[level].id[1], table[level].id[2])
			elseif table[level].type == "bank" then
				player:setBankBalance(player:getBankBalance() + table[level].id[1])
			elseif table[level].type == "addon" then
				player:addOutfitAddon(table[level].id[1], 3)
				player:addOutfitAddon(table[level].id[2], 3)
			else
				return false
			end

			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, table[level].msg)
			player:setStorageValue(storage, level)
		end
	end

	player:save()

	return true
end

advanceRewardLevel:register()