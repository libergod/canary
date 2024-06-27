-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 26/05/2024 às 17:22
-- Versão do servidor: 10.3.39-MariaDB-0ubuntu0.20.04.2
-- Versão do PHP: 8.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_realsoft_baiak`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `password` text NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `created` int(11) NOT NULL DEFAULT 0,
  `rlname` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(3) NOT NULL DEFAULT '',
  `web_lastlogin` int(11) NOT NULL DEFAULT 0,
  `web_flags` int(11) NOT NULL DEFAULT 0,
  `email_hash` varchar(32) NOT NULL DEFAULT '',
  `email_new` varchar(255) NOT NULL DEFAULT '',
  `email_new_time` int(11) NOT NULL DEFAULT 0,
  `email_code` varchar(255) NOT NULL DEFAULT '',
  `email_next` int(11) NOT NULL DEFAULT 0,
  `email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `phone` varchar(15) DEFAULT NULL,
  `key` varchar(64) NOT NULL DEFAULT '',
  `premdays` int(11) NOT NULL DEFAULT 0,
  `premdays_purchased` int(11) NOT NULL DEFAULT 0,
  `lastday` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `coins` int(12) UNSIGNED NOT NULL DEFAULT 0,
  `coins_transferable` int(12) UNSIGNED NOT NULL DEFAULT 0,
  `tournament_coins` int(12) UNSIGNED NOT NULL DEFAULT 0,
  `creation` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `recruiter` int(6) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `password`, `email`, `created`, `rlname`, `location`, `country`, `web_lastlogin`, `web_flags`, `email_hash`, `email_new`, `email_new_time`, `email_code`, `email_next`, `email_verified`, `phone`, `key`, `premdays`, `premdays_purchased`, `lastday`, `type`, `coins`, `coins_transferable`, `tournament_coins`, `creation`, `recruiter`) VALUES
(1, 'god', '21298df8a3277357ee55b01df9530b535cf08ec1', '@god', 0, '', '', '', 0, 0, '', '', 0, '', 0, 0, NULL, '', 0, 0, 0, 5, 0, 0, 0, 1716349624, 0),
(2, 'adminliber', '9c6391a317a45c1bc8ca9a4b7cb901d2985e3d63', 'admin@realsoft.com', 1716421187, '', '', 'us', 0, 3, '', '', 0, '', 0, 0, NULL, '', 95, 98, 1724974954, 6, 0, 40, 0, 1716421457, 0),
(3, 'libertest', '9c6391a317a45c1bc8ca9a4b7cb901d2985e3d63', 'libergod.oficial@gmail.com', 1716580240, '', '', 'br', 1716704470, 0, '', '', 0, '', 0, 0, NULL, '', 0, 0, 0, 1, 0, 10, 0, 1716580274, 0);

--
-- Acionadores `accounts`
--
DELIMITER $$
CREATE TRIGGER `oncreate_accounts` AFTER INSERT ON `accounts` FOR EACH ROW BEGIN
			INSERT INTO `account_vipgroups` (`id`, `account_id`, `name`, `customizable`) VALUES (1, NEW.`id`, 'Enemies', 0);
			INSERT INTO `account_vipgroups` (`id`, `account_id`, `name`, `customizable`) VALUES (2, NEW.`id`, 'Friends', 0);
			INSERT INTO `account_vipgroups` (`id`, `account_id`, `name`, `customizable`) VALUES (3, NEW.`id`, 'Trading Partner', 0);
		END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `account_bans`
--

CREATE TABLE `account_bans` (
  `account_id` int(11) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `account_ban_history`
--

CREATE TABLE `account_ban_history` (
  `id` int(11) NOT NULL,
  `account_id` int(11) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expired_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `account_sessions`
--

CREATE TABLE `account_sessions` (
  `id` varchar(191) NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `expires` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `account_vipgrouplist`
--

CREATE TABLE `account_vipgrouplist` (
  `account_id` int(11) UNSIGNED NOT NULL COMMENT 'id of account whose viplist entry it is',
  `player_id` int(11) NOT NULL COMMENT 'id of target player of viplist entry',
  `vipgroup_id` tinyint(3) UNSIGNED NOT NULL COMMENT 'id of vip group that player belongs'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `account_vipgroups`
--

CREATE TABLE `account_vipgroups` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `account_id` int(11) UNSIGNED NOT NULL COMMENT 'id of account whose vip group entry it is',
  `name` varchar(128) NOT NULL,
  `customizable` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `account_vipgroups`
--

INSERT INTO `account_vipgroups` (`id`, `account_id`, `name`, `customizable`) VALUES
(1, 1, 'Friends', 0),
(1, 2, 'Friends', 0),
(1, 3, 'Friends', 0),
(2, 1, 'Enemies', 0),
(2, 2, 'Enemies', 0),
(2, 3, 'Enemies', 0),
(3, 1, 'Trading Partners', 0),
(3, 2, 'Trading Partners', 0),
(3, 3, 'Trading Partners', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `account_viplist`
--

CREATE TABLE `account_viplist` (
  `account_id` int(11) UNSIGNED NOT NULL COMMENT 'id of account whose viplist entry it is',
  `player_id` int(11) NOT NULL COMMENT 'id of target player of viplist entry',
  `description` varchar(128) NOT NULL DEFAULT '',
  `icon` tinyint(2) UNSIGNED NOT NULL DEFAULT 0,
  `notify` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `auction_system`
--

CREATE TABLE `auction_system` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_id` smallint(6) NOT NULL,
  `count` smallint(6) NOT NULL,
  `value` int(11) NOT NULL,
  `date` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `boosted_boss`
--

CREATE TABLE `boosted_boss` (
  `looktypeEx` int(11) NOT NULL DEFAULT 0,
  `looktype` int(11) NOT NULL DEFAULT 136,
  `lookfeet` int(11) NOT NULL DEFAULT 0,
  `looklegs` int(11) NOT NULL DEFAULT 0,
  `lookhead` int(11) NOT NULL DEFAULT 0,
  `lookbody` int(11) NOT NULL DEFAULT 0,
  `lookaddons` int(11) NOT NULL DEFAULT 0,
  `lookmount` int(11) DEFAULT 0,
  `date` varchar(250) NOT NULL DEFAULT '',
  `boostname` text DEFAULT NULL,
  `raceid` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `boosted_boss`
--

INSERT INTO `boosted_boss` (`looktypeEx`, `looktype`, `lookfeet`, `looklegs`, `lookhead`, `lookbody`, `lookaddons`, `lookmount`, `date`, `boostname`, `raceid`) VALUES
(0, 1040, 0, 0, 0, 0, 0, 0, '26', 'Shadowpelt', '1561');

-- --------------------------------------------------------

--
-- Estrutura para tabela `boosted_creature`
--

CREATE TABLE `boosted_creature` (
  `looktype` int(11) NOT NULL DEFAULT 136,
  `lookfeet` int(11) NOT NULL DEFAULT 0,
  `looklegs` int(11) NOT NULL DEFAULT 0,
  `lookhead` int(11) NOT NULL DEFAULT 0,
  `lookbody` int(11) NOT NULL DEFAULT 0,
  `lookaddons` int(11) NOT NULL DEFAULT 0,
  `lookmount` int(11) DEFAULT 0,
  `date` varchar(250) NOT NULL DEFAULT '',
  `boostname` text DEFAULT NULL,
  `raceid` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `boosted_creature`
--

INSERT INTO `boosted_creature` (`looktype`, `lookfeet`, `looklegs`, `lookhead`, `lookbody`, `lookaddons`, `lookmount`, `date`, `boostname`, `raceid`) VALUES
(271, 0, 0, 0, 0, 0, 0, '26', 'Dragon Hatchling', '385');

-- --------------------------------------------------------

--
-- Estrutura para tabela `boss_room`
--

CREATE TABLE `boss_room` (
  `room_id` int(11) NOT NULL,
  `guid_player` varchar(32) NOT NULL,
  `time` int(11) NOT NULL,
  `to_time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `castle`
--

CREATE TABLE `castle` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `guild_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `castle_48`
--

CREATE TABLE `castle_48` (
  `guild_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `coins_transactions`
--

CREATE TABLE `coins_transactions` (
  `id` int(11) UNSIGNED NOT NULL,
  `account_id` int(11) UNSIGNED NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL,
  `coin_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `amount` int(12) UNSIGNED NOT NULL,
  `description` varchar(3500) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `coins_transactions`
--

INSERT INTO `coins_transactions` (`id`, `account_id`, `type`, `coin_type`, `amount`, `description`, `timestamp`) VALUES
(1, 2, 1, 3, 20, 'ADD Coins', '2024-05-24 17:04:31'),
(2, 2, 1, 3, 20, 'ADD Coins', '2024-05-24 18:25:31'),
(3, 3, 1, 3, 10, 'ADD Coins', '2024-05-26 16:39:05');

-- --------------------------------------------------------

--
-- Estrutura para tabela `daily_reward_history`
--

CREATE TABLE `daily_reward_history` (
  `id` int(11) NOT NULL,
  `daystreak` smallint(2) NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `exclusive_hunts`
--

CREATE TABLE `exclusive_hunts` (
  `id` int(11) NOT NULL,
  `hunt_id` int(11) NOT NULL,
  `guid_player` varchar(32) NOT NULL,
  `time` int(11) NOT NULL,
  `to_time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `exclusive_hunts`
--

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

-- --------------------------------------------------------

--
-- Estrutura para tabela `forge_history`
--

CREATE TABLE `forge_history` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `action_type` int(11) NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `is_success` tinyint(4) NOT NULL DEFAULT 0,
  `bonus` tinyint(4) NOT NULL DEFAULT 0,
  `done_at` bigint(20) NOT NULL,
  `done_at_date` datetime DEFAULT current_timestamp(),
  `cost` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `gained` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `global_storage`
--

CREATE TABLE `global_storage` (
  `key` varchar(32) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `global_storage`
--

INSERT INTO `global_storage` (`key`, `value`) VALUES
('14110', '1716699944'),
('40000', '0');

-- --------------------------------------------------------

--
-- Estrutura para tabela `guilds`
--

CREATE TABLE `guilds` (
  `id` int(11) NOT NULL,
  `level` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` int(11) NOT NULL,
  `motd` varchar(255) NOT NULL DEFAULT '',
  `residence` int(11) NOT NULL DEFAULT 0,
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `points` int(11) NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `logo_name` varchar(255) NOT NULL DEFAULT 'default.gif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Acionadores `guilds`
--
DELIMITER $$
CREATE TRIGGER `oncreate_guilds` AFTER INSERT ON `guilds` FOR EACH ROW BEGIN
        INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('The Leader', 3, NEW.`id`);
        INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Vice-Leader', 2, NEW.`id`);
        INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Member', 1, NEW.`id`);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `guildwar_kills`
--

CREATE TABLE `guildwar_kills` (
  `id` int(11) NOT NULL,
  `killer` varchar(50) NOT NULL,
  `target` varchar(50) NOT NULL,
  `killerguild` int(11) NOT NULL DEFAULT 0,
  `targetguild` int(11) NOT NULL DEFAULT 0,
  `warid` int(11) NOT NULL DEFAULT 0,
  `time` bigint(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `guild_invites`
--

CREATE TABLE `guild_invites` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `guild_id` int(11) NOT NULL DEFAULT 0,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `guild_membership`
--

CREATE TABLE `guild_membership` (
  `player_id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `nick` varchar(15) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `guild_ranks`
--

CREATE TABLE `guild_ranks` (
  `id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL COMMENT 'guild',
  `name` varchar(255) NOT NULL COMMENT 'rank name',
  `level` int(11) NOT NULL COMMENT 'rank level - leader, vice, member, maybe something else'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `guild_wars`
--

CREATE TABLE `guild_wars` (
  `id` int(11) NOT NULL,
  `guild1` int(11) NOT NULL DEFAULT 0,
  `guild2` int(11) NOT NULL DEFAULT 0,
  `name1` varchar(255) NOT NULL,
  `name2` varchar(255) NOT NULL,
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 0,
  `started` bigint(15) NOT NULL DEFAULT 0,
  `ended` bigint(15) NOT NULL DEFAULT 0,
  `frags_limit` smallint(4) UNSIGNED NOT NULL DEFAULT 0,
  `payment` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  `duration_days` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `houses`
--

CREATE TABLE `houses` (
  `id` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `new_owner` int(11) NOT NULL DEFAULT -1,
  `paid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `warnings` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `rent` int(11) NOT NULL DEFAULT 0,
  `town_id` int(11) NOT NULL DEFAULT 0,
  `bid` int(11) NOT NULL DEFAULT 0,
  `bid_end` int(11) NOT NULL DEFAULT 0,
  `last_bid` int(11) NOT NULL DEFAULT 0,
  `highest_bidder` int(11) NOT NULL DEFAULT 0,
  `size` int(11) NOT NULL DEFAULT 0,
  `guildid` int(11) DEFAULT NULL,
  `beds` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `houses`
--

INSERT INTO `houses` (`id`, `owner`, `new_owner`, `paid`, `warnings`, `name`, `rent`, `town_id`, `bid`, `bid_end`, `last_bid`, `highest_bidder`, `size`, `guildid`, `beds`) VALUES
(1, 0, -1, 1716954423, 0, 'Thunder City #1', 0, 1, 0, 0, 0, 0, 29, NULL, 0),
(2, 0, -1, 1716954423, 0, 'Thunder City #2', 0, 1, 0, 0, 0, 0, 36, NULL, 0),
(3, 0, -1, 1716954423, 0, 'Thunder City #3', 0, 1, 0, 0, 0, 0, 36, NULL, 0),
(4, 0, -1, 1716954423, 0, 'Thunder City #4', 0, 1, 0, 0, 0, 0, 37, NULL, 0),
(5, 0, -1, 1716954423, 0, 'Thunder City #5', 0, 1, 0, 0, 0, 0, 33, NULL, 0),
(6, 0, -1, 1716954423, 0, 'Thunder City #6', 0, 1, 0, 0, 0, 0, 29, NULL, 0),
(7, 0, -1, 1716954423, 0, 'Thunder City #7', 0, 1, 0, 0, 0, 0, 14, NULL, 0),
(8, 0, -1, 1716954423, 0, 'Thunder City #9', 0, 1, 0, 0, 0, 0, 35, NULL, 0),
(9, 0, -1, 1716954423, 0, 'Thunder City #10', 0, 1, 0, 0, 0, 0, 50, NULL, 0),
(10, 0, -1, 1716954423, 0, 'Thunder City #11', 0, 1, 0, 0, 0, 0, 33, NULL, 0),
(11, 0, -1, 1716954423, 0, 'Thunder City #12', 0, 1, 0, 0, 0, 0, 30, NULL, 0),
(12, 0, -1, 1716954423, 0, 'Thunder City #13', 0, 1, 0, 0, 0, 0, 39, NULL, 0),
(13, 0, -1, 1716954423, 0, 'Thunder City #14', 0, 1, 0, 0, 0, 0, 35, NULL, 0),
(14, 0, -1, 1716954423, 0, 'Thunder City #15', 0, 1, 0, 0, 0, 0, 26, NULL, 0),
(15, 0, -1, 1716954423, 0, 'Thunder City #16', 0, 1, 0, 0, 0, 0, 21, NULL, 0),
(16, 0, -1, 1716954423, 0, 'Thunder City #17', 0, 1, 0, 0, 0, 0, 33, NULL, 0),
(17, 0, -1, 1716954423, 0, 'Thunder City #18', 0, 1, 0, 0, 0, 0, 30, NULL, 0),
(18, 0, -1, 1716954423, 0, 'Thunder City #19', 0, 1, 0, 0, 0, 0, 27, NULL, 0),
(19, 0, -1, 1716954423, 0, 'Thunder City #20', 0, 1, 0, 0, 0, 0, 26, NULL, 0),
(20, 0, -1, 1716954423, 0, 'Thunder City #21', 0, 1, 0, 0, 0, 0, 31, NULL, 0),
(21, 0, -1, 1716954423, 0, 'Thunder City #22', 0, 1, 0, 0, 0, 0, 38, NULL, 0),
(22, 0, -1, 1716954423, 0, 'Thunder City #23', 0, 1, 0, 0, 0, 0, 23, NULL, 0),
(23, 0, -1, 1716954423, 0, 'Thunder City #24', 0, 1, 0, 0, 0, 0, 26, NULL, 0),
(24, 0, -1, 1716954423, 0, 'Thunder City #25', 0, 1, 0, 0, 0, 0, 373, NULL, 0),
(25, 0, -1, 1716954423, 0, 'Thunder City #26', 0, 1, 0, 0, 0, 0, 39, NULL, 0),
(26, 0, -1, 1716954423, 0, 'Thunder City #27', 0, 1, 0, 0, 0, 0, 44, NULL, 0),
(27, 0, -1, 1716954423, 0, 'Thunder City #28', 0, 1, 0, 0, 0, 0, 39, NULL, 0),
(28, 0, -1, 1716954423, 0, 'Thunder City #29', 0, 1, 0, 0, 0, 0, 55, NULL, 0),
(29, 0, -1, 1716954423, 0, 'Thunder City #30', 0, 1, 0, 0, 0, 0, 56, NULL, 0),
(30, 0, -1, 1716954423, 0, 'Thunder City #31', 0, 1, 0, 0, 0, 0, 25, NULL, 0),
(31, 0, -1, 1716954423, 0, 'Thunder City #32', 0, 1, 0, 0, 0, 0, 25, NULL, 0),
(32, 0, -1, 1716954423, 0, 'Thunder City #33', 0, 1, 0, 0, 0, 0, 25, NULL, 0),
(33, 0, -1, 1716954423, 0, 'Thunder City #34', 0, 1, 0, 0, 0, 0, 45, NULL, 0),
(34, 0, -1, 1716954423, 0, 'Thunder City #35', 0, 1, 0, 0, 0, 0, 161, NULL, 0),
(35, 0, -1, 1716954423, 0, 'Thunder City #36', 0, 1, 0, 0, 0, 0, 35, NULL, 0),
(36, 0, -1, 1716954423, 0, 'Thunder City #37', 0, 1, 0, 0, 0, 0, 35, NULL, 0),
(37, 0, -1, 1716954423, 0, 'Thunder City #38', 0, 1, 0, 0, 0, 0, 35, NULL, 0),
(38, 0, -1, 1716954423, 0, 'Thunder City #39', 0, 1, 0, 0, 0, 0, 59, NULL, 0),
(39, 0, -1, 1716954423, 0, 'Thunder City #40', 0, 1, 0, 0, 0, 0, 38, NULL, 0),
(40, 0, -1, 1716954423, 0, 'Thunder City #41', 0, 1, 0, 0, 0, 0, 39, NULL, 0),
(41, 0, -1, 1716954423, 0, 'Thunder City #42', 0, 1, 0, 0, 0, 0, 33, NULL, 0),
(42, 0, -1, 1716954423, 0, 'Thunder City #43', 0, 1, 0, 0, 0, 0, 31, NULL, 0),
(43, 0, -1, 1716954423, 0, 'Thunder City #44', 0, 1, 0, 0, 0, 0, 33, NULL, 0),
(44, 0, -1, 1716954423, 0, 'Thunder City #45', 0, 1, 0, 0, 0, 0, 31, NULL, 0),
(45, 0, -1, 1716954423, 0, 'Thunder City #46', 0, 1, 0, 0, 0, 0, 40, NULL, 0),
(46, 0, -1, 1716954423, 0, 'Thunder City #47', 0, 1, 0, 0, 0, 0, 35, NULL, 0),
(47, 0, -1, 1716954423, 0, 'Thunder City #48', 0, 1, 0, 0, 0, 0, 43, NULL, 0),
(48, 0, -1, 1716954423, 0, 'Thunder City #49', 0, 1, 0, 0, 0, 0, 21, NULL, 0),
(49, 0, -1, 1716954423, 0, 'Thunder City #50', 0, 1, 0, 0, 0, 0, 24, NULL, 0),
(50, 0, -1, 1716954423, 0, 'Thunder City #51', 0, 1, 0, 0, 0, 0, 39, NULL, 0),
(51, 0, -1, 1716954423, 0, 'Thunder City #52', 0, 1, 0, 0, 0, 0, 77, NULL, 0),
(52, 0, -1, 1716954423, 0, 'Thunder City #53', 0, 1, 0, 0, 0, 0, 77, NULL, 0),
(53, 0, -1, 1716954423, 0, 'Thunder City #54', 0, 1, 0, 0, 0, 0, 33, NULL, 0),
(54, 0, -1, 1716954423, 0, 'Thunder City #55', 0, 1, 0, 0, 0, 0, 41, NULL, 0),
(55, 0, -1, 1716954423, 0, 'Thunder City #56', 0, 1, 0, 0, 0, 0, 33, NULL, 0),
(56, 0, -1, 1716954423, 0, 'Thunder City #57', 0, 1, 0, 0, 0, 0, 35, NULL, 0),
(57, 0, -1, 1716954423, 0, 'Thunder City #58', 0, 1, 0, 0, 0, 0, 27, NULL, 0),
(58, 0, -1, 1716954423, 0, 'Thunder City #59', 0, 1, 0, 0, 0, 0, 25, NULL, 0),
(59, 0, -1, 1716954423, 0, 'Thunder City #60', 0, 1, 0, 0, 0, 0, 36, NULL, 0),
(60, 0, -1, 1716954423, 0, 'Thunder City #61', 0, 1, 0, 0, 0, 0, 27, NULL, 0),
(61, 0, -1, 1716954423, 0, 'Thunder City #62', 0, 1, 0, 0, 0, 0, 43, NULL, 0),
(62, 0, -1, 1716954423, 0, 'Thunder City #63', 0, 1, 0, 0, 0, 0, 41, NULL, 0),
(63, 0, -1, 1716954423, 0, 'Thunder City #64', 0, 1, 0, 0, 0, 0, 43, NULL, 0),
(64, 0, -1, 1716954423, 0, 'Thunder City #65', 0, 1, 0, 0, 0, 0, 34, NULL, 0),
(65, 0, -1, 1716954423, 0, 'Thunder City #66', 0, 1, 0, 0, 0, 0, 17, NULL, 0),
(66, 0, -1, 1716954423, 0, 'Thunder City #67', 0, 1, 0, 0, 0, 0, 31, NULL, 0),
(67, 0, -1, 1716954423, 0, 'Thunder City #68', 0, 1, 0, 0, 0, 0, 35, NULL, 0),
(68, 0, -1, 1716954423, 0, 'Thunder City #69', 0, 1, 0, 0, 0, 0, 55, NULL, 0),
(69, 0, -1, 1716954423, 0, 'Thunder City #70', 0, 1, 0, 0, 0, 0, 49, NULL, 0),
(70, 0, -1, 1716954423, 0, 'Thunder City #71', 0, 1, 0, 0, 0, 0, 40, NULL, 0),
(71, 0, -1, 1716954423, 0, 'Thunder City #72', 0, 1, 0, 0, 0, 0, 33, NULL, 0),
(72, 0, -1, 1716954423, 0, 'Thunder City #73', 0, 1, 0, 0, 0, 0, 23, NULL, 0),
(73, 0, -1, 1716954423, 0, 'Thunder City #74', 0, 1, 0, 0, 0, 0, 38, NULL, 0),
(74, 0, -1, 1716954423, 0, 'Thunder City #75', 0, 1, 0, 0, 0, 0, 33, NULL, 0),
(75, 0, -1, 1716954423, 0, 'Thunder City #76', 0, 1, 0, 0, 0, 0, 9, NULL, 0),
(76, 0, -1, 1716954423, 0, 'Thunder City #77', 0, 1, 0, 0, 0, 0, 9, NULL, 0),
(77, 0, -1, 1716954423, 0, 'Thunder City #78', 0, 1, 0, 0, 0, 0, 9, NULL, 0),
(78, 0, -1, 1716954423, 0, 'Thunder City #79', 0, 1, 0, 0, 0, 0, 9, NULL, 0),
(79, 0, -1, 1716954423, 0, 'Thunder City #80', 0, 1, 0, 0, 0, 0, 9, NULL, 0),
(80, 0, -1, 1716954423, 0, 'Thunder City #81', 0, 1, 0, 0, 0, 0, 9, NULL, 0),
(81, 0, -1, 1716954423, 0, 'Thunder City #82', 0, 1, 0, 0, 0, 0, 9, NULL, 0),
(82, 0, -1, 1716954423, 0, 'Thunder City #83', 0, 1, 0, 0, 0, 0, 9, NULL, 0),
(83, 0, -1, 1716954423, 0, 'Thunder City #84', 0, 1, 0, 0, 0, 0, 94, NULL, 0),
(84, 0, -1, 1716954423, 0, 'Thunder City #85', 0, 1, 0, 0, 0, 0, 27, NULL, 0),
(85, 0, -1, 1716954423, 0, 'Thunder City #86', 0, 1, 0, 0, 0, 0, 25, NULL, 0),
(86, 0, -1, 1716954423, 0, 'Thunder City #87', 0, 1, 0, 0, 0, 0, 24, NULL, 0),
(87, 0, -1, 1716954423, 0, 'Thunder City #88', 0, 1, 0, 0, 0, 0, 34, NULL, 0),
(88, 0, -1, 1716954423, 0, 'Thunder City #89', 0, 1, 0, 0, 0, 0, 39, NULL, 0),
(89, 0, -1, 1716954423, 0, 'Thunder City #90', 0, 1, 0, 0, 0, 0, 43, NULL, 0),
(90, 0, -1, 1716954423, 0, 'Thunder City #91', 0, 1, 0, 0, 0, 0, 31, NULL, 0),
(91, 0, -1, 1716954423, 0, 'Thunder City #92', 0, 1, 0, 0, 0, 0, 16, NULL, 0),
(92, 0, -1, 1716954423, 0, 'Thunder City #93', 0, 1, 0, 0, 0, 0, 20, NULL, 0),
(93, 0, -1, 1716954423, 0, 'Thunder City #94', 0, 1, 0, 0, 0, 0, 18, NULL, 0),
(94, 0, -1, 1716954423, 0, 'Thunder City #95', 0, 1, 0, 0, 0, 0, 40, NULL, 0),
(95, 0, -1, 1716954423, 0, 'Thunder City #96', 0, 1, 0, 0, 0, 0, 36, NULL, 0),
(96, 0, -1, 1716954423, 0, 'Thunder City #97', 0, 1, 0, 0, 0, 0, 17, NULL, 0),
(97, 0, -1, 1716954423, 0, 'Jamila Island #1', 0, 2, 0, 0, 0, 0, 43, NULL, 0),
(98, 0, -1, 1716954423, 0, 'Jamila Island #2', 0, 2, 0, 0, 0, 0, 52, NULL, 0),
(99, 0, -1, 1716954423, 0, 'Jamila Island #3', 0, 2, 0, 0, 0, 0, 39, NULL, 0),
(100, 0, -1, 1716954423, 0, 'Jamila Island #4', 0, 2, 0, 0, 0, 0, 67, NULL, 0),
(101, 0, -1, 1716954423, 0, 'Jamila Island #5', 0, 2, 0, 0, 0, 0, 30, NULL, 0),
(102, 0, -1, 1716954423, 0, 'Jamila Island #6', 0, 2, 0, 0, 0, 0, 24, NULL, 0),
(103, 0, -1, 1716954423, 0, 'Jamila Island #7', 0, 2, 0, 0, 0, 0, 20, NULL, 0),
(104, 0, -1, 1716954423, 0, 'Jamila Island #8', 0, 2, 0, 0, 0, 0, 27, NULL, 0),
(105, 0, -1, 1716954423, 0, 'Jamila Island #9', 0, 2, 0, 0, 0, 0, 28, NULL, 0),
(106, 0, -1, 1716954423, 0, 'Jamila Island #10', 0, 2, 0, 0, 0, 0, 28, NULL, 0),
(107, 0, -1, 1716954423, 0, 'Jamila Island #11', 0, 2, 0, 0, 0, 0, 50, NULL, 0),
(108, 0, -1, 1716954423, 0, 'Jamila Island #12', 0, 2, 0, 0, 0, 0, 37, NULL, 0),
(109, 0, -1, 1716954423, 0, 'Jamila Island #13', 0, 2, 0, 0, 0, 0, 27, NULL, 0),
(110, 0, -1, 1716954423, 0, 'Jamila Island #14', 0, 2, 0, 0, 0, 0, 68, NULL, 0),
(111, 0, -1, 1716954423, 0, 'Jamila Island #15', 0, 2, 0, 0, 0, 0, 15, NULL, 0),
(112, 0, -1, 1716954423, 0, 'Jamila Island #16', 0, 2, 0, 0, 0, 0, 15, NULL, 0),
(113, 0, -1, 1716954423, 0, 'Jamila Island #17', 0, 2, 0, 0, 0, 0, 18, NULL, 0),
(114, 0, -1, 1716954423, 0, 'Jamila Island #18', 0, 2, 0, 0, 0, 0, 18, NULL, 0),
(115, 0, -1, 1716954423, 0, 'Jamila Island #19', 0, 2, 0, 0, 0, 0, 16, NULL, 0),
(116, 0, -1, 1716954423, 0, 'Jamila Island #20', 0, 2, 0, 0, 0, 0, 16, NULL, 0),
(117, 0, -1, 1716954423, 0, 'Jamila Island #21', 0, 2, 0, 0, 0, 0, 13, NULL, 0),
(118, 0, -1, 1716954423, 0, 'Jamila Island #22', 0, 2, 0, 0, 0, 0, 13, NULL, 0),
(119, 0, -1, 1716954423, 0, 'Bhark #1', 0, 5, 0, 0, 0, 0, 16, NULL, 0),
(120, 0, -1, 1716954423, 0, 'Bhark #2', 0, 5, 0, 0, 0, 0, 16, NULL, 0),
(121, 0, -1, 1716954423, 0, 'Bhark #3', 0, 5, 0, 0, 0, 0, 6, NULL, 0),
(122, 0, -1, 1716954423, 0, 'Bhark #4', 0, 5, 0, 0, 0, 0, 6, NULL, 0),
(123, 0, -1, 1716954423, 0, 'Bhark #5', 0, 5, 0, 0, 0, 0, 22, NULL, 0),
(124, 0, -1, 1716954423, 0, 'Bhark #6', 0, 5, 0, 0, 0, 0, 22, NULL, 0),
(125, 0, -1, 1716954423, 0, 'Bhark #7', 0, 5, 0, 0, 0, 0, 48, NULL, 0),
(126, 0, -1, 1716954423, 0, 'Bhark #8', 0, 5, 0, 0, 0, 0, 12, NULL, 0),
(127, 0, -1, 1716954423, 0, 'Bhark #9', 0, 5, 0, 0, 0, 0, 31, NULL, 0),
(128, 0, -1, 1716954423, 0, 'Bhark #10', 0, 5, 0, 0, 0, 0, 25, NULL, 0),
(129, 0, -1, 1716954423, 0, 'Bhark #11', 0, 5, 0, 0, 0, 0, 34, NULL, 0),
(130, 0, -1, 1716954423, 0, 'Bhark #12', 0, 5, 0, 0, 0, 0, 9, NULL, 0),
(131, 0, -1, 1716954423, 0, 'Bhark #13', 0, 5, 0, 0, 0, 0, 22, NULL, 0),
(132, 0, -1, 1716954423, 0, 'Bhark #14', 0, 5, 0, 0, 0, 0, 9, NULL, 0),
(133, 0, -1, 1716954423, 0, 'Bhark #15', 0, 5, 0, 0, 0, 0, 13, NULL, 0),
(134, 0, -1, 1716954423, 0, 'Bhark #16', 0, 5, 0, 0, 0, 0, 16, NULL, 0),
(135, 0, -1, 1716954423, 0, 'Bhark #17', 0, 5, 0, 0, 0, 0, 40, NULL, 0),
(136, 0, -1, 1716954423, 0, 'Bhark #18', 0, 5, 0, 0, 0, 0, 22, NULL, 0),
(137, 0, -1, 1716954423, 0, 'Bhark #19', 0, 5, 0, 0, 0, 0, 30, NULL, 0),
(138, 0, -1, 1716954423, 0, 'Bhark #20', 0, 5, 0, 0, 0, 0, 15, NULL, 0),
(139, 0, -1, 1716954423, 0, 'Bhark #21', 0, 5, 0, 0, 0, 0, 20, NULL, 0),
(140, 0, -1, 1716954423, 0, 'Bhark #22', 0, 5, 0, 0, 0, 0, 11, NULL, 0),
(141, 0, -1, 1716954423, 0, 'Bhark #23', 0, 5, 0, 0, 0, 0, 11, NULL, 0),
(142, 0, -1, 1716954423, 0, 'Bhark #24', 0, 5, 0, 0, 0, 0, 22, NULL, 0),
(143, 0, -1, 1716954423, 0, 'Bhark #25', 0, 5, 0, 0, 0, 0, 14, NULL, 0),
(144, 0, -1, 1716954423, 0, 'Bhark #26', 0, 5, 0, 0, 0, 0, 14, NULL, 0),
(145, 0, -1, 1716954423, 0, 'Bhark #27', 0, 5, 0, 0, 0, 0, 11, NULL, 0),
(146, 0, -1, 1716954423, 0, 'Bhark #28', 0, 5, 0, 0, 0, 0, 11, NULL, 0),
(147, 0, -1, 1716954423, 0, 'Bhark #29', 0, 5, 0, 0, 0, 0, 27, NULL, 0),
(148, 0, -1, 1716954423, 0, 'Bhark #30', 0, 5, 0, 0, 0, 0, 41, NULL, 0),
(149, 0, -1, 1716954423, 0, 'Bhark #31', 0, 5, 0, 0, 0, 0, 13, NULL, 0),
(150, 0, -1, 1716954423, 0, 'Bhark #32', 0, 5, 0, 0, 0, 0, 13, NULL, 0),
(151, 0, -1, 1716954423, 0, 'Bhark #33', 0, 5, 0, 0, 0, 0, 10, NULL, 0),
(152, 0, -1, 1716954423, 0, 'Bhark #34', 0, 5, 0, 0, 0, 0, 11, NULL, 0),
(153, 0, -1, 1716954423, 0, 'Bhark #35', 0, 5, 0, 0, 0, 0, 13, NULL, 0),
(154, 0, -1, 1716954423, 0, 'Bhark #36', 0, 5, 0, 0, 0, 0, 13, NULL, 0),
(155, 0, -1, 1716954423, 0, 'Bhark #37', 0, 5, 0, 0, 0, 0, 17, NULL, 0),
(156, 0, -1, 1716954423, 0, 'Bhark #38', 0, 5, 0, 0, 0, 0, 13, NULL, 0),
(157, 0, -1, 1716954423, 0, 'Bhark #39', 0, 5, 0, 0, 0, 0, 19, NULL, 0),
(158, 0, -1, 1716954423, 0, 'Bhark #40', 0, 5, 0, 0, 0, 0, 35, NULL, 0),
(159, 0, -1, 1716954423, 0, 'Bhark #41', 0, 5, 0, 0, 0, 0, 17, NULL, 0),
(160, 0, -1, 1716954423, 0, 'Bhark #42', 0, 5, 0, 0, 0, 0, 19, NULL, 0),
(161, 0, -1, 1716954423, 0, 'Bhark #43', 0, 5, 0, 0, 0, 0, 6, NULL, 0),
(162, 0, -1, 1716954423, 0, 'Bhark #44', 0, 5, 0, 0, 0, 0, 6, NULL, 0),
(163, 0, -1, 1716954423, 0, 'Thunder City #8', 0, 1, 0, 0, 0, 0, 25, NULL, 0),
(164, 0, -1, 1716954423, 0, 'Akravi #1', 0, 3, 0, 0, 0, 0, 37, NULL, 0),
(165, 0, -1, 1716954423, 0, 'Akravi #2', 0, 3, 0, 0, 0, 0, 32, NULL, 0),
(166, 0, -1, 1716954423, 0, 'Akravi #3', 0, 3, 0, 0, 0, 0, 32, NULL, 0),
(167, 0, -1, 1716954423, 0, 'Akravi #4', 0, 3, 0, 0, 0, 0, 31, NULL, 0),
(168, 0, -1, 1716954423, 0, 'Akravi #5', 0, 3, 0, 0, 0, 0, 32, NULL, 0),
(169, 0, -1, 1716954423, 0, 'Akravi #6', 0, 3, 0, 0, 0, 0, 17, NULL, 0),
(170, 0, -1, 1716954423, 0, 'Akravi #7', 0, 3, 0, 0, 0, 0, 17, NULL, 0),
(171, 0, -1, 1716954423, 0, 'Akravi #8', 0, 3, 0, 0, 0, 0, 37, NULL, 0),
(172, 0, -1, 1716954423, 0, 'Akravi #9', 0, 3, 0, 0, 0, 0, 17, NULL, 0),
(173, 0, -1, 1716954423, 0, 'Akravi #10', 0, 3, 0, 0, 0, 0, 17, NULL, 0),
(174, 0, -1, 1716954423, 0, 'Akravi #11', 0, 3, 0, 0, 0, 0, 17, NULL, 0),
(175, 0, -1, 1716954423, 0, 'Akravi #12', 0, 3, 0, 0, 0, 0, 37, NULL, 0),
(176, 0, -1, 1716954423, 0, 'Akravi #13', 0, 3, 0, 0, 0, 0, 17, NULL, 0),
(177, 0, -1, 1716954423, 0, 'Akravi #14', 0, 3, 0, 0, 0, 0, 17, NULL, 0),
(178, 0, -1, 1716954423, 0, 'Akravi #15', 0, 3, 0, 0, 0, 0, 17, NULL, 0),
(179, 0, -1, 1716954423, 0, 'Akravi #16', 0, 3, 0, 0, 0, 0, 37, NULL, 0),
(180, 0, -1, 1716954423, 0, 'Akravi #17', 0, 3, 0, 0, 0, 0, 7, NULL, 0),
(181, 0, -1, 1716954423, 0, 'Akravi #18', 0, 3, 0, 0, 0, 0, 53, NULL, 0),
(182, 0, -1, 1716954423, 0, 'Akravi #19', 0, 3, 0, 0, 0, 0, 26, NULL, 0),
(183, 0, -1, 1716954423, 0, 'Akravi #20', 0, 3, 0, 0, 0, 0, 31, NULL, 0),
(184, 0, -1, 1716954423, 0, 'Akravi #21', 0, 3, 0, 0, 0, 0, 9, NULL, 0),
(185, 0, -1, 1716954423, 0, 'Akravi #22', 0, 3, 0, 0, 0, 0, 7, NULL, 0),
(186, 0, -1, 1716954423, 0, 'Akravi #23', 0, 3, 0, 0, 0, 0, 9, NULL, 0),
(187, 0, -1, 1716954423, 0, 'Akravi #24', 0, 3, 0, 0, 0, 0, 7, NULL, 0),
(188, 0, -1, 1716954423, 0, 'Akravi #25', 0, 3, 0, 0, 0, 0, 17, NULL, 0),
(189, 0, -1, 1716954423, 0, 'Akravi #26', 0, 3, 0, 0, 0, 0, 17, NULL, 0),
(190, 0, -1, 1716954423, 0, 'Akravi #27', 0, 3, 0, 0, 0, 0, 17, NULL, 0),
(191, 0, -1, 1716954423, 0, 'Akravi #28', 0, 3, 0, 0, 0, 0, 17, NULL, 0),
(192, 0, -1, 1716954423, 0, 'Akravi #29', 0, 3, 0, 0, 0, 0, 17, NULL, 0),
(193, 0, -1, 1716954423, 0, 'Akravi #30', 0, 3, 0, 0, 0, 0, 26, NULL, 0),
(194, 0, -1, 1716954423, 0, 'Akravi #31', 0, 3, 0, 0, 0, 0, 7, NULL, 0),
(195, 0, -1, 1716954423, 0, 'Akravi #32', 0, 3, 0, 0, 0, 0, 15, NULL, 0),
(196, 0, -1, 1716954423, 0, 'Akravi #33', 0, 3, 0, 0, 0, 0, 15, NULL, 0),
(197, 0, -1, 1716954423, 0, 'Akravi #34', 0, 3, 0, 0, 0, 0, 15, NULL, 0),
(198, 0, -1, 1716954423, 0, 'Akravi #35', 0, 3, 0, 0, 0, 0, 15, NULL, 0),
(199, 0, -1, 1716954423, 0, 'Wintermere #1', 0, 6, 0, 0, 0, 0, 72, NULL, 0),
(200, 0, -1, 1716954423, 0, 'Wintermere #2', 0, 6, 0, 0, 0, 0, 38, NULL, 0),
(201, 0, -1, 1716954423, 0, 'Wintermere #3', 0, 6, 0, 0, 0, 0, 17, NULL, 0),
(202, 0, -1, 1716954423, 0, 'Wintermere #4', 0, 6, 0, 0, 0, 0, 62, NULL, 0),
(203, 0, -1, 1716954423, 0, 'Wintermere #5', 0, 6, 0, 0, 0, 0, 113, NULL, 0),
(204, 0, -1, 1716954423, 0, 'Wintermere #6', 0, 6, 0, 0, 0, 0, 101, NULL, 0),
(205, 0, -1, 1716954423, 0, 'Wintermere #7', 0, 6, 0, 0, 0, 0, 42, NULL, 0),
(206, 0, -1, 1716954423, 0, 'Wintermere #8', 0, 6, 0, 0, 0, 0, 31, NULL, 0),
(207, 0, -1, 1716954423, 0, 'Wintermere #9', 0, 6, 0, 0, 0, 0, 24, NULL, 0),
(208, 0, -1, 1716954423, 0, 'Wintermere #10', 0, 6, 0, 0, 0, 0, 53, NULL, 0),
(209, 0, -1, 1716954423, 0, 'Wintermere #11', 0, 6, 0, 0, 0, 0, 54, NULL, 0),
(210, 0, -1, 1716954423, 0, 'Wintermere #12', 0, 6, 0, 0, 0, 0, 101, NULL, 0),
(211, 0, -1, 1716954423, 0, 'Wintermere #13', 0, 6, 0, 0, 0, 0, 40, NULL, 0),
(212, 0, -1, 1716954423, 0, 'Wintermere #14', 0, 6, 0, 0, 0, 0, 23, NULL, 0),
(213, 0, -1, 1716954423, 0, 'Wintermere #15', 0, 6, 0, 0, 0, 0, 75, NULL, 0),
(214, 0, -1, 1716954423, 0, 'Wintermere #16', 0, 6, 0, 0, 0, 0, 59, NULL, 0),
(215, 0, -1, 1716954423, 0, 'Wintermere #17', 0, 6, 0, 0, 0, 0, 101, NULL, 0),
(216, 0, -1, 1716954423, 0, 'Wintermere #18', 0, 6, 0, 0, 0, 0, 57, NULL, 0),
(217, 0, -1, 1716954423, 0, 'Wintermere #19', 0, 6, 0, 0, 0, 0, 64, NULL, 0),
(218, 0, -1, 1716954423, 0, 'Wintermere #20', 0, 6, 0, 0, 0, 0, 25, NULL, 0),
(219, 0, -1, 1716954423, 0, 'Wintermere #21', 0, 6, 0, 0, 0, 0, 25, NULL, 0),
(220, 0, -1, 1716954423, 0, 'Wintermere #22', 0, 6, 0, 0, 0, 0, 65, NULL, 0),
(221, 0, -1, 1716954423, 0, 'Wintermere #23', 0, 6, 0, 0, 0, 0, 45, NULL, 0),
(222, 0, -1, 1716954423, 0, 'Wintermere #24', 0, 6, 0, 0, 0, 0, 30, NULL, 0),
(223, 0, -1, 1716954423, 0, 'Wintermere #25', 0, 6, 0, 0, 0, 0, 58, NULL, 0),
(224, 0, -1, 1716954423, 0, 'Al Arar #1', 0, 4, 0, 0, 0, 0, 42, NULL, 0),
(225, 0, -1, 1716954423, 0, 'Al Arar #2', 0, 4, 0, 0, 0, 0, 57, NULL, 0),
(226, 0, -1, 1716954423, 0, 'Al Arar #3', 0, 4, 0, 0, 0, 0, 16, NULL, 0),
(227, 0, -1, 1716954423, 0, 'Al Arar #4', 0, 4, 0, 0, 0, 0, 50, NULL, 0),
(228, 0, -1, 1716954423, 0, 'Al Arar #5', 0, 4, 0, 0, 0, 0, 21, NULL, 0),
(229, 0, -1, 1716954423, 0, 'Al Arar #6', 0, 4, 0, 0, 0, 0, 17, NULL, 0),
(230, 0, -1, 1716954423, 0, 'Al Arar #7', 0, 4, 0, 0, 0, 0, 79, NULL, 0),
(231, 0, -1, 1716954423, 0, 'Al Arar #8', 0, 4, 0, 0, 0, 0, 62, NULL, 0),
(232, 0, -1, 1716954423, 0, 'Al Arar #9', 0, 4, 0, 0, 0, 0, 36, NULL, 0),
(233, 0, -1, 1716954423, 0, 'Al Arar #10', 0, 4, 0, 0, 0, 0, 30, NULL, 0),
(234, 0, -1, 1716954423, 0, 'Al Arar #11', 0, 4, 0, 0, 0, 0, 15, NULL, 0),
(235, 0, -1, 1716954423, 0, 'Al Arar #12', 0, 4, 0, 0, 0, 0, 182, NULL, 0),
(236, 0, -1, 1716954423, 0, 'Al Arar #13', 0, 4, 0, 0, 0, 0, 10, NULL, 0),
(237, 0, -1, 1716954423, 0, 'Shadow Wood #1', 0, 7, 0, 0, 0, 0, 13, NULL, 0),
(238, 0, -1, 1716954423, 0, 'Shadow Wood #2', 0, 7, 0, 0, 0, 0, 15, NULL, 0),
(239, 0, -1, 1716954423, 0, 'Shadow Wood #3', 0, 7, 0, 0, 0, 0, 16, NULL, 0),
(240, 0, -1, 1716954423, 0, 'Shadow Wood #4', 0, 7, 0, 0, 0, 0, 16, NULL, 0),
(241, 0, -1, 1716954423, 0, 'Shadow Wood #5', 0, 7, 0, 0, 0, 0, 22, NULL, 0),
(242, 0, -1, 1716954423, 0, 'Shadow Wood #6', 0, 7, 0, 0, 0, 0, 12, NULL, 0),
(243, 0, -1, 1716954423, 0, 'Shadow Wood #7', 0, 7, 0, 0, 0, 0, 11, NULL, 0),
(244, 0, -1, 1716954423, 0, 'Shadow Wood #8', 0, 7, 0, 0, 0, 0, 12, NULL, 0),
(245, 0, -1, 1716954423, 0, 'Shadow Wood #9', 0, 7, 0, 0, 0, 0, 16, NULL, 0),
(246, 0, -1, 1716954423, 0, 'Shadow Wood #10', 0, 7, 0, 0, 0, 0, 50, NULL, 0),
(247, 0, -1, 1716954423, 0, 'Shadow Wood #11', 0, 7, 0, 0, 0, 0, 14, NULL, 0),
(248, 0, -1, 1716954423, 0, 'Shadow Wood #12', 0, 7, 0, 0, 0, 0, 9, NULL, 0),
(249, 0, -1, 1716954423, 0, 'Shadow Wood #13', 0, 7, 0, 0, 0, 0, 70, NULL, 0),
(250, 0, -1, 1716954423, 0, 'Fork Village #1', 0, 1, 0, 0, 0, 0, 17, NULL, 0),
(251, 0, -1, 1716954423, 0, 'Fork Village #2', 0, 1, 0, 0, 0, 0, 27, NULL, 0),
(252, 0, -1, 1716954423, 0, 'Fork Village #3', 0, 1, 0, 0, 0, 0, 20, NULL, 0),
(253, 0, -1, 1716954423, 0, 'Fork Village #4', 0, 1, 0, 0, 0, 0, 23, NULL, 0),
(254, 0, -1, 1716954423, 0, 'Fork Village #5', 0, 1, 0, 0, 0, 0, 44, NULL, 0),
(255, 0, -1, 1716954423, 0, 'Fork Village #6', 0, 1, 0, 0, 0, 0, 28, NULL, 0),
(256, 0, -1, 1716954423, 0, 'Fork Village #7', 0, 1, 0, 0, 0, 0, 20, NULL, 0),
(257, 0, -1, 1716954423, 0, 'Fork Village #8', 0, 1, 0, 0, 0, 0, 21, NULL, 0),
(258, 0, -1, 1716954423, 0, 'Fork Village #9', 0, 1, 0, 0, 0, 0, 20, NULL, 0),
(259, 0, -1, 1716954423, 0, 'Fork Village #10', 0, 1, 0, 0, 0, 0, 44, NULL, 0),
(260, 0, -1, 1716954423, 0, 'Fork Village #11', 0, 1, 0, 0, 0, 0, 23, NULL, 0),
(261, 0, -1, 1716954423, 0, 'Fork Village #12', 0, 1, 0, 0, 0, 0, 21, NULL, 0),
(262, 0, -1, 1716954423, 0, 'Fork Village #13', 0, 1, 0, 0, 0, 0, 14, NULL, 0),
(263, 0, -1, 1716954423, 0, 'Thunder Hut #1', 0, 1, 0, 0, 0, 0, 16, NULL, 0),
(264, 0, -1, 1716954423, 0, 'Thunder Hut #2', 0, 1, 0, 0, 0, 0, 16, NULL, 0),
(265, 0, -1, 1716954423, 0, 'Thunder Hut #3', 0, 1, 0, 0, 0, 0, 16, NULL, 0),
(266, 0, -1, 1716954423, 0, 'Thunder Hut #4', 0, 1, 0, 0, 0, 0, 10, NULL, 0),
(267, 0, -1, 1716954423, 0, 'Thunder Hut #5', 0, 1, 0, 0, 0, 0, 12, NULL, 0),
(268, 0, -1, 1716954423, 0, 'Premia #1', 0, 8, 0, 0, 0, 0, 393, NULL, 0),
(269, 0, -1, 1716954423, 0, 'Premia #2', 0, 8, 0, 0, 0, 0, 450, NULL, 0),
(270, 0, -1, 1716954423, 0, 'Premia #3', 0, 8, 0, 0, 0, 0, 266, NULL, 0),
(271, 0, -1, 1716954423, 0, 'Premia #4', 0, 8, 0, 0, 0, 0, 262, NULL, 0),
(272, 0, -1, 1716954423, 0, 'Premia #5', 0, 8, 0, 0, 0, 0, 270, NULL, 0),
(273, 0, -1, 1716954423, 0, 'Premia #6', 0, 8, 0, 0, 0, 0, 385, NULL, 0),
(274, 0, -1, 1716954423, 0, 'Premia #7', 0, 8, 0, 0, 0, 0, 160, NULL, 0),
(275, 0, -1, 1716954423, 0, 'Premia #8', 0, 8, 0, 0, 0, 0, 160, NULL, 0),
(276, 0, -1, 1716954423, 0, 'Premia #9', 0, 8, 0, 0, 0, 0, 160, NULL, 0),
(277, 0, -1, 1716954423, 0, 'Premia #10', 0, 8, 0, 0, 0, 0, 542, NULL, 0),
(278, 0, -1, 1716954423, 0, 'Premia #11', 0, 8, 0, 0, 0, 0, 221, NULL, 0),
(279, 0, -1, 1716954423, 0, 'Premia #12', 0, 8, 0, 0, 0, 0, 269, NULL, 0),
(280, 0, -1, 1716954423, 0, 'Premia #13', 0, 8, 0, 0, 0, 0, 670, NULL, 0),
(281, 0, -1, 1716954423, 0, 'Premia #14', 0, 8, 0, 0, 0, 0, 160, NULL, 0),
(282, 0, -1, 1716954423, 0, 'Premia #15', 0, 8, 0, 0, 0, 0, 161, NULL, 0),
(283, 0, -1, 1716954423, 0, 'Premia #16', 0, 8, 0, 0, 0, 0, 165, NULL, 0),
(284, 0, -1, 1716954423, 0, 'Premia #17', 0, 8, 0, 0, 0, 0, 161, NULL, 0),
(285, 0, -1, 1716954423, 0, 'Premia #18', 0, 8, 0, 0, 0, 0, 166, NULL, 0),
(286, 0, -1, 1716954423, 0, 'Premia Subsolo #1', 0, 8, 0, 0, 0, 0, 47, NULL, 0),
(287, 0, -1, 1716954423, 0, 'Premia Subsolo #2', 0, 8, 0, 0, 0, 0, 46, NULL, 0),
(288, 0, -1, 1716954423, 0, 'Premia Subsolo #3', 0, 8, 0, 0, 0, 0, 47, NULL, 0),
(289, 0, -1, 1716954423, 0, 'Premia Subsolo #4', 0, 8, 0, 0, 0, 0, 48, NULL, 0),
(290, 0, -1, 1716954423, 0, 'Premia Subsolo #5', 0, 8, 0, 0, 0, 0, 102, NULL, 0),
(291, 0, -1, 1716954423, 0, 'Premia Subsolo #6', 0, 8, 0, 0, 0, 0, 59, NULL, 0),
(292, 0, -1, 1716954423, 0, 'Premia Subsolo #7', 0, 8, 0, 0, 0, 0, 66, NULL, 0),
(293, 0, -1, 1716954423, 0, 'Premia Subsolo #8', 0, 8, 0, 0, 0, 0, 161, NULL, 0),
(294, 0, -1, 1716954423, 0, 'Premia Subsolo #9', 0, 8, 0, 0, 0, 0, 71, NULL, 0),
(295, 0, -1, 1716954423, 0, 'Premia Subsolo #10', 0, 8, 0, 0, 0, 0, 100, NULL, 0),
(296, 0, -1, 1716954423, 0, 'Premia Subsolo #11', 0, 8, 0, 0, 0, 0, 88, NULL, 0),
(297, 0, -1, 1716954423, 0, 'Premia Subsolo #12', 0, 8, 0, 0, 0, 0, 202, NULL, 0),
(298, 0, -1, 1716954423, 0, 'Thunder Farm #1', 0, 1, 0, 0, 0, 0, 178, NULL, 0),
(299, 0, -1, 1716954423, 0, 'Thunder House #98', 0, 1, 0, 0, 0, 0, 35, NULL, 0),
(300, 0, -1, 1716954423, 0, 'Thunder House #99', 0, 1, 0, 0, 0, 0, 16, NULL, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `house_lists`
--

CREATE TABLE `house_lists` (
  `house_id` int(11) NOT NULL,
  `listid` int(11) NOT NULL,
  `version` bigint(20) NOT NULL DEFAULT 0,
  `list` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ip_bans`
--

CREATE TABLE `ip_bans` (
  `ip` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `kv_store`
--

CREATE TABLE `kv_store` (
  `key_name` varchar(191) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `value` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `kv_store`
--

INSERT INTO `kv_store` (`key_name`, `timestamp`, `value`) VALUES
('migrations.20231128213158_move_hireling_data_to_kv', 1716349624565, 0x3001),
('migrations.20241708000535_move_achievement_to_kv', 1716349624624, 0x3001),
('migrations.20241708362079_move_vip_system_to_kv', 1716349624671, 0x3001),
('migrations.20241708485868_move_some_storages_to_kv', 1716349624724, 0x3001),
('migrations.20241715984279_move_wheel_scrolls_from_storagename_to_kv', 1716700805553, 0x3001),
('player.7.badges.unlocked.Global Player (Grade 1)', 1716701532742, 0x10dc92cbb206),
('player.7.badges.unlocked.Global Player (Grade 2)', 1716701532720, 0x10dc92cbb206),
('player.7.badges.unlocked.Global Player (Grade 3)', 1716701532698, 0x10dc92cbb206),
('player.7.combat-protection', 1716422660791, 0x19000000000000f03f),
('player.7.daily-reward.streak', 1716700821984, 0x190000000000000000),
('player.7.features.autoloot', 1716429821221, 0x19000000000000f03f),
('player.7.last-mount', 1716742718325, 0x10bf01),
('player.7.titles.unlocked.Admirer of the Crown', 1716742718264, 0x10bed4cdb206),
('player.7.titles.unlocked.Beaststrider (Grade 1)', 1716742718285, 0x10bed4cdb206),
('player.7.titles.unlocked.Beaststrider (Grade 2)', 1716742718285, 0x10bed4cdb206),
('player.7.titles.unlocked.Beaststrider (Grade 3)', 1716742718285, 0x10bed4cdb206),
('player.7.titles.unlocked.Beaststrider (Grade 4)', 1716742718285, 0x10bed4cdb206),
('player.7.titles.unlocked.Beaststrider (Grade 5)', 1716742718285, 0x10bed4cdb206),
('player.7.titles.unlocked.Big Spender', 1716742718264, 0x10bed4cdb206),
('player.7.titles.unlocked.Crystal Hoarder', 1716742718285, 0x10bed4cdb206),
('player.7.titles.unlocked.Cyclopscamper', 1716701532768, 0x10dc92cbb206),
('player.7.titles.unlocked.Demondoom', 1716701532768, 0x10dc92cbb206),
('player.7.titles.unlocked.Dragondouser', 1716701532768, 0x10dc92cbb206),
('player.7.titles.unlocked.Drakenbane', 1716701532768, 0x10dc92cbb206),
('player.7.titles.unlocked.Exalted', 1716701532768, 0x10dc92cbb206),
('player.7.titles.unlocked.Gold Hoarder', 1716742718285, 0x10bed4cdb206),
('player.7.titles.unlocked.Platinum Hoarder', 1716742718285, 0x10bed4cdb206),
('player.7.titles.unlocked.Royal Bounacean Advisor', 1716742718264, 0x10bed4cdb206),
('player.7.titles.unlocked.Silencer', 1716701532768, 0x10dc92cbb206),
('player.7.titles.unlocked.Snake Charmer', 1716742718265, 0x10bed4cdb206),
('player.7.titles.unlocked.Trolltrasher', 1716701532768, 0x10dc92cbb206),
('player.8.achievements.Potion Addict-progress', 1716581481857, 0x19000000000000f03f),
('player.8.combat-protection', 1716580374593, 0x19000000000000f03f),
('player.8.daily-reward.streak', 1716704450412, 0x190000000000000000),
('player.8.titles.unlocked.Legend of the Shield', 1716704492834, 0x10eca9cbb206),
('player.8.titles.unlocked.Prince Charming', 1716586534962, 0x10a690c4b206),
('player.8.titles.unlocked.Snake Charmer', 1716704492828, 0x10eca9cbb206),
('player.9.achievements.Potion Addict-progress', 1716743331441, 0x190000000000001040),
('player.9.combat-protection', 1716742707039, 0x19000000000000f03f),
('player.9.daily-reward.streak', 1716704500016, 0x19000000000000f03f),
('player.9.titles.unlocked.Apex Predator', 1716743323884, 0x109bd9cdb206),
('player.9.titles.unlocked.Legend of the Axe', 1716743323879, 0x109bd9cdb206),
('player.9.titles.unlocked.Legend of the Shield', 1716743323876, 0x109bd9cdb206),
('player.9.titles.unlocked.Snake Charmer', 1716743323872, 0x109bd9cdb206),
('raids.ankrahmun.the-welter.checks-today', 1716743585182, 0x190000000000a08c40),
('raids.ankrahmun.the-welter.failed-attempts', 1716743585182, 0x190000000000a08c40),
('raids.darashia.tyrn.checks-today', 1716743585162, 0x190000000000a08c40),
('raids.darashia.tyrn.failed-attempts', 1716743585162, 0x190000000000a08c40),
('raids.drefia.arachir.checks-today', 1716743585173, 0x190000000000a08c40),
('raids.drefia.arachir.failed-attempts', 1716743585173, 0x190000000000a08c40),
('raids.drefia.the-pale-count.checks-today', 1716743585167, 0x190000000000a08c40),
('raids.drefia.the-pale-count.failed-attempts', 1716743585167, 0x190000000000a08c40),
('raids.edron.valorcrest.checks-today', 1716566491536, 0x190000000000007440),
('raids.edron.valorcrest.failed-attempts', 1716436742842, 0x190000000000f07340),
('raids.edron.valorcrest.trigger-when-possible', 1716743585162, 0x3001),
('raids.edron.weakened-shlorg.checks-today', 1716743585187, 0x190000000000a08c40),
('raids.edron.weakened-shlorg.failed-attempts', 1716743585187, 0x190000000000a08c40),
('raids.edron.white-pale.checks-today', 1716743585157, 0x190000000000a08c40),
('raids.edron.white-pale.failed-attempts', 1716743585157, 0x190000000000a08c40),
('raids.farmine.draptor.checks-today', 1716743585176, 0x190000000000a08c40),
('raids.farmine.draptor.failed-attempts', 1716743585176, 0x190000000000a08c40),
('raids.folda.yeti.checks-today', 1716743585185, 0x190000000000a08c40),
('raids.folda.yeti.failed-attempts', 1716743585185, 0x190000000000a08c40),
('raids.fury-gates.furiosa.checks-today', 1716743585159, 0x190000000000a08c40),
('raids.fury-gates.furiosa.failed-attempts', 1716743585159, 0x190000000000a08c40),
('raids.nargor.diblis.checks-today', 1716743585181, 0x190000000000a08c40),
('raids.nargor.diblis.failed-attempts', 1716743585181, 0x190000000000a08c40),
('raids.roshamuul.mawhawk.checks-today', 1716743585171, 0x190000000000a08c40),
('raids.roshamuul.mawhawk.failed-attempts', 1716743585171, 0x190000000000a08c40),
('raids.svargrond.hirintror.checks-today', 1716743585165, 0x190000000000a08c40),
('raids.svargrond.hirintror.failed-attempts', 1716743585165, 0x190000000000a08c40),
('raids.thais.rats.checks-today', 1716743585169, 0x190000000000a08c40),
('raids.thais.rats.failed-attempts', 1716743585169, 0x190000000000a08c40),
('raids.thais.wild-horses.checks-today', 1716410838771, 0x190000000000000040),
('raids.thais.wild-horses.failed-attempts', 1716354705985, 0x19000000000000f03f),
('raids.thais.wild-horses.trigger-when-possible', 1716743585171, 0x3001),
('raids.tiquanda.midnight-panther.checks-today', 1716573571624, 0x190000000000607b40),
('raids.tiquanda.midnight-panther.failed-attempts', 1716573511589, 0x190000000000507b40),
('raids.tiquanda.midnight-panther.trigger-when-possible', 1716743585155, 0x3001),
('raids.venore.the-old-widow.checks-today', 1716743585178, 0x190000000000a08c40),
('raids.venore.the-old-widow.failed-attempts', 1716743585178, 0x190000000000a08c40);

-- --------------------------------------------------------

--
-- Estrutura para tabela `lottery`
--

CREATE TABLE `lottery` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `qnt` int(11) NOT NULL DEFAULT 1,
  `item_name` varchar(255) NOT NULL,
  `date` varchar(256) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `market_history`
--

CREATE TABLE `market_history` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT 0,
  `itemtype` int(10) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `price` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `expires_at` bigint(20) UNSIGNED NOT NULL,
  `inserted` bigint(20) UNSIGNED NOT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL,
  `tier` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `market_history`
--

INSERT INTO `market_history` (`id`, `player_id`, `sale`, `itemtype`, `amount`, `price`, `expires_at`, `inserted`, `state`, `tier`) VALUES
(1, 7, 0, 3402, 1, 1, 1716435410, 1716435410, 1, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `market_offers`
--

CREATE TABLE `market_offers` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT 0,
  `itemtype` int(10) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `created` bigint(20) UNSIGNED NOT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT 0,
  `price` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `tier` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_account_actions`
--

CREATE TABLE `myaac_account_actions` (
  `account_id` int(11) NOT NULL,
  `ip` varchar(16) NOT NULL DEFAULT '0.0.0.0',
  `ipv6` binary(16) NOT NULL DEFAULT '0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `date` int(11) NOT NULL DEFAULT 0,
  `action` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `myaac_account_actions`
--

INSERT INTO `myaac_account_actions` (`account_id`, `ip`, `ipv6`, `date`, `action`) VALUES
(2, '167772296', 0x00000000000000000000000000000000, 1716421187, 'Account created.'),
(3, '167772296', 0x00000000000000000000000000000000, 1716580240, 'Account created.'),
(3, '167772296', 0x00000000000000000000000000000000, 1716580240, 'Created character <b>Liber Test</b>.'),
(3, '167772296', 0x00000000000000000000000000000000, 1716704485, 'Created character <b>Test Kina</b>.');

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_admin_menu`
--

CREATE TABLE `myaac_admin_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `page` varchar(255) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `flags` int(11) NOT NULL DEFAULT 0,
  `enabled` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_bugtracker`
--

CREATE TABLE `myaac_bugtracker` (
  `account` varchar(255) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `text` text NOT NULL,
  `id` int(11) NOT NULL DEFAULT 0,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `reply` int(11) NOT NULL DEFAULT 0,
  `who` int(11) NOT NULL DEFAULT 0,
  `uid` int(11) NOT NULL,
  `tag` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_changelog`
--

CREATE TABLE `myaac_changelog` (
  `id` int(11) NOT NULL,
  `body` varchar(500) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 - added, 2 - removed, 3 - changed, 4 - fixed',
  `where` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 - server, 2 - site',
  `date` int(11) NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `myaac_changelog`
--

INSERT INTO `myaac_changelog` (`id`, `body`, `type`, `where`, `date`, `player_id`, `hidden`) VALUES
(1, 'MyAAC installed. (:', 3, 2, 1716421139, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_charbazaar`
--

CREATE TABLE `myaac_charbazaar` (
  `id` int(11) NOT NULL,
  `account_old` int(11) NOT NULL,
  `account_new` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `date_end` datetime NOT NULL,
  `date_start` datetime NOT NULL,
  `bid_account` int(11) NOT NULL,
  `bid_price` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_charbazaar_bid`
--

CREATE TABLE `myaac_charbazaar_bid` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `auction_id` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_config`
--

CREATE TABLE `myaac_config` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `value` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `myaac_config`
--

INSERT INTO `myaac_config` (`id`, `name`, `value`) VALUES
(1, 'database_version', '34'),
(2, 'status_online', '1'),
(3, 'status_players', '0'),
(4, 'status_playersMax', '1000'),
(5, 'status_lastCheck', '1716744095'),
(6, 'status_uptime', '1716744095'),
(7, 'status_monsters', '16722'),
(8, 'status_uptimeReadable', '05 months, 26 days, 14h 21m'),
(9, 'status_motd', 'Welcome to the RealSoft!'),
(10, 'status_mapAuthor', 'RealSoft'),
(11, 'status_mapName', 'real02'),
(12, 'status_mapWidth', '16000'),
(13, 'status_mapHeight', '16000'),
(14, 'status_server', 'Canary'),
(15, 'status_serverVersion', '3.0'),
(16, 'status_clientVersion', '13.32'),
(17, 'views_counter', '20');

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_faq`
--

CREATE TABLE `myaac_faq` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL DEFAULT '',
  `answer` varchar(1020) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_forum`
--

CREATE TABLE `myaac_forum` (
  `id` int(11) NOT NULL,
  `first_post` int(11) NOT NULL DEFAULT 0,
  `last_post` int(11) NOT NULL DEFAULT 0,
  `section` int(3) NOT NULL DEFAULT 0,
  `replies` int(20) NOT NULL DEFAULT 0,
  `views` int(20) NOT NULL DEFAULT 0,
  `author_aid` int(20) NOT NULL DEFAULT 0,
  `author_guid` int(20) NOT NULL DEFAULT 0,
  `post_text` text NOT NULL,
  `post_topic` varchar(255) NOT NULL DEFAULT '',
  `post_smile` tinyint(1) NOT NULL DEFAULT 0,
  `post_html` tinyint(1) NOT NULL DEFAULT 0,
  `post_date` int(20) NOT NULL DEFAULT 0,
  `last_edit_aid` int(20) NOT NULL DEFAULT 0,
  `edit_date` int(20) NOT NULL DEFAULT 0,
  `post_ip` varchar(32) NOT NULL DEFAULT '0.0.0.0',
  `sticked` tinyint(1) NOT NULL DEFAULT 0,
  `closed` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_forum_boards`
--

CREATE TABLE `myaac_forum_boards` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `guild` int(11) NOT NULL DEFAULT 0,
  `access` int(11) NOT NULL DEFAULT 0,
  `closed` tinyint(1) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `myaac_forum_boards`
--

INSERT INTO `myaac_forum_boards` (`id`, `name`, `description`, `ordering`, `guild`, `access`, `closed`, `hidden`) VALUES
(1, 'News', 'News commenting', 0, 0, 0, 1, 0),
(2, 'Trade', 'Trade offers.', 1, 0, 0, 0, 0),
(3, 'Quests', 'Quest making.', 2, 0, 0, 0, 0),
(4, 'Pictures', 'Your pictures.', 3, 0, 0, 0, 0),
(5, 'Bug Report', 'Report bugs there.', 4, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_gallery`
--

CREATE TABLE `myaac_gallery` (
  `id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `author` varchar(50) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `myaac_gallery`
--

INSERT INTO `myaac_gallery` (`id`, `comment`, `image`, `thumb`, `author`, `ordering`, `hidden`) VALUES
(1, 'Demon', 'images/gallery/demon.jpg', 'images/gallery/demon_thumb.gif', 'MyAAC', 1, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_menu`
--

CREATE TABLE `myaac_menu` (
  `id` int(11) NOT NULL,
  `template` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `blank` tinyint(1) NOT NULL DEFAULT 0,
  `color` varchar(6) NOT NULL DEFAULT '',
  `category` int(11) NOT NULL DEFAULT 1,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `enabled` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `myaac_menu`
--

INSERT INTO `myaac_menu` (`id`, `template`, `name`, `link`, `blank`, `color`, `category`, `ordering`, `enabled`) VALUES
(1, 'tibiacom', 'Latest News', 'news', 0, '', 1, 0, 1),
(2, 'tibiacom', 'News Archive', 'news/archive', 0, '', 1, 1, 1),
(3, 'tibiacom', 'Event Schedule', 'eventcalendar', 0, '', 1, 2, 1),
(4, 'tibiacom', 'Account Management', 'account/manage', 0, '', 2, 0, 1),
(5, 'tibiacom', 'Create Account', 'account/create', 0, '', 2, 1, 1),
(6, 'tibiacom', 'Lost Account?', 'account/lost', 0, '', 2, 2, 1),
(7, 'tibiacom', 'Server Rules', 'rules', 0, '', 2, 3, 1),
(8, 'tibiacom', 'Downloads', 'downloadclient', 0, '', 2, 4, 1),
(9, 'tibiacom', 'Report Bug', 'bugtracker', 0, '', 2, 5, 1),
(10, 'tibiacom', 'Characters', 'characters', 0, '', 3, 0, 1),
(11, 'tibiacom', 'Who Is Online?', 'online', 0, '', 3, 1, 1),
(12, 'tibiacom', 'Highscores', 'highscores', 0, '', 3, 2, 1),
(13, 'tibiacom', 'Last Kills', 'lastkills', 0, '', 3, 3, 1),
(14, 'tibiacom', 'Houses', 'houses', 0, '', 3, 4, 1),
(15, 'tibiacom', 'Guilds', 'guilds', 0, '', 3, 5, 1),
(16, 'tibiacom', 'Polls', 'polls', 0, '', 3, 6, 1),
(17, 'tibiacom', 'Bans', 'bans', 0, '', 3, 7, 1),
(18, 'tibiacom', 'Support List', 'team', 0, '', 3, 8, 1),
(19, 'tibiacom', 'Forum', 'forum', 0, '', 4, 0, 1),
(20, 'tibiacom', 'Creatures', 'creatures', 0, '', 5, 0, 1),
(21, 'tibiacom', 'Spells', 'spells', 0, '', 5, 1, 1),
(22, 'tibiacom', 'Commands', 'commands', 0, '', 5, 2, 1),
(23, 'tibiacom', 'Gallery', 'gallery', 0, '', 5, 3, 1),
(24, 'tibiacom', 'Server Info', 'serverInfo', 0, '', 5, 4, 1),
(25, 'tibiacom', 'Experience Table', 'experienceTable', 0, '', 5, 5, 1),
(26, 'tibiacom', 'Current Auctions', 'currentcharactertrades', 0, '', 7, 0, 1),
(27, 'tibiacom', 'Auction History', 'pastcharactertrades', 0, '', 7, 1, 1),
(28, 'tibiacom', 'My Bids', 'ownbids', 0, '', 7, 2, 1),
(29, 'tibiacom', 'My Auctions', 'owncharactertrades', 0, '', 7, 3, 1),
(30, 'tibiacom', 'Create Auction', 'createcharacterauction', 0, '', 7, 4, 1),
(31, 'tibiacom', 'Donate', 'donate', 0, '', 6, 0, 1),
(32, 'tibiacom', 'Boxes', 'boxes', 0, '', 6, 0, 1),
(33, 'tibiacom', 'Shop Offer', 'gifts', 0, '', 6, 1, 1),
(34, 'tibiacom', 'Shop History', 'gifts/history', 0, '', 6, 2, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_monsters`
--

CREATE TABLE `myaac_monsters` (
  `id` int(11) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `mana` int(11) NOT NULL DEFAULT 0,
  `exp` int(11) NOT NULL,
  `health` int(11) NOT NULL,
  `speed_lvl` int(11) NOT NULL DEFAULT 1,
  `use_haste` tinyint(1) NOT NULL,
  `voices` text NOT NULL,
  `immunities` varchar(255) NOT NULL,
  `elements` text NOT NULL,
  `summonable` tinyint(1) NOT NULL,
  `convinceable` tinyint(1) NOT NULL,
  `pushable` tinyint(1) NOT NULL DEFAULT 0,
  `canpushitems` tinyint(1) NOT NULL DEFAULT 0,
  `canwalkonenergy` tinyint(1) NOT NULL DEFAULT 0,
  `canwalkonpoison` tinyint(1) NOT NULL DEFAULT 0,
  `canwalkonfire` tinyint(1) NOT NULL DEFAULT 0,
  `runonhealth` tinyint(1) NOT NULL DEFAULT 0,
  `hostile` tinyint(1) NOT NULL DEFAULT 0,
  `attackable` tinyint(1) NOT NULL DEFAULT 0,
  `rewardboss` tinyint(1) NOT NULL DEFAULT 0,
  `defense` int(11) NOT NULL DEFAULT 0,
  `armor` int(11) NOT NULL DEFAULT 0,
  `canpushcreatures` tinyint(1) NOT NULL DEFAULT 0,
  `race` varchar(255) NOT NULL,
  `loot` text NOT NULL,
  `summons` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_news`
--

CREATE TABLE `myaac_news` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `body` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 - news, 2 - ticker, 3 - article',
  `date` int(11) NOT NULL DEFAULT 0,
  `category` tinyint(1) NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL DEFAULT 0,
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_date` int(11) NOT NULL DEFAULT 0,
  `comments` varchar(50) NOT NULL DEFAULT '',
  `article_text` varchar(300) NOT NULL DEFAULT '',
  `article_image` varchar(100) NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `myaac_news`
--

INSERT INTO `myaac_news` (`id`, `title`, `body`, `type`, `date`, `category`, `player_id`, `last_modified_by`, `last_modified_date`, `comments`, `article_text`, `article_image`, `hidden`) VALUES
(1, 'Hello!', 'MyAAC is just READY to use!', 1, 1716421187, 2, 7, 0, 0, 'https://github.com/opentibiabr/myaac', '', '', 0),
(2, 'Hello tickets!', 'https://github.com/opentibiabr/myaac', 2, 1716421187, 4, 7, 0, 0, '', '', '', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_news_categories`
--

CREATE TABLE `myaac_news_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(50) NOT NULL DEFAULT '',
  `icon_id` int(2) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `myaac_news_categories`
--

INSERT INTO `myaac_news_categories` (`id`, `name`, `description`, `icon_id`, `hidden`) VALUES
(1, '', '', 0, 0),
(2, '', '', 1, 0),
(3, '', '', 2, 0),
(4, '', '', 3, 0),
(5, '', '', 4, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_notepad`
--

CREATE TABLE `myaac_notepad` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_pages`
--

CREATE TABLE `myaac_pages` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `title` varchar(30) NOT NULL,
  `body` text NOT NULL,
  `date` int(11) NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL DEFAULT 0,
  `php` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 - plain html, 1 - php',
  `enable_tinymce` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 - enabled, 0 - disabled',
  `access` tinyint(2) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_polls`
--

CREATE TABLE `myaac_polls` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `end` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `answers` int(11) NOT NULL,
  `votes_all` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_polls_answers`
--

CREATE TABLE `myaac_polls_answers` (
  `poll_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `votes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_spells`
--

CREATE TABLE `myaac_spells` (
  `id` int(11) NOT NULL,
  `spell` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL,
  `words` varchar(255) NOT NULL DEFAULT '',
  `category` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 - attack, 2 - healing, 3 - summon, 4 - supply, 5 - support',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 - instant, 2 - conjure, 3 - rune',
  `level` int(11) NOT NULL DEFAULT 0,
  `maglevel` int(11) NOT NULL DEFAULT 0,
  `mana` int(11) NOT NULL DEFAULT 0,
  `soul` tinyint(3) NOT NULL DEFAULT 0,
  `conjure_id` int(11) NOT NULL DEFAULT 0,
  `conjure_count` tinyint(3) NOT NULL DEFAULT 0,
  `reagent` int(11) NOT NULL DEFAULT 0,
  `item_id` int(11) NOT NULL DEFAULT 0,
  `premium` tinyint(1) NOT NULL DEFAULT 0,
  `vocations` varchar(100) NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_videos`
--

CREATE TABLE `myaac_videos` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `youtube_id` varchar(20) NOT NULL,
  `author` varchar(50) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_visitors`
--

CREATE TABLE `myaac_visitors` (
  `ip` varchar(45) NOT NULL,
  `lastvisit` int(11) NOT NULL DEFAULT 0,
  `page` varchar(2048) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_weapons`
--

CREATE TABLE `myaac_weapons` (
  `id` int(11) NOT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `maglevel` int(11) NOT NULL DEFAULT 0,
  `vocations` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL DEFAULT 1,
  `account_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 1,
  `vocation` int(11) NOT NULL DEFAULT 0,
  `health` int(11) NOT NULL DEFAULT 150,
  `healthmax` int(11) NOT NULL DEFAULT 150,
  `experience` bigint(20) NOT NULL DEFAULT 0,
  `lookbody` int(11) NOT NULL DEFAULT 0,
  `lookfeet` int(11) NOT NULL DEFAULT 0,
  `lookhead` int(11) NOT NULL DEFAULT 0,
  `looklegs` int(11) NOT NULL DEFAULT 0,
  `looktype` int(11) NOT NULL DEFAULT 136,
  `lookaddons` int(11) NOT NULL DEFAULT 0,
  `maglevel` int(11) NOT NULL DEFAULT 0,
  `mana` int(11) NOT NULL DEFAULT 0,
  `manamax` int(11) NOT NULL DEFAULT 0,
  `manaspent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `soul` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `town_id` int(11) NOT NULL DEFAULT 1,
  `posx` int(11) NOT NULL DEFAULT 0,
  `posy` int(11) NOT NULL DEFAULT 0,
  `posz` int(11) NOT NULL DEFAULT 0,
  `conditions` blob NOT NULL,
  `cap` int(11) NOT NULL DEFAULT 0,
  `sex` int(11) NOT NULL DEFAULT 0,
  `pronoun` int(11) NOT NULL DEFAULT 0,
  `lastlogin` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `lastip` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `save` tinyint(1) NOT NULL DEFAULT 1,
  `skull` tinyint(1) NOT NULL DEFAULT 0,
  `skulltime` bigint(20) NOT NULL DEFAULT 0,
  `lastlogout` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `blessings` tinyint(2) NOT NULL DEFAULT 0,
  `blessings1` tinyint(4) NOT NULL DEFAULT 0,
  `blessings2` tinyint(4) NOT NULL DEFAULT 0,
  `blessings3` tinyint(4) NOT NULL DEFAULT 0,
  `blessings4` tinyint(4) NOT NULL DEFAULT 0,
  `blessings5` tinyint(4) NOT NULL DEFAULT 0,
  `blessings6` tinyint(4) NOT NULL DEFAULT 0,
  `blessings7` tinyint(4) NOT NULL DEFAULT 0,
  `blessings8` tinyint(4) NOT NULL DEFAULT 0,
  `onlinetime` int(11) NOT NULL DEFAULT 0,
  `deletion` bigint(15) NOT NULL DEFAULT 0,
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `offlinetraining_time` smallint(5) UNSIGNED NOT NULL DEFAULT 43200,
  `offlinetraining_skill` tinyint(2) NOT NULL DEFAULT -1,
  `stamina` smallint(5) UNSIGNED NOT NULL DEFAULT 2520,
  `skill_fist` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_fist_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_club` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_club_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_sword` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_sword_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_axe` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_axe_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_dist` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_dist_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_shielding` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_shielding_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_fishing` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_fishing_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_critical_hit_chance` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `skill_critical_hit_chance_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_critical_hit_damage` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `skill_critical_hit_damage_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_life_leech_chance` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `skill_life_leech_chance_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_life_leech_amount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `skill_life_leech_amount_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_mana_leech_chance` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `skill_mana_leech_chance_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_mana_leech_amount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `skill_mana_leech_amount_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_criticalhit_chance` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_criticalhit_damage` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_lifeleech_chance` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_lifeleech_amount` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_manaleech_chance` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_manaleech_amount` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `manashield` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `max_manashield` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `xpboost_stamina` smallint(5) UNSIGNED DEFAULT NULL,
  `xpboost_value` tinyint(4) UNSIGNED DEFAULT NULL,
  `marriage_status` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `marriage_spouse` int(11) NOT NULL DEFAULT -1,
  `bonus_rerolls` bigint(21) NOT NULL DEFAULT 0,
  `prey_wildcard` bigint(21) NOT NULL DEFAULT 0,
  `task_points` bigint(21) NOT NULL DEFAULT 0,
  `quickloot_fallback` tinyint(1) DEFAULT 0,
  `lookmountbody` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lookmountfeet` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lookmounthead` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lookmountlegs` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lookfamiliarstype` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `isreward` tinyint(1) NOT NULL DEFAULT 1,
  `istutorial` tinyint(1) NOT NULL DEFAULT 0,
  `ismain` tinyint(1) NOT NULL DEFAULT 0,
  `forge_dusts` bigint(21) NOT NULL DEFAULT 0,
  `forge_dust_level` bigint(21) NOT NULL DEFAULT 100,
  `randomize_mount` tinyint(1) NOT NULL DEFAULT 0,
  `boss_points` int(11) NOT NULL DEFAULT 0,
  `rebirth` int(11) NOT NULL DEFAULT 0,
  `online_time` int(11) NOT NULL DEFAULT 0,
  `online_time_month` int(11) NOT NULL DEFAULT 0,
  `created` int(11) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `players`
--

INSERT INTO `players` (`id`, `name`, `group_id`, `account_id`, `level`, `vocation`, `health`, `healthmax`, `experience`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `lookaddons`, `maglevel`, `mana`, `manamax`, `manaspent`, `soul`, `town_id`, `posx`, `posy`, `posz`, `conditions`, `cap`, `sex`, `pronoun`, `lastlogin`, `lastip`, `save`, `skull`, `skulltime`, `lastlogout`, `blessings`, `blessings1`, `blessings2`, `blessings3`, `blessings4`, `blessings5`, `blessings6`, `blessings7`, `blessings8`, `onlinetime`, `deletion`, `balance`, `offlinetraining_time`, `offlinetraining_skill`, `stamina`, `skill_fist`, `skill_fist_tries`, `skill_club`, `skill_club_tries`, `skill_sword`, `skill_sword_tries`, `skill_axe`, `skill_axe_tries`, `skill_dist`, `skill_dist_tries`, `skill_shielding`, `skill_shielding_tries`, `skill_fishing`, `skill_fishing_tries`, `skill_critical_hit_chance`, `skill_critical_hit_chance_tries`, `skill_critical_hit_damage`, `skill_critical_hit_damage_tries`, `skill_life_leech_chance`, `skill_life_leech_chance_tries`, `skill_life_leech_amount`, `skill_life_leech_amount_tries`, `skill_mana_leech_chance`, `skill_mana_leech_chance_tries`, `skill_mana_leech_amount`, `skill_mana_leech_amount_tries`, `skill_criticalhit_chance`, `skill_criticalhit_damage`, `skill_lifeleech_chance`, `skill_lifeleech_amount`, `skill_manaleech_chance`, `skill_manaleech_amount`, `manashield`, `max_manashield`, `xpboost_stamina`, `xpboost_value`, `marriage_status`, `marriage_spouse`, `bonus_rerolls`, `prey_wildcard`, `task_points`, `quickloot_fallback`, `lookmountbody`, `lookmountfeet`, `lookmounthead`, `lookmountlegs`, `lookfamiliarstype`, `isreward`, `istutorial`, `ismain`, `forge_dusts`, `forge_dust_level`, `randomize_mount`, `boss_points`, `rebirth`, `online_time`, `online_time_month`, `created`, `hidden`, `comment`) VALUES
(1, 'Rook Sample', 1, 1, 2, 0, 155, 155, 100, 113, 115, 95, 39, 129, 0, 2, 60, 60, 5936, 0, 1, 991, 1210, 7, '', 410, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 12, 155, 12, 155, 12, 155, 12, 93, 10, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 100, 0, 0, 1, 0, 0, 0, 0, ''),
(2, 'Sorcerer Sample', 1, 1, 8, 1, 185, 185, 4200, 113, 115, 95, 39, 129, 0, 0, 90, 90, 0, 0, 8, 474, 1364, 7, '', 470, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 100, 0, 0, 1, 0, 0, 0, 0, ''),
(3, 'Druid Sample', 1, 1, 8, 2, 185, 185, 4200, 113, 115, 95, 39, 129, 0, 0, 90, 90, 0, 0, 8, 474, 1364, 7, '', 470, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 100, 0, 0, 1, 0, 0, 0, 0, ''),
(4, 'Paladin Sample', 1, 1, 8, 3, 185, 185, 4200, 113, 115, 95, 39, 129, 0, 0, 90, 90, 0, 0, 8, 474, 1364, 7, '', 470, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 100, 0, 0, 1, 0, 0, 0, 0, ''),
(5, 'Knight Sample', 1, 1, 8, 4, 185, 185, 4200, 113, 115, 95, 39, 129, 0, 0, 90, 90, 0, 0, 8, 474, 1364, 7, '', 470, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 100, 0, 0, 1, 0, 0, 0, 0, ''),
(6, 'GOD', 6, 1, 2, 0, 155, 155, 100, 113, 115, 95, 39, 75, 0, 0, 60, 60, 0, 0, 8, 474, 1364, 7, '', 410, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 100, 0, 0, 1, 0, 0, 0, 0, ''),
(7, 'Administrator', 6, 2, 8, 5, 203, 203, 4200, 70, 96, 74, 61, 667, 3, 150, 38, 98, 0, 150, 1, 991, 1221, 7, '', 517, 1, 0, 1716742718, 2281701386, 1, 0, 0, 1716743575, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 99999993802244, 43200, -1, 1858, 150, 0, 150, 0, 150, 0, 150, 0, 150, 0, 150, 0, 150, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 994, 1, 0, 0, 11, 100, 0, 0, 2, 0, 0, 1716421187, 0, ''),
(8, 'Liber Test', 1, 3, 7, 2, 19, 189, 4074, 113, 115, 95, 39, 129, 0, 3, 64, 64, 497, 1, 1, 993, 1211, 7, '', 483, 1, 0, 1716704492, 2281701386, 1, 0, 0, 1716704497, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 18, 2515, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 993, 1, 0, 1, 0, 100, 0, 0, 1, 0, 0, 1716580240, 0, ''),
(9, 'Test Kina', 1, 3, 60, 4, 974, 974, 3364074, 113, 115, 95, 39, 129, 0, 1, 354, 354, 4450, 2, 1, 216, 1246, 8, 0x010b02ffffffff0360ea00001b001c000000001f00001e0000fe010e02ffffffff03007102001b001c000000001f00001e00000470170000050100000006701700000702000000fe010f02ffffffff03786900001b001c000000001f00001e0000150100000014c0d40100fe, 1823, 1, 0, 1716743323, 2281701386, 1, 0, 0, 1716743637, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 100000, 43200, -1, 2516, 10, 0, 10, 0, 10, 0, 38, 24, 10, 0, 36, 256, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 991, 1, 0, 0, 0, 100, 0, 0, 1, 0, 0, 1716704485, 0, '');

--
-- Acionadores `players`
--
DELIMITER $$
CREATE TRIGGER `ondelete_players` BEFORE DELETE ON `players` FOR EACH ROW BEGIN
        UPDATE `houses` SET `owner` = 0 WHERE `owner` = OLD.`id`;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `players_online`
--

CREATE TABLE `players_online` (
  `player_id` int(11) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_bosstiary`
--

CREATE TABLE `player_bosstiary` (
  `player_id` int(11) NOT NULL,
  `bossIdSlotOne` int(11) NOT NULL DEFAULT 0,
  `bossIdSlotTwo` int(11) NOT NULL DEFAULT 0,
  `removeTimes` int(11) NOT NULL DEFAULT 1,
  `tracker` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `player_bosstiary`
--

INSERT INTO `player_bosstiary` (`player_id`, `bossIdSlotOne`, `bossIdSlotTwo`, `removeTimes`, `tracker`) VALUES
(1, 0, 0, 1, ''),
(2, 0, 0, 1, ''),
(3, 0, 0, 1, ''),
(4, 0, 0, 1, ''),
(5, 0, 0, 1, ''),
(6, 0, 0, 1, ''),
(8, 0, 0, 1, ''),
(7, 0, 0, 1, ''),
(9, 0, 0, 1, '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_charms`
--

CREATE TABLE `player_charms` (
  `player_guid` int(250) NOT NULL,
  `charm_points` varchar(250) DEFAULT NULL,
  `charm_expansion` tinyint(1) DEFAULT NULL,
  `rune_wound` int(250) DEFAULT NULL,
  `rune_enflame` int(250) DEFAULT NULL,
  `rune_poison` int(250) DEFAULT NULL,
  `rune_freeze` int(250) DEFAULT NULL,
  `rune_zap` int(250) DEFAULT NULL,
  `rune_curse` int(250) DEFAULT NULL,
  `rune_cripple` int(250) DEFAULT NULL,
  `rune_parry` int(250) DEFAULT NULL,
  `rune_dodge` int(250) DEFAULT NULL,
  `rune_adrenaline` int(250) DEFAULT NULL,
  `rune_numb` int(250) DEFAULT NULL,
  `rune_cleanse` int(250) DEFAULT NULL,
  `rune_bless` int(250) DEFAULT NULL,
  `rune_scavenge` int(250) DEFAULT NULL,
  `rune_gut` int(250) DEFAULT NULL,
  `rune_low_blow` int(250) DEFAULT NULL,
  `rune_divine` int(250) DEFAULT NULL,
  `rune_vamp` int(250) DEFAULT NULL,
  `rune_void` int(250) DEFAULT NULL,
  `UsedRunesBit` varchar(250) DEFAULT NULL,
  `UnlockedRunesBit` varchar(250) DEFAULT NULL,
  `tracker list` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `player_charms`
--

INSERT INTO `player_charms` (`player_guid`, `charm_points`, `charm_expansion`, `rune_wound`, `rune_enflame`, `rune_poison`, `rune_freeze`, `rune_zap`, `rune_curse`, `rune_cripple`, `rune_parry`, `rune_dodge`, `rune_adrenaline`, `rune_numb`, `rune_cleanse`, `rune_bless`, `rune_scavenge`, `rune_gut`, `rune_low_blow`, `rune_divine`, `rune_vamp`, `rune_void`, `UsedRunesBit`, `UnlockedRunesBit`, `tracker list`) VALUES
(1, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(2, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(3, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(4, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(5, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(6, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(7, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(8, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(9, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_deaths`
--

CREATE TABLE `player_deaths` (
  `player_id` int(11) NOT NULL,
  `time` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 1,
  `killed_by` varchar(255) NOT NULL,
  `is_player` tinyint(1) NOT NULL DEFAULT 1,
  `mostdamage_by` varchar(100) NOT NULL,
  `mostdamage_is_player` tinyint(1) NOT NULL DEFAULT 0,
  `unjustified` tinyint(1) NOT NULL DEFAULT 0,
  `mostdamage_unjustified` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `player_deaths`
--

INSERT INTO `player_deaths` (`player_id`, `time`, `level`, `killed_by`, `is_player`, `mostdamage_by`, `mostdamage_is_player`, `unjustified`, `mostdamage_unjustified`) VALUES
(8, 1716580599, 8, 'a tarantula', 0, 'a tarantula', 0, 0, 0),
(8, 1716582926, 7, 'a tarantula', 0, 'a tarantula', 0, 0, 0),
(9, 1716737891, 8, 'a rotworm', 0, 'a tarantula', 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_depotitems`
--

CREATE TABLE `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range eg 0-100 will be reserved for depot lockers and all > 100 will be then normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_exp_restore`
--

CREATE TABLE `player_exp_restore` (
  `id` int(11) NOT NULL,
  `id_player` int(11) NOT NULL,
  `expBefore` bigint(20) NOT NULL,
  `expAfter` bigint(20) NOT NULL,
  `canRestore` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `player_exp_restore`
--

INSERT INTO `player_exp_restore` (`id`, `id_player`, `expBefore`, `expAfter`, `canRestore`) VALUES
(1, 7, -1, -1, -1),
(2, 8, 4074, 4074, 1),
(3, 9, 4200, 664074, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_hirelings`
--

CREATE TABLE `player_hirelings` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `sex` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `posx` int(11) NOT NULL DEFAULT 0,
  `posy` int(11) NOT NULL DEFAULT 0,
  `posz` int(11) NOT NULL DEFAULT 0,
  `lookbody` int(11) NOT NULL DEFAULT 0,
  `lookfeet` int(11) NOT NULL DEFAULT 0,
  `lookhead` int(11) NOT NULL DEFAULT 0,
  `looklegs` int(11) NOT NULL DEFAULT 0,
  `looktype` int(11) NOT NULL DEFAULT 136
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_inboxitems`
--

CREATE TABLE `player_inboxitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_items`
--

CREATE TABLE `player_items` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `pid` int(11) NOT NULL DEFAULT 0,
  `sid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `player_items`
--

INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`, `attributes`) VALUES
(1, 11, 101, 23396, 1, ''),
(2, 11, 101, 23396, 1, ''),
(3, 11, 101, 23396, 1, ''),
(4, 11, 101, 23396, 1, ''),
(5, 11, 101, 23396, 1, ''),
(6, 11, 101, 23396, 1, ''),
(7, 3, 101, 2854, 1, 0x240126000000802c00000080),
(7, 6, 102, 3071, 1, ''),
(7, 11, 103, 23396, 1, ''),
(7, 101, 104, 3074, 1, ''),
(7, 101, 105, 10275, 1, 0x0f01),
(7, 101, 106, 3031, 40, 0x0f28),
(7, 101, 107, 3035, 1, 0x0f01),
(7, 101, 108, 3583, 2, 0x0f02),
(7, 101, 109, 3031, 100, 0x0f64),
(7, 101, 110, 3051, 1, ''),
(7, 101, 111, 3155, 99, 0x0f63),
(7, 101, 112, 9057, 1, 0x0f01),
(7, 101, 113, 7368, 1, 0x0f01),
(7, 101, 114, 3098, 1, ''),
(7, 101, 115, 3413, 1, ''),
(7, 101, 116, 3365, 1, ''),
(7, 101, 117, 2854, 1, 0x2400),
(7, 101, 118, 3457, 1, ''),
(7, 101, 119, 3003, 1, ''),
(7, 117, 120, 3035, 1, 0x0f01),
(7, 117, 121, 3003, 1, ''),
(7, 117, 122, 3457, 1, ''),
(8, 1, 101, 7992, 1, ''),
(8, 2, 102, 3572, 1, ''),
(8, 3, 103, 2854, 1, 0x26000000802c00000080),
(8, 4, 104, 7991, 1, ''),
(8, 5, 105, 3059, 1, ''),
(8, 6, 106, 3066, 1, ''),
(8, 7, 107, 3362, 1, ''),
(8, 8, 108, 3552, 1, ''),
(8, 11, 109, 23396, 1, ''),
(8, 103, 110, 2854, 1, 0x2400),
(8, 103, 111, 5710, 1, ''),
(8, 103, 112, 3003, 1, ''),
(8, 110, 113, 268, 19, 0x0f13),
(8, 110, 114, 5710, 1, ''),
(8, 110, 115, 3003, 1, ''),
(9, 1, 101, 3354, 1, ''),
(9, 2, 102, 3572, 1, ''),
(9, 3, 103, 2854, 1, 0x240126000000802c00000080),
(9, 4, 104, 3359, 1, ''),
(9, 5, 105, 3425, 1, ''),
(9, 6, 106, 7773, 1, ''),
(9, 7, 107, 3372, 1, ''),
(9, 8, 108, 3552, 1, ''),
(9, 11, 109, 23396, 1, ''),
(9, 103, 110, 3031, 63, 0x0f3f),
(9, 103, 111, 3572, 1, ''),
(9, 103, 112, 7773, 1, ''),
(9, 103, 113, 266, 6, 0x0f06),
(9, 103, 114, 5710, 1, ''),
(9, 103, 115, 3003, 1, ''),
(9, 103, 116, 3327, 1, ''),
(9, 103, 117, 7774, 1, '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_kills`
--

CREATE TABLE `player_kills` (
  `player_id` int(11) NOT NULL,
  `time` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `target` int(11) NOT NULL,
  `unavenged` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_misc`
--

CREATE TABLE `player_misc` (
  `player_id` int(11) NOT NULL,
  `info` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_namelocks`
--

CREATE TABLE `player_namelocks` (
  `player_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `namelocked_at` bigint(20) NOT NULL,
  `namelocked_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_prey`
--

CREATE TABLE `player_prey` (
  `player_id` int(11) NOT NULL,
  `slot` tinyint(1) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `raceid` varchar(250) NOT NULL,
  `option` tinyint(1) NOT NULL,
  `bonus_type` tinyint(1) NOT NULL,
  `bonus_rarity` tinyint(1) NOT NULL,
  `bonus_percentage` varchar(250) NOT NULL,
  `bonus_time` varchar(250) NOT NULL,
  `free_reroll` bigint(20) NOT NULL,
  `monster_list` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `player_prey`
--

INSERT INTO `player_prey` (`player_id`, `slot`, `state`, `raceid`, `option`, `bonus_type`, `bonus_rarity`, `bonus_percentage`, `bonus_time`, `free_reroll`, `monster_list`) VALUES
(7, 0, 3, '0', 0, 2, 2, '16', '0', 1716493457985, 0x170373050d017700b50181069a0752009d05),
(7, 1, 3, '0', 0, 2, 10, '40', '0', 1716493457985, 0xdb0843010300d7062c00de004d04ff003d00),
(7, 2, 0, '0', 0, 2, 7, '31', '0', 1716493457985, ''),
(8, 0, 3, '0', 0, 2, 8, '34', '0', 1716652274239, 0xd9083e012e059e05a3056a00c9060f027500),
(8, 1, 3, '0', 0, 0, 4, '22', '0', 1716652274239, 0x6903c606e505f6070c026400e102da085d03),
(8, 2, 0, '0', 0, 1, 10, '40', '0', 1716652274239, ''),
(9, 0, 3, '0', 0, 1, 2, '16', '0', 1716776499587, 0x3508de000c065c0304006e03db006c021b00),
(9, 1, 3, '0', 0, 0, 4, '22', '0', 1716776499587, 0xf507b501ba061b0447000303d20439003500),
(9, 2, 0, '0', 0, 3, 3, '19', '0', 1716776499587, '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_rewards`
--

CREATE TABLE `player_rewards` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_spells`
--

CREATE TABLE `player_spells` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_stash`
--

CREATE TABLE `player_stash` (
  `player_id` int(16) NOT NULL,
  `item_id` int(16) NOT NULL,
  `item_count` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_storage`
--

CREATE TABLE `player_storage` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `key` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `value` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `player_storage`
--

INSERT INTO `player_storage` (`player_id`, `key`, `value`) VALUES
(7, 0, 1),
(7, 6000, 1716429979),
(7, 12330, 1),
(7, 12332, 13),
(7, 12333, 3),
(7, 12450, 6),
(7, 13413, 1716699944),
(7, 13414, 5),
(7, 14900, 1),
(7, 14903, 0),
(7, 17101, 0),
(7, 20000, 42),
(7, 20001, 14),
(7, 20002, 1),
(7, 30012, 2),
(7, 30057, 1),
(7, 41651, 5),
(7, 41652, 2),
(7, 41912, 1),
(7, 42701, 29),
(7, 42703, 3),
(7, 42704, 4),
(7, 42705, 1),
(7, 42706, 1),
(7, 42707, 1),
(7, 42708, 3),
(7, 42709, 2),
(7, 42710, 2),
(7, 42711, 1),
(7, 42712, 1),
(7, 42713, 1),
(7, 42715, 1),
(7, 42716, 1),
(7, 42717, 5),
(7, 42718, 2),
(7, 42720, 2),
(7, 42721, 3),
(7, 42724, 2),
(7, 42725, 1),
(7, 42729, 12),
(7, 42731, 1),
(7, 44956, 1),
(7, 44957, 1),
(7, 44958, 1716435108),
(7, 45751, 1),
(7, 45752, 16),
(7, 45764, 1),
(7, 46309, 1),
(7, 46402, 1),
(7, 46403, 1),
(7, 46404, 1),
(7, 46851, 14),
(7, 46875, 1),
(7, 47402, 1),
(7, 47403, 1),
(7, 47512, 1),
(7, 47514, 1),
(7, 47601, 1),
(7, 47902, 1),
(7, 47903, 1),
(7, 47904, 1),
(7, 47905, 1),
(7, 48900, 1),
(7, 48901, 1),
(7, 50011, 5),
(7, 50043, 1),
(7, 50052, 1),
(7, 50053, 1),
(7, 50054, 1),
(7, 50055, 1),
(7, 50063, 1),
(7, 50065, 1),
(7, 50066, 1),
(7, 50067, 1),
(7, 50068, 1),
(7, 50069, 1),
(7, 50070, 1),
(7, 50071, 1),
(7, 50072, 1),
(7, 50073, 1),
(7, 50080, 1),
(7, 50081, 10),
(7, 50082, 2),
(7, 50083, 2),
(7, 50090, 10),
(7, 50091, 2),
(7, 50092, 2),
(7, 50115, 10),
(7, 50116, 3),
(7, 50117, 2),
(7, 50118, 2),
(7, 50139, 10),
(7, 50141, 10),
(7, 50143, 30),
(7, 50200, 7),
(7, 50201, 1),
(7, 50203, 1),
(7, 50205, 1),
(7, 50210, 1),
(7, 50225, 1),
(7, 50226, 4),
(7, 50227, 3),
(7, 50228, 3),
(7, 50230, 1),
(7, 50231, 1),
(7, 50234, 1),
(7, 50235, 1),
(7, 50236, 1),
(7, 50240, 1),
(7, 50243, 1),
(7, 50245, 7),
(7, 50250, 1),
(7, 50251, 1),
(7, 50252, 1),
(7, 50255, 1),
(7, 50256, 1),
(7, 50257, 1),
(7, 50258, 1),
(7, 50260, 1),
(7, 50263, 1),
(7, 50264, 1),
(7, 50403, 1),
(7, 50442, 1),
(7, 50443, 1),
(7, 50444, 1),
(7, 50445, 1),
(7, 50446, 1),
(7, 50470, 1),
(7, 50471, 1),
(7, 50472, 1),
(7, 50473, 1),
(7, 50474, 1),
(7, 50475, 1),
(7, 50486, 1),
(7, 50488, 1),
(7, 50490, 1),
(7, 50492, 1),
(7, 50494, 1),
(7, 50496, 1),
(7, 50498, 1),
(7, 50501, 1),
(7, 50506, 1),
(7, 50530, 61),
(7, 50541, 2),
(7, 50600, 2),
(7, 50601, 5),
(7, 50602, 3),
(7, 50603, 3),
(7, 50604, 3),
(7, 50605, 2),
(7, 50606, 1),
(7, 50620, 2),
(7, 50621, 2),
(7, 50622, 2),
(7, 50630, 1),
(7, 50631, 2),
(7, 50632, 2),
(7, 50633, 2),
(7, 50634, 3),
(7, 50635, 1),
(7, 50636, 1),
(7, 50640, 1),
(7, 50641, 3),
(7, 50642, 3),
(7, 50643, 3),
(7, 50644, 1),
(7, 50645, 1),
(7, 50660, 23),
(7, 50662, 5),
(7, 50663, 2),
(7, 50672, 1440),
(7, 50699, 2),
(7, 50700, 2),
(7, 50701, 2),
(7, 50850, 1),
(7, 50852, 3000),
(7, 50960, 1),
(7, 50984, 1),
(7, 50985, 1),
(7, 50986, 1),
(7, 50987, 1),
(7, 51004, 1),
(7, 51060, 1),
(7, 51061, 18),
(7, 51110, 25),
(7, 51111, 7),
(7, 51112, 3),
(7, 51113, 6),
(7, 51114, 3),
(7, 51115, 3),
(7, 51116, 3),
(7, 51117, 1),
(7, 51120, 1),
(7, 51121, 1),
(7, 51123, 1),
(7, 51124, 1),
(7, 51125, 1),
(7, 51140, 8),
(7, 51141, 3),
(7, 51142, 3),
(7, 51143, 3),
(7, 51160, 40),
(7, 51161, 3),
(7, 51162, 5),
(7, 51163, 3),
(7, 51164, 2),
(7, 51165, 6),
(7, 51166, 8),
(7, 51167, 3),
(7, 51168, 4),
(7, 51169, 2),
(7, 51170, 2),
(7, 51171, 2),
(7, 51172, 6),
(7, 51185, 1),
(7, 51210, 51),
(7, 51211, 6),
(7, 51212, 8),
(7, 51213, 6),
(7, 51214, 6),
(7, 51215, 8),
(7, 51216, 5),
(7, 51217, 5),
(7, 51218, 4),
(7, 51219, 2),
(7, 51220, 1),
(7, 51221, 1),
(7, 51222, 1),
(7, 51223, 1),
(7, 51224, 1),
(7, 51225, 1),
(7, 51228, 1),
(7, 51229, 1),
(7, 51231, 1),
(7, 51232, 1),
(7, 51234, 1),
(7, 51235, 1),
(7, 51236, 1),
(7, 51237, 1),
(7, 51238, 1),
(7, 51239, 1),
(7, 51242, 1),
(7, 51243, 1),
(7, 51244, 1),
(7, 51247, 1),
(7, 51248, 1),
(7, 51262, 3),
(7, 51263, 5),
(7, 51264, 3),
(7, 51266, 3),
(7, 51267, 1),
(7, 51268, 1),
(7, 51269, 1),
(7, 51300, 29),
(7, 51301, 3),
(7, 51302, 3),
(7, 51303, 3),
(7, 51304, 3),
(7, 51305, 3),
(7, 51306, 4),
(7, 51307, 6),
(7, 51308, 2),
(7, 51309, 2),
(7, 51310, 1),
(7, 51325, 1),
(7, 51326, 1),
(7, 51327, 1),
(7, 51328, 2),
(7, 51329, 1),
(7, 51330, 1),
(7, 51331, 1),
(7, 51332, 1),
(7, 51340, 1),
(7, 51341, 2),
(7, 51342, 2),
(7, 51343, 12),
(7, 51394, 8),
(7, 51396, 4),
(7, 51397, 2),
(7, 51398, 1),
(7, 51450, 1),
(7, 51451, 1),
(7, 51453, 1),
(7, 51480, 1),
(7, 51486, 1),
(7, 51540, 3),
(7, 51541, 3),
(7, 51542, 2),
(7, 51543, 1),
(7, 51544, 3),
(7, 51545, 5),
(7, 51546, 1),
(7, 51547, 1),
(7, 51548, 2),
(7, 51549, 1),
(7, 51550, 4),
(7, 51590, 1),
(7, 51591, 1),
(7, 51592, 1),
(7, 51593, 1),
(7, 51594, 1),
(7, 51595, 1),
(7, 51596, 1),
(7, 51597, 1),
(7, 51598, 1),
(7, 51611, 0),
(7, 51680, 1),
(7, 51712, 1),
(7, 52146, 2),
(7, 52148, 1),
(7, 52149, 3),
(7, 55047, 1),
(7, 55136, 1),
(7, 55137, 1),
(7, 55145, 21),
(7, 55146, 2),
(7, 55148, 6),
(7, 55154, 1),
(7, 55226, 1),
(7, 55227, 1),
(7, 55230, 1),
(7, 55233, 1),
(7, 56395, 2),
(7, 77124, 1716431572),
(7, 81056, 0),
(7, 81057, 1),
(7, 100157, 1),
(7, 112550, 0),
(7, 150001, 1),
(7, 515206, 1),
(7, 515207, 2),
(7, 515208, 3),
(7, 515209, 3),
(7, 891642, 0),
(7, 10001001, 16449536),
(7, 10001002, 16515072),
(7, 10002011, 191),
(7, 61305022, 14),
(7, 61305026, 34),
(7, 61305034, 2),
(7, 61305035, 6),
(7, 61305219, 2),
(7, 61305251, 20),
(7, 61305317, 18),
(7, 61305391, 4),
(8, 0, 1),
(8, 13413, 1716699944),
(8, 13414, 5),
(8, 14903, 0),
(8, 17101, 0),
(8, 20000, 37),
(8, 20001, 67),
(8, 44958, 1716587493),
(8, 48900, 0),
(8, 48901, 0),
(8, 81056, 0),
(8, 81057, 1),
(8, 112550, 0),
(9, 12330, 1),
(9, 12332, 13),
(9, 12333, 3),
(9, 12450, 6),
(9, 13413, 1716699944),
(9, 13414, 5),
(9, 14900, 1),
(9, 14903, 1),
(9, 15000, 50),
(9, 17101, 0),
(9, 20000, 39),
(9, 20001, 74),
(9, 20002, 1),
(9, 30012, 2),
(9, 30057, 1),
(9, 41651, 5),
(9, 41652, 2),
(9, 41912, 1),
(9, 42701, 29),
(9, 42703, 3),
(9, 42704, 4),
(9, 42705, 1),
(9, 42706, 1),
(9, 42707, 1),
(9, 42708, 3),
(9, 42709, 2),
(9, 42710, 2),
(9, 42711, 1),
(9, 42712, 1),
(9, 42713, 1),
(9, 42715, 1),
(9, 42716, 1),
(9, 42717, 5),
(9, 42718, 2),
(9, 42720, 2),
(9, 42721, 3),
(9, 42724, 2),
(9, 42725, 1),
(9, 42729, 12),
(9, 42731, 1),
(9, 44956, 1),
(9, 44957, 1),
(9, 45751, 1),
(9, 45752, 16),
(9, 45764, 1),
(9, 46309, 1),
(9, 46402, 1),
(9, 46403, 1),
(9, 46404, 1),
(9, 46851, 14),
(9, 46875, 1),
(9, 47402, 1),
(9, 47403, 1),
(9, 47512, 1),
(9, 47514, 1),
(9, 47601, 1),
(9, 47902, 1),
(9, 47903, 1),
(9, 47904, 1),
(9, 47905, 1),
(9, 48900, 0),
(9, 48901, 0),
(9, 50011, 5),
(9, 50043, 1),
(9, 50052, 1),
(9, 50053, 1),
(9, 50054, 1),
(9, 50055, 1),
(9, 50063, 1),
(9, 50065, 1),
(9, 50066, 1),
(9, 50067, 1),
(9, 50068, 1),
(9, 50069, 1),
(9, 50070, 1),
(9, 50071, 1),
(9, 50072, 1),
(9, 50073, 1),
(9, 50080, 1),
(9, 50081, 10),
(9, 50082, 2),
(9, 50083, 2),
(9, 50090, 10),
(9, 50091, 2),
(9, 50092, 2),
(9, 50115, 10),
(9, 50116, 3),
(9, 50117, 2),
(9, 50118, 2),
(9, 50139, 10),
(9, 50141, 10),
(9, 50143, 30),
(9, 50200, 7),
(9, 50201, 1),
(9, 50203, 1),
(9, 50205, 1),
(9, 50210, 1),
(9, 50225, 1),
(9, 50226, 4),
(9, 50227, 3),
(9, 50228, 3),
(9, 50230, 1),
(9, 50231, 1),
(9, 50234, 1),
(9, 50235, 1),
(9, 50236, 1),
(9, 50240, 1),
(9, 50243, 1),
(9, 50245, 7),
(9, 50250, 1),
(9, 50251, 1),
(9, 50252, 1),
(9, 50255, 1),
(9, 50256, 1),
(9, 50257, 1),
(9, 50258, 1),
(9, 50260, 1),
(9, 50263, 1),
(9, 50264, 1),
(9, 50403, 1),
(9, 50442, 1),
(9, 50443, 1),
(9, 50444, 1),
(9, 50445, 1),
(9, 50446, 1),
(9, 50470, 1),
(9, 50471, 1),
(9, 50472, 1),
(9, 50473, 1),
(9, 50474, 1),
(9, 50475, 1),
(9, 50486, 1),
(9, 50488, 1),
(9, 50490, 1),
(9, 50492, 1),
(9, 50494, 1),
(9, 50496, 1),
(9, 50498, 1),
(9, 50501, 1),
(9, 50506, 1),
(9, 50530, 61),
(9, 50541, 2),
(9, 50600, 2),
(9, 50601, 5),
(9, 50602, 3),
(9, 50603, 3),
(9, 50604, 3),
(9, 50605, 2),
(9, 50606, 1),
(9, 50620, 2),
(9, 50621, 2),
(9, 50622, 2),
(9, 50630, 1),
(9, 50631, 2),
(9, 50632, 2),
(9, 50633, 2),
(9, 50634, 3),
(9, 50635, 1),
(9, 50636, 1),
(9, 50640, 1),
(9, 50641, 3),
(9, 50642, 3),
(9, 50643, 3),
(9, 50644, 1),
(9, 50645, 1),
(9, 50660, 23),
(9, 50662, 5),
(9, 50663, 2),
(9, 50672, 1440),
(9, 50699, 2),
(9, 50700, 2),
(9, 50701, 2),
(9, 50850, 1),
(9, 50852, 3000),
(9, 50960, 1),
(9, 50984, 1),
(9, 50985, 1),
(9, 50986, 1),
(9, 50987, 1),
(9, 51004, 1),
(9, 51060, 1),
(9, 51061, 18),
(9, 51110, 25),
(9, 51111, 7),
(9, 51112, 3),
(9, 51113, 6),
(9, 51114, 3),
(9, 51115, 3),
(9, 51116, 3),
(9, 51117, 1),
(9, 51120, 1),
(9, 51121, 1),
(9, 51123, 1),
(9, 51124, 1),
(9, 51125, 1),
(9, 51140, 8),
(9, 51141, 3),
(9, 51142, 3),
(9, 51143, 3),
(9, 51160, 40),
(9, 51161, 3),
(9, 51162, 5),
(9, 51163, 3),
(9, 51164, 2),
(9, 51165, 6),
(9, 51166, 8),
(9, 51167, 3),
(9, 51168, 4),
(9, 51169, 2),
(9, 51170, 2),
(9, 51171, 2),
(9, 51172, 6),
(9, 51185, 1),
(9, 51210, 51),
(9, 51211, 6),
(9, 51212, 8),
(9, 51213, 6),
(9, 51214, 6),
(9, 51215, 8),
(9, 51216, 5),
(9, 51217, 5),
(9, 51218, 4),
(9, 51219, 2),
(9, 51220, 1),
(9, 51221, 1),
(9, 51222, 1),
(9, 51223, 1),
(9, 51224, 1),
(9, 51225, 1),
(9, 51228, 1),
(9, 51229, 1),
(9, 51231, 1),
(9, 51232, 1),
(9, 51234, 1),
(9, 51235, 1),
(9, 51236, 1),
(9, 51237, 1),
(9, 51238, 1),
(9, 51239, 1),
(9, 51242, 1),
(9, 51243, 1),
(9, 51244, 1),
(9, 51247, 1),
(9, 51248, 1),
(9, 51262, 3),
(9, 51263, 5),
(9, 51264, 3),
(9, 51266, 3),
(9, 51267, 1),
(9, 51268, 1),
(9, 51269, 1),
(9, 51300, 29),
(9, 51301, 3),
(9, 51302, 3),
(9, 51303, 3),
(9, 51304, 3),
(9, 51305, 3),
(9, 51306, 4),
(9, 51307, 6),
(9, 51308, 2),
(9, 51309, 2),
(9, 51310, 1),
(9, 51325, 1),
(9, 51326, 1),
(9, 51327, 1),
(9, 51328, 2),
(9, 51329, 1),
(9, 51330, 1),
(9, 51331, 1),
(9, 51332, 1),
(9, 51340, 1),
(9, 51341, 2),
(9, 51342, 2),
(9, 51343, 12),
(9, 51394, 8),
(9, 51396, 4),
(9, 51397, 2),
(9, 51398, 1),
(9, 51450, 1),
(9, 51451, 1),
(9, 51453, 1),
(9, 51480, 1),
(9, 51486, 1),
(9, 51540, 3),
(9, 51541, 3),
(9, 51542, 2),
(9, 51543, 1),
(9, 51544, 3),
(9, 51545, 5),
(9, 51546, 1),
(9, 51547, 1),
(9, 51548, 2),
(9, 51549, 1),
(9, 51550, 4),
(9, 51590, 1),
(9, 51591, 1),
(9, 51592, 1),
(9, 51593, 1),
(9, 51594, 1),
(9, 51595, 1),
(9, 51596, 1),
(9, 51597, 1),
(9, 51598, 1),
(9, 51611, 0),
(9, 51680, 1),
(9, 51712, 1),
(9, 52146, 2),
(9, 52148, 1),
(9, 52149, 3),
(9, 55047, 1),
(9, 55136, 1),
(9, 55137, 1),
(9, 55145, 21),
(9, 55146, 2),
(9, 55148, 6),
(9, 55154, 1),
(9, 55226, 1),
(9, 55227, 1),
(9, 55230, 1),
(9, 55233, 1),
(9, 56395, 2),
(9, 81056, 0),
(9, 81057, 1),
(9, 100157, 1),
(9, 112550, 0),
(9, 515206, 1),
(9, 515207, 2),
(9, 515208, 3),
(9, 515209, 3),
(9, 10001001, 16449536),
(9, 10001002, 16515072),
(9, 10003001, 64946176),
(9, 61305022, 6),
(9, 61305026, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_taskhunt`
--

CREATE TABLE `player_taskhunt` (
  `player_id` int(11) NOT NULL,
  `slot` tinyint(1) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `raceid` varchar(250) NOT NULL,
  `upgrade` tinyint(1) NOT NULL,
  `rarity` tinyint(1) NOT NULL,
  `kills` varchar(250) NOT NULL,
  `disabled_time` bigint(20) NOT NULL,
  `free_reroll` bigint(20) NOT NULL,
  `monster_list` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `player_taskhunt`
--

INSERT INTO `player_taskhunt` (`player_id`, `slot`, `state`, `raceid`, `upgrade`, `rarity`, `kills`, `disabled_time`, `free_reroll`, `monster_list`) VALUES
(7, 0, 2, '0', 0, 1, '0', 0, 1716493457985, 0xfe01c4021d0782010e016f04e3020e029103),
(7, 1, 2, '0', 0, 1, '0', 0, 1716493457985, 0x2a00f4007b061701f7030700470051047a00),
(7, 2, 2, '0', 0, 1, '0', 0, 1716493457985, 0x9e038606bf030b00dd00d4032f005504dc08),
(8, 0, 2, '0', 0, 1, '0', 0, 1716652274239, 0x2c002c081304d706d001e902fc000e02d203),
(8, 1, 2, '0', 0, 1, '0', 0, 1716652274239, 0xac070f02ac044a04d302bc025e0392014d00),
(8, 2, 2, '0', 0, 1, '0', 0, 1716652274239, 0x290801038901f607d700510079014e003d00),
(9, 0, 2, '0', 0, 1, '0', 0, 1716776499587, 0xb601c7026d028c0715014c004a014e01b701),
(9, 1, 2, '0', 0, 1, '0', 0, 1716776499587, 0xf40752009c054a070d0273023600d4032e08),
(9, 2, 0, '0', 0, 1, '0', 0, 1716776499587, '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_wheeldata`
--

CREATE TABLE `player_wheeldata` (
  `player_id` int(11) NOT NULL,
  `slot` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `server_config`
--

CREATE TABLE `server_config` (
  `config` varchar(50) NOT NULL,
  `value` varchar(256) NOT NULL DEFAULT '',
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `server_config`
--

INSERT INTO `server_config` (`config`, `value`, `timestamp`) VALUES
('db_version', '47', '2024-05-26 05:09:50'),
('motd_hash', '8e8f89afdbb0c9d43130ba9ac3be914cfdb44216', '2024-05-22 23:39:00'),
('motd_num', '1', '2024-05-22 23:39:00'),
('players_record', '2', '2024-05-26 17:06:28');

-- --------------------------------------------------------

--
-- Estrutura para tabela `snake_game`
--

CREATE TABLE `snake_game` (
  `id` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `snowballwar`
--

CREATE TABLE `snowballwar` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `score` int(11) NOT NULL,
  `data` varchar(255) NOT NULL,
  `hora` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `store_history`
--

CREATE TABLE `store_history` (
  `id` int(11) NOT NULL,
  `account_id` int(11) UNSIGNED NOT NULL,
  `mode` smallint(2) NOT NULL DEFAULT 0,
  `description` varchar(3500) NOT NULL,
  `coin_type` tinyint(1) NOT NULL DEFAULT 0,
  `coin_amount` int(12) NOT NULL,
  `time` bigint(20) UNSIGNED NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `coins` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `store_history`
--

INSERT INTO `store_history` (`id`, `account_id`, `mode`, `description`, `coin_type`, `coin_amount`, `time`, `timestamp`, `coins`) VALUES
(1, 2, 0, '[Online Time] Transferable Coins', 3, 20, 1716570271, 0, 0),
(2, 2, 0, '[Online Time] Transferable Coins', 3, 20, 1716575131, 0, 0),
(3, 3, 0, '[Online Time] Transferable Coins', 3, 10, 1716741545, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tile_store`
--

CREATE TABLE `tile_store` (
  `house_id` int(11) NOT NULL,
  `data` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tile_store`
--

INSERT INTO `tile_store` (`house_id`, `data`) VALUES
(1, 0xe803c60407010000005e0b00),
(1, 0xea03c6040701000000412000),
(1, 0xec03c60407010000005e0b00),
(2, 0xe003c60407010000005e0b00),
(2, 0xe203c6040701000000412000),
(2, 0xe403c60407010000005e0b00),
(3, 0xd903c6040701000000412000),
(3, 0xdb03c60407010000005e0b00),
(3, 0xd703c60407010000005e0b00),
(4, 0xd203c60407010000005e0b00),
(4, 0xd003c6040701000000412000),
(4, 0xce03c60407010000005e0b00),
(5, 0xc103c80407010000003f2000),
(5, 0xc103c90407010000005e0b00),
(5, 0xc003c6040701000000412000),
(5, 0xbf03c9040701000000240900),
(6, 0xb403c6040701000000412000),
(7, 0xea03be040601000000412000),
(8, 0xdf03b8040601000000412000),
(9, 0xdd03bc040601000000412000),
(9, 0xe003bc0406010000005e0b00),
(10, 0xd403b8040601000000412000),
(11, 0xea03c6040601000000412000),
(12, 0xe203c6040601000000412000),
(13, 0xd903c6040601000000412000),
(14, 0xc203c90406010000003f2000),
(40, 0x0104a00407010000003f2000),
(40, 0x05049c0407010000005e0b00),
(41, 0xf903a00407010000005e0b00),
(41, 0xfa039c0407010000005e0b00),
(41, 0xfe039e0407010000003f2000),
(42, 0xfe03a20407010000003f2000),
(43, 0xf603a00407010000005e0b00),
(43, 0xf1039e0407010000003f2000),
(44, 0xf103a20407010000003f2000),
(45, 0xe8039f040701000000412000),
(46, 0xe903a8040701000000412000),
(46, 0xe603a5040701000000412000),
(46, 0xe703a50407010000005e0b00),
(47, 0xe503af040701000000412000),
(48, 0xee03ad0407010000003f2000),
(49, 0xf903b0040701000000412000),
(50, 0x0404b6040701000000412000),
(51, 0x0004aa0407010000003f2000),
(54, 0x0404b6040601000000412000),
(59, 0xf403bb0407010000003f2000),
(59, 0xf603b90407010000005e0b00),
(59, 0xf703b9040701000000412000),
(59, 0xf803b90407010000005e0b00),
(60, 0xf403c20407010000003f2000),
(61, 0xd903af040701000000412000),
(63, 0xda03a7040701000000412000),
(67, 0xd003af0407010000005e0b00),
(67, 0xcf03af040701000000412000),
(67, 0xce03ac0407010000005e0b00),
(67, 0xc903af0407010000003f2000),
(81, 0xb003b60407010000003f2000),
(82, 0xb303bd0407010000005e0b00),
(82, 0xb003bb0407010000003f2000),
(86, 0xf903b0040601000000412000),
(87, 0xf603ba0406010000005e0b00),
(87, 0xf703ba040601000000412000),
(87, 0xf703be040601000000412000),
(87, 0xf803ba0406010000005e0b00),
(92, 0xbd03bf040401000000741b00),
(92, 0xbd03c0040401000000f71a00),
(92, 0xba03c2040401000000731b00),
(92, 0xbb03c2040401000000731b00),
(93, 0xbd03ba040401000000741b00),
(93, 0xbd03bb040401000000f71a00),
(93, 0xbd03bc0404010000005c0b00),
(93, 0xbb03bd0404010000005e0b00),
(94, 0xc103b8040401000000731b00),
(94, 0xbf03b8040401000000731b00),
(94, 0xc003b8040401000000ee1a00),
(94, 0xbb03b80404010000005e0b00),
(95, 0xbf03bb0403010000005e0b00),
(95, 0xbe03bb040301000000731b00),
(95, 0xbe03c2040301000000731b00),
(95, 0xbd03bb040301000000ee1a00),
(95, 0xbd03c2040301000000731b00),
(96, 0xbe03b7040301000000731b00),
(96, 0xbd03b7040301000000ee1a00),
(299, 0xe503b70406010000005c0b00),
(299, 0xe903b8040601000000412000),
(299, 0xea03b30406010000005e0b00),
(300, 0xd003be0407010000005e0b00),
(300, 0xd003c2040701000000412000);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tmpwoe`
--

CREATE TABLE `tmpwoe` (
  `started` int(11) NOT NULL,
  `guild` int(11) NOT NULL,
  `breaker` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `indexer` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tmpwoe`
--

INSERT INTO `tmpwoe` (`started`, `guild`, `breaker`, `time`, `indexer`) VALUES
(1682639794, 3, 268435465, 1681862387, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `towns`
--

CREATE TABLE `towns` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `posx` int(11) NOT NULL DEFAULT 0,
  `posy` int(11) NOT NULL DEFAULT 0,
  `posz` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `towns`
--

INSERT INTO `towns` (`id`, `name`, `posx`, `posy`, `posz`) VALUES
(1, 'Real City', 991, 1210, 7),
(2, 'Jah\'Island', 725, 1388, 7),
(3, 'Kravhzi', 980, 1413, 8),
(4, 'Al\'Nahf', 1071, 1296, 7),
(5, 'Bkrianz', 1238, 1307, 3),
(6, 'Iceland', 815, 1089, 7),
(7, 'Woodzbrock', 1312, 1011, 6),
(8, 'Premia Island', 474, 1364, 7);

-- --------------------------------------------------------

--
-- Estrutura para tabela `woe`
--

CREATE TABLE `woe` (
  `id` int(11) NOT NULL,
  `started` int(11) NOT NULL,
  `guild` int(11) NOT NULL,
  `breaker` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `woe`
--

INSERT INTO `woe` (`id`, `started`, `guild`, `breaker`, `time`) VALUES
(1, 1673381353, 0, 0, 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_unique` (`name`);

--
-- Índices de tabela `account_bans`
--
ALTER TABLE `account_bans`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `banned_by` (`banned_by`);

--
-- Índices de tabela `account_ban_history`
--
ALTER TABLE `account_ban_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `banned_by` (`banned_by`);

--
-- Índices de tabela `account_sessions`
--
ALTER TABLE `account_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `account_vipgrouplist`
--
ALTER TABLE `account_vipgrouplist`
  ADD UNIQUE KEY `account_vipgrouplist_unique` (`account_id`,`player_id`,`vipgroup_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `vipgroup_id` (`vipgroup_id`),
  ADD KEY `account_vipgrouplist_vipgroup_fk` (`vipgroup_id`,`account_id`);

--
-- Índices de tabela `account_vipgroups`
--
ALTER TABLE `account_vipgroups`
  ADD PRIMARY KEY (`id`,`account_id`);

--
-- Índices de tabela `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD UNIQUE KEY `account_viplist_unique` (`account_id`,`player_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `boosted_boss`
--
ALTER TABLE `boosted_boss`
  ADD PRIMARY KEY (`date`);

--
-- Índices de tabela `boosted_creature`
--
ALTER TABLE `boosted_creature`
  ADD PRIMARY KEY (`date`);

--
-- Índices de tabela `castle`
--
ALTER TABLE `castle`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `coins_transactions`
--
ALTER TABLE `coins_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`);

--
-- Índices de tabela `daily_reward_history`
--
ALTER TABLE `daily_reward_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `exclusive_hunts`
--
ALTER TABLE `exclusive_hunts`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `forge_history`
--
ALTER TABLE `forge_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `global_storage`
--
ALTER TABLE `global_storage`
  ADD UNIQUE KEY `global_storage_unique` (`key`);

--
-- Índices de tabela `guilds`
--
ALTER TABLE `guilds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `guilds_name_unique` (`name`),
  ADD UNIQUE KEY `guilds_owner_unique` (`ownerid`);

--
-- Índices de tabela `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warid` (`warid`);

--
-- Índices de tabela `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD PRIMARY KEY (`player_id`,`guild_id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Índices de tabela `guild_membership`
--
ALTER TABLE `guild_membership`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `guild_id` (`guild_id`),
  ADD KEY `rank_id` (`rank_id`);

--
-- Índices de tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Índices de tabela `guild_wars`
--
ALTER TABLE `guild_wars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild1` (`guild1`),
  ADD KEY `guild2` (`guild2`);

--
-- Índices de tabela `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner` (`owner`),
  ADD KEY `town_id` (`town_id`);

--
-- Índices de tabela `house_lists`
--
ALTER TABLE `house_lists`
  ADD PRIMARY KEY (`house_id`,`listid`),
  ADD KEY `house_id_index` (`house_id`),
  ADD KEY `version` (`version`);

--
-- Índices de tabela `ip_bans`
--
ALTER TABLE `ip_bans`
  ADD PRIMARY KEY (`ip`),
  ADD KEY `banned_by` (`banned_by`);

--
-- Índices de tabela `kv_store`
--
ALTER TABLE `kv_store`
  ADD PRIMARY KEY (`key_name`);

--
-- Índices de tabela `lottery`
--
ALTER TABLE `lottery`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `market_history`
--
ALTER TABLE `market_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`,`sale`);

--
-- Índices de tabela `market_offers`
--
ALTER TABLE `market_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale` (`sale`,`itemtype`),
  ADD KEY `created` (`created`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `myaac_account_actions`
--
ALTER TABLE `myaac_account_actions`
  ADD KEY `account_id` (`account_id`);

--
-- Índices de tabela `myaac_admin_menu`
--
ALTER TABLE `myaac_admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `myaac_bugtracker`
--
ALTER TABLE `myaac_bugtracker`
  ADD PRIMARY KEY (`uid`);

--
-- Índices de tabela `myaac_changelog`
--
ALTER TABLE `myaac_changelog`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `myaac_charbazaar`
--
ALTER TABLE `myaac_charbazaar`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `myaac_charbazaar_bid`
--
ALTER TABLE `myaac_charbazaar_bid`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `myaac_config`
--
ALTER TABLE `myaac_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices de tabela `myaac_faq`
--
ALTER TABLE `myaac_faq`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `myaac_forum`
--
ALTER TABLE `myaac_forum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section` (`section`);

--
-- Índices de tabela `myaac_forum_boards`
--
ALTER TABLE `myaac_forum_boards`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `myaac_gallery`
--
ALTER TABLE `myaac_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `myaac_menu`
--
ALTER TABLE `myaac_menu`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `myaac_monsters`
--
ALTER TABLE `myaac_monsters`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `myaac_news`
--
ALTER TABLE `myaac_news`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `myaac_news_categories`
--
ALTER TABLE `myaac_news_categories`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `myaac_notepad`
--
ALTER TABLE `myaac_notepad`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `myaac_pages`
--
ALTER TABLE `myaac_pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices de tabela `myaac_polls`
--
ALTER TABLE `myaac_polls`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `myaac_spells`
--
ALTER TABLE `myaac_spells`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices de tabela `myaac_videos`
--
ALTER TABLE `myaac_videos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `myaac_visitors`
--
ALTER TABLE `myaac_visitors`
  ADD UNIQUE KEY `ip` (`ip`);

--
-- Índices de tabela `myaac_weapons`
--
ALTER TABLE `myaac_weapons`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `players_unique` (`name`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `vocation` (`vocation`);

--
-- Índices de tabela `players_online`
--
ALTER TABLE `players_online`
  ADD PRIMARY KEY (`player_id`);

--
-- Índices de tabela `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD KEY `player_id` (`player_id`),
  ADD KEY `killed_by` (`killed_by`),
  ADD KEY `mostdamage_by` (`mostdamage_by`);

--
-- Índices de tabela `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD UNIQUE KEY `player_depotitems_unique` (`player_id`,`sid`);

--
-- Índices de tabela `player_exp_restore`
--
ALTER TABLE `player_exp_restore`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `player_hirelings`
--
ALTER TABLE `player_hirelings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
  ADD UNIQUE KEY `player_inboxitems_unique` (`player_id`,`sid`);

--
-- Índices de tabela `player_items`
--
ALTER TABLE `player_items`
  ADD PRIMARY KEY (`player_id`,`pid`,`sid`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `sid` (`sid`);

--
-- Índices de tabela `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD UNIQUE KEY `player_namelocks_unique` (`player_id`),
  ADD KEY `namelocked_by` (`namelocked_by`);

--
-- Índices de tabela `player_prey`
--
ALTER TABLE `player_prey`
  ADD PRIMARY KEY (`player_id`,`slot`);

--
-- Índices de tabela `player_rewards`
--
ALTER TABLE `player_rewards`
  ADD UNIQUE KEY `player_rewards_unique` (`player_id`,`sid`);

--
-- Índices de tabela `player_spells`
--
ALTER TABLE `player_spells`
  ADD PRIMARY KEY (`player_id`,`name`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `player_stash`
--
ALTER TABLE `player_stash`
  ADD PRIMARY KEY (`player_id`,`item_id`);

--
-- Índices de tabela `player_storage`
--
ALTER TABLE `player_storage`
  ADD PRIMARY KEY (`player_id`,`key`);

--
-- Índices de tabela `player_taskhunt`
--
ALTER TABLE `player_taskhunt`
  ADD PRIMARY KEY (`player_id`,`slot`);

--
-- Índices de tabela `player_wheeldata`
--
ALTER TABLE `player_wheeldata`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `server_config`
--
ALTER TABLE `server_config`
  ADD PRIMARY KEY (`config`);

--
-- Índices de tabela `snake_game`
--
ALTER TABLE `snake_game`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `snowballwar`
--
ALTER TABLE `snowballwar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Índices de tabela `store_history`
--
ALTER TABLE `store_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`);

--
-- Índices de tabela `tile_store`
--
ALTER TABLE `tile_store`
  ADD KEY `house_id` (`house_id`);

--
-- Índices de tabela `towns`
--
ALTER TABLE `towns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `account_ban_history`
--
ALTER TABLE `account_ban_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `coins_transactions`
--
ALTER TABLE `coins_transactions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `daily_reward_history`
--
ALTER TABLE `daily_reward_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `forge_history`
--
ALTER TABLE `forge_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `guilds`
--
ALTER TABLE `guilds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `guild_wars`
--
ALTER TABLE `guild_wars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `houses`
--
ALTER TABLE `houses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=301;

--
-- AUTO_INCREMENT de tabela `market_history`
--
ALTER TABLE `market_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `market_offers`
--
ALTER TABLE `market_offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `myaac_admin_menu`
--
ALTER TABLE `myaac_admin_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `myaac_bugtracker`
--
ALTER TABLE `myaac_bugtracker`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `myaac_changelog`
--
ALTER TABLE `myaac_changelog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `myaac_charbazaar`
--
ALTER TABLE `myaac_charbazaar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `myaac_charbazaar_bid`
--
ALTER TABLE `myaac_charbazaar_bid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `myaac_config`
--
ALTER TABLE `myaac_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `myaac_faq`
--
ALTER TABLE `myaac_faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `myaac_forum`
--
ALTER TABLE `myaac_forum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `myaac_forum_boards`
--
ALTER TABLE `myaac_forum_boards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `myaac_gallery`
--
ALTER TABLE `myaac_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `myaac_menu`
--
ALTER TABLE `myaac_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de tabela `myaac_monsters`
--
ALTER TABLE `myaac_monsters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `myaac_news`
--
ALTER TABLE `myaac_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `myaac_news_categories`
--
ALTER TABLE `myaac_news_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `myaac_notepad`
--
ALTER TABLE `myaac_notepad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `myaac_pages`
--
ALTER TABLE `myaac_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `myaac_spells`
--
ALTER TABLE `myaac_spells`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `myaac_videos`
--
ALTER TABLE `myaac_videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `player_exp_restore`
--
ALTER TABLE `player_exp_restore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `player_hirelings`
--
ALTER TABLE `player_hirelings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `store_history`
--
ALTER TABLE `store_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `towns`
--
ALTER TABLE `towns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `account_bans`
--
ALTER TABLE `account_bans`
  ADD CONSTRAINT `account_bans_account_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_bans_player_fk` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `account_ban_history`
--
ALTER TABLE `account_ban_history`
  ADD CONSTRAINT `account_bans_history_account_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_bans_history_player_fk` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `account_vipgrouplist`
--
ALTER TABLE `account_vipgrouplist`
  ADD CONSTRAINT `account_vipgrouplist_player_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_vipgrouplist_vipgroup_fk` FOREIGN KEY (`vipgroup_id`,`account_id`) REFERENCES `account_vipgroups` (`id`, `account_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD CONSTRAINT `account_viplist_account_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_viplist_player_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `coins_transactions`
--
ALTER TABLE `coins_transactions`
  ADD CONSTRAINT `coins_transactions_account_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `daily_reward_history`
--
ALTER TABLE `daily_reward_history`
  ADD CONSTRAINT `daily_reward_history_player_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `forge_history`
--
ALTER TABLE `forge_history`
  ADD CONSTRAINT `forge_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `guilds`
--
ALTER TABLE `guilds`
  ADD CONSTRAINT `guilds_ownerid_fk` FOREIGN KEY (`ownerid`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  ADD CONSTRAINT `guildwar_kills_warid_fk` FOREIGN KEY (`warid`) REFERENCES `guild_wars` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD CONSTRAINT `guild_invites_guild_fk` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_invites_player_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `guild_membership`
--
ALTER TABLE `guild_membership`
  ADD CONSTRAINT `guild_membership_guild_fk` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guild_membership_player_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guild_membership_rank_fk` FOREIGN KEY (`rank_id`) REFERENCES `guild_ranks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD CONSTRAINT `guild_ranks_fk` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `house_lists`
--
ALTER TABLE `house_lists`
  ADD CONSTRAINT `houses_list_house_fk` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `ip_bans`
--
ALTER TABLE `ip_bans`
  ADD CONSTRAINT `ip_bans_players_fk` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `market_history`
--
ALTER TABLE `market_history`
  ADD CONSTRAINT `market_history_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `market_offers`
--
ALTER TABLE `market_offers`
  ADD CONSTRAINT `market_offers_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_account_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD CONSTRAINT `player_deaths_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD CONSTRAINT `player_depotitems_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `player_hirelings`
--
ALTER TABLE `player_hirelings`
  ADD CONSTRAINT `player_hirelings_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
  ADD CONSTRAINT `player_inboxitems_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `player_items`
--
ALTER TABLE `player_items`
  ADD CONSTRAINT `player_items_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD CONSTRAINT `player_namelocks_players2_fk` FOREIGN KEY (`namelocked_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `player_namelocks_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `player_rewards`
--
ALTER TABLE `player_rewards`
  ADD CONSTRAINT `player_rewards_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `player_spells`
--
ALTER TABLE `player_spells`
  ADD CONSTRAINT `player_spells_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `player_storage`
--
ALTER TABLE `player_storage`
  ADD CONSTRAINT `player_storage_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `player_wheeldata`
--
ALTER TABLE `player_wheeldata`
  ADD CONSTRAINT `player_wheeldata_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `store_history`
--
ALTER TABLE `store_history`
  ADD CONSTRAINT `store_history_account_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tile_store`
--
ALTER TABLE `tile_store`
  ADD CONSTRAINT `tile_store_account_fk` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
