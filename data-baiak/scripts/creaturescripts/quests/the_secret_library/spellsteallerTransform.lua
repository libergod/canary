local CONFIG_OUTFITS = {
	list = {
		[1] = {lookType = 12, lookHead = 10, lookBody = 57, lookLegs = 0, lookFeet = 0, lookAddons = 0, lookMount = 0},
		[2] = {lookType = 12, lookHead = 77, lookBody = 96, lookLegs = 0, lookFeet = 0, lookAddons = 0, lookMount = 0},
		[3] = {lookType = 12, lookHead = 81, lookBody = 100, lookLegs = 0, lookFeet = 0, lookAddons = 0, lookMount = 0}
	},
}

local transformSpellStealler = CreatureEvent("transformSpellStealler")
function transformSpellStealler.onThink(creature)
	
	local targetMonster = creature:getMonster()
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'the spellstealer' then
		return true
	end
	
	
	local storagevalue = Game.getStorageValue(GlobalStorage.TheSecretLibrary.SpellsteallerTransform)
	
	if storagevalue == 1 then
		
		local outfits = math.random(2,3)
		--Spdlog.warn("[TEST SpellsteallerTransform] - outfits: ".. outfits)
	
		local creaturePosition = creature:getPosition()
		local outfitx = CONFIG_OUTFITS.list[outfits]

		--Spdlog.warn("[TEST SpellsteallerTransform] - LookHead: ".. outfitx.lookHead .. " lookBody: ".. outfitx.lookBody)
			creature:setOutfit(outfitx)
			
			if outfits == 2 then
				creature:say("The spellstealer absorbs the power of destruction!", TALKTYPE_MONSTER_YELL) -- if 2
			elseif outfits == 3 then
				creature:say("The spellstealer absorbs the power of creation!", TALKTYPE_MONSTER_YELL) -- if 3
			end
				
			Game.setStorageValue(GlobalStorage.TheSecretLibrary.SpellsteallerTransform, 3)
			
			-- create summons
			--Game.createMonster("Knowledge Raider", {x = 1169, y = 400, z = 8}, false, true)
			--Game.createMonster("Knowledge Raider", {x = 1174, y = 400, z = 8}, false, true)
			--Game.createMonster("Knowledge Raider", {x = 1177, y = 390, z = 8}, false, true)
			--Game.createMonster("Knowledge Raider", {x = 1167, y = 390, z = 8}, false, true)
			--Game.createMonster("Knowledge Raider", {x = 1171, y = 389, z = 8}, false, true)
			
	elseif storagevalue == -1 then
	
	Game.setStorageValue(GlobalStorage.TheSecretLibrary.SpellsteallerTransform, 2)
	
		addEvent(function()

			Game.setStorageValue(GlobalStorage.TheSecretLibrary.SpellsteallerTransform, 1)


		end, 15 * 1000)

	end
	
	return true
end

transformSpellStealler:register()
