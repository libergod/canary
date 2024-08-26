-- Config
local tplist = {
    [42000] = {name = "Deathstrike", positions = {{x = 1984, y = 809, z = 10}}, subareas = {}}, -- OK
    [42001] = {name = "Gnomevil", positions = {{x = 1980, y = 811, z = 11}}, subareas = {}}, -- OK
    [42002] = {name = "Abyssador", positions = {{x = 1968, y = 802, z = 12}}, subareas = {}}, -- OK
    [42003] = {name = "Anomaly", positions = {{x = 1187, y = 668, z = 7}}, subareas = {}}, -- OK
    [42004] = {name = "World Devourer", positions = {{x = 1204, y = 808, z = 7}}, subareas = {}}, -- 
    [42005] = {name = "Rupture", positions = {{x = 1247, y = 662, z = 7}}, subareas = {}}, -- OK (need test)
    [42006] = {name = "Eradicator", positions = {{x = 1281, y = 704, z = 7}}, subareas = {}}, -- OK (need test) 
    [42007] = {name = "Outburst", positions = {{x = 1145, y = 700, z = 7}}, subareas = {}}, -- OK (need test)
    [42008] = {name = "Realityquake", positions = {{x = 1122, y = 657, z = 7}}, subareas = {}}, -- OK (need test) (foreshock)
    [42009] = {name = "Bloodback", positions = {{x = 795, y = 462, z = 7}}, subareas = {}}, -- OK
    [42010] = {name = "Darkfang", positions = {{x = 786, y = 414, z = 7}}, subareas = {}}, -- OK
    [42011] = {name = "Sharpclaw", positions = {{x = 770, y = 383, z = 7}}, subareas = {}}, -- OK
    [42012] = {name = "Shadowpelt", positions = {{x = 766, y = 341, z = 7}}, subareas = {}}, -- OK
    [42013] = {name = "Black Vixen", positions = {{x = 845, y = 460, z = 7}}, subareas = {}}, -- OK
    [42014] = {name = "Lions Mini Bosses", positions = {{x = 1375, y = 335, z = 9}}, subareas = {}}, -- OK
    [42015] = {name = "Brokul", positions = {{x = 1032, y = 424, z = 8}}, subareas = {}}, -- Check how many times can do it, need to fix not exiting the room
    [42016] = {name = "Grand Master Oberon", positions = {{x = 1104, y = 527, z = 8}}, subareas = {}},
    [42017] = {name = "Grand Mini Bosses", positions = {{x = XXX, y = XXX, z = X}}, subareas = {}},
    [42018] = {name = "Ghulosh", positions = {{x = 1205, y = 564, z = 7}}, subareas = {}},
    [42019] = {name = "Gorzindel", positions = {{x = XXX, y = XXX, z = X}}, subareas = {}},
    [42020] = {name = "Lokathmor", positions = {{x = XXX, y = XXX, z = X}}, subareas = {}},
    [42021] = {name = "Mazzinor", positions = {{x = XXX, y = XXX, z = X}}, subareas = {}},
    [42022] = {name = "The Scourge Of Oblivion", positions = {{x = XXX, y = XXX, z = X}}, subareas = {}},
    [42023] = {name = "The Dread Maiden", positions = {{x = XXX, y = XXX, z = X}}, subareas = {}},
    [42024] = {name = "Thaian", positions = {{x = XXX, y = XXX, z = X}}, subareas = {}},
    [42025] = {name = "Brain Head", positions = {{x = XXX, y = XXX, z = X}}, subareas = {}},
    [42026] = {name = "The Fear Feaster", positions = {{x = XXX, y = XXX, z = X}}, subareas = {}},
    [42027] = {name = "The Unwelcome", positions = {{x = XXX, y = XXX, z = X}}, subareas = {}},
    [42028] = {name = "Vok The Freakish", positions = {{x = XXX, y = XXX, z = X}}, subareas = {}},
    [42029] = {name = "Irgix The Flimsy", positions = {{x = XXX, y = XXX, z = X}}, subareas = {}},
    [42030] = {name = "Unaz The Mean", positions = {{x = XXX, y = XXX, z = X}}, subareas = {}},
    [42031] = {name = "The Pale Worm", positions = {{x = XXX, y = XXX, z = X}}, subareas = {}},
    [42032] = {name = "Rotworms", positions = {{x = XXX, y = XXX, z = X}}, subareas = {}},
    [42033] = {name = "Rotworms", positions = {{x = XXX, y = XXX, z = X}}, subareas = {}},
    [42034] = {name = "Rotworms", positions = {{x = XXX, y = XXX, z = X}}, subareas = {}},
    [42035] = {name = "Rotworms", positions = {{x = XXX, y = XXX, z = X}}, subareas = {}},
    [42036] = {name = "Rotworms", positions = {{x = XXX, y = XXX, z = X}}, subareas = {}}
}
local firstid = 42000 -- Put your first action id used here
local lastid = 42036 -- Put your last action id used here

-- Config End
local teleports = MoveEvent()
function teleports.onStepIn(player, item, position, fromPosition)
    if not player:isPlayer() then
        return false
    end
  
    local tp = tplist[item.actionid]
    local quantity = table.getn(tp.positions)
  
    player:registerEvent("Teleport_Modal_Window")
  
    local title = "Teleport"
    local message = "List of ".. tp.name .." Spawns"
      
    local window = ModalWindow(item.actionid, title, message)
    window:addButton(100, "Go")
    window:addButton(101, "Cancel")
      
    for i = 1, quantity do
        if tp.subareas[i] == nil then
            window:addChoice(i,"".. tp.name .." ".. i .."")
        else
            window:addChoice(i,"".. tp.subareas[i] .."")
        end
    end
  
    window:setDefaultEnterButton(100)
    window:setDefaultEscapeButton(101)
  
    if tp and quantity < 2 then
        player:unregisterEvent("Teleport_Modal_Window")
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Teleported to '.. tp.name ..'.')
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
        player:teleportTo(tp.positions[1])
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    else
        window:sendToPlayer(player)
    end
    return true
end

for j = firstid, lastid do
    teleports:aid(j)
end

teleports:type("stepin")
teleports:register()

local modalTp = CreatureEvent("Teleport_Modal_Window")
modalTp:type("modalwindow")

function modalTp.onModalWindow(player, modalWindowId, buttonId, choiceId)
    player:unregisterEvent("Teleport_Modal_Window")
    if modalWindowId >= firstid and modalWindowId <= lastid then
        if buttonId == 100 then
            player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
            player:teleportTo(tplist[modalWindowId].positions[choiceId])
            player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
            if tplist[modalWindowId].subareas[choiceId] == nil then
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Teleported to '.. tplist[modalWindowId].name ..' '.. choiceId ..'.')
            else
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Teleported to '.. tplist[modalWindowId].subareas[choiceId] ..'.')
            end
        end
    end
    return true
end

modalTp:register()