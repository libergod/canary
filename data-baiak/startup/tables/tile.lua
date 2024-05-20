-- Look README.md for see the reserved action/unique numbers

TileAction = {
	-- Cure poison tiles at dawnport outpost entrances
	-- Tiles data\scripts\movements\others\dawnport_tiles.lua
	--[[
	[20001] = {
		itemId = 416,
		itemPos = {
			{x = 32064, y = 31881, z = 5},
			{x = 32065, y = 31881, z = 5},
			{x = 32074, y = 31890, z = 5},
			{x = 32074, y = 31891, z = 5},
			{x = 32064, y = 31900, z = 5},
			{x = 32065, y = 31900, z = 5},
			{x = 32056, y = 31890, z = 5},
			{x = 32056, y = 31891, z = 5}
		}
	},
	]]--
}

TileUnique = {
	-- Lions rock quest (gems tile) scripts/actions/other/gems
	--[[
	[25006] = {
		itemId = 21441,
		itemPos = {x = 33069, y = 32298, z = 9}
	},
	[25007] = {
		itemId = 21442,
		itemPos = {x = 33069, y = 32302, z = 9}
	},
	[29003] = {
		itemId = 431,
		itemPos = {x = 32794, y = 31595, z = 5},
		targetPos = {x = 32796, y = 31576, z = 5},
		targetItem = 1270
	}
	]]--
}
