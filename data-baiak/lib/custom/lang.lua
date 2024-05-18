function getPlayerLanguage(cid) 

	local player = Player(cid)
	
    local Lang = db.storeQuery("SELECT `language` FROM `accounts` WHERE `id` = " .. player:getAccountId() .. " LIMIT 1")
    if Lang ~= false then
		local langid = result.getDataInt(Lang, 'language')
        result.free(Lang)
        return langid
    end
    return false
end

function doPlayerSetLanguage(cid, new) 
	local player = Player(cid)
    local acc = player:getAccountId()
    if new == 2 then
        db.query("UPDATE `accounts` SET language = 2 WHERE `id` = " .. acc)
    elseif new == 1 then
        db.query("UPDATE `accounts` SET language = 1 WHERE `id` = " .. acc)
    else
        db.query("UPDATE `accounts` SET language = 0 WHERE `id` = " .. acc)
    end  
end