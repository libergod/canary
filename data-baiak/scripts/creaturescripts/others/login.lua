local playerLogin = CreatureEvent("PlayerLogin")

function playerLogin.onLogin(player)	
	-- RESTORE EXP SYSTEM
	local usrExist = db.storeQuery("SELECT `id` FROM `player_exp_restore` WHERE `id_player` = " .. player:getGuid() .. " LIMIT 1")
	if usrExist ~= false then
		local iduser = result.getDataInt(usrExist, 'id')
		result.free(usrExist)
		-- iduser (Id do user ja existente na tabela)
		local usrExpAtual = db.storeQuery("SELECT `experience` FROM `players` WHERE `id` = " .. player:getGuid() .. " LIMIT 1")
		if usrExpAtual ~= false then
			local usrExpAct = result.getDataInt(usrExpAtual, 'experience')
			result.free(usrExpAtual)
			-- usrExpAtual (exp do user atualmente)
			local canRestoreTst = db.storeQuery("SELECT `canRestore` FROM `player_exp_restore` WHERE `id_player` = " .. player:getGuid() .. " LIMIT 1")
			if canRestoreTst ~= false then
				local canRestoreTsts = result.getDataInt(canRestoreTst, 'canRestore')
				result.free(canRestoreTst)	
				if canRestoreTsts ~= -1 then
					db.query('UPDATE `player_exp_restore` SET `expAfter` = '..usrExpAct..' where `id_player`='..player:getGuid())
				end
			end
		end
	else	
		db.query(string.format("INSERT INTO `player_exp_restore`(`id_player`, `expBefore`, `expAfter`, `canRestore`) VALUES (%s, %s, %s, %s)", player:getGuid(), "-1", "-1", "-1"))
	end
	
	
	--[[
	if player:getStorageValue(RestoreExp.canRestore) == 1 then
		local expAtual = db.storeQuery("SELECT `experience` FROM `players` WHERE `id` = " .. player:getGuid() .. " LIMIT 1")
		if expAtual ~= false then
			local expuser = result.getDataInt(expAtual, 'experience')
			result.free(expAtual)
			player:setStorageValue(RestoreExp.xpAfter, expuser)
		end

		--player:setStorageValue(RestoreExp.xpAfter, player:getExperience())
	else
		player:setStorageValue(RestoreExp.xpBefore, -1)
		player:setStorageValue(RestoreExp.xpAfter, -1)
	end
	]]--

	if player:isPremium() then
		--player:setStorageValue(Storage.PremiumAccount, 1)
		player:say("[ONLINE]", TALKTYPE_MONSTER_SAY)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	
	-- Create SHOP file for users
	if not fileExist("data-baiak/npc/private_shop/ZSHOP - ".. player:getName() .. ".lua") then
		local fili = io.open("data-baiak/npc/private_shop/ZSHOP - ".. player:getName() .. ".lua", "w+")
		fili:close()
	end
	
	-- Eventos
	if player:getStorageValue(STORAGEVALUE_EVENTS) >= 1 then
		player:teleportTo(player:getTown():getTemplePosition())
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:setStorageValue(STORAGEVALUE_EVENTS, 0)
	end

	-- Tournaments Coin per Hour System
	Karin.EventCoin[player:getId()] = 0
	
	-- Dodge/Critical System
	if player:getDodgeLevel() == -1 then
		player:setDodgeLevel(0)
	end
	if player:getCriticalLevel() == -1 then
		player:setCriticalLevel(0)
	end
	
	-- Mining
	if player:getStorageValue(configMining.level.storageTentativas) == -1 or player:getStorageValue(configMining.level.storageNivel) == -1 then
		player:setStorageValue(configMining.level.storageTentativas, 0) -- Tentativas
		player:setStorageValue(configMining.level.storageNivel, 1) -- Level
	end
	
	-- Premium Ends Teleport to Temple, change addon (citizen) houseless
	local defaultTown = "Thunder City" -- default town where player is teleported if his home town is in premium area
	local freeTowns = {"Thunder City", "Jamila Island", "Akravi", "Al Arar", "Bhark", "Wintermere", "Shadow Wood"} -- towns in free account area

	if not player:isPremium() and not table.contains(freeTowns, player:getTown():getName()) then
		local town = player:getTown()
		local sex = player:getSex()
		local home = getHouseByPlayerGUID(getPlayerGUID(player))
		town = table.contains(freeTowns, town:getName()) and town or Town(defaultTown)
		player:teleportTo(town:getTemplePosition())
		player:setTown(town)
		player:sendTextMessage(MESSAGE_FAILURE, "Your premium time has expired.")

		if sex == 1 then
			player:setOutfit({ lookType = 128, lookFeet = 114, lookLegs = 134, lookHead = 114, lookAddons = 0 })
        elseif sex == 0 then
			player:setOutfit({ lookType = 136, lookFeet = 114, lookLegs = 134, lookHead = 114, lookAddons = 0 })
        end

		if home and not player:isPremium() then
            setHouseOwner(home, 0)
            player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, "You've lost your house because you are not premium anymore.")
			player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, "Your items from house are send to your inbox.")
        end
	end
	
	-- Open channels
	player:openChannel(3) -- World chat
	player:openChannel(5) -- Advertsing main
	if player:getGuild() then
		player:openChannel(0x00) -- guild
	end

	-- GUILD LEVEL SYSTEM
	local guild = player:getGuild()
	if guild then
		if player:getLevel() >= CONFIG_GUILD_LEVEL.minLevelToGetPoints then
			player:registerEvent('GuildLevelK')
		end
	  player:registerEvent('guildLevel_e')
	end	
	
	-- Maintain users Health/mana according to his vocation/promotion
	local vocation = player:getVocation()
	local level = player:getLevel()
	local debugact = false
	
	local bonusRebirth = 5
	bonusRebirth = bonusRebirth / 100
	
	--Spdlog.info("[REBORN NPC] - Bonus Rebirth: ".. (bonusRebirth*100) * player:getReborn()  .. "% Player Reborns: ".. player:getReborn() .. " Player Gain Mana: "..vocation:getManaGain().. " Player Health Gain: " ..vocation:getHealthGain().. " Player Get Cap: "..vocation:getCapacityGain())
	local mana = math.floor(90 * bonusRebirth)
	local health = math.floor(185 * bonusRebirth)
	local capMore = math.floor(47000 * bonusRebirth)
	
	if player:getReborn() > 0 then
		local supposedhealth = math.floor(185 + (vocation:getHealthGain() * (level-8)) + (health * player:getReborn()))
		local supposedmana = math.floor(90 + (vocation:getManaGain() * (level-8)) + (mana * player:getReborn()))
		local supposedcap = math.floor(47000 + (vocation:getCapacityGain() * (level-8)) + (capMore * player:getReborn()))
		if supposedhealth ~= math.floor(player:getMaxHealth()) then
			player:sendTextMessage(MESSAGE_ADMINISTRATOR , "Server detected your max health was wrongly set at " .. math.floor(player:getMaxHealth()) .. " and we adjusted it to " .. math.floor(supposedhealth) .. " automatically.")
			player:setMaxHealth(supposedhealth)
			player:addHealth(supposedhealth)
		end
		if supposedmana ~= math.floor(player:getMaxMana()) then
			player:sendTextMessage(MESSAGE_ADMINISTRATOR , "Server detected your max mana was wrongly set at " .. math.floor(player:getMaxMana()) .. " and we adjusted it to " .. math.floor(supposedmana) .. " automatically.")
			player:setMaxMana(supposedmana)
			player:addMana(supposedmana)
		end
		if supposedcap ~= math.floor(player:getCapacity()) then
			player:sendTextMessage(MESSAGE_ADMINISTRATOR , "Server detected your max capacity was wrongly set at " .. math.floor(player:getCapacity() / 100) .. " and we adjusted it to " .. math.floor(supposedcap/100) .. " automatically.")
			player:setCapacity(supposedcap)
		end
		
		if debugact then
			player:sendTextMessage(MESSAGE_ADMINISTRATOR , "For level " .. player:getLevel() .. ", your max HP should be: " .. supposedhealth .. " max mana should be: " .. supposedmana .. " max cap should be: " .. supposedcap .. ".")
		end
	else
		local supposedhealth = math.floor(185 + (vocation:getHealthGain() * (level-8)))
		local supposedmana = math.floor(90 + (vocation:getManaGain() * (level-8)))
		local supposedcap = math.floor(47000 + (vocation:getCapacityGain() * (level-8)))
		if supposedhealth ~= math.floor(player:getMaxHealth()) then
			player:sendTextMessage(MESSAGE_ADMINISTRATOR , "Server detected your max health was wrongly set at " .. math.floor(player:getMaxHealth()) .. " and we adjusted it to " .. supposedhealth .. " automatically.")
			player:setMaxHealth(supposedhealth)
			player:addHealth(supposedhealth)
		end
		if supposedmana ~= math.floor(player:getMaxMana()) then
			player:sendTextMessage(MESSAGE_ADMINISTRATOR , "Server detected your max mana was wrongly set at " .. math.floor(player:getMaxMana()) .. " and we adjusted it to " .. supposedmana .. " automatically.")
			player:setMaxMana(supposedmana)
			player:addMana(supposedmana)
		end
		if supposedcap ~= math.floor(player:getCapacity()) then
			player:sendTextMessage(MESSAGE_ADMINISTRATOR , "Server detected your max capacity was wrongly set at " .. math.floor(player:getCapacity() / 100) .. " and we adjusted it to " .. supposedcap/100 .. " automatically.")
			player:setCapacity(supposedcap)
		end
		
		if debugact then
			player:sendTextMessage(MESSAGE_ADMINISTRATOR , "For level " .. player:getLevel() .. ", your max HP should be: " .. supposedhealth .. " max mana should be: " .. supposedmana .. " max cap should be: " .. supposedcap .. ".")
		end
	end
	-- end maintain users health/mana according to his vocation/promotion
	
	-- start Dodge/Critial System
	
	player:sendTextMessage(MESSAGE_ADMINISTRATOR , "You currently have: " .. (player:getCriticalLevel() / 1000) * 100 .. "%, more Critical Damage and " .. (player:getDodgeLevel() / 1000) * 100 .. "% more Dodge Chance.")
	
	-- end Dodge/Critical System
	
	-- Recruiter system
	local resultId = db.storeQuery('SELECT `recruiter` from `accounts` where `id`='..getAccountNumberByPlayerName(getPlayerName(player)))
	local recruiterStatus = Result.getNumber(resultId, 'recruiter')
	local sex = player:getSex()
	if recruiterStatus >= 1 then
		if sex == 1 then
			local outfit = player:hasOutfit(746)
			if outfit == false then
				player:addOutfit(746)
			end
		else
			local outfit = player:hasOutfit(745)
			if outfit == false then
				player:addOutfit(745)
			end
		end
	end
	if recruiterStatus >= 3 then
		if sex == 1 then
			local outfit = player:hasOutfit(746,1)
			if outfit == false then
				player:addOutfitAddon(746,1)
			end
		else
			local outfit = player:hasOutfit(745,1)
			if outfit == false then
				player:addOutfit(745,1)
			end
		end
	end
	if recruiterStatus >= 10 then
		if sex == 1 then
			local outfit = player:hasOutfit(746,2)
			if outfit == false then
				player:addOutfitAddon(746,2)
			end
		else
			local outfit = player:hasOutfit(745,2)
			if outfit == false then
				player:addOutfit(745,2)
			end
		end
	end
	-- End recruiter system

	local playerId = player:getId()
	DailyReward.init(playerId)

	player:loadSpecialStorage()

	-- LOGIN AS GHOST USING GOD/GM ACCOUNT
	if player:getGroup():getId() >= GROUP_TYPE_GAMEMASTER then
		--player:setGhostMode(true)
	end

	-- Boosted creature
	player:sendTextMessage(MESSAGE_BOOSTED_CREATURE, "Today's boosted creature: " .. Game.getBoostedCreature() .. " \
	Boosted creatures yield more experience points, carry more loot than usual and respawn at a faster rate.")
	
	-- Boosted boss
	player:sendTextMessage(MESSAGE_BOOSTED_CREATURE, "Today's boosted boss: " .. Game.getBoostedBoss() .. " \
	Boosted bosses contain more loot and count more kills for your Bosstiary.")

	if SCHEDULE_EXP_RATE ~= 100 then
		if SCHEDULE_EXP_RATE > 100 then
			player:sendTextMessage(MESSAGE_BOOSTED_CREATURE, "Exp Rate Event! Monsters yield more experience points than usual \
			Happy Hunting!")
		else
			player:sendTextMessage(MESSAGE_BOOSTED_CREATURE, "Exp Rate Decreased! Monsters yield less experience points than usual.")
		end
	end

	if SCHEDULE_SPAWN_RATE ~= 100 then
		if SCHEDULE_SPAWN_RATE > 100 then
			player:sendTextMessage(MESSAGE_BOOSTED_CREATURE, "Spawn Rate Event! Monsters respawn at a faster rate \
			Happy Hunting!")
		else
			player:sendTextMessage(MESSAGE_BOOSTED_CREATURE, "Spawn Rate Decreased! Monsters respawn at a slower rate.")
		end
	end

	if SCHEDULE_LOOT_RATE ~= 100 then
		if SCHEDULE_LOOT_RATE > 100 then
			player:sendTextMessage(MESSAGE_BOOSTED_CREATURE, "Loot Rate Event! Monsters carry more loot than usual \
			Happy Hunting!")
		else
			player:sendTextMessage(MESSAGE_BOOSTED_CREATURE, "Loot Rate Decreased! Monsters carry less loot than usual.")
		end
	end

	if SCHEDULE_SKILL_RATE ~= 100 then
		if SCHEDULE_SKILL_RATE > 100 then
			player:sendTextMessage(MESSAGE_BOOSTED_CREATURE, "Skill Rate Event! Your skills progresses at a higher rate \
			Happy Hunting!")
		else
			player:sendTextMessage(MESSAGE_BOOSTED_CREATURE, "Skill Rate Decreased! Your skills progresses at a lower rate.")
		end
	end
	
	-- Attempt to check if we're in a hazard zone
	player:updateHazard()
	
	-- Loyalty system
	player:initializeLoyaltySystem()
	

	if (player:getAccountType() == ACCOUNT_TYPE_TUTOR) then
	local msg = [[:: Tutor Rules
		1 *> 3 Warnings you lose the job.
		2 *> Without parallel conversations with players in Help, if the player starts offending, you simply mute it.
		3 *> Be educated with the players in Help and especially in the Private, try to help as much as possible.
		4 *> Always be on time, if you do not have a justification you will be removed from the staff.
		5 *> Help is only allowed to ask questions related to tibia.
		6 *> It is not allowed to divulge time up or to help in quest.
		7 *> You are not allowed to sell items in the Help.
		8 *> If the player encounters a bug, ask to go to the website to send a ticket and explain in detail.
		9 *> Always keep the Tutors Chat open. (required).
		10 *> You have finished your schedule, you have no tutor online, you communicate with some CM in-game
		or ts and stay in the help until someone logs in, if you can.
		11 *> Always keep a good Portuguese in the Help, we want tutors who support, not that they speak a satanic ritual.
		12 *> If you see a tutor doing something that violates the rules, take a print and send it to your superiors. "
		- Commands -
		Mute Player: /mute nick, 90 (90 seconds)
		Unmute Player: /unmute nick.
		- Commands -]]
		player:popupFYI(msg)
	end

	-- Rewards
	local rewards = #player:getRewardList()
	if(rewards > 0) then
		player:sendTextMessage(MESSAGE_LOGIN, string.format("You have %d %s in your reward chest.",
		rewards, rewards > 1 and "rewards" or "reward"))
	end

	-- Update player id
	local stats = player:inBossFight()
	if stats then
		stats.playerId = player:getId()
	end

	-- Set Client XP Gain Rate --
	if configManager.getBoolean(configKeys.XP_DISPLAY_MODE) then
		local baseRate = player:getFinalBaseRateExperience()
		player:setBaseXpGain(baseRate * 100)
	else
		local baseRate = player:getFinalBaseRateExperience()
		player:setBaseXpGain(baseRate)
	end

	local staminaBonus = player:getFinalBonusStamina()
	player:setStaminaXpBoost(staminaBonus * 100)

	player:getFinalLowLevelBonus()

	return true
end

playerLogin:register()
