local info = {
	bossName = "Orshabaal",
	firstPlayer = Position(709, 1471, 8),
	fromPos = Position(724, 1466, 8),
	toPos = Position(745, 1477, 8),
	exitPos = Position(713, 1473, 8),
	centroSala = Position(735,1471,8),
	localPedra = Position(728,1472,8),
	idPedra = 1842,
	timerPedra = 30,
	northRange = 15, eastRange = 15, southRange = 15, westRange = 15,
	
	summonPositions = {
		["Demon"] = 
		{
			[1] = Position(733,1469,8),
			[2] = Position(738,1469,8),
			[3] = Position(738,1474,8),
			[4] = Position(733,1474,8)
		},
		["Fire Elemental"] = 
		{
			[1] = Position(733,1467,8),
			[2] = Position(738,1467,8),
			[3] = Position(738,1476,8),
			[4] = Position(733,1476,8)
		}
	},
}


local function revertLever(position)
	local leverItem = Tile(position):getItemById(2773)
	if leverItem then
		leverItem:transform(2772)
	end
end


function removeMonstersInArea(fromPos,toPos)

	local spectators = Game.getSpectators(info.centroSala, false, true, info.westRange, info.eastRange, info.northRange, info.southRange)
	
	if #spectators > 0 then
		return false
	else
        --local monsters = { } 
        for Px = fromPos.x, toPos.x do
                for Py = fromPos.y, toPos.y do
                    --local monster = Monster(getThingFromPos(Position(x,y,8)))
					local monster = getThingfromPos({x=Px, y=Py, z=8, stackpos=253})
					if isMonster(monster.uid) then
						monster:remove()
						--table.insert(monsters, monster.uid)
					end
                end
        end
		return true	
	end	
	return true
end

local demonHelmetEntrance = Action()
function demonHelmetEntrance.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local playersTable = { }
	if item:getActionId() == 47000 then
		if player:doCheckBossRoom(info.bossName, info.fromPos, info.toPos) then
			for x = info.firstPlayer.x, info.firstPlayer.x + 3 do
					local sqm = Tile(Position(x, info.firstPlayer.y, 8))
					if sqm and sqm:getGround():getId() == 430 then
						local player_ = sqm:getTopCreature()
						if player_ and player_:isPlayer() then
							if player_:getStorageValue(Storage.Quest.DemonHelmet) >= 1 then
								player_:getPosition():sendMagicEffect(CONST_ME_POFF)
								player_:sendCancelMessage("You already finished the quest.")
								return true
							end
							table.insert(playersTable, player_:getId())
						end
					end
			end
			
			if removeMonstersInArea(info.fromPos, info.toPos) == true then

				for _, p in pairs(playersTable) do
					local nPlayer = Player(p)
					if nPlayer then
						nPlayer:teleportTo(info.centroSala) -- Local de Entrada do BOSS
					end
				end
				local orshabaal = Game.createMonster(info.bossName, Position(729, 1472, 8))
				
				local summons = info.summonPositions["Demon"]
				for i = 1, #summons do
					Game.createMonster("Demon", summons[i], false, true)
				end
				
				local summons = info.summonPositions["Fire Elemental"]
				for i = 1, #summons do
					Game.createMonster("Fire Elemental", summons[i], false, true)
				end
			
				addEvent(kickPlayersAfterTime, 10 * 60 * 1000, playersTable, info.fromPos, info.toPos, info.exitPos)
			
			end
		end
	end
	return true
end

demonHelmetEntrance:aid(47000)
demonHelmetEntrance:register()

local function checkMonstersKilled(fromPos, toPos, playerid)

		local player = Player(playerid)
		
		if player then
		
			for Px = fromPos.x, toPos.x do
					for Py = fromPos.y, toPos.y do
						local monster = getThingfromPos({x=Px, y=Py, z=8, stackpos=253})
						if isMonster(monster.uid) then
							player:sendCancelMessage("You need to kill all monsters before open a passage.")
							player:getPosition():sendMagicEffect(CONST_ME_POFF)
							return false
						end
					end
			end
		
		end
		return true
end
local function createRock()
    local pedra = Game.createItem(info.idPedra, 1, info.localPedra)
    return true
end

local removeRockLever = Action()
function removeRockLever.onUse(player, item, fromPosition, target, toPosition, isHotkey)

if item:getActionId() == 47001 then

	local check = checkMonstersKilled(info.fromPos, info.toPos, player:getId())

	if not check then
		return true
	end

	local thing = Tile(info.localPedra):getItemById(info.idPedra)
	
	if thing then
		thing:remove()
		thing:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:getPosition():sendMagicEffect(32)
		player:sendCancelMessage("The passage is open, hurry up you have 30 seconds.")	
		addEvent(createRock, 30 * 1000) -- 30 sec
		item:transform(2773)
		addEvent(revertLever, 30 * 1000, item:getPosition())
	else
		player:sendCancelMessage("The passage is already open, you have 30 seconds.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
	end

end

return true
end
removeRockLever:aid(47001)
removeRockLever:register()