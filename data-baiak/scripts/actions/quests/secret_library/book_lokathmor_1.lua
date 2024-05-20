local bookLokathmorFull = Action()

function bookLokathmorFull.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item:getId() == 27879 then
		item:setActionId()
		item:transform(27881)
		item:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		Game.setStorageValue(GlobalStorage.TheSecretLibrary.LokathmorFight, -1) -- Lokathmor solto 
	end
	return true
end

bookLokathmorFull:aid(21306)
bookLokathmorFull:register()
