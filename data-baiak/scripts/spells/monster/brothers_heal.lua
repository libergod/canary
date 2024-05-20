local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setArea(createCombatArea(AREA_CIRCLE2X2))
local monsters = {
	"brother chill",
	"brother freeze"
}

function onTargetTile(cid, pos)
	local tile = Tile(pos)
	if tile then
		local target = tile:getTopCreature()
		if target and target ~= cid then
			targetName = target:getName():lower()
			if table.contains(monsters, targetName) then
				local min = math.random(950,1200)
				local max = math.random(950,1200)
				target:addHealth(max * 2, COMBAT_ICEDAMAGE)
				--doTargetCombatHealth(0, target, COMBAT_HEALING, min, max, CONST_ME_NONE)
			end
		end
	end
	return true
end

combat:setCallback(CALLBACK_PARAM_TARGETTILE, "onTargetTile")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end


spell:name("brothersHeal")
spell:words("###818")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_MASS_HEALING)
spell:isAggressive(false)
spell:isSelfTarget(true)
spell:needLearn(false)
spell:register()


--{name ="icecle heal", interval = 2000, chance = 25, target = false}
