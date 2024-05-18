-- guild:getPoints()
-- guild:setPoints(amount)
-- guild:getLevel()
-- guild:setLevel(amount)

-- BONUS
GUILD_LEVEL_BONUS_EXP = 1
GUILD_LEVEL_BONUS_LOOT = 2
GUILD_LEVEL_BONUS_HEALTH = 0
GUILD_LEVEL_BONUS_MANA = 0
GUILD_LEVEL_BONUS_ELEMENTAL = 1

-- OBTAINING POINTS
--GUILD_LEVEL_POINTS_MONSTER = 1
--GUILD_LEVEL_POINTS_BOSS = 2

CONFIG_GUILD_LEVEL = {
	quantityToLevel = 1000, -- points to next level
	maxLevel = 100, -- guild level limit
	minLevelToGetPoints = 100,
	rewards = {-- level, type of the reward and bonus quantity
		[1] = {level = 1, type = nil, quantity = nil},
		[2] = {level = 10, type = GUILD_LEVEL_BONUS_EXP, quantity = 0.02},-- 2% XP
		[3] = {level = 20, type = GUILD_LEVEL_BONUS_LOOT, quantity = 0.02}, -- 2% LOOT
		[4] = {level = 35, type = GUILD_LEVEL_BONUS_EXP, quantity = 0.05}, -- 5% EXP
		[5] = {level = 50, type = GUILD_LEVEL_BONUS_LOOT, quantity = 0.05}, -- 5% LOOT
		[6] = {level = 60, type = GUILD_LEVEL_BONUS_EXP, quantity = 0.03}, -- 3% EXP
		[7] = {level = 75, type = GUILD_LEVEL_BONUS_LOOT, quantity = 0.03}, -- 3% LOOT
		[8] = {level = 90, type = GUILD_LEVEL_BONUS_ELEMENTAL, quantity = 0.05},  -- 5% ELEMENTAL RESISTANCE
		[9] = {level = 95, type = GUILD_LEVEL_BONUS_ELEMENTAL, quantity = 0.5}, -- 5% ELEMENTAL RESISTANCE
		[10] = {level = 100, type = GUILD_LEVEL_BONUS_ELEMENTAL, quantity = 0.5} -- 5% ELEMENTAL RESISTANCE
	}
}

CONFIG_GUILD_MONSTERS = {
	minMonsterExp = 10,
	type = {
		["monster"] = {pts = 1},
		["boss"] = {pts = 250},
	},
	killingPlayer = {level = 150, pts = 120, msg = "[Guild System] The player %s killed someone above level 150 and earned %d points for your guild!"}
}

function Guild.getGuildLevel(self)
	return self:getLevel()
end

function Guild.getGuildPoints(self)
	return self:getPoints()
end

function getReward(cid)
	local player = Player(cid)
	local rewardTable = { }
	if player then
		local g = player:getGuild()
		if g then
			for i = 1, #CONFIG_GUILD_LEVEL.rewards do
				if g:getGuildLevel() >= CONFIG_GUILD_LEVEL.rewards[i].level then
					rewardTable[i] = CONFIG_GUILD_LEVEL.rewards[i]
				end
			end
			return rewardTable
		else
			return true
		end
	end
end

function Guild.setGuildLevel(self, amount)
	local old = self:getGuildLevel()
	local g_name = self:getName()
	if amount > CONFIG_GUILD_LEVEL.maxLevel then
		return error(">> The level must be under "..CONFIG_GUILD_LEVEL.maxLevel..".")
	elseif amount < 1 then
		return error(">> The level must be higher or equals than 1.")
	else
		self:setLevel(amount)
		local new = self:getGuildLevel()
		print("Level from guild "..g_name.." changed from ["..old.."] to ["..new.."].")
	end
	return true
end

function Guild.setGuildPoints(self, amount)
	local g_name = self:getName()
	if amount > CONFIG_GUILD_LEVEL.quantityToLevel then
		amount = CONFIG_GUILD_LEVEL.quantityToLevel
	elseif amount < 0 then
		return error(">> The value must be higher than 0.")
	end
	self:setPoints(amount)
	return true
end

function mustLevelUp(gid)
	local guild = Guild(gid)
	if guild then
		if guild:getGuildPoints() >= CONFIG_GUILD_LEVEL.quantityToLevel then
			guild:setGuildLevel(guild:getGuildLevel() + 1)
			guild:setGuildPoints(0)
			broadcastMessage('[Guild System]\n The guild '..guild:getName()..' just levelled up to level '..guild:getGuildLevel()..'!\n Congratulations!')
		end
	else
		error(">> Cannot find a guild with this id.")
	end
end

function sendKillingPoints(cid, type)
	local creature = Creature(cid)
	local p_block = { }
	for _, k in pairs(CONFIG_GUILD_MONSTERS.type) do
		if _ == type then
			for creatureid, damage in pairs(creature:getDamageMap()) do
				local p = Creature(creatureid)
				if p and (p:isPlayer() and p:getGuild()) then
					local guild = Guild(p:getGuild():getId())
					if guild then
						if not isInArray(p_block, guild:getId()) then
							guild:setGuildPoints(guild:getGuildPoints() + k.pts)
							if guild:getGuildLevel() < CONFIG_GUILD_LEVEL.maxLevel then
								mustLevelUp(guild:getId()) -- check if the guild will level up or not
							end
							table.insert(p_block, guild:getId())
				 -- add the guild into a table to block if someone from the same guild give damage on the same monster
						end
					end
				end
			end
		end
	end
	return true
end
