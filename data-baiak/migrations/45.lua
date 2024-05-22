function onUpdateDatabase()
	logger.info("Updating database to version 46 (RealSoft Custom Scripts v1)")
	logger.info("Updating database to version 46 (Rebirth System)")
	db.query([[
			ALTER TABLE `players` 
		ADD `rebirth` INT(11) NOT NULL DEFAULT 0;
	]])
	
	logger.info("Updating database to version 46 (Boss Room)")
	
	db.query([[
			CREATE TABLE `boss_room` (
	  `room_id` int(11) NOT NULL,
	  `guid_player` varchar(32) NOT NULL,
	  `time` int(11) NOT NULL,
	  `to_time` int(11) NOT NULL
	) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
	]])
	
	logger.info("Updating database to version 46 (Castle WOE)")
	
	db.query([[
			CREATE TABLE `castle` (
	  `id` int(11) NOT NULL,
	  `name` varchar(255) NOT NULL,
	  `guild_id` int(11) NOT NULL DEFAULT 0
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
	]])
	
	db.query([[
			ALTER TABLE `castle`
		  ADD PRIMARY KEY (`id`);
	]])
	
	db.query([[
			CREATE TABLE `tmpwoe` (
	  `started` int(11) NOT NULL,
	  `guild` int(11) NOT NULL,
	  `breaker` int(11) NOT NULL,
	  `time` int(11) NOT NULL,
	  `indexer` int(11) NOT NULL
	) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
	]])
	
	db.query([[
			INSERT INTO `tmpwoe` (`started`, `guild`, `breaker`, `time`, `indexer`) VALUES
		(1682639794, 3, 268435465, 1681862387, 1);
	]])
	
	db.query([[
			CREATE TABLE `woe` (
	  `id` int(11) NOT NULL,
	  `started` int(11) NOT NULL,
	  `guild` int(11) NOT NULL,
	  `breaker` int(11) NOT NULL,
	  `time` int(11) NOT NULL
	) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
	]])
	
	db.query([[
			INSERT INTO `woe` (`id`, `started`, `guild`, `breaker`, `time`) VALUES
	(1, 1673381353, 0, 0, 0);
	]])
	
	logger.info("Updating database to version 46 (Castle 48H)")
	
	db.query([[
			CREATE TABLE `castle_48` (
		  `guild_id` int(11) NOT NULL
		) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
	]])
	
	logger.info("Updating database to version 46 (Exclusive Hunts)")
	
	db.query([[
			CREATE TABLE `exclusive_hunts` (
	  `id` int(11) NOT NULL,
	  `hunt_id` int(11) NOT NULL,
	  `guid_player` varchar(32) NOT NULL,
	  `time` int(11) NOT NULL,
	  `to_time` int(11) NOT NULL
	) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
	]])
	
	db.query([[
			ALTER TABLE `exclusive_hunts`
		ADD PRIMARY KEY (`id`);
	]])
	
	db.query([[
			INSERT INTO `exclusive_hunts` (`id`, `hunt_id`, `guid_player`, `time`, `to_time`) VALUES
		(1, 20001, '0', 0, 0),
		(2, 20002, '0', 0, 0),
		(3, 20003, '0', 0, 0),
		(4, 20004, '0', 0, 0),
		(5, 20005, '0', 0, 0),
		(6, 20006, '0', 0, 0),
		(7, 20007, '0', 0, 0),
		(8, 20008, '0', 0, 0),
		(9, 20009, '0', 0, 0),
		(10, 20010, '0', 0, 0),
		(11, 20011, '0', 0, 0),
		(12, 20012, '0', 0, 0),
		(13, 20013, '0', 0, 0),
		(14, 20014, '0', 0, 0),
		(15, 20015, '0', 0, 0),
		(16, 20016, '0', 0, 0),
		(17, 20017, '0', 0, 0),
		(18, 20018, '0', 0, 0),
		(19, 20019, '0', 0, 0),
		(20, 20020, '0', 0, 0),
		(21, 20000, '0', 0, 0);
]])

	logger.info("Updating database to version 46 (Lottery System)")
	
	db.query([[
			CREATE TABLE `lottery` (
	  `id` int(11) NOT NULL,
	  `name` varchar(255) NOT NULL,
	  `item` varchar(255) NOT NULL,
	  `qnt` int(11) NOT NULL DEFAULT 1,
	  `item_name` varchar(255) NOT NULL,
	  `date` varchar(256) NOT NULL
	) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
	]])
	
	db.query([[
			ALTER TABLE `lottery`
		ADD PRIMARY KEY (`id`);
	]])
	
	logger.info("Updating database to version 46 (Online Points)")
	
	db.query([[
			ALTER TABLE `players` 
		ADD 		
		`online_time` int(11) NOT NULL DEFAULT 0;
	]])
	
	db.query([[
			ALTER TABLE `players` 
		ADD 
		`online_time_month` int(11) NOT NULL DEFAULT 0;
	]])
	
	logger.info("Updating database to version 46 (Restore EXP System)")
	
	db.query([[
			CREATE TABLE `player_exp_restore` (
	  `id` int(11) NOT NULL,
	  `id_player` int(11) NOT NULL,
	  `expBefore` bigint(20) NOT NULL,
	  `expAfter` bigint(20) NOT NULL,
	  `canRestore` tinyint(1) NOT NULL
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
	]])
	
	db.query([[
			ALTER TABLE `player_exp_restore`
		ADD PRIMARY KEY (`id`);
	]])
	
	logger.info("Updating database to version 46 (Snake Game System)")
	
	db.query([[
			CREATE TABLE `snake_game` (
	  `id` int(11) NOT NULL,
	  `guid` int(11) NOT NULL,
	  `points` int(11) NOT NULL
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
	]])
	
	db.query([[
			ALTER TABLE `snake_game`
		ADD PRIMARY KEY (`id`);
	]])
	
	logger.info("Updating database to version 46 (Snow Ball System)")
	
	db.query([[
			CREATE TABLE `snowballwar` (
	  `id` int(11) NOT NULL,
	  `name` varchar(255) NOT NULL,
	  `score` int(11) NOT NULL,
	  `data` varchar(255) NOT NULL,
	  `hora` varchar(255) NOT NULL
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
	]])
	
	db.query([[
			ALTER TABLE `snowballwar`
	  ADD PRIMARY KEY (`id`),
	  ADD KEY `id` (`id`);
	]])
	
	logger.info("Updating database to version 46 (Auction System)")
	
	db.query([[
			CREATE TABLE `auction_system` (
	  `id` int NOT NULL,
	  `player_id` int NOT NULL,
	  `item_name` varchar(255) NOT NULL,
	  `item_id` smallint NOT NULL,
	  `count` smallint NOT NULL,
	  `value` int NOT NULL,
	  `date` bigint NOT NULL
	) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
	]])

	return true
end
