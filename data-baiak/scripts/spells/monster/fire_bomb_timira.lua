local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITBYFIRE)

arr = {
 {0, 1, 1, 1, 0}, 
 {1, 1, 1, 1, 1}, 
 {1, 1, 2, 1, 1}, 
 {1, 1, 1, 1, 1}, 
 {0, 1, 1, 1, 0}, 
}


local area = createCombatArea(arr)
combat:setArea(area)

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:name("timira fire bomb")
spell:words("###810")
spell:needLearn(true)
spell:cooldown("2000")
spell:isSelfTarget(true)
spell:register()