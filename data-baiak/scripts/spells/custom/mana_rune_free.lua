local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

local rune = Spell("rune")

function rune.onCastSpell(creature, var, isHotkey)
	if Monster(var:getNumber(1073762188)) then
		creature:sendCancelMessage("Sorry, not possible.")
		creature:getPosition():sendMagicEffect(CONST_ME_POFF)
	return false
	else
		local min = (creature:getLevel() / 5) + (creature:getMagicLevel() * 7.3) + 42
		local max = (creature:getLevel() / 5) + (creature:getMagicLevel() * 12.4) + 90
		local random = math.random(min,max)
		local player = Player(var:getNumber())
		player:addMana(random, true)
		--player:say("Aaaah...", TALKTYPE_MONSTER_SAY)
		player:getPosition():sendMagicEffect(13)
		return combat:execute(creature, var)
	end
end

rune:group("healing")
rune:name("mana rune free")
rune:runeId(3163)
rune:allowFarUse(true)
rune:charges(1)
rune:level(300)
rune:magicLevel(20)
rune:cooldown(1 * 1000)
rune:isAggressive(false)
rune:needTarget(true)
rune:isBlocking(true) -- True = Solid / False = Creature
rune:register()