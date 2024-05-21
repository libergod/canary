local mType = Game.createMonsterType("The Mega Magmaoid")
local monster = {}

monster.description = "The Mega Magmaoid"
monster.experience = 80000
monster.outfit = {
	lookType = 1413,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.events = {
	"dodgeCriticalThree",
	"dodgeCriticalOne",
	"dodgeCriticalTwo",
}

monster.health = 104000 
monster.maxHealth = 104000 
monster.race = "blood"
monster.corpse = 36847
monster.speed = 115
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.bosstiary = {
	bossRaceId = 2060,
	bossRace = RARITY_ARCHFOE,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.summon = {
	maxSummons = 2,
	summons = {
		{name = "Blasting Flame", chance = 30, interval = 3000},
	}
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{id = 3043, chance = 100000, minCount = 1, maxCount = 3}, -- crystal coin
	{id = 3035, chance = 55000, minCount = 1, maxCount = 39}, -- platinum coin
	{id = 7642, chance = 40000, minCount = 1, maxCount = 19}, -- great spirit potion
	{id = 7643, chance = 40000, minCount = 1, maxCount = 19}, -- ultimate health potion
	{id = 239, chance = 30000, minCount = 1, maxCount = 19}, -- great health potion
	{id = 238, chance = 30000, minCount = 1, maxCount = 19}, -- great mana potion
	{id = 23373, chance = 25000, minCount = 1, maxCount = 19}, -- ultimate mana potion
	{id = 7440, chance = 22000, minCount = 1, maxCount = 9}, -- mastermind potion
	{id = 7443, chance = 20000, minCount = 1, maxCount = 9} -- bullseye potion
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -200, maxDamage = -550},
	
	{name ="combat", interval = 3000, chance = 30, type = COMBAT_FIREDAMAGE, minDamage = -680, maxDamage = -860, range = 7, radius = 5, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	
	{name ="brainhead firewave", interval = 1800, chance = 30, minDamage = -515, maxDamage = -665, target = false}
}

monster.defenses = {
	defense = 60,
	armor = 82,
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = -10}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType:register(monster)