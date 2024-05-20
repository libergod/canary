local mType = Game.createMonsterType("Guard")
local monster = { }

monster.description = "a guard"
monster.experience = 0
monster.outfit = {
	lookType = 57,
	lookHead = 94,
	lookBody = 114,
	lookLegs = 57,
	lookFeet = 94,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 3334
monster.Bestiary = {
	class = "Fey",
	race = BESTY_RACE_FEY,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Feyrist (nighttime) and its underground (all day)."
	}

monster.health = 10000
monster.maxHealth = 10000
monster.race = "blood"
monster.corpse = 6080
monster.speed = 230
monster.manaCost = 0
monster.maxSummons = 0

monster.faction = FACTION_WOE_OWNER --4
monster.enemyFactions = {FACTION_PLAYER, FACTION_WOE_ENEMY} --1 and 5

monster.changeTarget = {
	interval = 4000,
	chance = 10
}


monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10
}

monster.respawnType = {
	period = RESPAWNPERIOD_NIGHT,
	underground = true
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 20,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "How you dare enter our castle!", yell = false},
	{text = "Emps will triumph !", yell = false},
	{text = "Get out now or DIE!", yell = false}
}


monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 10, maxDamage = -515},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -60, maxDamage = -315, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true},
	{name ="drunk", interval = 2000, chance = 11, length = 4, spread = 2, effect = CONST_ME_SOUND_PURPLE, target = false, duration = 25000},
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -200, range = 7, shootEffect = CONST_ANI_LEAFSTAR, target = false}
}

monster.defenses = {
	defense = 20,
	armor = 30
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 70},
	{type = COMBAT_FIREDAMAGE, percent = -5},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 40}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}


mType:register(monster)