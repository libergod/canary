local config = {
effect = 44,
distanceEffect = 29
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ICE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

local condition = Condition(CONDITION_OUTFIT)
condition:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ICE)
condition:setParameter(CONDITION_PARAM_TICKS, 3730)
condition:setOutfit({lookTypeEx = 7303})

local function freezeTimer(creature,pos,count)

	local player = Player(creature)
	
	if not player:hasCondition(CONDITION_OUTFIT) then
		stopEvent(freezeTimer)
		return false
	end
    if count >= 1 and Creature(creature) then
        local spectators = Game.getSpectators(pos, false, false, 13, 13, 7, 7)
        if #spectators > 0 then
            for _,spectator in pairs(spectators) do
                if spectator:isPlayer() then
                    spectator:sendTextMessage(MESSAGE_HEALED, nil, pos, count, TEXTCOLOR_SKYBLUE)
                end
            end
        end
        addEvent(freezeTimer, 1000, creature, pos, count - 1)
    end
end

local function unfreeze(cid)

    local player = Player(cid)
    local pos = player:getPosition()

	if player:hasCondition(CONDITION_OUTFIT) or player:isMovementBlocked() then
	
		pos:sendDistanceEffect(Position(pos.x+1, pos.y+1, pos.z), config.distanceEffect)
		pos:sendDistanceEffect(Position(pos.x+1, pos.y-1, pos.z), config.distanceEffect)
		pos:sendDistanceEffect(Position(pos.x-1, pos.y-1, pos.z), config.distanceEffect)
		pos:sendDistanceEffect(Position(pos.x-1, pos.y+1, pos.z), config.distanceEffect)
		player:say("UNFROZEN", TALKTYPE_MONSTER_SAY)
		pos:sendMagicEffect(config.effect)
		player:setMovementBlocked(false)
		return true
	else
		stopEvent(unfreeze)
		return false
	end
	
end

local rune = Spell("rune")

function rune.onCastSpell(creature, var, isHotkey)
	if Monster(var:getNumber(1073762188)) then
		creature:sendCancelMessage('Sorry not possible. You can just freeze players.')
		creature:getPosition():sendMagicEffect(CONST_ME_POFF)
	return false
	else
		if creature:getExhaustion(7212) <= 0 then
			creature:setExhaustion(7212, 15) -- 15 SECONDS BETWEEN FROZEN
		else
			creature:sendCancelMessage('You\'re exhausted for: '..creature:getExhaustion(7212)..' seconds.')
			return false
		end
		local player = Player(var:getNumber())
		local pos = player:getPosition()
		Position(pos.x+1, pos.y+1, pos.z):sendDistanceEffect(pos, config.distanceEffect)
		Position(pos.x+1, pos.y-1, pos.z):sendDistanceEffect(pos, config.distanceEffect)
		Position(pos.x-1, pos.y-1, pos.z):sendDistanceEffect(pos, config.distanceEffect)
		Position(pos.x-1, pos.y+1, pos.z):sendDistanceEffect(pos, config.distanceEffect)
		player:addCondition(condition)
		pos:sendMagicEffect(config.effect)
		player:say("FROZEN", TALKTYPE_MONSTER_SAY)
		player:setMovementBlocked(true)
		addEvent(freezeTimer, 1000, player.uid, player:getPosition(), 3000 / 1000)
		addEvent(unfreeze, 4000, player.uid)
    return combat:execute(creature, var)
	end
end

rune:group("support")
rune:name("freeze rune")
rune:runeId(3170)
rune:allowFarUse(true)
rune:charges(1)
rune:level(300)
rune:magicLevel(20)
--rune:cooldown(15 * 1000)
rune:isAggressive(false)
rune:needTarget(true)
rune:isBlocking(true) -- True = Solid / False = Creature
rune:register()