local function check_cond(p, t)
    local pg = t.pago
    if (pg) then 
        local ct = t.custo
		local money = p:getMoney()
		local bankmoney = p:getBankBalance()
		
		if money < ct then
			if bankmoney < ct then
				if money + bankmoney < ct then
					p:sendCancelMessage(TP_MODAL_SYSTEM.msgs.mny:format(t.custo))
					return false
				elseif money + bankmoney >= ct then
					p:sendCancelMessage(TP_MODAL_SYSTEM.msgs.moneybank)
					return false
				end
			else
				p:setBankBalance(bankmoney - ct)
			end
			
		else
			p:removeMoney(ct)
		end
    end
    p:getPosition():sendMagicEffect(CONST_ME_POFF)
    p:teleportTo(t.pos)
    p:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
end 

local function rem_pl(p)
    if (TP_MODAL_SYSTEM.locais_wp[p:getGuid()]) then
        TP_MODAL_SYSTEM.locais_wp[p:getGuid()] = nil
    end
end 


local flyModalCreature = CreatureEvent("Fly Modal")
function flyModalCreature.onModalWindow(player, modalWindowId, buttonId, choiceId)
    player:unregisterEvent("Modal_tpsystem")
    if (modalWindowId == TP_MODAL_SYSTEM.id) then
        if (buttonId == 101) then 
            local tp_tgt = TP_MODAL_SYSTEM.locais[choiceId]
            if (tp_tgt) then 
                check_cond(player, tp_tgt)
            else
                local tp_tgt_w = TP_MODAL_SYSTEM.locais_wp[player:getGuid()]
                if (tp_tgt_w) then 
                    check_cond(player, TP_MODAL_SYSTEM.locais_wp[player:getGuid()][choiceId - #TP_MODAL_SYSTEM.locais])
                end
            end
        end 
        rem_pl(player)
    end
    return true
end

flyModalCreature:register()