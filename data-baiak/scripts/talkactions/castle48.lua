local castle = TalkAction("!castle48")

function castle.onSay(player, words, param)

    if player:getStorageValue(Castle48H.playerStorageVote) >= os.time() then
        player:sendCancelMessage(Castle48H.msg.prefix .. "You already voted!")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    if Game.getStorageValue(Castle48H.storageGlobal) ~= 0 then
        player:sendCancelMessage(Castle48H.msg.prefix .. "The castle are not accepting votes at this moment.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    if not player:getGuild() then
        player:sendCancelMessage(Castle48H.msg.prefix .. "You need to be in a guild to vote.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    if player:getLevel() < Castle48H.levelMin then
        player:sendCancelMessage(Castle48H.msg.prefix .. Castle48H.msg.levelMin:format(Castle48H.levelMin, " or higher to vote."))
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    if param == 1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, Castle48H.msg.prefix .. "You voted to maintain the actual owner of castle.")
        player:getPosition():sendMagicEffect(29)
        Game.setStorageValue(Castle48H.storageVoteOne, Game.getStorageValue(Castle48H.storageVoteOne) + 1)
    elseif param == 2 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, Castle48H.msg.prefix .. "You voted to change ownership to most time holding guild.")
        player:getPosition():sendMagicEffect(30)
        Game.setStorageValue(Castle48H.storageVoteTwo, Game.getStorageValue(Castle48H.storageVoteTwo) + 1)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, Castle48H.msg.prefix .. "Command not recognized.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
    end

    player:setStorageValue(Castle48H.playerStorageVote, os.time() + 3600)
    return false
end

castle:groupType("god")
castle:separator(" ")
castle:register()
