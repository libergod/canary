local superUpGlobal = GlobalEvent("superUpGlobal")

function superUpGlobal.onThink(interval)

    local superXpCave = SUPERUP:freeCave()

    for _, b in pairs(superXpCave) do
        if os.time() >= b[2] then
           db.query(string.format("UPDATE exclusive_hunts SET `guid_player` = %d, `time` = %s, `to_time` = %s WHERE `hunt_id` = %d", 0, 0, 0, b[1]))
        end
    end
    return true
end

superUpGlobal:interval(1000*60) -- Once per minute
superUpGlobal:register()