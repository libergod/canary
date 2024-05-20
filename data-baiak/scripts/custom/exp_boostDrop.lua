local custom_exp_damage_effect = CreatureEvent("custom_exp_damage_effect")

local config = {
    ['Rotworm'] = { chance = 500 }, -- 100 means 1%, 5000 means 100%
    ['Demon'] = { chance = 500 },
	['Cyclops'] = { chance = 500 },
	['Dragon'] = { chance = 500 },
	['Carniphila'] = { chance = 500 },
	['Dragon Lord'] = { chance = 500 },
	['Green Djinn'] = { chance = 500 },
	['Hellfire Fighter'] = { chance = 500 },
	['Hero'] = { chance = 500 },
	['Medusa'] = { chance = 500 },
	['Hellspawn'] = { chance = 500 },
	['Minotaur'] = { chance = 500 },
	['Giant Spider'] = { chance = 500 },
	['Mutated Human'] = { chance = 500 },
	['Mummy'] = { chance = 500 },
	['Nightmare'] = { chance = 500 },
	['Orc Leader'] = { chance = 500 },
	['Pirate Buccaneer'] = { chance = 500 },
	['Quara Mantassin'] = { chance = 500 },
	['Serpent Spawn'] = { chance = 500 },
	['Frost Dragon'] = { chance = 500 },
	['Vampire'] = { chance = 500 },
	['Warlock'] = { chance = 500 },
	['Wyrm'] = { chance = 500 },
	['Wyvern'] = { chance = 500 },
	['Young Sea Serpent'] = { chance = 500 },
	['Defiler'] = { chance = 500 },
	['Dwarf'] = { chance = 500 },
	['Destroyer'] = { chance = 500 },
	['Behemoth'] = { chance = 500 },
	['Braindeath'] = { chance = 500 },
	['Grim Reaper'] = { chance = 500 },
	['War Golem'] = { chance = 500 },
	['Fury'] = { chance = 500 },
	['Bog Raider'] = { chance = 500 },
	['Ashmunrah'] = { chance = 500 },
	
}

local function sendMessage(target)
    if not target then
        return true
    end
    target:sendMagicEffect(56)
    target:sendMagicEffect(57)
end


local function removeBoostExp(target)
    if not target then
        return true
    end
	local tile = Tile(target)
    if tile then
		local ground = tile:getGround()
		if ground then
			ground:setActionId()
		end
	end
end

function custom_exp_damage_effect.onKill(creature, target)
    if target:isPlayer() then
        return true
    end
    local monster = config[target:getName()]
    if not monster then
        return true
    end
    if math.random(1, 5000) <= monster.chance then
        local tile = Tile(target:getPosition())
        if tile then
            local ground = tile:getGround()
            if ground then
                ground:setActionId(6000)
                target:say('DOUBLE EXP!', TALKTYPE_MONSTER_SAY)
                for i = 0, 3 do
                    addEvent(sendMessage, 750 * i, target:getPosition())
                end
				
				addEvent(removeBoostExp, 1000 * 3, target:getPosition())
            end
        end
    end
    return true
end

custom_exp_damage_effect:type("kill")
custom_exp_damage_effect:register()
---------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------
local custom_exp_damage_effect_login = CreatureEvent("custom_exp_damage_effect_login")

function custom_exp_damage_effect_login.onLogin(player)
    player:registerEvent("custom_exp_damage_effect")
    return true
end

custom_exp_damage_effect_login:type("login")
custom_exp_damage_effect_login:register()
---------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------
local custom_exp_damage_effect_movement = MoveEvent()
custom_exp_damage_effect_movement:type("stepin")

local function sendEffect(cid)
    local player = Player(cid)
    if not player then
        return true
    end
    local pos = player:getPosition()
    local pos2 = player:getPosition() + Position(math.random(-2, 2), math.random(-2, 2), 0)
    pos2:sendDistanceEffect(pos, 31)
end

function custom_exp_damage_effect_movement.onStepIn(player, item, position, fromPosition)
    if player:isMonster() then
        return true
    end
    local tile = Tile(player:getPosition())
    if tile then
        local ground = tile:getGround()
        if ground then
            ground:setActionId()
            player:setStorageValue(6000, os.time() + 60)
            player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have received double experience for the next 60 seconds.')
            for i = 0, 25 do
                addEvent(sendEffect, 100 * i, player:getId())
            end
        end
    end
    return true
end

custom_exp_damage_effect_movement:aid(6000)

custom_exp_damage_effect_movement:register()
---------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------
local expCheck = TalkAction("!exp")

local function secondsToReadable(s)
    local hours   = math.floor(s / 3600)
    local minutes = math.floor(math.fmod(s, 3600)/60)
    local seconds = math.floor(math.fmod(s, 60))
    return (hours   > 0 and (hours   .. ' hour'   .. (hours   > 1 and 's ' or ' ')) or '') ..
           (minutes > 0 and (minutes .. ' minute' .. (minutes > 1 and 's ' or ' ')) or '') ..
           (seconds > 0 and (seconds .. ' second' .. (seconds > 1 and 's ' or ' ')) or '')
end

function expCheck.onSay(player, words)
 
    local exhaust = 6000
    if player:getStorageValue(exhaust) - os.time() > 0 then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "Your extra exp will end in : "..secondsToReadable(player:getStorageValue(exhaust) - os.time()).."")
        return false
	else
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "You don't have extra Exp Boost active.")
		return false
    end
    return false
end

expCheck:groupType("normal")
expCheck:separator(" ")
expCheck:register()
---------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------
