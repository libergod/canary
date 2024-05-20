Karin.EventCoin = { }

local EventTournamentPerHour = GlobalEvent('EventTournamentPerHour')

function EventTournamentPerHour.onThink(interval)
    local players = Game.getPlayers()
    if #players == 0 then
        return true
    end

     for _, player in pairs(players) do
        if player and Karin.EventCoin[player:getId()] and Karin.EventCoin[player:getId()] >= 60 then
            local playerId = player:getId()
            addEvent(function()
                local pp = Player(playerId)
                if pp then
					if pp:isVip() then
						pp:addTransferableCoins(20)
						pp:sendTextMessage(MESSAGE_EVENT_ADVANCE, '[VIP] - You received 20 transferable coins for being online 1 Hour.')
						db.query(string.format("INSERT INTO `store_history`(`account_id`, `mode`, `description`, `coin_type`, `coin_amount`, `time`) VALUES (%s, %s, %s, %s, %s, %s)", pp:getAccountId(), "0", db.escapeString("[Online Time] Transferable Coins"), "3", "20", os.time()))
						Karin.EventCoin[pp:getId()] = 0
					else
						pp:addTransferableCoins(10)
						pp:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You received 10 transferable coins for being online 1 Hour.')
						db.query(string.format("INSERT INTO `store_history`(`account_id`, `mode`, `description`, `coin_type`, `coin_amount`, `time`) VALUES (%s, %s, %s, %s, %s, %s)", pp:getAccountId(), "0", db.escapeString("[Online Time] Transferable Coins"), "3", "10", os.time()))
						Karin.EventCoin[pp:getId()] = 0
					end
                end
            end, _ * 10)
        elseif player then
            if not Karin.EventCoin[player:getId()] then
                Karin.EventCoin[player:getId()] = 0
            end
            Karin.EventCoin[player:getId()] = Karin.EventCoin[player:getId()] + 1
        end
     end

    return true
end

EventTournamentPerHour:interval(60000)
EventTournamentPerHour:register()


