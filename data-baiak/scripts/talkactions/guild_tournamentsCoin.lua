local gtc = TalkAction("!guildcoins")

function gtc.onSay(player, words, param)
    local targetGuild = player:getGuild()
    if targetGuild then
        if player:getStorageValue(35551) > os.time() then
            player:sendCancelMessage("You need to wait " .. minimalTimers(player:getStorageValue(35551) - os.time()))
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            return true
        else
            local gMembers = targetGuild:getMembersOnline()
            local membersOnlineRequired = 1
            local membersOnline = 0
			local tournamentsCoins = 100
            for _, targetPlayer in ipairs(gMembers) do
                membersOnline = membersOnline + 1
            end

            if membersOnline < membersOnlineRequired then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You need %d guild members online to active this command.", membersOnlineRequired))
                player:getPosition():sendMagicEffect(CONST_ME_POFF)
                return true
            end
            db.asyncStoreQuery("SELECT `id`, `name`, `ownerid` FROM `guilds` WHERE `id` = " .. targetGuild:getId() .. " LIMIT 1",
            function(info)
                    local owner = result.getString(info, "ownerid")
                    if tonumber(owner) == player:getGuid() then
                        player:setStorageValue(35551, os.time() + 24 * 60 * 60)
                        for _, targetPlayer in ipairs(gMembers) do
                            if targetPlayer then                               
								targetPlayer:addTransferableCoins(tournamentsCoins)
                                targetPlayer:getPosition():sendMagicEffect(CONST_ME_HOLYDAMAGE)
								targetPlayer:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You received from Guild Bank %d tournament coins.", tournamentsCoins))
								db.query(string.format("INSERT INTO `store_history`(`account_id`, `mode`, `description`, `coin_type`, `coin_amount`, `time`) VALUES (%s, %s, %s, %s, %s, %s)", targetPlayer:getAccountId(), "0", db.escapeString("[Guild Bank] - Tournament Coins"), "1", "100", os.time()))
                            end
                        end
                    end
                end
            )
        end
    end
end
gtc:groupType("normal")
gtc:register()