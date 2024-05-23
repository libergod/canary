local food = TalkAction("!food")

function food.onSay(player, words, param)
    if player:removeMoneyBank(1000) then
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
        player:addItem(3725, 100)    
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You bought brown mushrooms for 1k!")
    else
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        player:sendCancelMessage("You don\'t have 1k.")
    end
end

food:groupType("normal")
food:register()