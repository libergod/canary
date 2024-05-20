--[[
	Look README.md for see the reserved action/unique numbers
	From range 5000 to 6000 is reserved for keys chest
	From range 6001 to 472 is reserved for script reward
	Path: data\scripts\actions\Global\system\quest_reward_common.lua

	From range 473 to 15000 is reserved for others scripts (varied rewards)

	There is no need to tamper with the chests scripts, just register a new table and configure correctly
	So the quest will work in-game

	Example:
	[xxxx] = {
		-- For use of the map
		itemId = xxxx,
		itemPos = {x = xxxxx, y = xxxxx, z = x},
		-- For use of the script
		container = xxxx (it's for use reward in a container, only put the id of the container here)
		keyAction = xxxx, (it's for use one key in the chest and is reward in container, only put the key in reward and action here)
		reward = {{xxxx, x}},
		storage = xxxxx
	},

	Note:
	The "for use of the map" variables are only used to create the action or unique on the map during startup
	If the reward is an key, do not need to use "keyAction", only set the storage as same action id

	The "for use of the script" variables are used by the scripts
	To allow a single script to manage all rewards
]]

ChestAction = {
	--[[[false] = {
		itemId = false,
		itemPos = {
			{x = 33057, y = 31029, z = 7},
			{x = 33055, y = 31029, z = 7},
			{x = 33053, y = 31029, z = 7}
		}
	},]]--
	-- Keys quest
	--[[[5000] = {
		itemId = xxxx,
		itemPos = {
			{x = xxxxx, y = xxxxx, z = x},
			{x = xxxxx, y = xxxxx, z = x}
		},
		action = xxxx,
		reward = {{xxxx, 1}},
		storage = storage
	},]]--
	-- The New Frontier Quest
	--[[
	[5001] = { -- Reward Outfit
		itemId = 5862,
		itemPos = {
			{x = 33053, y = 31020, z = 7}
		}
	}]]--

}

ChestUnique = {
	-- Keys quest
	-- data\scripts\actions\system\quest_reward_key.lua
	--[[
	[5000] = {
		isKey = true,
		itemId = 387,
		itemPos = {x = 32219, y = 32401, z = 10},
		reward = {{2972, 1}},
		storage = Storage.Quest.Key.ID3980
	},
	[5001] = {
		isKey = true,
		itemId = 1777,
		itemPos = {x = 32652, y = 32107, z = 7},
		reward = {{2969, 1}},
		storage = Storage.Quest.Key.ID4055
	},
	[5002] = {
		isKey = true,
		itemId = 2434,
		itemPos = {x = 32068, y = 31895, z = 3},
		reward = {{21392, 1}},
		storage = Storage.Quest.Key.ID0010
	}]]--

}
