local open = Action()

config = {
  pos = {
    [1] = Position(1047, 202, 11),
    [2] = Position(1048, 202, 11)
  },
  id = 8384,
}

function walls()

config = {
  pos = {
    [1] = Position(1047, 202, 11),
    [2] = Position(1048, 202, 11)
  },
  id = 8384,
}


  for i = 1, 2 do 
		local tile = Tile(config.pos[i])
		if tile then
			local item = tile:getItemById(config.id)
			if item then
				item:getPosition():sendMagicEffect(CONST_ME_POFF)
				item:remove()
			else
				wall = Game.createItem(config.id, 1, config.pos[i])
				wall:getPosition():sendMagicEffect(CONST_ME_POFF)
			end
		end
	end
end

function open.onUse(player, item, fromPosition, target, toPosition, isHotkey)
  
  if item.itemid == 2773 then
    player:getPosition():sendMagicEffect(CONST_ME_POFF)
    return false
  end

  walls()
  player:say("Woow!", TALKTYPE_MONSTER_SAY)
  player:getPosition():sendMagicEffect(50)
  addEvent(function()
    walls()
    item:getPosition():sendMagicEffect(CONST_ME_POFF)
    item:transform(2772)
  end, 3 * 60 * 1000)

  item:getPosition():sendMagicEffect(CONST_ME_POFF)
  item:transform(2773)

  return true
end

open:aid(34513)
open:register()