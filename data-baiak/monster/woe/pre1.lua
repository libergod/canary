local mType = Game.createMonsterType("PreEmpes")
local monster = { }

monster.description = "a pre empe"
monster.experience = 0
monster.outfit = {
	lookTypeEx = 2034,
	lookType = 0,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 3335
monster.Bestiary = {
	class = "Fey",
	race = BESTY_RACE_FEY,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 50,
	Stars = 3,
	Occurrence = 0,
	Locations = "Pre Empes at WoE event."
	}

monster.health = 25000
monster.maxHealth = 25000
monster.race = "blood"
monster.corpse = 2034
monster.speed = 0
monster.manaCost = 0
monster.maxSummons = 0

monster.faction = FACTION_WOE_OWNER --4
monster.enemyFactions = {FACTION_PLAYER, FACTION_WOE_ENEMY} --1 and 5

monster.changeTarget = {
	interval = 4000,
	chance = 1
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
	rewardBoss = false,
	illusionable = false,
	canPushItems = false,
	canPushCreatures = true,
	staticAttackChance = 95,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
	pet = false
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -991},
	{name ="combat", interval = 2000, chance = 40, type = COMBAT_PHYSICALDAMAGE, minDamage = -250, maxDamage = -500, range = 7, radius = 6, effect = CONST_ME_HITAREA, target = false},
	{name ="combat", interval = 3000, chance = 34, type = COMBAT_PHYSICALDAMAGE, minDamage = -120, maxDamage = -500, range = 7, radius = 1, shootEffect = CONST_ANI_WHIRLWINDSWORD, target = true},
	{name ="combat", interval = 4000, chance = 30, type = COMBAT_ENERGYDAMAGE, minDamage = -100, maxDamage = -800, length = 8, spread = 3, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -480, range = 14, radius = 5, effect = CONST_ME_POFF, target = false},
	{name ="combat", interval = 4000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -100, maxDamage = -650, range = 7, radius = 13, effect = CONST_ME_BLOCKHIT, target = false},
	{name ="combat", interval = 4000, chance = 18, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -600, radius = 14, effect = CONST_ME_LOSEENERGY, target = false},
	{name ="combat", interval = 3000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -750, range = 7, radius = 4, effect = CONST_ME_ENERGYAREA, target = false}
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "COME AND GIVE ME SOME AMUSEMENT", yell = false},
	{text = "IS THAT THE BEST YOU HAVE TO OFFER, TIBIANS?", yell = true},
	{text = "I NEED HELP!.", yell = true},
	{text = "FLAWLESS VICTORY!", yell = true}
}

monster.defenses = {
	defense = 10,
	armor = 10
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 70},
	{type = COMBAT_FIREDAMAGE, percent = -15},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 80},
	{type = COMBAT_HOLYDAMAGE , percent = 30},
	{type = COMBAT_DEATHDAMAGE , percent = 20}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

monster.events = {
"Emp_Dmg",
"Pre_Empes",
"Empr_Dmg"
}

mType:register(monster)
