local CONFIG_OUTFITS = {
	list = {
		[1] = {lookType = 12, lookHead = 10, lookBody = 57, lookLegs = 0, lookFeet = 0, lookAddons = 0, lookMount = 0},
		[2] = {lookType = 12, lookHead = 77, lookBody = 96, lookLegs = 0, lookFeet = 0, lookAddons = 0, lookMount = 0},
		[3] = {lookType = 12, lookHead = 81, lookBody = 100, lookLegs = 0, lookFeet = 0, lookAddons = 0, lookMount = 0}
	},
}

local vortexSpellstealer = MoveEvent()

function vortexSpellstealer.onStepIn(creature, item, position, fromPosition)

	local storagevalue = Game.getStorageValue(GlobalStorage.TheSecretLibrary.SpellsteallerTransform)
	
	if item.itemid == 32415 and storagevalue == 3 then --vortex id == verde e storage = 2 (transformado)
		if creature:isMonster() then
			if creature:getName():lower() == "the spellstealer" then
				if creature:getOutfit().lookType == 12 and creature:getOutfit().lookHead == 81 and creature:getOutfit().lookBody == 100 then --verde pizando em verde
					creature:setOutfit(CONFIG_OUTFITS.list[1])
					--Spdlog.warn("[TEST vortexSpellstealer] - STEP: 23470")
					Game.setStorageValue(GlobalStorage.TheSecretLibrary.SpellsteallerTransform, -1)
					creature:say("The creation vortex consumes the stolen energy!", TALKTYPE_MONSTER_YELL)
					Game.createMonster("Demon Slave", {x = 1177, y = 409, z = 9}, false, true)
					Game.createMonster("Demon Slave", {x = 1175, y = 411, z = 9}, false, true)
				elseif creature:getOutfit().lookType == 12 and creature:getOutfit().lookHead == 77 and creature:getOutfit().lookBody == 96 then -- verde pizando em vermelho
				--healar 50% vida
					creature:addHealth(creature:getMaxHealth()/2)
					creature:say("HEAL!!", TALKTYPE_MONSTER_YELL)
				end
			end
		end
	elseif item.itemid == 32416 and storagevalue == 3 then --vortex id == vermelho e storage = 2 (transformado)
		if creature:isMonster() then
			if creature:getName():lower() == "the spellstealer" then
				if creature:getOutfit().lookType == 12 and creature:getOutfit().lookHead == 77 and creature:getOutfit().lookBody == 96 then -- vermelho pizando em vermelho
					creature:setOutfit(CONFIG_OUTFITS.list[1])
					--Spdlog.warn("[TEST vortexSpellstealer] - STEP: 22894")
					Game.setStorageValue(GlobalStorage.TheSecretLibrary.SpellsteallerTransform, -1)
					creature:say("The destruction vortex consumes the stolen energy!", TALKTYPE_MONSTER_YELL)
					Game.createMonster("Demon Slave", {x = 1186, y = 422, z = 9}, false, true)
					Game.createMonster("Demon Slave", {x = 1188, y = 420, z = 9}, false, true)
				elseif creature:getOutfit().lookType == 12 and creature:getOutfit().lookHead == 81 and creature:getOutfit().lookBody == 100 then -- verde pisando em vermelho 
				--healar 50% vida
					creature:addHealth(creature:getMaxHealth()/2)
					creature:say("HEAL!!", TALKTYPE_MONSTER_YELL)
				end
			end
		end
	end
	return true
end

vortexSpellstealer:type("stepin")
vortexSpellstealer:aid(21307)
vortexSpellstealer:register()
