SUPERUP = {
	msg = {
		naoDisponivel = "This exp cave is currently occupied by %s until %s.",
		disponivel = "Congratulations! You successfully rented a exp cave with a duration of %d %s!",
		naoItem = "You need a %s to rent an exp cave.",
		tempoAcabou = "Your time at the cave finished!",
		possuiCave = "You already own a exp cave!",
	},
	areas = {
		[20000] = {nome = "Demon", entrada = Position(2283, 824, 7), from = Position(2264, 775, 7), to = Position(2356, 846, 7)},
		[20001] = {nome = "Grim Reaper", entrada = Position(548, 1249, 7), from = Position(2121, 897, 7), to = Position(2221, 1038, 7)},
		[20002] = {nome = "Rotten Golem", entrada = Position(548, 1249, 7), from = Position(2247, 1088, 7), to = Position(2315, 1169, 7)},
		[20003] = {nome = "Dark Torturer", entrada = Position(548, 1249, 7), from = Position(1954, 1059, 7), to = Position(2083, 1146, 7)},
		[20004] = {nome = "Vexclaw", entrada = Position(548, 1249, 7), from = Position(1952, 1172, 7), to = Position(2040, 1234, 7)},
		[20005] = {nome = "True Dawnfire Asura", entrada = Position(548, 1249, 7), from = Position(2243, 975, 7), to = Position(2325, 1074, 7)},
		[20006] = {nome = "Brachiodemon", entrada = Position(548, 1249, 7), from = Position(2231, 899, 7), to = Position(2330, 968, 7)},
		[20007] = {nome = "Floating Savant", entrada = Position(548, 1249, 7), from = Position(2244, 1183, 7), to = Position(2316, 1260, 7)},
		[20008] = {nome = "Infernal Demon", entrada = Position(548, 1249, 7), from = Position(1963, 803, 7), to = Position(2080, 884, 7)},
		[20009] = {nome = "Frost Dragon", entrada = Position(548, 1249, 7), from = Position(2104, 1056, 7), to = Position(2226, 1148, 7)},
		[20010] = {nome = "Hydra", entrada = Position(548, 1249, 7), from = Position(1964, 898, 7), to = Position(2082, 953, 7)},
		[20011] = {nome = "Ghastly Dragon", entrada = Position(548, 1249, 7), from = Position(2358, 909, 7), to = Position(2441, 963, 7)},
		[20012] = {nome = "Lava Lurker", entrada = Position(548, 1249, 7), from = Position(2098, 786, 7), to = Position(2245, 880, 7)},
		[20013] = {nome = "Sparkion", entrada = Position(548, 1249, 7), from = Position(2215, 1278, 7), to = Position(2299, 1355, 7)},
		[20014] = {nome = "Behemoth", entrada = Position(548, 1249, 7), from = Position(1960, 960, 7), to = Position(2092, 1044, 7)},
		[20015] = {nome = "Behemoth", entrada = Position(548, 1249, 7), from = Position(2264, 775, 7), to = Position(2356, 846, 7)},
		[20016] = {nome = "Cyclops Drone", entrada = Position(548, 1249, 7), from = Position(2360, 977, 7), to = Position(2462, 1086, 7)},
		[20017] = {nome = "Warlock", entrada = Position(548, 1249, 7), from = Position(2070, 1251, 7), to = Position(2184, 1326, 7)},
		[20018] = {nome = "Hero", entrada = Position(548, 1249, 7), from = Position(2070, 1161, 7), to = Position(2176, 1235, 7)},
		[20019] = {nome = "Cobra Vizier", entrada = Position(548, 1249, 7), from = Position(2340, 1103, 7), to = Position(2388, 1190, 7)},
		[20020] = {nome = "Werelion", entrada = Position(548, 1249, 7), from = Position(1948, 1249, 7), to = Position(2044, 1372, 7)},
	},
	setTime = 1, -- Em horas
	itemID = 12305,
}

function SUPERUP:getCave(id)
	local resultCave = db.storeQuery("SELECT guid_player, to_time FROM exclusive_hunts WHERE `hunt_id` = " .. id)
	if not resultCave then
		return false
	end

	local caveOwner = result.getNumber(resultCave, "guid_player")
	local caveTime = result.getDataLong(resultCave, "to_time")
	result.free(resultCave)

	return {dono = caveOwner, tempo = caveTime}
end

function SUPERUP:freeCave()
	freeCaves = { }
	local fres = db.storeQuery("SELECT `hunt_id`, `to_time`, `guid_player` FROM exclusive_hunts")
	if not fres then
		return
	end

	repeat
		local idHunt = result.getNumber(fres, "hunt_id")
		local tempoFinal = result.getDataLong(fres, "to_time")
		local guidPlayer = result.getNumber(fres, "guid_player")
		--Spdlog.info("[EXP CAVE] - Inserted in Table: ID Hunt: "..idHunt.." Tempo Final: "..tempoFinal.." guidPlayer: "..guidPlayer)
		table.insert(freeCaves, {idHunt, tempoFinal, guidPlayer})

	until not result.next(fres)
	return freeCaves
end
