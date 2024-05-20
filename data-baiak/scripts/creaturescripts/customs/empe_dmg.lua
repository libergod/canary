dofile("./_woe.lua")

local formulas = 
	{
		[1] = {level = 5, ml = 2},
		[2] = {level = 5, ml = 2},
		[3] = {level = 5, ml = 1},
		[4] = {level = 5, ml = 3}
	}

--add more vocs.	
	
function formulilla(cid)
	local tmp = formulas[cid:getVocation()]
	if not tmp then
		return 100 --default
	else
		return ((cid:getLevel() / tmp.level) + cid:getMagicLevel() * tmp.ml)
	end
end


local empe_dmg = CreatureEvent("Emp_Dmg")

function empe_dmg.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType)
	
	local guild = attacker:getGuild()
	local Guild_ID = guild:getId()
	
	Woe.getInfo()
	
	if not attacker:isPlayer() then
		return true
	end
	
	if not Woe.isRegistered(attacker) then
		return false
	end	
		
	if Guild_ID == infoLua[2] then
		--doPlayerSendCancel(attacker, "You can't atack your empe.")
		attacker:sendTextMessage(MESSAGE_EVENT_DEFAULT,"You can't attack your empe.")
		attacker:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end

	return primaryDamage, primaryType, secondaryDamage, secondaryType
end

local emper_dmg = CreatureEvent("Empr_Dmg")

function emper_dmg.onThink(creature)
	
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
			Woe.getInfo()
			
			if Guild_ID == infoLua[2] then
			--	monster:doMonsterChangeTarget()
				monster:removeTarget(creatures:getId())
				--creature:say("NOT ATTACKING YOU!", TALKTYPE_ORANGE_2)
				return false
			else
				--creatures:sendTextMessage(MESSAGE_LOGIN, "Tower attacking you!")
				--creature:say("ATTACKING YOU!", TALKTYPE_ORANGE_2)
				return true
			end
			
		end
	end
		end, 1000, creature:getId())
		
		return true
end


empe_dmg:register()
emper_dmg:register()

