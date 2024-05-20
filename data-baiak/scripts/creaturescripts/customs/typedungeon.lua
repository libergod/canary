function modalDungeon(player)

	player:registerEvent("DungeonSystem_Modal")
	
	local window = ModalWindow(DUNGEON_SYSTEM.Modal.ID, DUNGEON_SYSTEM.Modal.Title, DUNGEON_SYSTEM.Modal.Msg)
	
	window:addButton(1, "Confirm")
	window:addButton(2, "Details")
	window:addButton(3, "Exit")
	
	for k,v in pairs(DUNGEON_SYSTEM.Dungeons) do
		window:addChoice(k, "[OPEN] " .. v.Name)
	end
	
	window:setDefaultEnterButton(1)
    window:setDefaultEscapeButton(3)
	
	window:sendToPlayer(player)
	
end

function onModalWindow(player, modalWindowId, buttonId, choiceId)  
    
	player:unregisterEvent("DungeonSystemType_Modal")

	local dg = DUNGEON_SYSTEM.Dungeons
	local msg = DUNGEON_SYSTEM.Messages
	local modal = DUNGEON_SYSTEM.Modal
	local sto = DUNGEON_SYSTEM.Storages	
	
	if buttonId == 100 then
		
		modalDungeon(player)
		
	end
	
end