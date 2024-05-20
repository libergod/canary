local castlerDmg = CreatureEvent("castler_Dmg")

function castlerDmg.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType)

	local guild = attacker:getGuild()
	local Guild_ID = guild:getId()

	if not attacker:isPlayer() then
		return true
	end

	if Guild_ID == Game.getStorageValue(STORAGEVALUE_CASTLE_DOMINADO) or Guild_ID == CASTLE24H:getGuildIdFromCastle() then
		--doPlayerSendCancel(attacker, "You can't atack your empe.")
		attacker:sendCancelMessage(CASTLE24H.castleNome .." You can't attack your defense.")
		attacker:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end

	return primaryDamage, primaryType, secondaryDamage, secondaryType
end

local castleDmg = CreatureEvent("castle_Dmg")

function castleDmg.onThink(creature)

	addEvent(function(cid)
			local monster = Monster(cid)
			if not monster then
				return
			end

	for _, creatures in ipairs(monster:getTargetList()) do
		if monster:isTarget(creatures) then
			local playerid = Player(creatures:getId())
			if not playerid:isPlayer() then
				return false
			end

			local guild = playerid:getGuild()
			local Guild_ID = guild:getId()

			if Guild_ID == Game.getStorageValue(STORAGEVALUE_CASTLE_DOMINADO) or Guild_ID == CASTLE24H:getGuildIdFromCastle() then
			--	monster:doMonsterChangeTarget()
				monster:removeTarget(creatures:getId())
				--creature:say("NOT ATTACKING YOU!", TALKTYPE_ORANGE_2)
				return false
			else
				--creatures:sendCancelMessage(CASTLE24H.castleNome .." Defense are attacking you.")
				--creature:say("ATTACKING YOU!", TALKTYPE_ORANGE_2)
				return true
			end

		end
	end
		end, 1000, creature:getId())

		return true
end


castlerDmg:register()
castleDmg:register()

