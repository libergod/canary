local condition = Condition(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_TICKS, 16000)
condition:setParameter(CONDITION_PARAM_BUFF_DAMAGERECEIVED, 90) -- sofrendo 10% a menos de dano

function onTargetCreature(creature, target)
	local player = creature:getPlayer()

	if target:isPlayer() then
		return false
	end
	if target:getMaster() then
		return true
	end

	target:addCondition(condition)
	return true
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
combat:setArea(createCombatArea(AREA_CIRCLE2X2))
combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

local spell = Spell("instant")

function spell.onCastSpell(creature, var, isHotkey)
	local target = creature:getTarget()
	if target then
		var = Variant(target)
	end
	return combat:execute(creature, var)
end

spell:name("Enhance Skills of The Devourer of Secrets")
spell:words("###819")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_EXPOSE_WEAKNESS)
spell:isSelfTarget(true)
spell:needTarget(false)
spell:needLearn(false)
spell:register()