area = {
	{0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0},
	{0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0},
	{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{1, 1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
	{0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0},
	{0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0}
}

local createArea = createCombatArea(area)

local combat = Combat()
combat:setArea(createArea)

function onTargetTile(cid, pos)
	local creature = Creature(cid)
	if not creature then
		return true
	end
	local tile = Tile(pos)
	if tile then
		local creatures = tile:getCreatures()
		if creatures then
			for k, tmpCreature in pairs(creatures) do
				if creature:getId() ~= tmpCreature:getId() then
					local min = 12200
					local max = 14500
					if tmpCreature:isPlayer() then
						local storage = tmpCreature:getStorageValue(Storage.Quest.U11_80.TheSecretLibrary.MazzinorProtection)
						if storage ~= 1 then
							doTargetCombatHealth(cid, tmpCreature, COMBAT_ENERGYDAMAGE, -min, -max, CONST_ME_NONE)
						end
					end
				end
			end
		end
	end
	pos:sendMagicEffect(CONST_ME_PURPLEENERGY)
	return true
end

combat:setCallback(CALLBACK_PARAM_TARGETTILE, "onTargetTile")

local function delayedCastSpell(cid, var)
	local creature = Creature(cid)
	if not creature then
		return
	end
	if creature:getHealth() >= 1 then
		return combat:execute(creature, positionToVariant(creature:getPosition()))
	end
	return
end

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local roomCenterPosition = Position(1145, 426, 8)
	creature:say("SUPERCHARGED MAZZINOR BEGINS TO OVERLOAD HIS POWER!", TALKTYPE_MONSTER_YELL)
	addEvent(delayedCastSpell, 1000, creature:getId(), var)
	return true
end

spell:name("supercharged_rageofsky")
spell:words("##816")
spell:isAggressive(true)
spell:blockWalls(true)
spell:needLearn(true)
spell:register()