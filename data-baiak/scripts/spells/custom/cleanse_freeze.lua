local config = {
effect = 44,
distanceEffect = 29
}


local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

local function unfreeze(cid)
    local player = Player(cid)
    local pos = player:getPosition()
    pos:sendDistanceEffect(Position(pos.x+1, pos.y+1, pos.z), config.distanceEffect)
    pos:sendDistanceEffect(Position(pos.x+1, pos.y-1, pos.z), config.distanceEffect)
    pos:sendDistanceEffect(Position(pos.x-1, pos.y-1, pos.z), config.distanceEffect)
    pos:sendDistanceEffect(Position(pos.x-1, pos.y+1, pos.z), config.distanceEffect)
    player:removeCondition(CONDITION_OUTFIT)
	player:say("UNFROZEN", TALKTYPE_MONSTER_SAY)
    pos:sendMagicEffect(config.effect)
    player:setMovementBlocked(false)
end

local spell = Spell("instant")

function spell.onCastSpell(creature, var)

	if creature:getExhaustion(7213) <= 0 then
		creature:setExhaustion(7213, 15) -- 20 SECONDS BETWEEN FROZEN
	else
		creature:sendCancelMessage('You\'re exhausted for: '..creature:getExhaustion(7213)..' seconds.')
		return false
	end
	
	unfreeze(creature)
	
	return combat:execute(creature, var)
end

spell:name("Cleanse Freeze")
spell:words("exana freeze")
spell:group("support")
spell:vocation("knight;true", "elite knight;true","paladin;true", "royal paladin;true", "druid;true", "elder druid;true", "sorcerer;true", "master sorcerer;true")
spell:id(901)
--spell:cooldown(15 * 1000)
spell:level(300)
spell:mana(250)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()
