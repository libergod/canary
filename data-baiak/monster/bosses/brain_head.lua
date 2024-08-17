local mType = Game.createMonsterType("Brain Head")
local monster = {}

monster.name = "Brain Head"
monster.description = "Brain Head"
monster.experience = 50000
monster.outfit = {
	lookTypeEx = 32418,
	lookType = 0,
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
	"brainHeadHeal",
}

monster.health = 230000
monster.maxHealth = monster.health
monster.race = "undead"
monster.corpse = 32272
monster.speed = 0
monster.manaCost = 0
monster.maxSummons = 0

monster.bosstiary = {
	bossRaceId = 1862, -- 
	bossRace = RARITY_ARCHFOE,
}

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.loot = {
	{ name = "crystal coin", chance = 96300, maxCount = 3 },
	{ name = "diamond", chance = 55560, maxCount = 2 },
	{ name = "ultimate mana potion", chance = 51850, maxCount = 6 },
	{ name = "white gem", chance = 51850, maxCount = 2 },
	{ name = "supreme health potion", chance = 29630 },
	{ name = "mastermind potion", chance = 22220 },
	{ name = "cursed bone", chance = 22220 },
	{ name = "berserk potion", chance = 18520 },
	{ name = "death toll", chance = 18520, maxCount = 2 },
	{ name = "ivory comb", chance = 18520 },
	{ name = "bullseye potion", chance = 14810, maxCount = 10 },
	{ name = "ultimate spirit potion", chance = 14810, maxCount = 6 },
	{ name = "moonstone", chance = 14810 },
	{ name = "spooky hood", chance = 8520 },
	{ name = "silver hand mirror", chance = 7410 },
	{ name = "amber with a dragonfly", chance = 7410 },
	{ name = "phantasmal axe", chance = 3700 },
	{ name = "ghost claw", chance = 3700 },
	{ name = "giant amethyst", chance = 3700 },
	{ id = 32621, chance = 3200 }, -- ring of souls
}

monster.attacks = {

	{ name = "combat", type = COMBAT_DEATHDAMAGE, interval = 2000, chance = 80, minDamage = -700, maxDamage = -1200, effect = CONST_ME_MORTAREA, shootEffect = CONST_ANI_SUDDENDEATH, target = true, range = 7 },
	{ name = "combat", type = COMBAT_LIFEDRAIN, interval = 2000, chance = 20, length = 8, spread = 0, minDamage = -900, maxDamage = -1300, effect = CONST_ME_ELECTRICALSPARK },

	{name ="melee", interval = 2000, chance = 100, minDamage = -200, maxDamage = -550},
	
	{name ="combat", interval = 3000, chance = 30, type = COMBAT_FIREDAMAGE, minDamage = -680, maxDamage = -860, range = 7, radius = 5, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	
	{name ="brainhead firewave", interval = 1800, chance = 30, minDamage = -515, maxDamage = -665, target = false},
	
	{name ="brainhead wave energy", interval = 2000, chance = 20, minDamage = -400, maxDamage = -550, target = false}
}

monster.defenses = {
	defense = 78,
	armor = 78,
	mitigation = 3.27,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -30 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "invisible", condition = true },
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Feel the power of death unleashed!", yell = false },
	{ text = "I will rule again and my realm of death will span the world!", yell = false },
	{ text = "My lich-knights will conquer this world for me!", yell = false },
}

mType.onThink = function(monster, interval)
end

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType.onDisappear = function(monster, creature)
end

mType.onMove = function(monster, creature, fromPosition, toPosition)
end

mType.onSay = function(monster, creature, type, message)
end

mType:register(monster)
