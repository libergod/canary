local CONFIG_OUTFITS = {
	list = {
		[1] = {lookType = 875, lookHead = 79, lookBody = 3, lookLegs = 4, lookFeet = 2, lookAddons = 3, lookMount = 0}, -- amarelo Normal
		[2] = {lookType = 875, lookHead = 77, lookBody = 39, lookLegs = 115, lookFeet = 2, lookAddons = 3, lookMount = 0}, -- vermelho reflect
		[3] = {lookType = 875, lookHead = 85, lookBody = 104, lookLegs = 125, lookFeet = 2, lookAddons = 3, lookMount = 0} -- azul imune
	},
}

local transformScourge = CreatureEvent("transformScourge")
function transformScourge.onThink(creature)
	
	local targetMonster = creature:getMonster()
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'the scourge of oblivion' then
		return true
	end
	
	
	local storagevalue = Game.getStorageValue(GlobalStorage.TheSecretLibrary.ScourageTransform)
	local storagevalue2 = Game.getStorageValue(GlobalStorage.TheSecretLibrary.ScourageTransform2)
	
	if storagevalue == 1 and storagevalue2 == 1 then
		
		local outfits = math.random(2,3)
		local creaturePosition = creature:getPosition()
		local outfitx = CONFIG_OUTFITS.list[outfits]

		creature:setOutfit(outfitx)
		
		if outfits == 2 then
			creature:say("The Scourge Of Oblivion activates its reflective shields!", TALKTYPE_MONSTER_YELL) -- if 2 vermelho
			Game.setStorageValue(GlobalStorage.TheSecretLibrary.ScourageTransform, 2)
		elseif outfits == 3 then
			creature:say("The Scourge Of Oblivion prepares a devastating attack!", TALKTYPE_MONSTER_YELL) -- if 3 azul
			Game.setStorageValue(GlobalStorage.TheSecretLibrary.ScourageTransform, 3)
		end
		
	elseif storagevalue == -1 and storagevalue2 == -1 then
	
	Game.setStorageValue(GlobalStorage.TheSecretLibrary.ScourageTransform2, 1)
	
	local outfitx = CONFIG_OUTFITS.list[1]
	creature:setOutfit(outfitx)

		addEvent(function()

			Game.setStorageValue(GlobalStorage.TheSecretLibrary.ScourageTransform, 1)

		end, 30 * 1000)

	end
	
	return true
end

transformScourge:register()
