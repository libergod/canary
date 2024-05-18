RestoreExp = {
	xpBefore = 90004,
	xpAfter = 90005,
	canRestore = 90006,
}

ENGLISH = 2
SPANISH = 1
PORTUGUES = 0

function Player.getOnlineTime(self)
    local resultId = db.storeQuery(string.format('SELECT online_time FROM `players` WHERE `id` = %d', self:getGuid()))
    if not resultId then
        return 0
    end

    local value = result.getNumber(resultId, "online_time")
    result.free(resultId)
    return value
end

function Player.addOnlineTime(self, amount)
    db.query(string.format("UPDATE `players` SET `online_time` = `online_time` + %d WHERE `id` = %d", amount, self:getGuid()))
end

function Player.restartOnlineTime(self)
    db.query(string.format("UPDATE `players` SET `online_time` = %d WHERE `id` = %d", 0, self:getGuid()))
end

function Player.addToMonthTime(self)

    db.query(string.format("UPDATE `players` SET `online_time_month` = `online_time` + `online_time_month` WHERE `id` = %d", self:getGuid()))
end

DUNGEON_SYSTEM = {

	Storages = {
		timerDungeon = 49356,
		timerCooldown = 50203,
		storageReward = 50205,
	},
	
	Modal = {
		IDType = 2049,
		TitleType = "Type Dungeon, by: Tataboy67",
		MsgType = "Select this type:",
	
		ID = 2050,
		Title = "Dungeon System, by: Tataboy67!",
		Msg = "Select your Dungeon:",
		
		IDDetails = 2051,
		TitleDetails = "Details Dungeon",
	},
	
	Messages = {
		ToEntry = "Welcome to Dungeon",
		ToFail = "Dungeon finished by the time. \n\nThank you for playing!",
		
		WaitFriendsCooldown = "Wait your friend: %s",
		ToCooldown = "You're in cooldown to enter in a dungeon again. Cooldown: %s.",
		MsgNeedLevel = "You don't have level required. You need level %s.",
		MsgUniqueNeedParty = "You need party, to entry in dungeon",
		MsgNeedParty = "You need to be at a party to enter the dungeon. You need %s players",
		MsgLeaderParty = "You are not the leader of the Party.",
		
		MsgDistanceLeader = "Your friends need to be close to you.",
		
		NeedPzSoloMsg = "You need to be in a safe area [PZ].",
		NeedPzMsg = "Your team needs to go a safe area [PZ].",
	
		PlayerInside = "Already has inside.",
	},
	
	CooldownTime = 1,
	
	PzToEntry = true,
	
	SQMsDistanceOfLeader = 5,

	Dungeons = {

		[1] = {
			-- Name
			Name = "Diabolic Hyper",
			
			-- Party
			NeedParty = true,
			AmountParty = 2,
			
			-- Level
			NeedLevel = false,
			Level = 50,
						
			-- Dungeon
			DungeonTime = 10, -- 5 min, 30 seconds
			DungeonPos = Position(1165, 934, 7),

			-- Position Dungeon
			FromPos = {x = 1161, y = 930, z = 7}, 	-- Position /\ < from the dungeon
			ToPos = {x = 1226, y = 940, z = 7},		-- Position \/ > from the dungeon
			
			SpawnMonsters = true,
			Monsters = {
				["Demon"] = Position(1170, 934, 7),
				["Rat"] = Position(1170, 935, 7),
				["Hydra"] = Position(1167, 932, 7),
			},
			
		},
		
		[2] = {
			-- Name
			Name = "Supreme Rat's",
			
			-- Party
			NeedParty = false,
			AmountParty = 1,
			
			-- Level
			NeedLevel = false,
			Level = 50,
						
			-- Dungeon
			DungeonTime = 300, -- seconds
			DungeonPos = Position(1930, 1615, 8),

			-- Position Dungeon
			FromPos = {x = 1828, y = 1506, z = 8}, 	-- Position /\ < from the dungeon
			ToPos = {x = 1959, y = 1624, z = 8},		-- Position \/ > from the dungeon
			
			SpawnMonsters = true,
			Monsters = {
				["Demon"] = Position(1170, 934, 7),
				["Rat"] = Position(1170, 935, 7),
				["Hydra"] = Position(1167, 932, 7),
			},
			
		},
		
		[3] = {
			-- Name
			Name = "Triple",
			
			-- Party
			NeedParty = true,
			AmountParty = 3,
			
			-- Level
			NeedLevel = false,
			Level = 50,
						
			-- Dungeon
			DungeonTime = 10, -- 5 min, 30 seconds
			DungeonPos = Position(1165, 934, 7),

			-- Position Dungeon
			FromPos = {x = 1161, y = 930, z = 7}, 	-- Position /\ < from the dungeon
			ToPos = {x = 1226, y = 940, z = 7},		-- Position \/ > from the dungeon
			
			SpawnMonsters = true,
			Monsters = {
				["Demon"] = Position(1170, 934, 7),
				["Rat"] = Position(1170, 935, 7),
				["Hydra"] = Position(1167, 932, 7),
			},
			
		},

	},
	
}
