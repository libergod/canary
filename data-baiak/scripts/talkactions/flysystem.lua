TP_MODAL_SYSTEM = {
    id = 1060, -- se nao souber do que se trata, nao mude
    titulo = "Fly System", -- titulo da janela
    mensagem = "Select your destine", -- mensagem da janela
    
    tempo = 10, -- Tempo em segundos para o jogador poder utilizar o sistema novamente
    
    -- CONFIG DE HOUSES -- 
    houses_modal = true, -- se deseja exibir a house do jogador no modal de teleport, true/false
    house_pago = true, -- se o player precisa pagar para se teleportar para a house, true/false
    house_custo = 5000, -- custo do teleport para a house, caso tenha colocado true acima
    -- FIM DE CONFIG DOS HOUSES -- 
    
    protect_zone = true, -- se o player precisa ta em uma zona segura para utilizar o comando, true/false
    
    msgs = {
        ptz = "You need to be in a Protection Zone to use Fly System!",
        mny = "You don't have %d gold coins to travel!",
        exh = "You need to wait %d seconds until use the Fly System!",
		vipz = "This command is available only for VIP Account! Please recharge at store!",
		moneybank = "You don't have suficient money in bank account or character.",
    },
    
    locais = {
        [1] = {
            nome = 'TEMPLE', -- Nome do local a ser mostrado na janela
            pago = true, -- caso o jogador tenha que pagar para usar o teleport -> true/false
            custo = 10000, -- custo da viagem, caso tenha colocado true acima
            pos = Position(991,1209,7) -- Posicao que ira se teleportar. Segue a ordem: X,Y,Z
        },
        
        [2] = {
            nome = 'DEPOT',
            pago = true,
            custo = 10000,
            pos = Position(961,1211,7)
            
        },
        
        [3] = {
            nome = 'STORES',
            pago = true,
            custo = 10000,
            pos = Position(633,1239,5)
        },
		
		[4] = {
            nome = 'IMBUI ISLAND',
            pago = true,
            custo = 10000,
            pos = Position(1004,1046,7)
        },
		
		[5] = {
            nome = 'TRAINING ISLAND',
            pago = true,
            custo = 10000,
            pos = Position(985,1208,7)
        },
        -- para adicionar mais, copie a partir do [3] até a linha de cima deste comentario, em seguida, adicione modifique para [4] e assim por diante
    },
    
    locais_wp = { }, -- não mexa
    storage = 44958, -- Storage que irá controlar o tempo para utilizar o sistema novamente
}

local function create_modal(id, title, message, tb, p)
    local wd = ModalWindow(id, title, message)
   
    for i, v in pairs(tb.locais) do
        wd:addChoice(i, v.nome .. ' | custo: ' .. ((v.pago and v.custo) or 0))
    end 
    
    local start_tp = #tb.locais
    
    if (TP_MODAL_SYSTEM.houses_modal) then 
        local p_house = p:getHouse()
        if (p_house) then 
            tb.locais_wp[p:getGuid()] = { }
            table.insert(tb.locais_wp[p:getGuid()], {
                nome = "House",
                pago = tb.house_pago,
                custo = tb.house_custo,
                pos = p_house:getExitPosition()
            })
        end 
        if (tb.locais_wp[p:getGuid()]) then 
            for i, v in pairs(tb.locais_wp[p:getGuid()]) do
                wd:addChoice(i + start_tp, v.nome .. ' | custo: ' .. ((v.pago and v.custo) or 0))
            end 
        end 
    end 
   
    wd:addButton(101, "Teleport")
    wd:addButton(100, "Cancel")
    
    wd:setDefaultEnterButton(101)
    wd:setDefaultEscapeButton(100)
    return wd  
end


local function check_cond(p)
    if (p:getStorageValue(TP_MODAL_SYSTEM.storage) >= os.time()) then 
        p:sendCancelMessage((TP_MODAL_SYSTEM.msgs.exh):format(p:getStorageValue(TP_MODAL_SYSTEM.storage) - os.time()))
        p:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end 
    
    if (TP_MODAL_SYSTEM.protect_zone) then 
        if not (Tile(p:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE)) then 
            p:sendCancelMessage(TP_MODAL_SYSTEM.msgs.ptz)
            p:getPosition():sendMagicEffect(CONST_ME_POFF)
            return false 
        end 
    end
    return true
end 

local flySystem = TalkAction("!fly")

function flySystem.onSay(player, words, param)
    if not (check_cond(player)) then 
		return false 
	end
	if not player:isVip() then
		player:sendCancelMessage(TP_MODAL_SYSTEM.msgs.vipz)
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:setStorageValue(TP_MODAL_SYSTEM.storage, os.time() + TP_MODAL_SYSTEM.tempo)
		return false
	end
		player:registerEvent("Modal_tpsystem")
		local window = create_modal(TP_MODAL_SYSTEM.id, TP_MODAL_SYSTEM.titulo, TP_MODAL_SYSTEM.mensagem, TP_MODAL_SYSTEM, player)
		window:sendToPlayer(player)
		player:setStorageValue(TP_MODAL_SYSTEM.storage, os.time() + TP_MODAL_SYSTEM.tempo)
    return true
end

flySystem:groupType("normal")
flySystem:separator(" ")
flySystem:register()