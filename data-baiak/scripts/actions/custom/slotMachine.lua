if not slotMachineData then
	slotMachineData = {
		needItem = {id = 3043, count = 200000},
		items = vector(22723,22724, 21554, 9170),

		positions = {
			Position(951, 1208, 6),
			Position(951, 1209, 6),
			Position(951, 1210, 6)
		},
		positionEffectDice = {
			Position(953, 1208, 6),
			Position(953, 1210, 6),
		},

		rolled = vector()
	}
end

local positions = slotMachineData.positions
local function drawEffects()
	local n = 0
	local function decrease()
		if slotMachineData.owner then
			return
		end
		local t = 20 - n
		if t > 0 then
			n = n + 1
			for _, position in ipairs(positions) do
				position:sendMagicEffect(math.random(CONST_ME_GIFT_WRAPS, CONST_ME_FIREWORK_BLUE))
			end
			addEvent(decrease, 850)
			addEvent(function()
				
				-- clear items
				for index, position in ipairs(positions) do
					local tile = Tile(position)
					if tile then
						local item = tile:getTopDownItem()
						if item then
							item:remove()
						end
					end

					addEvent(function()
						position:sendMagicEffect(CONST_ME_MAGIC_GREEN)
					end, index * 100)
				end
				
				
			end, 14000)
		end
	end
	decrease()
end

local function checkEquals(itemVec)
    local ret = true
    for i = 1, itemVec:size() do
        if itemVec:get(i) ~= itemVec:get(math.min(itemVec:size(), i + 1)) then
            ret = false
            break
        end
    end
	return ret, itemVec:front()
end

local function showTextAnimated(toPosition, text)

local spectators = Game.getSpectators(toPosition, false, true, 7, 7, 5, 5)
			if #spectators > 0 then
					for i = 1, #spectators do
						spectators[i]:say(text, TALKTYPE_MONSTER_SAY, false, spectators[i], toPosition)
					end
			end
end

local function clearMachine(positions)
	-- clear items
	for index, position in ipairs(positions) do
		local tile = Tile(position)
		if tile then
			local item = tile:getTopDownItem()
			if item then
				item:remove()
			end
		end

		addEvent(function()
			position:sendMagicEffect(CONST_ME_MAGIC_GREEN)
		end, index * 100)
	end
end

local SlotMachineTools = Action()

function SlotMachineTools.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local name = player:getName()

	if slotMachineData.owner then
		player:sendCancelMessage('Aguarde a sua vez.')
		return true
	else
		local item = slotMachineData.needItem
		--if not player:removeItem(item.id, item.count) then
			if not player:removeMoney(item.count) then
				if not player:removeMoneyBank(item.count) then
					player:sendCancelMessage(('Você não possui %dx crystal coins.'):format(item.count * 1000))
					return true
				end
			end
		--end
		slotMachineData.owner = name
	end

	item:transform(item.itemid + 1)
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	fromPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	slotMachineData.positionEffectDice[1]:sendMagicEffect(CONST_ME_CRAPS)
	slotMachineData.positionEffectDice[2]:sendMagicEffect(CONST_ME_CRAPS)


	-- clear items
	for index, position in ipairs(positions) do
		local tile = Tile(position)
		if tile then
			local item = tile:getTopDownItem()
			if item then
				item:remove()
			end
		end

		addEvent(function()
			position:sendMagicEffect(CONST_ME_MAGIC_GREEN)
		end, index * 100)
	end

	local rolledVec = slotMachineData.rolled
	rolledVec:reset()

	for index, position in ipairs(positions) do
		addEvent(function()
			local item = Game.createItem(slotMachineData.items:rand(), 1, position)
			rolledVec:emplace_back(item:getId())

			position:sendMagicEffect(CONST_ME_FIREATTACK)
		end, index * 1000)
	end

	-- check the result
	addEvent(function(name)
		local win, rewardId = checkEquals(rolledVec)
		local reward = Game.createItem(rewardId, 1)
		local player = Player(name)
		if not player then
            if win then
                local resultId = db.storeQuery("SELECT `id` FROM `players` WHERE `name` = '" .. name.. "'")
                if not resultId then
                    result.free(resultId)
                    return false
                end

                local targetPlayerGUID = result.getDataInt(resultId, "id")
                result.free(resultId)

                targetPlayer = Player(targetPlayerGUID, true)
                if not targetPlayer then
                    return false
                end
                local itemSend = Game.createItem(rewardId, 1)
                targetPlayer:getInbox():addItemEx(itemSend, INDEX_WHEREEVER, FLAG_NOLIMIT)
                targetPlayer:delete()
			end
		else
			if win then
					local itemMandar = Game.createItem(rewardId, 1)
                    player:getInbox():addItemEx(itemMandar, INDEX_WHEREEVER, FLAG_NOLIMIT)
					inbox = true
				local rewardName = reward:getName()
				player:sendTextMessage(MESSAGE_INFO_DESCR, ('Parabéns, você ganhou 1x %s.%s'):format(rewardName, inbox and ' O item foi enviado para a sua caixa de entrada (inbox).' or ''))
				Game.broadcastMessage(('[Slot Machine]: %s encontrou 1x %s, que sortudo(a).'):format(name, rewardName), MESSAGE_EVENT_ADVANCE)
			else
				clearMachine(positions)
			end
		end

		item:transform(item.itemid - 1)
		rolledVec:reset()
		slotMachineData.owner = nil

		local centerPosition = positions[math.ceil(#positions/2)]
		if win then
			showTextAnimated(centerPosition, "WIN!")
			for _, position in ipairs(positions) do
				position:sendMagicEffect(CONST_ME_ENERGYAREA)
			end
			drawEffects()
		else
			showTextAnimated(centerPosition, "LOSE!")
			for _, position in ipairs(positions) do
				position:sendMagicEffect(CONST_ME_POFF)
			end
		end
	end, (#positions + 1) * 1000, name)
	return true
end

SlotMachineTools:uid(48123)
SlotMachineTools:register()