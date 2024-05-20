-- Look README.md for see the reserved action/unique numbers

TeleportAction = {
	--[[
	[35001] = { -- The Cursed Crystal teleports
		itemId = 19387,
		itemPos = {
			{x = 31973, y = 32905, z = 10},
			{x = 31973, y = 32905, z = 11},
			{x = 32009, y = 32928, z = 10},
			{x = 32009, y = 32928, z = 9}
		}
	},
	-- Path: data\scripts\movements\quests\the_queen_of_the_banshees\movement(2)-second_seal_pearl.lua
	[35002] = {
		itemId = 1949,
		itemPos = {
			{x = 32176, y = 31869, z = 15},
			{x = 32177, y = 31869, z = 15}
		}
	}
	]]--
}

TeleportUnique = {
	-- The first dragon quest
	-- Path: data\scripts\movements\quests\first_dragon\entrance_teleport.lua
	-- Tazhadur entrance
	--[[
	[35001] = {
		itemId = 8649,
		itemPos = {x = 33234, y = 32276, z = 12}
	},
	-- Kalyassa entrance
	[35002] = {
		itemId = 8646,
		itemPos = {x = 33160, y = 31320, z = 5}
	},
	]]--
	
	
	--Exit Forge
	[38001] = {
		itemId = 775,
		itemPos = {x = 1003, y = 1049, z = 7},
		destination = {x = 991, y = 1210, z = 7},
		effect = CONST_ME_TELEPORT
	},
	--Entrance Forge
	[38002] = {
		itemId = 775,
		itemPos = {x = 977, y = 1210, z = 7},
		destination = {x = 1004, y = 1046, z = 7},
		effect = CONST_ME_TELEPORT
	},
}
