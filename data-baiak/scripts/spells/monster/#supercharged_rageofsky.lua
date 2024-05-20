local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_BIGCLOUDS)

combat:setArea(createCombatArea(AREA_SQUARE16X16))


function onTargetTile(cid, pos)
	local tile = Tile(pos)
	if tile then
		local target = tile:getTopCreature()
		if target and target ~= cid then
			local player = Player(target)
			targetName = target:getName():lower()
			casterName = cid:getName():lower()
			if target:isPlayer() and casterName ~= targetName then
				local storage = player:getStorageValue(Storage.Quest.U11_80.TheSecretLibrary.MazzinorProtection)
				if storage == 1 then
					local damageCalc = math.random(12500,14500)
					doTargetCombatHealth(cid:getId(), target:getId(), COMBAT_ENERGY, -damageCalc, -damageCalc, CONST_ME_NONE, ORIGIN_NONE)
					return true
				else
					return false
				end
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

spell:name("supercharged_rageofsky")
spell:words("##816")
spell:needLearn(true)
spell:needDirection(false)
spell:cooldown("1000")
spell:isSelfTarget(false)
spell:register()