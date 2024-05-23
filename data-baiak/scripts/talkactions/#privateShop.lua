local privateShopTalk = TalkAction("!privateshop")

local funcs = {"on", "off", "add", "remove", "list", "help", "list"}

local function checkSidesNpcs(fromPos,toPos, name)
	local uids = { }
	for Px = fromPos.x, toPos.x do
			for Py = fromPos.y, toPos.y do
				local creature = getThingfromPos({x=Px, y=Py, z=7, stackpos=253})
				if isCreature(creature.uid) then
					local creaturerr = Creature(creature.uid)
					if creaturerr:getName() ~= name or (not creaturerr:isPlayer()) then
						table.insert(uids, creature.uid)
						--Spdlog.error("[PRIVATE SHOP] - Inserted CID: " ..creature.uid.. " "..creaturerr:getName())
					end					
				end
			end
	end
	--Spdlog.error("[PRIVATE SHOP] - checkSidesNPcs")
return uids

end

local function tabletama(tb)
	local tam = 0

	for i, v in pairs(tb) do
		tam = tam + 1
	end

	return tam
end

local function removePlayer(p)

local target = Player(p)
	if not target then
		player:sendCancelMessage("[PRIVATE SHOP] - Player not found.")
		return false
	end
	
	target:remove()
	return false
end

function privateShopTalk.onSay(player, words, param)

	local split = param:split(",")
	
	if split[1] == "" or split[2] == "" or split[3] == "" or split[4] == "" then
		player:sendCancelMessage("[PRIVATE SHOP] - User Name or param required.")
		return false
	end
	

	local param = split[1]

	local configs = _PV_SHOP_CONFIG

	if (configs.vip) and not(player:isVip()) then
		player:sendCancelMessage("[PRIVATE SHOP] - You must have a vip account to use this command.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end

	if (player:getLevel() < configs.level) then
		player:sendCancelMessage("[PRIVATE SHOP] - You must be at least level " .. configs.level .. " to use this system.")
		return false
	end

	if not(isInArray(funcs, param)) then
		player:sendCancelMessage("[PRIVATE SHOP] - You typed a invalid option, to see help window type ".. words .. " help.")
		return false
	end

	if (param == "on") then

		if player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT) then
			player:sendCancelMessage("[PRIVATE SHOP] - You can't activate the system with your pz locked.")
			return false
		end

		local pos = player:getPosition()
		local pos1 = {x = pos.x-5, y = pos.y-5, z = pos.z}
		local pos2 = {x = pos.x+5, y = pos.y+5, z = pos.z}
		local uids = checkSidesNpcs(pos1,pos2,player:getName())

			for _, b in pairs(uids) do
				local pp = Creature(b)
				if pp:isCreature() and not pp:isPlayer() then
					player:sendCancelMessage("[PRIVATE SHOP] - You're near a npc, please go to another place.")
					return false
				end
			end

		local pikznelis = 0
		for _, a in pairs(getPlayerShopItens(getPlayerGUID(player))) do
			pikznelis = 1
			break
		end

		if (pikznelis == 0) then
			player:sendCancelMessage("[PRIVATE SHOP] - You must add a item to your shop before ative it.")
			return false
		end

		player:setStorageValue(75431, 1)
		
		addEvent(removePlayer, 1, getPlayerGUID(player))
	elseif (param == "add") then

		if not(split[4]) then
			player:sendCancelMessage("[PRIVATE SHOP] - You typed a invalid option, to see help window type ".. words .. " help.")
			return false
		end
		local item = ItemType(getItemIdByName(split[2]:lower()))
		--local item = ItemType(getItemIdByName(split[2]:lower()))
		
		if not item:getId() then
			player:sendCancelMessage("[PRIVATE SHOP] - " .. split[2]:lower() .." isn't a valid item.")
			return false
		end

		if (tabletama(getPlayerShopItens(getPlayerGUID(player))) >= configs.maxitens) then
			player:sendCancelMessage("[PRIVATE SHOP] - You can't have more than ".. configs.maxitens.." types of items in your Private Shop.")
			return false
		end

		if (isInArray(configs.notadd, item:getId())) then
			player:sendCancelMessage("[PRIVATE SHOP] - You can't add " .. split[2] .. " to Private Shop.")
			return false
		end

		if not(tonumber(split[3])) or (tonumber(split[3]) < 1) then
			player:sendCancelMessage("[PRIVATE SHOP] - ".. split[3] .. " isn't a valid quantity.")
			return false
		end

		if player:getItemCount(item:getId()) < tonumber(split[3]) then
			player:sendCancelMessage("[PRIVATE SHOP] - You don't have ".. split[3] .."x " .. item:getName() .."(s).")--split[2]
			return false
		end

		player:sendCancelMessage("[PRIVATE SHOP] - You added with successful ".. split[3] .. " ".. split[2] .."(s) to your Private Shop.")
		doAddItemForPlayerShop(getPlayerGUID(player), item:getId(), split[3], split[4])
		player:removeItem(item:getId(), tonumber(split[3]))
	elseif (param == "list") then
		local itens = getPlayerShopItens(getPlayerGUID(player))
		local msgiteins = "Items in your Private Shop:\n"

		for a, b in pairs(itens) do
		local item = ItemType(a)
			msgiteins = msgiteins .. "\n".. b[1] .. " " .. item:getName() .. getPrefix(b[1]) .. " - ".. b[2] .. " Gold Coins"
		end

		local msgiteins = msgiteins .. "\nX-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X"
			player:showTextDialog(2160, msgiteins)
	elseif (param == "remove") then
		if not(split[3]) then
			player:sendCancelMessage("[PRIVATE SHOP] - You typed a invalid option, to see help window type ".. words .. " help.")
			return false
		end

		if not(tonumber(split[3])) or (tonumber(split[3]) < 1) then
			player:sendCancelMessage("[PRIVATE SHOP] - ".. split[3] .. " isn't a valid quanty.")
			return false
		end

		local item = getItemIdByName(split[2])
		if not (item) then
			player:sendCancelMessage(split[2] .." isn't a item.")
			return false
		end

		local shopt = getPlayerShopItens(getPlayerGUID(player))
		if not(shopt[item]) or (tonumber(shopt[item][1]) < tonumber(split[3])) then
			player:sendCancelMessage("[PRIVATE SHOP] - You haven't ".. split[3] .." " .. split[2] .."(s) in Private Shop.")
			return false
		end

		player:sendCancelMessage("[PRIVATE SHOP] - You removed with successful ".. split[3] .. " ".. split[2] .."(s) from your Private Shop.")
		doRemoveItemFromPlayerShop(getPlayerGUID(player), item, split[3])
		player:addItem(item, tonumber(split[3]))
	elseif (param == "help") then
		local msg = "Private Shop System Help: \n \n * add - is used to add a item to your Private Shop. \n"
		local msg = msg .."     Usage Example: !privateshop add, item, quanty, price by unit"
		local msg = msg .."\n!privateshop add, demon armor, 1, 60000\n"
		local msg = msg .."\n * remove - is used to remove a item from your Private Shop. \n"
		local msg = msg .."     Usage Example: !privateshop remove, item, quanty"
		local msg = msg .."\n!privateshop remove, demon armor, 5\n"
		local msg = msg .."\n * on - is used to active your Private Shop\n"
		local msg = msg .."\n * list - displays in screen a window containing all items that you have in your Private Shop."
		player:showTextDialog(2160, msg)
   end

   return true
end

privateShopTalk:groupType("god")
privateShopTalk:separator(" ")
privateShopTalk:register()
