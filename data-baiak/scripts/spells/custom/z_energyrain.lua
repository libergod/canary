local config = {
    combat = COMBAT_ENERGYDAMAGE,
    distanceEffect = 25,
    rounds = 4,
    delay = 250,
    firstEffect = 38,
    secondEffect = 41
}

local acombat, combat = createCombatObject(), createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, config.combat)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, config.combat)

local arr1 = {
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
}

setCombatArea(combat2, createCombatArea(arr1))
setCombatArea(acombat, createCombatArea(arr1))

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 2) + (maglevel * 2.1) + 35
	local max = (level / 2) + (maglevel * 2.3) + 55
	return -min, -max
end

combat2:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")


function onGetFormulaValues(player, level, maglevel)
	local min = 0
	local max = 0
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")


local effect = {config.firstEffect,config.secondEffect}
function onTargetTile(cid, pos)
    return math.random(2) == 1 and pos:sendMagicEffect(effect[math.random(#effect)]) and  doSendDistanceShoot({ x = pos.x - 7, y = pos.y - 7, z = pos.z}, pos, 36) and doCombat(cid, combat, positionToVariant(pos))
end

setCombatCallback(acombat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

local function doTimeCombat(cid, combat, var)
     if isPlayer(cid) then
         doCombat(cid, combat, var)
         doCombat(cid, combat2, var)
     end
     return true
end


local spell = Spell("instant")

function spell.onCastSpell(cid, var)

    local player = Player(cid)
     for x = 1, config.rounds do
         addEvent(doTimeCombat, (x-1) * config.delay, cid.uid, acombat, var)
     end
     return true
end


spell:name("Energy Rain")
spell:words("exevo gran mas energy")
spell:group("attack")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
spell:impactSound(SOUND_EFFECT_TYPE_SPELL_ULTIMATE_ENERGY_STRIKE)
spell:vocation("sorcerer", "master sorecerer")
spell:id(802)
spell:level(500)
spell:range(6)
spell:mana(900)
spell:needTarget(false)
spell:blockWalls(true)
spell:isSelfTarget(true)
spell:isPremium(true)
spell:cooldown(40 * 1000)
spell:groupCooldown(4 * 1000, 40 * 1000)
spell:register()