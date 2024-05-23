local addVip = TalkAction("/addvip")

function addVip.onSay(player, words, param)
	if not player:getGroup():getAccess() or player:getAccountType() < ACCOUNT_TYPE_GOD then
		return true
	end

	-- Check the first param (player name) exists
	if param == "" then
		player:sendCancelMessage("Player name param required")
		-- Distro log
		Spdlog.error("[addVip.onSay] - Player name param not found")
		return false
	end

	local split = param:split(",")
	local name = split[1]
	local days = nil
	if split[2] then
		days = tonumber(split[2])
	end

	-- Check if player is online
	local targetPlayer = Player(name)
	if not targetPlayer then
		player:sendCancelMessage("Player ".. string.titleCase(name) .." is not online.")
		-- Distro log
		Spdlog.error("[addVip.onSay] - Player ".. string.titleCase(name) .." is not online")
		return false
	end

	-- Check if the days number is valid
	if days <= 0 or days == nil then
		player:sendCancelMessage("Invalid number of days.")
		return false
	end

	targetPlayer:addVipDays(days)
	
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Successfull added ".. days .." \z
                           days of vip account to ".. targetPlayer:getName() .." player.")
	targetPlayer:sendTextMessage(MESSAGE_EVENT_ADVANCE, "".. player:getName() .." added \z
	                             ".. days .." days of vip account to you.")
	-- Distro log
	Spdlog.info("".. player:getName() .." added ".. days .." vip days to player ".. targetPlayer:getName())
	return true
end

addVip:groupType("god")
addVip:separator(" ")
addVip:register()
