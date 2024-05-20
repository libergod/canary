local mType = Game.createMonsterType("Drogorion")
local monster = { }

monster.description = "Drogorion"
monster.experience = 45000
monster.outfit = {
	lookType = 303,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 50000
monster.maxHealth = 50000
monster.race = "blood"
monster.corpse = 0
monster.speed = 430
monster.manaCost = 670

monster.changeTarget = {
	interval = 6000,
	chance = 40
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
	convinceable = true,
	pushable = false,
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 10000,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "You know what, I changed my mind. BRING IT!", yell = false}
}

monster.loot = {
	{id = 3434, chance = 5230} -- vampire shield
}

monster.attacks = {
	{name ="melee", interval = 1500, chance = 100, skill = 120, attack = 120},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -50, maxDamage = -200, range = 1, radius = 1, effect = CONST_ME_SMALLCLOUDS, target = true},
	{name ="speed", interval = 2000, chance = 15, speedChange = -400, radius = 1, effect = CONST_ME_MAGIC_RED, target = false, duration = 60000}
}

monster.defenses = {
	defense = 55,
	armor = 35,
	{name ="outfit", interval = 2000, chance = 10, effect = CONST_ME_GROUNDSHAKER, target = false, duration = 5000, outfitMonster = "bat"},
	{name ="speed", interval = 2000, chance = 15, speedChange = 300, effect = CONST_ME_MAGIC_RED, target = false, duration = 3000},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 15, maxDamage = 25, target = false}
}

monster.elements = {
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = 20}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "invisible", condition = true},
	{type = "drown", condition = true}
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
