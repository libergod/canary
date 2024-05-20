config = {
        quests = {
            [46001] = {
                name = { active = true, value = "Addon Doll"},
                rewards = {
                    {id = 9177, count = 1},
                },
                level = { active = false, min = 150,},
                storage = { active = false, key = 91143,},
                effect = { active = true, effectWin = CONST_ME_GIFT_WRAPS,},
				achievement = { active = true, id = 3,},
            },
            [46002] = {
                name = { active = true, value = " Gold Ingot"},
                rewards = {
                    {id = 9058, count = 5},
                },
                level = { active = false, min = 150,},
                storage = { active = false, key = 91146,},
                effect = { active = true, effectWin = CONST_ME_GIFT_WRAPS,},
				achievement = { active = true, id = 3,},
            },
			[46003] = {
                name = { active = true, value = " Demon Helmet"},
                rewards = {
                    {id = 3387, count = 1},
                },
                level = { active = false, min = 150,},
                storage = { active = false, key = 91146,},
                effect = { active = true, effectWin = CONST_ME_GIFT_WRAPS,},
				achievement = { active = true, id = 1,},
            },
			[46004] = {
                name = { active = true, value = " Demon Shield"},
                rewards = {
                    {id = 3420, count = 1},
                },
                level = { active = false, min = 150,},
                storage = { active = false, key = 91146,},
                effect = { active = true, effectWin = CONST_ME_GIFT_WRAPS,},
				achievement = { active = false, id = 0,},
            },
			[46005] = {
                name = { active = true, value = " 100 Crystal Coins"},
                rewards = {
                    {id = 3043, count = 100},
                },
                level = { active = false, min = 150,},
                storage = { active = false, key = 91146,},
                effect = { active = true, effectWin = CONST_ME_GIFT_WRAPS,},
				achievement = { active = false, id = 0,},
            },
        },
    messages = {
        notExist = "This quest dosn't exist.",
        win = "You already finished the quest %s.",
        notWin = "You already finished this quest.",
        level = "You need to be at least level %d to finish this quest.",
    },
}
local allQuests = Action()
function allQuests.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local choose = config.quests[item.actionid]

	if player:getStorageValue(item.actionid) == 1 then
		player:sendCancelMessage(config.messages.notWin)
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
		
		return true
	else

		if not choose then
			player:sendCancelMessage(config.messages.notExist)
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			return true
		end

		if choose.level.active and player:getLevel() < choose.level.min then
			player:sendCancelMessage(config.messages.level:format(choose.level.min))
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			return true
		end

		if choose.storage.active and player:getStorageValue(choose.storage.key) >= 0 then
			player:sendCancelMessage(config.messages.notWin)
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			return true
		end

		if player:getStorageValue(item.actionid) ~= 1 then


			for i = 1, #choose.rewards do
				player:addItem(choose.rewards[i].id, choose.rewards[i].count)
			end

			player:setStorageValue(item.actionid, 1)
			
			if choose.achievement.active then
				player:addAchievement(choose.achievement.id)
			end

			if choose.effect.active then
				player:getPosition():sendMagicEffect(choose.effect.effectWin)
			end

			if choose.name.active then
				player:sendCancelMessage(config.messages.win:format(choose.name.value))
			end
		else
			player:sendCancelMessage(config.messages.notWin)
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			return true
		end		
	end
    return true
end

for actionRange = 46000, 46999 do
	allQuests:aid(actionRange)
end
allQuests:register()
