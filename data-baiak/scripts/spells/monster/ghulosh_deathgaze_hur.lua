local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONHIT)

combat:setArea(createCombatArea({
{1},
{1},
{1},
{1},
{1},
{3},
}))

local monsters = {
	"concentrated death",
}

function onTargetTile(cid, pos)
	local tile = Tile(pos)
	if tile then
		local target = tile:getTopCreature()
		if target and target ~= cid then
			targetName = target:getName():lower()
			casterName = cid:getName():lower()
			if table.contains(monsters, targetName) and casterName ~= targetName then
				target:addHealth(-(target:getMaxHealth() * 0.35))
				cid:addHealth(-(cid:getMaxHealth() * 0.05))
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

spell:name("ghurloshDeathGazeHur")
spell:words("###815")
spell:needLearn(true)
spell:needDirection(true)
spell:cooldown("2000")
spell:isSelfTarget(true)
spell:register()