

if not Karin then Karin = {} end
Karin.CreaturesIcon = {
    Creatures = {},
}

local globalEventCreatureIcons = GlobalEvent("globalEventCreatureIcons")

function globalEventCreatureIcons.onThink(interval)
    for cid, data in pairs(Karin.CreaturesIcon.Creatures) do
        local monster = Creature(cid)
        if monster then
            local pos = monster:getPosition()
            local range = 7
            local msg = createNetworkMessage(cid, data)
            for _, player in pairs(Game.getSpectators(pos, false, true, range, range, range, range)) do
                msg:sendToPlayer(player, false);
            end
        end
    end
    return true
end

globalEventCreatureIcons:interval(500)
globalEventCreatureIcons:register()

function createNetworkMessage(cid, data)
    local msg = NetworkMessage()
    msg:addByte(0x8B)
    msg:addU32(cid)
    --// Type 14 for this
    msg:addByte(0x0E)
    --// 0 = no icon, 1 = we'll send an icon
    msg:addByte(1)
    -- Icon number
    msg:addByte(data.icon)
    --// Creature update
    msg:addByte(0)
    --// Used for the life in the new quest
    msg:addU16(data.index)
    return msg
end

function Karin:setCreatureIcon(cid, icon, index) 
    Karin.CreaturesIcon.Creatures[cid] = { icon = icon, index = index }
end