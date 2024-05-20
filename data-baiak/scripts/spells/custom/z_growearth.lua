local config = {
    type = COMBAT_EARTHDAMAGE,
    effect = 51, --
    effect2 = 55, --
    distance = 46, -- Distance effect
    rounds = 4, -- How many rounds
    time = 250 -- How fast it should be
}

local combat = Combat()
local combat2 = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, config.type)
combat:setParameter(COMBAT_PARAM_EFFECT, config.effect2)
combat2:setParameter(COMBAT_PARAM_TYPE, config.type)
combat2:setParameter(COMBAT_PARAM_EFFECT, config.effect)

local area = {
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
{ 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0 },
{ 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0 },
{ 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0 },
{ 0, 0, 1, 0, 0, 3, 0, 0, 1, 0, 0 },
{ 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0 },
{ 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0 },
{ 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0 },
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
}

local area2 = {
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
{ 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0 },
{ 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0 },
{ 0, 0, 0, 1, 1, 3, 1, 1, 0, 0, 0 },
{ 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0 },
{ 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0 },
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
}

combat:setArea(createCombatArea(area))
combat2:setArea(createCombatArea(area2))

function onGetFormulaValues(player, level, magicLevel) -- DISTANCE EFFECT FORMULAS
    local min = (level / 5) + (magicLevel * 5) + 25
    local max = (level / 5) + (magicLevel * 6.2) + 45
    return -min, -max
end

function onGetFormulaValues2(player, level, magicLevel) -- INSIDE OF AURA EFFECT FORMULAS
    local min = (level / 5) + (magicLevel * 5) + 25
    local max = (level / 5) + (magicLevel * 6.2) + 45
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
combat2:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues2")

local function effecto(cid, variant)
    local player = Player(cid)
    if player then
        local pos = player:getPosition()
        Position(pos.x+3, pos.y+1, pos.z):sendDistanceEffect(Position(pos.x+3, pos.y-1, pos.z), config.distance)
        Position(pos.x+3, pos.y-1, pos.z):sendDistanceEffect(Position(pos.x+1, pos.y-3, pos.z), config.distance)
        Position(pos.x+1, pos.y-3, pos.z):sendDistanceEffect(Position(pos.x-1, pos.y-3, pos.z), config.distance)
        Position(pos.x-1, pos.y-3, pos.z):sendDistanceEffect(Position(pos.x-3, pos.y-1, pos.z), config.distance)
        Position(pos.x-3, pos.y-1, pos.z):sendDistanceEffect(Position(pos.x-3, pos.y+1, pos.z), config.distance)
        Position(pos.x-3, pos.y+1, pos.z):sendDistanceEffect(Position(pos.x-1, pos.y+3, pos.z), config.distance)
        Position(pos.x-1, pos.y+3, pos.z):sendDistanceEffect(Position(pos.x+1, pos.y+3, pos.z), config.distance)
        Position(pos.x+1, pos.y+3, pos.z):sendDistanceEffect(Position(pos.x+3, pos.y+1, pos.z), config.distance)
        combat:execute(player, variant)
        combat2:execute(player, variant)
    end
end


local spell = Spell("instant")

function spell.onCastSpell(creature, variant)

    local cid = creature:getId()
    for i = 1, config.rounds do
        addEvent(effecto, config.time * (i -1), cid, variant)
    end
    return true
end

spell:group("attack")
spell:id(804)
spell:name("Exevo Grow Earth")
spell:words("exevo mas earth grow")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
spell:impactSound(SOUND_EFFECT_TYPE_SPELL_TERRA_STRIKE)
spell:level(500)
spell:mana(900)
spell:isPremium(true)
spell:isSelfTarget(true)
spell:blockWalls(true)
spell:cooldown(40 * 1000)
spell:groupCooldown(4 * 1000, 40 * 1000)
spell:needLearn(false)
spell:vocation("druid;true", "elder druid;true")
spell:register()