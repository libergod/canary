local config = {
    storage = 20000, -- Storage para salvar o tempo do minuto atual
	storageTotal = 20001, -- Storage para salvar o tempo total até o logout
    pointItemId = 37317, -- item a dar ao player (pode remover depois de alterar o BD
    pointsPerHour = 1, -- 1 ponto adicionar no tempo online
	onlineTime = 60, -- 60 segundos para premiar a cada 1 min
    checkDuplicateIps = false
}

local onlinePointsEvent = GlobalEvent("GainPointPerHour")

function onlinePointsEvent.onThink(interval)
    local players = Game.getPlayers()
    if #players == 0 then
        return true
    end

    local checkIp = { }
    for _, player in pairs(players) do
        local ip = player:getIp()
        if ip ~= 0 and (not config.checkDuplicateIps or not checkIp[ip]) then
            checkIp[ip] = true
            local seconds = math.max(0, player:getStorageValue(config.storage))
            if seconds >= config.onlineTime then
                player:setStorageValue(config.storage, 0)
				player:setStorageValue(config.storageTotal, player:getStorageValue(config.storageTotal) + config.pointsPerHour)
                --end
                return true
            end
            player:setStorageValue(config.storage, seconds +math.ceil(interval/1000))
        end
    end
    return true
end

onlinePointsEvent:interval(1000) -- VERIFICA A CADA 1 segundo
onlinePointsEvent:register()