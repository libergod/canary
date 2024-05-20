local combats = {}
local spellConfig = {
    combat = COMBAT_PHYSICALDAMAGE,
    distanceEffect = CONST_ANI_ETHEREALSPEAR,
    effect = CONST_ME_HITAREA,
    increment = {
        hits = 3,
        bonus = 30
    },
    players = {}
}

for i = 1, 2 do
    combats[i] = Combat()
    combats[i]:setParameter(COMBAT_PARAM_TYPE, spellConfig.combat)
    combats[i]:setParameter(COMBAT_PARAM_EFFECT, spellConfig.effect)
    combats[i]:setParameter(COMBAT_PARAM_DISTANCEEFFECT, spellConfig.distanceEffect)

    function onGetFormulaValues(player, skill, attack, factor)
	
		local level = player:getLevel()
		
        local multiplier = (100 + (spellConfig.increment.bonus * i-1)) / 100
        local min = ((level / 2) + (skill * 1.1)) * multiplier
        local max = ((level / 2) + (skill * 1.2)) * multiplier
        return -min, -max
    end
    combats[i]:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
end


local spell = Spell("instant")

function spell.onCastSpell(creature, var)
    local target = Creature(var:getNumber())
    if target then
        local cid = creature:getId()
        local tid = target:getId()
        local list = spellConfig.players[cid]
        if not spellConfig.players[cid] or not spellConfig.players[cid][tid] then
            spellConfig.players[cid] = {[tid] = 1}
            return combats[1]:execute(creature, var)
        end
        if spellConfig.players[cid][tid] < spellConfig.increment.hits-1 then
            spellConfig.players[cid][tid] = spellConfig.players[cid][tid] +1
            return combats[1]:execute(creature, var)
        else
            spellConfig.players[cid][tid] = 0
            return combats[2]:execute(creature, var)
        end
    end
    return false
end

spell:name("Repeat Flux")
spell:words("repeat flux")
spell:group("attack")
spell:vocation("paladin", "royal paladin")
spell:id(800)
spell:cooldown(1200)
spell:level(500)
spell:range(6)
spell:mana(400)
spell:needTarget(true)
spell:blockWalls(true)
spell:isPremium(true)
spell:register()