-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02-Jun-2023 às 02:37
-- Versão do servidor: 10.4.28-MariaDB
-- versão do PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `realbaiak_acc`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `password` char(40) NOT NULL,
  `secret` char(16) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 1,
  `premdays` int(11) NOT NULL DEFAULT 0,
  `coins` int(11) NOT NULL DEFAULT 0,
  `coins_tournaments` int(11) NOT NULL DEFAULT 0,
  `lastday` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `proxy_id` int(11) NOT NULL DEFAULT 0,
  `email` varchar(255) NOT NULL DEFAULT '',
  `creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `recruiter` int(11) DEFAULT 0,
  `vote` int(11) NOT NULL DEFAULT 0,
  `key` varchar(20) NOT NULL DEFAULT '0',
  `email_new` varchar(255) NOT NULL DEFAULT '',
  `email_new_time` int(11) NOT NULL DEFAULT 0,
  `rlname` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `page_access` int(11) NOT NULL DEFAULT 0,
  `email_code` varchar(255) NOT NULL DEFAULT '',
  `next_email` int(11) NOT NULL DEFAULT 0,
  `premium_points` int(11) NOT NULL DEFAULT 0,
  `create_date` bigint(20) NOT NULL DEFAULT 0,
  `create_ip` bigint(20) NOT NULL DEFAULT 0,
  `last_post` int(11) NOT NULL DEFAULT 0,
  `flag` varchar(80) NOT NULL DEFAULT '',
  `vip_time` int(11) NOT NULL DEFAULT 0,
  `guild_points` int(11) NOT NULL DEFAULT 0,
  `guild_points_stats` int(11) NOT NULL DEFAULT 0,
  `passed` int(11) NOT NULL DEFAULT 0,
  `block` int(11) NOT NULL DEFAULT 0,
  `refresh` int(11) NOT NULL DEFAULT 0,
  `birth_date` varchar(50) NOT NULL DEFAULT '',
  `gender` varchar(20) NOT NULL DEFAULT '',
  `loyalty_points` bigint(20) NOT NULL DEFAULT 0,
  `authToken` varchar(100) NOT NULL DEFAULT '',
  `player_sell_bank` int(11) DEFAULT 0,
  `secret_status` tinyint(1) NOT NULL DEFAULT 0,
  `tournamentBalance` int(11) NOT NULL DEFAULT 0,
  `language` int(11) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `password`, `secret`, `type`, `premdays`, `coins`, `coins_tournaments`, `lastday`, `proxy_id`, `email`, `creation`, `recruiter`, `vote`, `key`, `email_new`, `email_new_time`, `rlname`, `location`, `page_access`, `email_code`, `next_email`, `premium_points`, `create_date`, `create_ip`, `last_post`, `flag`, `vip_time`, `guild_points`, `guild_points_stats`, `passed`, `block`, `refresh`, `birth_date`, `gender`, `loyalty_points`, `authToken`, `player_sell_bank`, `secret_status`, `tournamentBalance`, `language`) VALUES
(2, 'GU985423', 'e247251862624aa67f728619a8b7253f9bd67f02', NULL, 5, 0, 89363, 54491139, 1676217706, 0, 'almeidaliber@gmail.com', '2022-08-03 11:44:10', 0, 0, 'VE1A-3UPU-PY3I-VO5A', '', 0, 'Gustavo Liber', 'São Paulo', 3, '', 0, 0, 0, 2130706433, 1642011224, 'unknown', 1697403825, 0, 0, 0, 0, 0, '10/4/1995', 'male', 0, '', 0, 0, 0, 2),
(3, 'GU9854233', 'e247251862624aa67f728619a8b7253f9bd67f02', NULL, 1, 0, 0, 9990634, 0, 0, 'almeidaliber@hotmail.com', '2022-08-03 11:44:10', 0, 0, 'YVOW-ELOR-AVO3-A5YM', '', 0, 'Gustavo Liber', 'Sao paulo', 0, '', 0, 0, 0, 2130706433, 0, 'unknown', 0, 0, 0, 0, 0, 0, '1/1/2009', 'female', 0, '', 0, 0, 0, 2),
(4, 'canaryacc1', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', NULL, 5, 0, 2000, 0, 0, 0, 'admin@canaryaac.com', '2022-08-03 11:44:10', 0, 0, '0', '', 0, '', '', 3, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', 0, '', 0, 0, 0, 2),
(15, 'teste32', 'e247251862624aa67f728619a8b7253f9bd67f02', NULL, 0, 0, 0, 0, 0, 0, 'teste32@gmail.com', '2023-04-21 20:22:55', 0, 0, '0', '', 0, '', '', 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', 0, '', 0, 0, 0, 2),
(16, 'teste33', 'e247251862624aa67f728619a8b7253f9bd67f02', NULL, 0, 0, 0, 0, 0, 0, 'teste33@gmail.com', '2023-04-21 20:34:53', 0, 0, '0', '', 0, '', '', 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', 0, '', 0, 0, 0, 2),
(17, 'teste34', 'e247251862624aa67f728619a8b7253f9bd67f02', NULL, 0, 0, 0, 0, 0, 0, 'teste34@gmail.com', '2023-04-21 20:43:19', 0, 0, '0', '', 0, '', '', 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', 0, '', 0, 0, 0, 2),
(18, 'Bordonii', '2441143e5440d5ffd10036623977135d1fb0ddf0', NULL, 0, 0, 9991029, 9928049, 0, 0, 'engenharia.bordoni@gmail.com', '2023-04-21 20:44:06', 0, 0, '0', '', 0, '', '', 0, '', 0, 0, 0, 0, 0, '', 1713223144, 0, 0, 0, 0, 0, '', '', 0, '', 0, 0, 0, 2),
(19, '2979660', 'd5bd38d64d1543754ba0c84921090255357eedd9', NULL, 0, 0, 9954281, 10000084, 0, 0, 'kirby3xd@gmail.com', '2023-04-21 23:00:42', 0, 0, '0', '', 0, '', '', 0, '', 0, 0, 0, 0, 0, '', 1713831912, 0, 0, 0, 0, 0, '', '', 0, '', 0, 0, 0, 2),
(20, 'guicazacov', 'fe43705fc2d9bd38a8cd15b4f1175708120fffce', NULL, 0, 0, 9999361, 9999999, 0, 0, 'guilhermecazacov@grupourbans.com.br', '2023-04-24 22:12:35', 0, 0, '0', '', 0, '', '', 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', 0, '', 0, 0, 0, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `accounts_options`
--

CREATE TABLE `accounts_options` (
  `account_id` int(11) NOT NULL,
  `options` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `accounts_storage`
--

CREATE TABLE `accounts_storage` (
  `account_id` int(11) NOT NULL DEFAULT 0,
  `key` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `value` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `accounts_storage`
--

INSERT INTO `accounts_storage` (`account_id`, `key`, `value`) VALUES
(2, 2, 1673192457),
(3, 2, 1673376951);

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_authentication`
--

CREATE TABLE `account_authentication` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `account_authentication`
--

INSERT INTO `account_authentication` (`id`, `account_id`, `secret`, `status`) VALUES
(1, 2, 'UVYXMFS3O4A6GWJT', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_bans`
--

CREATE TABLE `account_bans` (
  `account_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_ban_history`
--

CREATE TABLE `account_ban_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expired_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_character_sale`
--

CREATE TABLE `account_character_sale` (
  `id` int(11) NOT NULL,
  `id_account` int(11) NOT NULL,
  `id_player` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `price_type` tinyint(4) NOT NULL,
  `price_coins` int(11) DEFAULT NULL,
  `price_gold` int(11) DEFAULT NULL,
  `dta_insert` datetime NOT NULL,
  `dta_valid` datetime NOT NULL,
  `dta_sale` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_character_sale_history`
--

CREATE TABLE `account_character_sale_history` (
  `id` int(11) NOT NULL,
  `id_old_account` int(11) DEFAULT NULL,
  `id_player` int(11) DEFAULT NULL,
  `id_new_account` int(11) DEFAULT NULL,
  `price_type` tinyint(1) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `char_id` int(11) DEFAULT NULL,
  `dta_insert` datetime NOT NULL DEFAULT current_timestamp(),
  `dta_sale` datetime DEFAULT NULL,
  `extornada` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_credentials`
--

CREATE TABLE `account_credentials` (
  `id_credential` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_registration`
--

CREATE TABLE `account_registration` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `recovery` varchar(23) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `address` varchar(50) NOT NULL,
  `housenumber` int(11) NOT NULL,
  `additional` varchar(50) NOT NULL,
  `postalcode` varchar(20) NOT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `account_registration`
--

INSERT INTO `account_registration` (`id`, `account_id`, `recovery`, `firstname`, `lastname`, `address`, `housenumber`, `additional`, `postalcode`, `city`, `country`, `state`, `mobile`) VALUES
(1, 2, '2BB4-9ZYO-40WW-G3XP', 'GUSTAVO', 'LIBER', 'av belarmino ferreira', 37, 'apto 42C', '03573090', 'Sao Paulo', 'Brazil', 'Sao Paulo', 'almeidaliber@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_viplist`
--

CREATE TABLE `account_viplist` (
  `account_id` int(11) NOT NULL COMMENT 'id of account whose viplist entry it is',
  `player_id` int(11) NOT NULL COMMENT 'id of target player of viplist entry',
  `description` varchar(128) NOT NULL DEFAULT '',
  `icon` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `notify` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `account_viplist`
--

INSERT INTO `account_viplist` (`account_id`, `player_id`, `description`, `icon`, `notify`) VALUES
(2, 18, '', 0, 0),
(2, 19, '', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `text` varchar(255) NOT NULL,
  `date` varchar(20) NOT NULL,
  `author` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atr_wikki_category`
--

CREATE TABLE `atr_wikki_category` (
  `id_atr_wikki_category` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `dta_insert` datetime NOT NULL DEFAULT current_timestamp(),
  `dta_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dta_deleted` datetime DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atr_wikki_subcategory`
--

CREATE TABLE `atr_wikki_subcategory` (
  `id_atr_wikki_subcategory` int(11) NOT NULL,
  `id_atr_wikki_category` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `text` text NOT NULL,
  `dta_insert` datetime NOT NULL DEFAULT current_timestamp(),
  `dta_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dta_deleted` datetime DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auction_system`
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
-- Estrutura da tabela `blessings_history`
--

CREATE TABLE `blessings_history` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `blessing` tinyint(4) NOT NULL,
  `loss` tinyint(1) NOT NULL,
  `timestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `boosted_boss`
--

CREATE TABLE `boosted_boss` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `boosted_boss`
--

INSERT INTO `boosted_boss` (`looktype`, `lookfeet`, `looklegs`, `lookhead`, `lookbody`, `lookaddons`, `lookmount`, `date`, `boostname`, `raceid`) VALUES
(1068, 79, 90, 0, 57, 2, 0, '2', 'The Lily of Night', '1602');

-- --------------------------------------------------------

--
-- Estrutura da tabela `boosted_creature`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `boosted_creature`
--

INSERT INTO `boosted_creature` (`looktype`, `lookfeet`, `looklegs`, `lookhead`, `lookbody`, `lookaddons`, `lookmount`, `date`, `boostname`, `raceid`) VALUES
(1315, 0, 0, 0, 0, 0, 0, '3', 'Courage Leech', '1941');

-- --------------------------------------------------------

--
-- Estrutura da tabela `boost_creature`
--

CREATE TABLE `boost_creature` (
  `name` varchar(255) NOT NULL,
  `exp` int(11) NOT NULL DEFAULT 0,
  `loot` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `boss_room`
--

CREATE TABLE `boss_room` (
  `room_id` int(11) NOT NULL,
  `guid_player` varchar(32) NOT NULL,
  `time` int(11) NOT NULL,
  `to_time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_achievements`
--

CREATE TABLE `canary_achievements` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `grade` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `storage` int(11) NOT NULL,
  `secret` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_badges`
--

CREATE TABLE `canary_badges` (
  `id` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_boss`
--

CREATE TABLE `canary_boss` (
  `id` int(11) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_compendium`
--

CREATE TABLE `canary_compendium` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `headline` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `publishdate` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_countdowns`
--

CREATE TABLE `canary_countdowns` (
  `id` int(11) NOT NULL,
  `date_start` int(11) NOT NULL,
  `date_end` int(11) NOT NULL,
  `themebox` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_creatures`
--

CREATE TABLE `canary_creatures` (
  `id` int(11) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_groups`
--

CREATE TABLE `canary_groups` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `canary_groups`
--

INSERT INTO `canary_groups` (`id`, `group_id`, `name`) VALUES
(1, 1, 'player'),
(2, 2, 'tutor'),
(3, 3, 'senior tutor'),
(4, 4, 'gamemaster'),
(5, 5, 'community manager'),
(6, 6, 'god');

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_items`
--

CREATE TABLE `canary_items` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `type` varchar(150) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_news`
--

CREATE TABLE `canary_news` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `body` text NOT NULL,
  `type` tinyint(4) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `category` tinyint(4) NOT NULL,
  `player_id` int(11) NOT NULL,
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_date` datetime NOT NULL,
  `comments` varchar(50) NOT NULL,
  `article_text` varchar(300) NOT NULL,
  `article_image` varchar(100) NOT NULL,
  `hidden` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_payments`
--

CREATE TABLE `canary_payments` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `method` varchar(100) NOT NULL,
  `reference` varchar(200) NOT NULL,
  `total_coins` int(11) NOT NULL,
  `final_price` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `canary_payments`
--

INSERT INTO `canary_payments` (`id`, `account_id`, `method`, `reference`, `total_coins`, `final_price`, `status`, `date`) VALUES
(1, 2, 'mercadopago', '63eab98c70f99', 250, 25, 0, 1676284109);

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_polls`
--

CREATE TABLE `canary_polls` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(250) NOT NULL,
  `description` varchar(500) NOT NULL,
  `date_start` int(11) NOT NULL,
  `date_end` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_polls_answers`
--

CREATE TABLE `canary_polls_answers` (
  `id` int(11) NOT NULL,
  `poll_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_polls_questions`
--

CREATE TABLE `canary_polls_questions` (
  `id` int(11) NOT NULL,
  `poll_id` int(11) NOT NULL,
  `question` varchar(250) NOT NULL,
  `description` varchar(500) NOT NULL,
  `votes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_products`
--

CREATE TABLE `canary_products` (
  `id` int(11) NOT NULL,
  `coins` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `canary_products`
--

INSERT INTO `canary_products` (`id`, `coins`) VALUES
(1, 250),
(2, 750),
(3, 1500),
(4, 3000),
(5, 4500),
(6, 15000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_samples`
--

CREATE TABLE `canary_samples` (
  `id` int(11) NOT NULL,
  `vocation` int(11) NOT NULL,
  `experience` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `health` int(11) NOT NULL,
  `healthmax` int(11) NOT NULL,
  `maglevel` int(11) NOT NULL,
  `mana` int(11) NOT NULL,
  `manamax` int(11) NOT NULL,
  `manaspent` int(11) NOT NULL,
  `soul` int(11) NOT NULL,
  `town_id` int(11) NOT NULL,
  `posx` int(11) NOT NULL,
  `posy` int(11) NOT NULL,
  `posz` int(11) NOT NULL,
  `cap` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  `lookbody` int(11) NOT NULL,
  `lookfeet` int(11) NOT NULL,
  `lookhead` int(11) NOT NULL,
  `looklegs` int(11) NOT NULL,
  `looktype` int(11) NOT NULL,
  `lookaddons` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `canary_samples`
--

INSERT INTO `canary_samples` (`id`, `vocation`, `experience`, `level`, `health`, `healthmax`, `maglevel`, `mana`, `manamax`, `manaspent`, `soul`, `town_id`, `posx`, `posy`, `posz`, `cap`, `balance`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `lookaddons`) VALUES
(1, 0, 4200, 8, 185, 185, 0, 90, 90, 0, 0, 1, 0, 0, 0, 470, 0, 113, 115, 95, 39, 129, 0),
(3, 2, 4200, 8, 185, 185, 0, 90, 90, 0, 0, 1, 0, 0, 0, 470, 0, 113, 115, 95, 39, 130, 0),
(4, 3, 4200, 8, 185, 185, 0, 90, 90, 0, 0, 1, 0, 0, 0, 470, 0, 113, 115, 95, 39, 129, 0),
(5, 4, 4200, 8, 185, 185, 0, 90, 90, 0, 0, 1, 0, 0, 0, 470, 0, 113, 115, 95, 39, 131, 0),
(6, 1, 4200, 8, 185, 185, 0, 90, 90, 0, 0, 1, 0, 0, 0, 470, 0, 113, 115, 95, 39, 130, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_towns`
--

CREATE TABLE `canary_towns` (
  `id` int(11) NOT NULL,
  `town_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `canary_towns`
--

INSERT INTO `canary_towns` (`id`, `town_id`, `name`) VALUES
(1, 0, 'No Town'),
(2, 1, 'Real City'),
(3, 2, 'Jah\'Island'),
(4, 3, 'Kravhzi'),
(5, 4, 'Al\'Nahf'),
(6, 5, 'Bkrianz'),
(7, 6, 'Iceland'),
(8, 7, 'Woodzbrock'),
(9, 8, 'Premia Island');

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_uploads`
--

CREATE TABLE `canary_uploads` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `path` varchar(500) NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_website`
--

CREATE TABLE `canary_website` (
  `id` int(11) NOT NULL,
  `timezone` varchar(150) NOT NULL,
  `title` varchar(70) NOT NULL,
  `downloads` varchar(250) NOT NULL,
  `discord` varchar(250) NOT NULL,
  `player_voc` int(11) NOT NULL COMMENT '0 off and 1 on',
  `player_max` int(11) NOT NULL COMMENT 'players por conta',
  `player_guild` int(11) NOT NULL COMMENT 'level',
  `donates` int(11) NOT NULL COMMENT '0 off and 1 on',
  `coin_price` decimal(10,2) NOT NULL,
  `mercadopago` int(11) NOT NULL,
  `pagseguro` int(11) NOT NULL,
  `paypal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `canary_website`
--

INSERT INTO `canary_website` (`id`, `timezone`, `title`, `downloads`, `discord`, `player_voc`, `player_max`, `player_guild`, `donates`, `coin_price`, `mercadopago`, `pagseguro`, `paypal`) VALUES
(1, 'America/Sao_Paulo', 'RealSoft - BAIAK', 'http://26.72.25.224/updater/Full_Game_BAIAK.rar', '', 1, 10, 100, 1, 0.10, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_worldquests`
--

CREATE TABLE `canary_worldquests` (
  `id` int(11) NOT NULL,
  `storage` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_worlds`
--

CREATE TABLE `canary_worlds` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `creation` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `location` int(11) NOT NULL DEFAULT 0,
  `pvp_type` int(11) NOT NULL DEFAULT 0,
  `premium_type` int(11) NOT NULL DEFAULT 0,
  `transfer_type` int(11) NOT NULL DEFAULT 0,
  `battle_eye` int(11) NOT NULL DEFAULT 0,
  `world_type` int(11) NOT NULL DEFAULT 0,
  `ip` varchar(18) NOT NULL,
  `port` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `canary_worlds`
--

INSERT INTO `canary_worlds` (`id`, `name`, `creation`, `location`, `pvp_type`, `premium_type`, `transfer_type`, `battle_eye`, `world_type`, `ip`, `port`) VALUES
(1, 'RealSoft - Baiak', '2023-04-21 19:43:14', 7, 0, 0, 0, 2, 0, '26.72.25.224', 7172);

-- --------------------------------------------------------

--
-- Estrutura da tabela `castle`
--

CREATE TABLE `castle` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `guild_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `castle`
--

INSERT INTO `castle` (`id`, `name`, `guild_id`) VALUES
(1, 'RealSoft', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `castle_48`
--

CREATE TABLE `castle_48` (
  `guild_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `coins_transactions`
--

CREATE TABLE `coins_transactions` (
  `id` int(11) NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `description` varchar(3500) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `daily_reward_history`
--

CREATE TABLE `daily_reward_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `daystreak` smallint(6) NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `daily_reward_history`
--

INSERT INTO `daily_reward_history` (`id`, `daystreak`, `player_id`, `timestamp`, `description`) VALUES
(1, 0, 9, 1673273259, 'Claimed reward no. 1. Picked items: 10x ultimate mana potion.'),
(2, 1, 9, 1673362527, 'Claimed reward no. 2. Picked items: 10x ultimate mana potion.'),
(3, 0, 10, 1673376640, 'Claimed reward no. 1. Picked items: 10x ultimate mana potion.'),
(4, 2, 9, 1673453866, 'Claimed reward no. 3. Picked reward: 2x Prey bonus reroll(s)'),
(5, 1, 10, 1674491240, 'Claimed reward no. 2. Picked items: 10x animate dead rune.'),
(6, 2, 10, 1674576002, 'Claimed reward no. 3. Picked reward: 2x Prey bonus reroll(s)'),
(7, 3, 9, 1674576011, 'Claimed reward no. 4. Picked items: 20x animate dead rune.'),
(8, 4, 9, 1674747299, 'Claimed reward no. 5. Picked reward: 2x Prey bonus reroll(s)'),
(9, 3, 10, 1674747304, 'Claimed reward no. 4. Picked items: 20x animate dead rune.'),
(10, 5, 9, 1674851310, 'Claimed reward no. 6. Picked items: 2x training wand.'),
(11, 6, 9, 1675031403, 'Claimed reward no. 7. Picked reward: XP Bonus for 30 minutes.'),
(12, 4, 10, 1675181908, 'Claimed reward no. 5. Picked reward: 2x Prey bonus reroll(s)'),
(13, 0, 9, 1675181914, 'Claimed reward no. 1. Picked items: 10x ultimate mana potion.'),
(14, 1, 9, 1675263375, 'Claimed reward no. 2. Picked items: 10x ultimate mana potion.'),
(15, 2, 9, 1675709933, 'Claimed reward no. 3. Picked reward: 2x Prey bonus reroll(s)'),
(16, 3, 9, 1676248857, 'Claimed reward no. 4. Picked items: 20x ultimate mana potion.'),
(17, 4, 9, 1676638617, 'Claimed reward no. 5. Picked reward: 2x Prey bonus reroll(s)'),
(18, 5, 9, 1676646481, 'Claimed reward no. 6. Picked items: 2x training wand.'),
(19, 6, 9, 1677166393, 'Claimed reward no. 7. Picked reward: XP Bonus for 30 minutes.'),
(20, 0, 9, 1677251069, 'Claimed reward no. 1. Picked items: 10x ultimate mana potion.'),
(21, 1, 9, 1677500633, 'Claimed reward no. 2. Picked items: 10x ultimate mana potion.'),
(22, 2, 9, 1677584980, 'Claimed reward no. 3. Picked reward: 2x Prey bonus reroll(s)'),
(23, 0, 11, 1677584987, 'Claimed reward no. 1. Picked items: 10x ultimate spirit potion.'),
(24, 3, 9, 1677603905, 'Claimed reward no. 4. Picked items: 20x ultimate mana potion.'),
(25, 4, 9, 1679685145, 'Claimed reward no. 5. Picked reward: 2x Prey bonus reroll(s)'),
(26, 0, 9, 1681741328, 'Claimed reward no. 1. Picked items: 10x ultimate mana potion.'),
(27, 1, 9, 1681741331, 'Claimed reward no. 2. Picked items: 10x ultimate mana potion.'),
(28, 1, 9, 1681741341, 'Claimed reward no. 2. Picked items: 10x ultimate mana potion.'),
(29, 2, 9, 1682021340, 'Claimed reward no. 3. Picked reward: 2x Prey bonus reroll(s)'),
(30, 0, 17, 1682111017, 'Claimed reward no. 1. Picked items: 9x ultimate mana potion, 1x avalanche rune.'),
(31, 0, 18, 1682118976, 'Claimed reward no. 1. Picked items: 10x strong mana potion.'),
(32, 3, 9, 1682131719, 'Claimed reward no. 4. Picked items: 20x ultimate mana potion.'),
(33, 0, 19, 1682301198, 'Claimed reward no. 1. Picked items: 10x mana potion.'),
(34, 1, 18, 1682350242, 'Claimed reward no. 2. Picked items: 10x ultimate spirit potion.'),
(35, 1, 19, 1682350258, 'Claimed reward no. 2. Picked items: 10x supreme health potion.'),
(36, 4, 9, 1682350555, 'Claimed reward no. 5. Picked reward: 2x Prey bonus reroll(s)'),
(37, 0, 20, 1682363076, 'Claimed reward no. 1. Picked items: 10x ultimate mana potion.'),
(38, 1, 17, 1682373724, 'Claimed reward no. 2. Picked items: 10x ultimate mana potion.'),
(39, 0, 21, 1682374708, 'Claimed reward no. 1. Picked items: 10x ultimate mana potion.'),
(40, 2, 18, 1682438838, 'Claimed reward no. 3. Picked reward: 2x Prey bonus reroll(s)'),
(41, 5, 9, 1682521177, 'Claimed reward no. 6. Picked items: 2x training wand.'),
(42, 3, 18, 1682524334, 'Claimed reward no. 4. Picked items: 20x ultimate spirit potion.'),
(43, 2, 19, 1682648796, 'Claimed reward no. 3. Picked reward: 2x Prey bonus reroll(s)');

-- --------------------------------------------------------

--
-- Estrutura da tabela `exclusive_hunts`
--

CREATE TABLE `exclusive_hunts` (
  `id` int(11) NOT NULL,
  `hunt_id` int(11) NOT NULL,
  `guid_player` varchar(32) NOT NULL,
  `time` int(11) NOT NULL,
  `to_time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `exclusive_hunts`
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
-- Estrutura da tabela `forge_history`
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

--
-- Extraindo dados da tabela `forge_history`
--

INSERT INTO `forge_history` (`id`, `player_id`, `action_type`, `description`, `is_success`, `bonus`, `done_at`, `done_at_date`, `cost`, `gained`) VALUES
(8487, 17, 0, 'Successful <br><br>Fusion partners:<ul> <li>First item: a soulhexer, tier 0</li><li>Second item: a soulhexer, tier 0</li></ul><br>Result:<ul> <li>First item: tier + 1</li><li>Second item: consumed</li></ul><br>Invested:<ul><li>0 cores</li><li>100 dust</li><li>8 kk gold</li></ul>', 1, 0, 1682297814, '2023-04-26 21:44:51', 0, 0),
(8962, 18, 2, 'Converted 60 dust to 3 slivers.', 1, 0, 1682131529, '2023-04-28 11:55:00', 0, 0),
(8963, 18, 0, 'Unsuccessful <br><br>Fusion partners:<ul> <li>First item: a soulbleeder, tier 0</li><li>Second item: a soulbleeder, tier 0</li></ul><br>Result:<ul> <li>First item: unchanged</li><li>Second item: consumed</li></ul><br>Invested:<ul><li>0 cores</li><li>100 dust</li><li>8 kk gold</li></ul>', 0, 0, 1682297758, '2023-04-28 11:55:00', 0, 0),
(8968, 9, 2, 'Spent 29 dust to increase the dust limit to 105.', 1, 0, 1682131531, '2023-04-28 13:52:16', 0, 0),
(8969, 9, 2, 'Spent 30 dust to increase the dust limit to 106.', 1, 0, 1682131532, '2023-04-28 13:52:16', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `free_pass`
--

CREATE TABLE `free_pass` (
  `player_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `global_storage`
--

CREATE TABLE `global_storage` (
  `key` varchar(32) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `global_storage`
--

INSERT INTO `global_storage` (`key`, `value`) VALUES
('14110', '1683153660'),
('40000', '4'),
('48503', '3');

-- --------------------------------------------------------

--
-- Estrutura da tabela `guilds`
--

CREATE TABLE `guilds` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` bigint(20) NOT NULL,
  `motd` varchar(255) NOT NULL DEFAULT '',
  `residence` int(11) NOT NULL,
  `description` text NOT NULL,
  `guild_logo` mediumblob DEFAULT NULL,
  `create_ip` bigint(20) NOT NULL DEFAULT 0,
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `last_execute_points` bigint(20) NOT NULL DEFAULT 0,
  `logo_gfx_name` varchar(255) NOT NULL DEFAULT '',
  `level` int(11) NOT NULL DEFAULT 1,
  `points` int(11) NOT NULL DEFAULT 0,
  `logo_name` varchar(100) NOT NULL,
  `world_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `guilds`
--

INSERT INTO `guilds` (`id`, `name`, `ownerid`, `creationdata`, `motd`, `residence`, `description`, `guild_logo`, `create_ip`, `balance`, `last_execute_points`, `logo_gfx_name`, `level`, `points`, `logo_name`, `world_id`) VALUES
(3, 'RealSoft', 9, 1673371048, '', 0, 'New guild. Leader must edit this text :)', 0x313637333337313034383b646174613a696d6167652f6769663b6261736536342c52306c474f446c68514142414150634141414141414167414142414141426741414267494143454941436b494144454941446b4941446b514145495141456f514146495141466f5141466f5941474d5941474e6a556d73594147744b4147746a556d746a576d7472576e4d5941484e5341484e72576e4e72593373594148736841487453414874614148747a5933747a6134516841495261414952614349526a4349523761345237633477684149786a434979456334794565355168414a5272434a534d65357770414a7872434a787a434a794d6535794d684a7955684b5570414b567a434b5637434b5755684b57636a4b3070414b3137434b32636a4c5570414c5637434c5745434c576c6c4c57746c4c3078414c3245434c324d434c32316e4d5978414d614d434d6155434d613170633478414d3655434d363972645978414e5935414e6155434e6163434e3435414f2f657876666e7a762f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f79483542414541414645414c414141414142414145414141416a2b414b4e4543514367494d454143424d614e4b6a774945494143523832584168526f734f43416a4e7144494345434a4b50486b4d7943596c6b704567695445717137496753704d6d534b564e2b424e6b785a514162476a554347466d795a63715750556b7947597079364a4f6951486c366a456c7a4a70475141456a677a446c514a644759517a753672506b7861396169566e334b354e6e314b63696f55334d475942717a3645696c4d4a64794e5174544a6b69554872757964456b4567496359564b75614841757a37744359543868364e566f54373958446b4c4d69415a4342525741414d346d7566496c334a52496749427759534a444167516f634d7a305870706c334a6d584c5644482f334e454368496b574c585a6b3172736a41634944466d3672734a424167414146514754694a644969416f4d45437851343244446a4b5a4d416c533854595641516749414443784c2b474341674945414243302b424741415141516752484245576a485a674167675142774149754e39517675427842632b743939414f324d4757303034426e4a424545556b306d4951525267685278417348454151414345793051414242423051414167675062426a41427570565a454551437a375949494d4e42684641424156656c6d45424434366741476b5858464144697755454145514c454946515630307041516c52424431495749515251627777516764516a6c4145677744733846706761303357517848486d61444341777751304a304354437751514163416243415a5351514738494345456c37775541476c4d6141414141636b55634e615638615730674d4a4f464744624a6b5a344141537667584234414836465561454351416b30454f456778365558463432695a4445416739636c78315657524952774b5146624a425a4241596755594143437844775942482b4b775267416c356d4b696745445155416f4943504368786746334d4154426b41536a474343744a7a547651416746764450724157456230426b494f4542546841684a67354a424845726970305a4d4777736e34567741704a4d4c4341545a3865364251414c7851686751456a4b624242437a36715249514b4144516f78486f4353446a6f41756c35564a715653346c57684c4974466175755376516d4b59414451484145774b78443968564145454c514b63514a41594241524849647565646a41685a6b43454151526e53386c4d493639545153615577574641472b4c6d7631314b364b356864416456725a2b3441434f46514a41413146524b41415633327136785954424851675951414f455042415479795a42536b4151675278595770504c53633041437641796c4856536266383030635232316f65616e6c5a39786b4133795a51524137444f70575a714276594b55542b724343666c65354776336f5573616237476f42443132574e31304d5043536278674146306d51567441515759454d41494146545847684e6c5a3751543155516346664544443536416d585650425a3244455865654c4951414d365132457043354267324143707131314c6c416d4b56476b374d4739494379413141443052486c526777365177494b4643464333552f4e414941424b7942634a56746d73657a35556b546c746344304147697137613553427a427474522b6258775141755431515541634d756944415a46687078766e666e6e2f464642494f4641426a414161676752416b4e49494148454149644a7542416774676743496b4a41453779747175647249736c78786d4d766754534a597959784956794b6f41524141425175416e4241433449416c30497739434b4865434771424d4344333458674677344b4e6c59636f3948646c64464862696b5365774a43582b45597459567a62676e32414a5956525453704b454d4559445a786c514e797049414c3161307a4d4d476b676e5a6c6e5453495a56706377416759467a4330434f4c694343437a43675277525267417263746f41494f4941425a45456345725448753851677759655355785549456843426c6a7846616b5777674147494978344437476f466739494c536741514d5a37465a535a303347486b674149457930305264514b676752454b344b69524145423477364b4c42794f47756a6836366f716549354a71356a6944414a53736136344c35534d4c4d49496b464541334c4e6c5a4168696746636241524965396f31705969436739397a776c5830666b79646c6f756138574c4d55434d78795763694a6a52537a31386965646d654d4469476566566a5a6f4c5639425351474d554951446d43416c725153434145716d484c64395249636349556c5a56424b304670514843506a2b61684142756b615763526242415267436b676f59634143364b4b55316b6253682f727a794759486d4b674c42536f493073556d45635a5a724178343067625069346a596677695368636c466b46596b49417535674c5a6c5753596b2f665a4f3537786e76626b785a436a7a74395a4b7274415249426d68426a7867774e73574d4d77674530413842447443567439776c6d7a506c7a503532383858623351636942466a5665416f4349664f6f7a4334586c4d785051496f7059626154595242355147356134494146744c4668367a4f41653743796c634b38425a3559736335536c374b554135545651674567674145535567535552693473512f6f4956307543522b57416a69576f4d6b494f436c436244637a4c41766e71774c6d415971386668724f61666a724b543635694c7a2b2b6255474d564934424c6d444c47627a454b596954584662676d553348644d576a7167332b514c735530456367427141494c68714c5a4f7a326c74346d315732516f577732475743416d49586b63556b514151502b537357694a6957536f5451713934424c555341594d56787a66427262376c6931754a416c4e5343747246587531726152464f424e4c786957644a4b77676752383569324f79654e6a33706e4248536f46767463384446412b64744c79584f78314f78694b38654a344e77344b747236395178316656684936716a48426b4e6f53514e6a736c4a53754f63596b46393569666366576b614e4d6c79316e49347130466d5345463152517158495662336354366a764e37455a794b456e4d6f774a67684353556349337a50416c58636b7866565049756342656379335342306a2b674c74646c2b6c506b56316547344b2b6f3248647553773451453643724b7562596a2b46306d366732544b547039704a37527430746a724d595a674f7a465373363347482b5948736231386a6f5679357370534a6b65676d3641464441417a49496a4833745674546473466b7839514f4c522b66363353315367415133304c4d6b6434766b42644f454a35716c4d354b7a367061455461432b47564843546e436f573077742b596339477a4347645473586d3041414134685774454347554a436c787457796b705a6e46532f59747134555a414b6f7a724f71567932445545355356424b70794c496b45784749474b544459706b6a4243695141524c6f65746572766b477847554942436d416741396a4f64743275732b774b5a44766233566b495169685167512b6b494e4851316f675366434344456e6a6732786e7741416c5177494a363235734645694f33422b68393733716a674154762f72594853694144483651374d45505167517a364c514e30553855484151413443525474677873732f4e3479304d48424e773774496477414d4277507563674c566533774b45426835496f4f434141414f773d3d, 2130706433, 0, 0, '', 1, 0, 'realsoft', 0),
(4, 'Other Guilds', 10, 1673377483, '', 0, 'New guild. Leader must edit this text :)', 0x313637333337373438333b646174613a696d6167652f6769663b6261736536342c52306c474f446c68514142414150634141414141414167414142414141426741414267494143454941436b494144454941446b4941446b514145495141456f514146495141466f5141466f5941474d5941474e6a556d73594147744b4147746a556d746a576d7472576e4d5941484e5341484e72576e4e72593373594148736841487453414874614148747a5933747a6134516841495261414952614349526a4349523761345237633477684149786a434979456334794565355168414a5272434a534d65357770414a7872434a787a434a794d6535794d684a7955684b5570414b567a434b5637434b5755684b57636a4b3070414b3137434b32636a4c5570414c5637434c5745434c576c6c4c57746c4c3078414c3245434c324d434c32316e4d5978414d614d434d6155434d613170633478414d3655434d363972645978414e5935414e6155434e6163434e3435414f2f657876666e7a762f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f79483542414541414645414c414141414142414145414141416a2b414b4e4543514367494d454143424d614e4b6a774945494143523832584168526f734f43416a4e7144494345434a4b50486b4d7943596c6b704567695445717137496753704d6d534b564e2b424e6b785a514162476a554347466d795a63715750556b7947597079364a4f6951486c366a456c7a4a70475141456a677a446c514a644759517a753672506b7861396169566e334b354e6e314b63696f55334d475942717a3645696c4d4a64794e5174544a6b69554872757964456b4567496359564b75614841757a37744359543868364e566f54373958446b4c4d69415a4342525741414d346d7566496c334a52496749427759534a444167516f634d7a305870706c334a6d584c5644482f334e454368496b574c585a6b3172736a41634944466d3672734a424167414146514754694a644969416f4d45437851343244446a4b5a4d416c533854595641516749414443784c2b474341674945414243302b424741415141516752484245576a485a674167675142774149754e39517675427842632b743939414f324d4757303034426e4a424545556b306d4951525267685278417348454151414345793051414242423051414167675062426a41427570565a454551437a375949494d4e42684641424156656c6d45424434366741476b5858464144697755454145514c454946515630307041516c52424431495749515251627777516764516a6c4145677744733846706761303357517848486d61444341777751304a304354437751514163416243415a5351514738494345456c37775541476c4d6141414141636b55634e615638615730674d4a4f464744624a6b5a344141537667584234414836465561454351416b30454f456778365558463432695a4445416739636c78315657524952774b5146624a425a4241596755594143437844775942482b4b775267416c356d4b696745445155416f4943504368786746334d4154426b41536a474343744a7a547651416746764450724157456230426b494f4542546841684a67354a424845726970305a4d4777736e34567741704a4d4c4341545a3865364251414c7851686751456a4b624242437a36715249514b4144516f78486f4353446a6f41756c35564a715653346c57684c4974466175755376516d4b59414451484145774b78443968564145454c514b63514a41594241524849647565646a41685a6b43454151526e53386c4d493639545153615577574641472b4c6d7631314b364b356864416456725a2b3441434f46514a41413146524b41415633327136785954424851675951414f455042415479795a42536b4151675278595770504c53633041437641796c4856536266383030635232316f65616e6c5a39786b4133795a51524137444f70575a714276594b55542b724343666c65354776336f5573616237476f42443132574e31304d5043536278674146306d51567441515759454d41494146545847684e6c5a3751543155516346664544443536416d585650425a3244455865654c4951414d365132457043354267324143707131314c6c416d4b56476b374d4739494379413141443052486c526777365177494b4643464333552f4e414941424b7942634a56746d73657a35556b546c746344304147697137613553427a427474522b6258775141755431515541634d756944415a46687078766e666e6e2f464642494f4641426a414161676752416b4e49494148454149644a7542416774676743496b4a41453779747175647249736c78786d4d766754534a597959784956794b6f41524141425175416e4241433449416c30497739434b4865434771424d4344333458674677344b4e6c59636f3948646c64464862696b5365774a43582b45597459567a62676e32414a5956525453704b454d4559445a786c514e797049414c3161307a4d4d476b676e5a6c6e5453495a56706377416759467a4330434f4c694343437a43675277525267417263746f41494f4941425a45456345725448753851677759655355785549456843426c6a7846616b5777674147494978344437476f466739494c536741514d5a37465a535a303347486b674149457930305264514b676752454b344b69524145423477364b4c42794f47756a6836366f716549354a71356a6944414a53736136344c35534d4c4d49496b464541334c4e6c5a4168696746636241524965396f31705969436739397a776c5830666b79646c6f756138574c4d55434d78795763694a6a52537a31386965646d654d4469476566566a5a6f4c5639425351474d554951446d43416c725153434145716d484c64395249636349556c5a56424b304670514843506a2b61684142756b615763526242415267436b676f59634143364b4b55316b6253682f727a794759486d4b674c42536f493073556d45635a5a724178343067625069346a596677695368636c466b46596b49417535674c5a6c5753596b2f665a4f3537786e76626b785a436a7a74395a4b7274415249426d68426a7867774e73574d4d77674530413842447443567439776c6d7a506c7a503532383858623351636942466a5665416f4349664f6f7a4334586c4d785051496f7059626154595242355147356134494146744c4668367a4f41653743796c634b38425a3559736335536c374b554135545651674567674145535567535552693473512f6f4956307543522b57416a69576f4d6b494f436c436244637a4c41766e71774c6d415971386668724f61666a724b543635694c7a2b2b6255474d564934424c6d444c47627a454b596954584662676d553348644d576a7167332b514c735530456367427141494c68714c5a4f7a326c74346d315732516f577732475743416d49586b63556b514151502b537357694a6957536f5451713934424c555341594d56787a66427262376c6931754a416c4e5343747246587531726152464f424e4c786957644a4b77676752383569324f79654e6a33706e4248536f46767463384446412b64744c79584f78314f78694b38654a344e77344b747236395178316656684936716a48426b4e6f53514e6a736c4a53754f63596b46393569666366576b614e4d6c79316e49347130466d5345463152517158495662336354366a764e37455a794b456e4d6f774a67684353556349337a50416c58636b7866565049756342656379335342306a2b674c74646c2b6c506b56316547344b2b6f3248647553773451453643724b7562596a2b46306d366732544b547039704a37527430746a724d595a674f7a465373363347482b5948736231386a6f5679357370534a6b65676d3641464441417a49496a4833745674546473466b7839514f4c522b66363353315367415133304c4d6b6434766b42644f454a35716c4d354b7a367061455461432b47564843546e436f573077742b596339477a4347645473586d3041414134685774454347554a436c787457796b705a6e46532f59747134555a414b6f7a724f71567932445545355356424b70794c496b45784749474b544459706b6a4243695141524c6f65746572766b477847554942436d416741396a4f64743275732b774b5a44766233566b495169685167512b6b494e4851316f675366434344456e6a6732786e7741416c5177494a363235734645694f33422b68393733716a674154762f72594853694144483651374d45505167517a364c514e30553855484151413443525474677873732f4e3479304d48424e773774496477414d4277507563674c566533774b45426835496f4f434141414f773d3d, 2130706433, 0, 0, '', 1, 0, '', 0),
(6, 'Kidaucu', 18, 1682454568, '', 0, '', NULL, 0, 0, 0, '', 1, 0, 'default_logo', 1);

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
-- Estrutura da tabela `guildwar_kills`
--

CREATE TABLE `guildwar_kills` (
  `id` int(11) NOT NULL,
  `killer` varchar(50) NOT NULL,
  `target` varchar(50) NOT NULL,
  `killerguild` int(11) NOT NULL DEFAULT 0,
  `targetguild` int(11) NOT NULL DEFAULT 0,
  `warid` int(11) NOT NULL DEFAULT 0,
  `time` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_actions_h`
--

CREATE TABLE `guild_actions_h` (
  `id` int(10) UNSIGNED NOT NULL,
  `guild_id` int(11) DEFAULT NULL,
  `player_id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `date` bigint(20) DEFAULT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_applications`
--

CREATE TABLE `guild_applications` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `account_id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL DEFAULT 0,
  `text` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `date` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_events`
--

CREATE TABLE `guild_events` (
  `id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `date` int(11) NOT NULL,
  `private` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_invites`
--

CREATE TABLE `guild_invites` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `guild_id` int(11) NOT NULL DEFAULT 0,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `guild_invites`
--

INSERT INTO `guild_invites` (`player_id`, `guild_id`, `date`) VALUES
(17, 6, 1682411392),
(19, 6, 1682411405),
(20, 6, 1682411411),
(21, 6, 1682411385),
(22, 6, 1682411421);

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_membership`
--

CREATE TABLE `guild_membership` (
  `player_id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `nick` varchar(15) NOT NULL DEFAULT '',
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `guild_membership`
--

INSERT INTO `guild_membership` (`player_id`, `guild_id`, `rank_id`, `nick`, `date`) VALUES
(9, 3, 7, '', 0),
(10, 4, 10, '', 0),
(18, 6, 16, '', 1682454568);

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_ranks`
--

CREATE TABLE `guild_ranks` (
  `id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL COMMENT 'guild',
  `name` varchar(255) NOT NULL COMMENT 'rank name',
  `level` int(11) NOT NULL COMMENT 'rank level - leader, vice, member, maybe something else'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `guild_ranks`
--

INSERT INTO `guild_ranks` (`id`, `guild_id`, `name`, `level`) VALUES
(7, 3, 'The Leader', 3),
(8, 3, 'Vice-Leader', 2),
(9, 3, 'Member', 1),
(10, 4, 'The Leader', 3),
(11, 4, 'Vice-Leader', 2),
(12, 4, 'Member', 1),
(16, 6, 'Mamador de Piroca', 3),
(17, 6, 'So a cabecinha', 2),
(18, 6, 'Chupa transa e da o cu', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_transfer_h`
--

CREATE TABLE `guild_transfer_h` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `from_guild_id` int(11) NOT NULL,
  `to_guild_id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `date` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_wars`
--

CREATE TABLE `guild_wars` (
  `id` int(11) NOT NULL,
  `guild1` int(11) NOT NULL DEFAULT 0,
  `guild2` int(11) NOT NULL DEFAULT 0,
  `name1` varchar(255) NOT NULL,
  `name2` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `started` bigint(20) NOT NULL DEFAULT 0,
  `ended` bigint(20) NOT NULL DEFAULT 0,
  `frags_limit` int(11) DEFAULT 20,
  `price1` int(11) NOT NULL DEFAULT 0,
  `price2` int(11) NOT NULL DEFAULT 0,
  `frags` int(11) NOT NULL DEFAULT 0,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `highscores`
--

CREATE TABLE `highscores` (
  `id` tinyint(4) NOT NULL,
  `name` tinyint(4) NOT NULL,
  `account_id` tinyint(4) NOT NULL,
  `group_id` tinyint(4) NOT NULL,
  `level` tinyint(4) NOT NULL,
  `experience` tinyint(4) NOT NULL,
  `vocation` tinyint(4) NOT NULL,
  `rank` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `houses`
--

CREATE TABLE `houses` (
  `id` int(11) NOT NULL,
  `house_id` int(11) NOT NULL,
  `world_id` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
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
-- Extraindo dados da tabela `houses`
--

INSERT INTO `houses` (`id`, `house_id`, `world_id`, `owner`, `paid`, `warnings`, `name`, `rent`, `town_id`, `bid`, `bid_end`, `last_bid`, `highest_bidder`, `size`, `guildid`, `beds`) VALUES
(1, 0, 0, 17, 1684712236, 0, 'Thunder City #1', 0, 1, 0, 0, 0, 0, 42, NULL, 2),
(2, 0, 0, 9, 1680094250, 0, 'Thunder City #2', 0, 1, 0, 0, 0, 0, 49, NULL, 2),
(3, 0, 0, 0, 1680095434, 0, 'Thunder City #3', 0, 1, 0, 0, 0, 0, 48, NULL, 2),
(4, 0, 0, 18, 1684712506, 0, 'Thunder City #4', 0, 1, 0, 0, 0, 0, 49, NULL, 2),
(5, 0, 0, 0, 0, 0, 'Thunder City #5', 0, 1, 0, 0, 0, 0, 56, NULL, 2),
(6, 0, 0, 0, 0, 0, 'Thunder City #6', 0, 1, 0, 0, 0, 0, 49, NULL, 2),
(7, 0, 0, 0, 0, 0, 'Thunder City #7', 0, 1, 0, 0, 0, 0, 20, NULL, 2),
(8, 0, 0, 0, 0, 0, 'Thunder City #9', 0, 1, 0, 0, 0, 0, 42, NULL, 2),
(9, 0, 0, 0, 0, 0, 'Thunder City #10', 0, 1, 0, 0, 0, 0, 63, NULL, 2),
(10, 0, 0, 0, 0, 0, 'Thunder City #11', 0, 1, 0, 0, 0, 0, 40, NULL, 2),
(11, 0, 0, 0, 0, 0, 'Thunder City #12', 0, 1, 0, 0, 0, 0, 42, NULL, 2),
(12, 0, 0, 0, 0, 0, 'Thunder City #13', 0, 1, 0, 0, 0, 0, 49, NULL, 2),
(13, 0, 0, 0, 0, 0, 'Thunder City #14', 0, 1, 0, 0, 0, 0, 49, NULL, 2),
(14, 0, 0, 0, 0, 0, 'Thunder City #15', 0, 1, 0, 0, 0, 0, 36, NULL, 2),
(15, 0, 0, 0, 0, 0, 'Thunder City #16', 0, 1, 0, 0, 0, 0, 30, NULL, 2),
(16, 0, 0, 0, 0, 0, 'Thunder City #17', 0, 1, 0, 0, 0, 0, 49, NULL, 2),
(17, 0, 0, 0, 0, 0, 'Thunder City #18', 0, 1, 0, 0, 0, 0, 42, NULL, 2),
(18, 0, 0, 0, 0, 0, 'Thunder City #19', 0, 1, 0, 0, 0, 0, 42, NULL, 2),
(19, 0, 0, 0, 0, 0, 'Thunder City #20', 0, 1, 0, 0, 0, 0, 36, NULL, 2),
(20, 0, 0, 0, 0, 0, 'Thunder City #21', 0, 1, 0, 0, 0, 0, 48, NULL, 2),
(21, 0, 0, 0, 0, 0, 'Thunder City #22', 0, 1, 0, 0, 0, 0, 60, NULL, 2),
(22, 0, 0, 0, 0, 0, 'Thunder City #23', 0, 1, 0, 0, 0, 0, 30, NULL, 2),
(23, 0, 0, 0, 0, 0, 'Thunder City #24', 0, 1, 0, 0, 0, 0, 36, NULL, 2),
(24, 0, 0, 0, 0, 0, 'Thunder City #25', 0, 1, 0, 0, 0, 0, 549, NULL, 12),
(25, 0, 0, 0, 0, 0, 'Thunder City #26', 0, 1, 0, 0, 0, 0, 56, NULL, 2),
(26, 0, 0, 0, 0, 0, 'Thunder City #27', 0, 1, 0, 0, 0, 0, 63, NULL, 4),
(27, 0, 0, 0, 0, 0, 'Thunder City #28', 0, 1, 0, 0, 0, 0, 49, NULL, 2),
(28, 0, 0, 0, 0, 0, 'Thunder City #29', 0, 1, 0, 0, 0, 0, 70, NULL, 4),
(29, 0, 0, 0, 0, 0, 'Thunder City #30', 0, 1, 0, 0, 0, 0, 72, NULL, 4),
(30, 0, 0, 0, 0, 0, 'Thunder City #31', 0, 1, 0, 0, 0, 0, 35, NULL, 2),
(31, 0, 0, 0, 0, 0, 'Thunder City #32', 0, 1, 0, 0, 0, 0, 35, NULL, 2),
(32, 0, 0, 0, 0, 0, 'Thunder City #33', 0, 1, 0, 0, 0, 0, 35, NULL, 2),
(33, 0, 0, 0, 1644432459, 0, 'Thunder City #34', 0, 1, 0, 0, 0, 0, 56, NULL, 4),
(34, 0, 0, 0, 1644432459, 0, 'Thunder City #35', 0, 1, 0, 0, 0, 0, 216, NULL, 8),
(35, 0, 0, 0, 1644432459, 0, 'Thunder City #36', 0, 1, 0, 0, 0, 0, 50, NULL, 2),
(36, 0, 0, 0, 1644432459, 0, 'Thunder City #37', 0, 1, 0, 0, 0, 0, 50, NULL, 2),
(37, 0, 0, 0, 1644432459, 0, 'Thunder City #38', 0, 1, 0, 0, 0, 0, 50, NULL, 2),
(38, 0, 0, 0, 1644432459, 0, 'Thunder City #39', 0, 1, 0, 0, 0, 0, 81, NULL, 4),
(39, 0, 0, 0, 1644432459, 0, 'Thunder City #40', 0, 1, 0, 0, 0, 0, 48, NULL, 2),
(40, 0, 0, 0, 1644432459, 0, 'Thunder City #41', 0, 1, 0, 0, 0, 0, 63, NULL, 2),
(41, 0, 0, 0, 1644432459, 0, 'Thunder City #42', 0, 1, 0, 0, 0, 0, 54, NULL, 2),
(42, 0, 0, 0, 1644432459, 0, 'Thunder City #43', 0, 1, 0, 0, 0, 0, 48, NULL, 2),
(43, 0, 0, 0, 1644432459, 0, 'Thunder City #44', 0, 1, 0, 0, 0, 0, 48, NULL, 2),
(44, 0, 0, 0, 1644432459, 0, 'Thunder City #45', 0, 1, 0, 0, 0, 0, 48, NULL, 2),
(45, 0, 0, 0, 1644432459, 0, 'Thunder City #46', 0, 1, 0, 0, 0, 0, 48, NULL, 2),
(46, 0, 0, 0, 1644432459, 0, 'Thunder City #47', 0, 1, 0, 0, 0, 0, 48, NULL, 2),
(47, 0, 0, 0, 1644432459, 0, 'Thunder City #48', 0, 1, 0, 0, 0, 0, 56, NULL, 2),
(48, 0, 0, 0, 1644432459, 0, 'Thunder City #49', 0, 1, 0, 0, 0, 0, 36, NULL, 2),
(49, 0, 0, 0, 1644432459, 0, 'Thunder City #50', 0, 1, 0, 0, 0, 0, 31, NULL, 2),
(50, 0, 0, 0, 1644432459, 0, 'Thunder City #51', 0, 1, 0, 0, 0, 0, 49, NULL, 2),
(51, 0, 0, 0, 1644432459, 0, 'Thunder City #52', 0, 1, 0, 0, 0, 0, 105, NULL, 2),
(52, 0, 0, 0, 1644432459, 0, 'Thunder City #53', 0, 1, 0, 0, 0, 0, 98, NULL, 2),
(53, 0, 0, 0, 1644432459, 0, 'Thunder City #54', 0, 1, 0, 0, 0, 0, 42, NULL, 2),
(54, 0, 0, 0, 1644432459, 0, 'Thunder City #55', 0, 1, 0, 0, 0, 0, 49, NULL, 2),
(55, 0, 0, 0, 1644432459, 0, 'Thunder City #56', 0, 1, 0, 0, 0, 0, 45, NULL, 2),
(56, 0, 0, 0, 1644432459, 0, 'Thunder City #57', 0, 1, 0, 0, 0, 0, 45, NULL, 2),
(57, 0, 0, 0, 1644432459, 0, 'Thunder City #58', 0, 1, 0, 0, 0, 0, 35, NULL, 2),
(58, 0, 0, 0, 1644432459, 0, 'Thunder City #59', 0, 1, 0, 0, 0, 0, 28, NULL, 2),
(59, 0, 0, 0, 1644432459, 0, 'Thunder City #60', 0, 1, 0, 0, 0, 0, 56, NULL, 2),
(60, 0, 0, 0, 1644432459, 0, 'Thunder City #61', 0, 1, 0, 0, 0, 0, 47, NULL, 2),
(61, 0, 0, 0, 1644432459, 0, 'Thunder City #62', 0, 1, 0, 0, 0, 0, 56, NULL, 2),
(62, 0, 0, 0, 1644432459, 0, 'Thunder City #63', 0, 1, 0, 0, 0, 0, 50, NULL, 2),
(63, 0, 0, 0, 1644432459, 0, 'Thunder City #64', 0, 1, 0, 0, 0, 0, 56, NULL, 4),
(64, 0, 0, 0, 1644432459, 0, 'Thunder City #65', 0, 1, 0, 0, 0, 0, 46, NULL, 2),
(65, 0, 0, 0, 1644432459, 0, 'Thunder City #66', 0, 1, 0, 0, 0, 0, 25, NULL, 2),
(66, 0, 0, 0, 1644432459, 0, 'Thunder City #67', 0, 1, 0, 0, 0, 0, 48, NULL, 2),
(67, 0, 0, 0, 1644432459, 0, 'Thunder City #68', 0, 1, 0, 0, 0, 0, 63, NULL, 2),
(68, 0, 0, 0, 1644432459, 0, 'Thunder City #69', 0, 1, 0, 0, 0, 0, 77, NULL, 2),
(69, 0, 0, 0, 1644432459, 0, 'Thunder City #70', 0, 1, 0, 0, 0, 0, 66, NULL, 2),
(70, 0, 0, 0, 0, 0, 'Thunder City #71', 0, 1, 0, 0, 0, 0, 48, NULL, 2),
(71, 0, 0, 0, 1644432459, 0, 'Thunder City #72', 0, 1, 0, 0, 0, 0, 42, NULL, 2),
(72, 0, 0, 0, 1644432459, 0, 'Thunder City #73', 0, 1, 0, 0, 0, 0, 30, NULL, 2),
(73, 0, 0, 0, 1644432459, 0, 'Thunder City #74', 0, 1, 0, 0, 0, 0, 48, NULL, 2),
(74, 0, 0, 0, 1644432459, 0, 'Thunder City #75', 0, 1, 0, 0, 0, 0, 42, NULL, 2),
(75, 0, 0, 0, 1644432459, 0, 'Thunder City #76', 0, 1, 0, 0, 0, 0, 15, NULL, 2),
(76, 0, 0, 0, 1644432459, 0, 'Thunder City #77', 0, 1, 0, 0, 0, 0, 20, NULL, 2),
(77, 0, 0, 0, 1644432459, 0, 'Thunder City #78', 0, 1, 0, 0, 0, 0, 15, NULL, 2),
(78, 0, 0, 0, 1644432459, 0, 'Thunder City #79', 0, 1, 0, 0, 0, 0, 20, NULL, 2),
(79, 0, 0, 0, 1644432459, 0, 'Thunder City #80', 0, 1, 0, 0, 0, 0, 15, NULL, 2),
(80, 0, 0, 0, 1644432459, 0, 'Thunder City #81', 0, 1, 0, 0, 0, 0, 15, NULL, 2),
(81, 0, 0, 0, 1644432459, 0, 'Thunder City #82', 0, 1, 0, 0, 0, 0, 20, NULL, 2),
(82, 0, 0, 0, 1644432459, 0, 'Thunder City #83', 0, 1, 0, 0, 0, 0, 20, NULL, 2),
(83, 0, 0, 0, 1644432459, 0, 'Thunder City #84', 0, 1, 0, 0, 0, 0, 127, NULL, 2),
(84, 0, 0, 0, 1644432459, 0, 'Thunder City #85', 0, 1, 0, 0, 0, 0, 35, NULL, 2),
(85, 0, 0, 0, 1644432459, 0, 'Thunder City #86', 0, 1, 0, 0, 0, 0, 35, NULL, 2),
(86, 0, 0, 0, 1644432459, 0, 'Thunder City #87', 0, 1, 0, 0, 0, 0, 33, NULL, 2),
(87, 0, 0, 0, 1644432459, 0, 'Thunder City #88', 0, 1, 0, 0, 0, 0, 51, NULL, 2),
(88, 0, 0, 0, 1644432459, 0, 'Thunder City #89', 0, 1, 0, 0, 0, 0, 56, NULL, 2),
(89, 0, 0, 0, 1644432459, 0, 'Thunder City #90', 0, 1, 0, 0, 0, 0, 64, NULL, 4),
(90, 0, 0, 0, 1644432459, 0, 'Thunder City #91', 0, 1, 0, 0, 0, 0, 42, NULL, 2),
(91, 0, 0, 0, 1644432459, 0, 'Thunder City #92', 0, 1, 0, 0, 0, 0, 24, NULL, 2),
(92, 0, 0, 0, 1644432459, 0, 'Thunder City #93', 0, 1, 0, 0, 0, 0, 25, NULL, 2),
(93, 0, 0, 0, 1644432459, 0, 'Thunder City #94', 0, 1, 0, 0, 0, 0, 25, NULL, 2),
(94, 0, 0, 0, 1644432459, 0, 'Thunder City #95', 0, 1, 0, 0, 0, 0, 51, NULL, 2),
(95, 0, 0, 0, 1644432459, 0, 'Thunder City #96', 0, 1, 0, 0, 0, 0, 44, NULL, 2),
(96, 0, 0, 0, 1644432459, 0, 'Thunder City #97', 0, 1, 0, 0, 0, 0, 21, NULL, 2),
(97, 0, 0, 0, 1644432459, 0, 'Jamila Island #1', 0, 2, 0, 0, 0, 0, 64, NULL, 4),
(98, 0, 0, 0, 1644432459, 0, 'Jamila Island #2', 0, 2, 0, 0, 0, 0, 84, NULL, 4),
(99, 0, 0, 0, 1644432459, 0, 'Jamila Island #3', 0, 2, 0, 0, 0, 0, 55, NULL, 4),
(100, 0, 0, 0, 1644432459, 0, 'Jamila Island #4', 0, 2, 0, 0, 0, 0, 106, NULL, 4),
(101, 0, 0, 0, 1644432459, 0, 'Jamila Island #5', 0, 2, 0, 0, 0, 0, 49, NULL, 4),
(102, 0, 0, 0, 1644432459, 0, 'Jamila Island #6', 0, 2, 0, 0, 0, 0, 40, NULL, 2),
(103, 0, 0, 0, 1644432459, 0, 'Jamila Island #7', 0, 2, 0, 0, 0, 0, 35, NULL, 4),
(104, 0, 0, 0, 1644432459, 0, 'Jamila Island #8', 0, 2, 0, 0, 0, 0, 42, NULL, 2),
(105, 0, 0, 0, 1644432459, 0, 'Jamila Island #9', 0, 2, 0, 0, 0, 0, 42, NULL, 2),
(106, 0, 0, 0, 1644432459, 0, 'Jamila Island #10', 0, 2, 0, 0, 0, 0, 42, NULL, 2),
(107, 0, 0, 0, 1644432459, 0, 'Jamila Island #11', 0, 2, 0, 0, 0, 0, 74, NULL, 4),
(108, 0, 0, 0, 1644432459, 0, 'Jamila Island #12', 0, 2, 0, 0, 0, 0, 60, NULL, 0),
(109, 0, 0, 0, 1644432459, 0, 'Jamila Island #13', 0, 2, 0, 0, 0, 0, 42, NULL, 2),
(110, 0, 0, 0, 1644432459, 0, 'Jamila Island #14', 0, 2, 0, 0, 0, 0, 90, NULL, 2),
(111, 0, 0, 0, 1644432459, 0, 'Jamila Island #15', 0, 2, 0, 0, 0, 0, 20, NULL, 2),
(112, 0, 0, 0, 1644432459, 0, 'Jamila Island #16', 0, 2, 0, 0, 0, 0, 20, NULL, 2),
(113, 0, 0, 0, 1644432459, 0, 'Jamila Island #17', 0, 2, 0, 0, 0, 0, 23, NULL, 2),
(114, 0, 0, 0, 1644432459, 0, 'Jamila Island #18', 0, 2, 0, 0, 0, 0, 23, NULL, 2),
(115, 0, 0, 0, 1644432459, 0, 'Jamila Island #19', 0, 2, 0, 0, 0, 0, 20, NULL, 2),
(116, 0, 0, 0, 1644432459, 0, 'Jamila Island #20', 0, 2, 0, 0, 0, 0, 20, NULL, 2),
(117, 0, 0, 0, 1644432459, 0, 'Jamila Island #21', 0, 2, 0, 0, 0, 0, 16, NULL, 2),
(118, 0, 0, 0, 1644432459, 0, 'Jamila Island #22', 0, 2, 0, 0, 0, 0, 16, NULL, 2),
(119, 0, 0, 0, 1644432459, 0, 'Bhark #1', 0, 5, 0, 0, 0, 0, 24, NULL, 0),
(120, 0, 0, 0, 1644432459, 0, 'Bhark #2', 0, 5, 0, 0, 0, 0, 20, NULL, 0),
(121, 0, 0, 0, 1644432459, 0, 'Bhark #3', 0, 5, 0, 0, 0, 0, 13, NULL, 0),
(122, 0, 0, 0, 1644432459, 0, 'Bhark #4', 0, 5, 0, 0, 0, 0, 10, NULL, 0),
(123, 0, 0, 0, 1644432459, 0, 'Bhark #5', 0, 5, 0, 0, 0, 0, 40, NULL, 2),
(124, 0, 0, 0, 1644432459, 0, 'Bhark #6', 0, 5, 0, 0, 0, 0, 28, NULL, 2),
(125, 0, 0, 0, 1644432459, 0, 'Bhark #7', 0, 5, 0, 0, 0, 0, 64, NULL, 4),
(126, 0, 0, 0, 1644432459, 0, 'Bhark #8', 0, 5, 0, 0, 0, 0, 16, NULL, 2),
(127, 0, 0, 0, 1644432459, 0, 'Bhark #9', 0, 5, 0, 0, 0, 0, 35, NULL, 2),
(128, 0, 0, 0, 1644432459, 0, 'Bhark #10', 0, 5, 0, 0, 0, 0, 28, NULL, 2),
(129, 0, 0, 0, 1644432459, 0, 'Bhark #11', 0, 5, 0, 0, 0, 0, 48, NULL, 4),
(130, 0, 0, 0, 1644432459, 0, 'Bhark #12', 0, 5, 0, 0, 0, 0, 20, NULL, 2),
(131, 0, 0, 0, 1644432459, 0, 'Bhark #13', 0, 5, 0, 0, 0, 0, 40, NULL, 4),
(132, 0, 0, 0, 1644432459, 0, 'Bhark #14', 0, 5, 0, 0, 0, 0, 20, NULL, 2),
(133, 0, 0, 0, 1644432459, 0, 'Bhark #15', 0, 5, 0, 0, 0, 0, 24, NULL, 2),
(134, 0, 0, 0, 1644432459, 0, 'Bhark #16', 0, 5, 0, 0, 0, 0, 24, NULL, 2),
(135, 0, 0, 0, 1644432459, 0, 'Bhark #17', 0, 5, 0, 0, 0, 0, 58, NULL, 2),
(136, 0, 0, 0, 1644432459, 0, 'Bhark #18', 0, 5, 0, 0, 0, 0, 34, NULL, 2),
(137, 0, 0, 0, 1644432459, 0, 'Bhark #19', 0, 5, 0, 0, 0, 0, 44, NULL, 2),
(138, 0, 0, 0, 1644432459, 0, 'Bhark #20', 0, 5, 0, 0, 0, 0, 26, NULL, 2),
(139, 0, 0, 0, 1644432459, 0, 'Bhark #21', 0, 5, 0, 0, 0, 0, 35, NULL, 2),
(140, 0, 0, 0, 1644432459, 0, 'Bhark #22', 0, 5, 0, 0, 0, 0, 20, NULL, 2),
(141, 0, 0, 0, 1644432459, 0, 'Bhark #23', 0, 5, 0, 0, 0, 0, 16, NULL, 2),
(142, 0, 0, 0, 1644432459, 0, 'Bhark #24', 0, 5, 0, 0, 0, 0, 32, NULL, 4),
(143, 0, 0, 0, 1644432459, 0, 'Bhark #25', 0, 5, 0, 0, 0, 0, 24, NULL, 2),
(144, 0, 0, 0, 1644432459, 0, 'Bhark #26', 0, 5, 0, 0, 0, 0, 21, NULL, 2),
(145, 0, 0, 0, 1644432459, 0, 'Bhark #27', 0, 5, 0, 0, 0, 0, 20, NULL, 2),
(146, 0, 0, 0, 1644432459, 0, 'Bhark #28', 0, 5, 0, 0, 0, 0, 20, NULL, 2),
(147, 0, 0, 0, 1644432459, 0, 'Bhark #29', 0, 5, 0, 0, 0, 0, 42, NULL, 2),
(148, 0, 0, 0, 1644432459, 0, 'Bhark #30', 0, 5, 0, 0, 0, 0, 56, NULL, 4),
(149, 0, 0, 0, 1644432459, 0, 'Bhark #31', 0, 5, 0, 0, 0, 0, 20, NULL, 2),
(150, 0, 0, 0, 1644432459, 0, 'Bhark #32', 0, 5, 0, 0, 0, 0, 20, NULL, 2),
(151, 0, 0, 0, 1644432459, 0, 'Bhark #33', 0, 5, 0, 0, 0, 0, 16, NULL, 2),
(152, 0, 0, 0, 1644432459, 0, 'Bhark #34', 0, 5, 0, 0, 0, 0, 20, NULL, 2),
(153, 0, 0, 0, 1644432459, 0, 'Bhark #35', 0, 5, 0, 0, 0, 0, 25, NULL, 2),
(154, 0, 0, 0, 1644432459, 0, 'Bhark #36', 0, 5, 0, 0, 0, 0, 25, NULL, 2),
(155, 0, 0, 0, 1644432459, 0, 'Bhark #37', 0, 5, 0, 0, 0, 0, 25, NULL, 2),
(156, 0, 0, 0, 1644432459, 0, 'Bhark #38', 0, 5, 0, 0, 0, 0, 20, NULL, 2),
(157, 0, 0, 0, 1644432459, 0, 'Bhark #39', 0, 5, 0, 0, 0, 0, 27, NULL, 2),
(158, 0, 0, 0, 1644432459, 0, 'Bhark #40', 0, 5, 0, 0, 0, 0, 49, NULL, 2),
(159, 0, 0, 0, 1644432459, 0, 'Bhark #41', 0, 5, 0, 0, 0, 0, 30, NULL, 2),
(160, 0, 0, 0, 1644432459, 0, 'Bhark #42', 0, 5, 0, 0, 0, 0, 30, NULL, 2),
(161, 0, 0, 0, 1644432459, 0, 'Bhark #43', 0, 5, 0, 0, 0, 0, 11, NULL, 0),
(162, 0, 0, 0, 1644432459, 0, 'Bhark #44', 0, 5, 0, 0, 0, 0, 11, NULL, 0),
(163, 0, 0, 0, 1644432459, 0, 'Thunder City #8', 0, 1, 0, 0, 0, 0, 35, NULL, 2),
(164, 0, 0, 0, 1644432459, 0, 'Akravi #1', 0, 3, 0, 0, 0, 0, 56, NULL, 2),
(165, 0, 0, 0, 1644432459, 0, 'Akravi #2', 0, 3, 0, 0, 0, 0, 49, NULL, 6),
(166, 0, 0, 0, 1644432459, 0, 'Akravi #3', 0, 3, 0, 0, 0, 0, 56, NULL, 4),
(167, 0, 0, 0, 1644432459, 0, 'Akravi #4', 0, 3, 0, 0, 0, 0, 56, NULL, 4),
(168, 0, 0, 0, 1644432459, 0, 'Akravi #5', 0, 3, 0, 0, 0, 0, 49, NULL, 4),
(169, 0, 0, 0, 0, 0, 'Akravi #6', 0, 3, 0, 0, 0, 0, 30, NULL, 2),
(170, 0, 0, 0, 0, 0, 'Akravi #7', 0, 3, 0, 0, 0, 0, 30, NULL, 2),
(171, 0, 0, 0, 0, 0, 'Akravi #8', 0, 3, 0, 0, 0, 0, 50, NULL, 4),
(172, 0, 0, 0, 0, 0, 'Akravi #9', 0, 3, 0, 0, 0, 0, 25, NULL, 2),
(173, 0, 0, 0, 1644432459, 0, 'Akravi #10', 0, 3, 0, 0, 0, 0, 25, NULL, 2),
(174, 0, 0, 0, 1644432459, 0, 'Akravi #11', 0, 3, 0, 0, 0, 0, 25, NULL, 2),
(175, 0, 0, 0, 1644432459, 0, 'Akravi #12', 0, 3, 0, 0, 0, 0, 50, NULL, 4),
(176, 0, 0, 0, 0, 0, 'Akravi #13', 0, 3, 0, 0, 0, 0, 30, NULL, 2),
(177, 0, 0, 0, 0, 0, 'Akravi #14', 0, 3, 0, 0, 0, 0, 25, NULL, 2),
(178, 0, 0, 0, 0, 0, 'Akravi #15', 0, 3, 0, 0, 0, 0, 25, NULL, 2),
(179, 0, 0, 0, 0, 0, 'Akravi #16', 0, 3, 0, 0, 0, 0, 49, NULL, 4),
(180, 0, 0, 0, 0, 0, 'Akravi #17', 0, 3, 0, 0, 0, 0, 12, NULL, 2),
(181, 0, 0, 0, 0, 0, 'Akravi #18', 0, 3, 0, 0, 0, 0, 72, NULL, 6),
(182, 0, 0, 0, 0, 0, 'Akravi #19', 0, 3, 0, 0, 0, 0, 41, NULL, 4),
(183, 0, 0, 0, 0, 0, 'Akravi #20', 0, 3, 0, 0, 0, 0, 42, NULL, 4),
(184, 0, 0, 0, 0, 0, 'Akravi #21', 0, 3, 0, 0, 0, 0, 12, NULL, 2),
(185, 0, 0, 0, 0, 0, 'Akravi #22', 0, 3, 0, 0, 0, 0, 9, NULL, 2),
(186, 0, 0, 0, 0, 0, 'Akravi #23', 0, 3, 0, 0, 0, 0, 20, NULL, 2),
(187, 0, 0, 0, 0, 0, 'Akravi #24', 0, 3, 0, 0, 0, 0, 16, NULL, 2),
(188, 0, 0, 0, 0, 0, 'Akravi #25', 0, 3, 0, 0, 0, 0, 20, NULL, 2),
(189, 0, 0, 0, 0, 0, 'Akravi #26', 0, 3, 0, 0, 0, 0, 25, NULL, 2),
(190, 0, 0, 0, 0, 0, 'Akravi #27', 0, 3, 0, 0, 0, 0, 25, NULL, 2),
(191, 0, 0, 0, 0, 0, 'Akravi #28', 0, 3, 0, 0, 0, 0, 30, NULL, 2),
(192, 0, 0, 0, 0, 0, 'Akravi #29', 0, 3, 0, 0, 0, 0, 25, NULL, 2),
(193, 0, 0, 0, 0, 0, 'Akravi #30', 0, 3, 0, 0, 0, 0, 42, NULL, 4),
(194, 0, 0, 0, 0, 0, 'Akravi #31', 0, 3, 0, 0, 0, 0, 12, NULL, 2),
(195, 0, 0, 0, 0, 0, 'Akravi #32', 0, 3, 0, 0, 0, 0, 21, NULL, 2),
(196, 0, 0, 0, 0, 0, 'Akravi #33', 0, 3, 0, 0, 0, 0, 21, NULL, 2),
(197, 0, 0, 0, 0, 0, 'Akravi #34', 0, 3, 0, 0, 0, 0, 21, NULL, 2),
(198, 0, 0, 0, 0, 0, 'Akravi #35', 0, 3, 0, 0, 0, 0, 21, NULL, 2),
(199, 0, 0, 0, 0, 0, 'Wintermere #1', 0, 6, 0, 0, 0, 0, 111, NULL, 4),
(200, 0, 0, 0, 0, 0, 'Wintermere #2', 0, 6, 0, 0, 0, 0, 54, NULL, 4),
(201, 0, 0, 0, 0, 0, 'Wintermere #3', 0, 6, 0, 0, 0, 0, 24, NULL, 2),
(202, 0, 0, 0, 0, 0, 'Wintermere #4', 0, 6, 0, 0, 0, 0, 94, NULL, 0),
(203, 0, 0, 0, 0, 0, 'Wintermere #5', 0, 6, 0, 0, 0, 0, 152, NULL, 4),
(204, 0, 0, 0, 0, 0, 'Wintermere #6', 0, 6, 0, 0, 0, 0, 131, NULL, 6),
(205, 0, 0, 0, 0, 0, 'Wintermere #7', 0, 6, 0, 0, 0, 0, 65, NULL, 4),
(206, 0, 0, 0, 0, 0, 'Wintermere #8', 0, 6, 0, 0, 0, 0, 48, NULL, 0),
(207, 0, 0, 0, 0, 0, 'Wintermere #9', 0, 6, 0, 0, 0, 0, 45, NULL, 0),
(208, 0, 0, 0, 0, 0, 'Wintermere #10', 0, 6, 0, 0, 0, 0, 73, NULL, 2),
(209, 0, 0, 0, 0, 0, 'Wintermere #11', 0, 6, 0, 0, 0, 0, 76, NULL, 0),
(210, 0, 0, 0, 0, 0, 'Wintermere #12', 0, 6, 0, 0, 0, 0, 147, NULL, 0),
(211, 0, 0, 0, 0, 0, 'Wintermere #13', 0, 6, 0, 0, 0, 0, 65, NULL, 0),
(212, 0, 0, 0, 0, 0, 'Wintermere #14', 0, 6, 0, 0, 0, 0, 38, NULL, 0),
(213, 0, 0, 0, 0, 0, 'Wintermere #15', 0, 6, 0, 0, 0, 0, 108, NULL, 0),
(214, 0, 0, 0, 0, 0, 'Wintermere #16', 0, 6, 0, 0, 0, 0, 86, NULL, 0),
(215, 0, 0, 0, 0, 0, 'Wintermere #17', 0, 6, 0, 0, 0, 0, 129, NULL, 6),
(216, 0, 0, 0, 0, 0, 'Wintermere #18', 0, 6, 0, 0, 0, 0, 84, NULL, 0),
(217, 0, 0, 0, 0, 0, 'Wintermere #19', 0, 6, 0, 0, 0, 0, 97, NULL, 0),
(218, 0, 0, 0, 0, 0, 'Wintermere #20', 0, 6, 0, 0, 0, 0, 42, NULL, 0),
(219, 0, 0, 0, 0, 0, 'Wintermere #21', 0, 6, 0, 0, 0, 0, 48, NULL, 0),
(220, 0, 0, 0, 0, 0, 'Wintermere #22', 0, 6, 0, 0, 0, 0, 93, NULL, 2),
(221, 0, 0, 0, 0, 0, 'Wintermere #23', 0, 6, 0, 0, 0, 0, 69, NULL, 2),
(222, 0, 0, 0, 0, 0, 'Wintermere #24', 0, 6, 0, 0, 0, 0, 60, NULL, 0),
(223, 0, 0, 0, 0, 0, 'Wintermere #25', 0, 6, 0, 0, 0, 0, 83, NULL, 0),
(224, 0, 0, 0, 0, 0, 'Al Arar #1', 0, 4, 0, 0, 0, 0, 48, NULL, 0),
(225, 0, 0, 0, 0, 0, 'Al Arar #2', 0, 4, 0, 0, 0, 0, 87, NULL, 0),
(226, 0, 0, 0, 0, 0, 'Al Arar #3', 0, 4, 0, 0, 0, 0, 21, NULL, 0),
(227, 0, 0, 0, 0, 0, 'Al Arar #4', 0, 4, 0, 0, 0, 0, 70, NULL, 0),
(228, 0, 0, 0, 0, 0, 'Al Arar #5', 0, 4, 0, 0, 0, 0, 27, NULL, 0),
(229, 0, 0, 0, 0, 0, 'Al Arar #6', 0, 4, 0, 0, 0, 0, 24, NULL, 0),
(230, 0, 0, 0, 0, 0, 'Al Arar #7', 0, 4, 0, 0, 0, 0, 114, NULL, 0),
(231, 0, 0, 0, 0, 0, 'Al Arar #8', 0, 4, 0, 0, 0, 0, 79, NULL, 0),
(232, 0, 0, 0, 0, 0, 'Al Arar #9', 0, 4, 0, 0, 0, 0, 50, NULL, 0),
(233, 0, 0, 0, 0, 0, 'Al Arar #10', 0, 4, 0, 0, 0, 0, 52, NULL, 0),
(234, 0, 0, 0, 0, 0, 'Al Arar #11', 0, 4, 0, 0, 0, 0, 23, NULL, 2),
(235, 0, 0, 0, 0, 0, 'Al Arar #12', 0, 4, 0, 0, 0, 0, 235, NULL, 0),
(236, 0, 0, 0, 0, 0, 'Al Arar #13', 0, 4, 0, 0, 0, 0, 20, NULL, 0),
(237, 0, 0, 0, 0, 0, 'Shadow Wood #1', 0, 7, 0, 0, 0, 0, 20, NULL, 0),
(238, 0, 0, 0, 0, 0, 'Shadow Wood #2', 0, 7, 0, 0, 0, 0, 20, NULL, 0),
(239, 0, 0, 0, 0, 0, 'Shadow Wood #3', 0, 7, 0, 0, 0, 0, 24, NULL, 0),
(240, 0, 0, 0, 0, 0, 'Shadow Wood #4', 0, 7, 0, 0, 0, 0, 20, NULL, 0),
(241, 0, 0, 0, 0, 0, 'Shadow Wood #5', 0, 7, 0, 0, 0, 0, 30, NULL, 0),
(242, 0, 0, 0, 0, 0, 'Shadow Wood #6', 0, 7, 0, 0, 0, 0, 16, NULL, 0),
(243, 0, 0, 0, 0, 0, 'Shadow Wood #7', 0, 7, 0, 0, 0, 0, 16, NULL, 0),
(244, 0, 0, 0, 0, 0, 'Shadow Wood #8', 0, 7, 0, 0, 0, 0, 16, NULL, 0),
(245, 0, 0, 0, 0, 0, 'Shadow Wood #9', 0, 7, 0, 0, 0, 0, 20, NULL, 0),
(246, 0, 0, 0, 0, 0, 'Shadow Wood #10', 0, 7, 0, 0, 0, 0, 63, NULL, 0),
(247, 0, 0, 0, 0, 0, 'Shadow Wood #11', 0, 7, 0, 0, 0, 0, 16, NULL, 0),
(248, 0, 0, 0, 0, 0, 'Shadow Wood #12', 0, 7, 0, 0, 0, 0, 12, NULL, 0),
(249, 0, 0, 0, 0, 0, 'Shadow Wood #13', 0, 7, 0, 0, 0, 0, 88, NULL, 0),
(250, 0, 0, 0, 0, 0, 'Fork Village #1', 0, 1, 0, 0, 0, 0, 30, NULL, 2),
(251, 0, 0, 0, 0, 0, 'Fork Village #2', 0, 1, 0, 0, 0, 0, 49, NULL, 4),
(252, 0, 0, 0, 0, 0, 'Fork Village #3', 0, 1, 0, 0, 0, 0, 33, NULL, 2),
(253, 0, 0, 0, 0, 0, 'Fork Village #4', 0, 1, 0, 0, 0, 0, 39, NULL, 2),
(254, 0, 0, 0, 0, 0, 'Fork Village #5', 0, 1, 0, 0, 0, 0, 65, NULL, 2),
(255, 0, 0, 0, 0, 0, 'Fork Village #6', 0, 1, 0, 0, 0, 0, 45, NULL, 4),
(256, 0, 0, 0, 0, 0, 'Fork Village #7', 0, 1, 0, 0, 0, 0, 37, NULL, 2),
(257, 0, 0, 0, 0, 0, 'Fork Village #8', 0, 1, 0, 0, 0, 0, 31, NULL, 2),
(258, 0, 0, 0, 0, 0, 'Fork Village #9', 0, 1, 0, 0, 0, 0, 28, NULL, 2),
(259, 0, 0, 0, 0, 0, 'Fork Village #10', 0, 1, 0, 0, 0, 0, 62, NULL, 2),
(260, 0, 0, 0, 0, 0, 'Fork Village #11', 0, 1, 0, 0, 0, 0, 36, NULL, 2),
(261, 0, 0, 0, 0, 0, 'Fork Village #12', 0, 1, 0, 0, 0, 0, 24, NULL, 2),
(262, 0, 0, 0, 0, 0, 'Fork Village #13', 0, 1, 0, 0, 0, 0, 25, NULL, 2),
(263, 0, 0, 0, 0, 0, 'Thunder Hut #1', 0, 1, 0, 0, 0, 0, 30, NULL, 2),
(264, 0, 0, 0, 0, 0, 'Thunder Hut #2', 0, 1, 0, 0, 0, 0, 30, NULL, 2),
(265, 0, 0, 0, 0, 0, 'Thunder Hut #3', 0, 1, 0, 0, 0, 0, 30, NULL, 2),
(266, 0, 0, 0, 0, 0, 'Thunder Hut #4', 0, 1, 0, 0, 0, 0, 25, NULL, 2),
(267, 0, 0, 0, 0, 0, 'Thunder Hut #5', 0, 1, 0, 0, 0, 0, 25, NULL, 2),
(268, 0, 0, 0, 0, 0, 'Premia #1', 0, 8, 0, 0, 0, 0, 550, NULL, 8),
(269, 0, 0, 0, 0, 0, 'Premia #2', 0, 8, 0, 0, 0, 0, 565, NULL, 8),
(270, 0, 0, 0, 0, 0, 'Premia #3', 0, 8, 0, 0, 0, 0, 327, NULL, 6),
(271, 0, 0, 0, 0, 0, 'Premia #4', 0, 8, 0, 0, 0, 0, 364, NULL, 6),
(272, 0, 0, 0, 0, 0, 'Premia #5', 0, 8, 0, 0, 0, 0, 389, NULL, 6),
(273, 0, 0, 0, 0, 0, 'Premia #6', 0, 8, 0, 0, 0, 0, 509, NULL, 10),
(274, 0, 0, 0, 0, 0, 'Premia #7', 0, 8, 0, 0, 0, 0, 218, NULL, 2),
(275, 0, 0, 0, 0, 0, 'Premia #8', 0, 8, 0, 0, 0, 0, 218, NULL, 2),
(276, 0, 0, 0, 0, 0, 'Premia #9', 0, 8, 0, 0, 0, 0, 218, NULL, 2),
(277, 0, 0, 0, 0, 0, 'Premia #10', 0, 8, 0, 0, 0, 0, 677, NULL, 12),
(278, 0, 0, 0, 0, 0, 'Premia #11', 0, 8, 0, 0, 0, 0, 311, NULL, 4),
(279, 0, 0, 0, 0, 0, 'Premia #12', 0, 8, 0, 0, 0, 0, 407, NULL, 4),
(280, 0, 0, 0, 0, 0, 'Premia #13', 0, 8, 0, 0, 0, 0, 904, NULL, 14),
(281, 0, 0, 0, 0, 0, 'Premia #14', 0, 8, 0, 0, 0, 0, 218, NULL, 2),
(282, 0, 0, 0, 0, 0, 'Premia #15', 0, 8, 0, 0, 0, 0, 212, NULL, 2),
(283, 0, 0, 0, 0, 0, 'Premia #16', 0, 8, 0, 0, 0, 0, 221, NULL, 2),
(284, 0, 0, 0, 0, 0, 'Premia #17', 0, 8, 0, 0, 0, 0, 224, NULL, 2),
(285, 0, 0, 0, 0, 0, 'Premia #18', 0, 8, 0, 0, 0, 0, 231, NULL, 2),
(286, 0, 0, 0, 0, 0, 'Premia Subsolo #1', 0, 8, 0, 0, 0, 0, 49, NULL, 2),
(287, 0, 0, 0, 0, 0, 'Premia Subsolo #2', 0, 8, 0, 0, 0, 0, 64, NULL, 2),
(288, 0, 0, 0, 0, 0, 'Premia Subsolo #3', 0, 8, 0, 0, 0, 0, 49, NULL, 2),
(289, 0, 0, 0, 0, 0, 'Premia Subsolo #4', 0, 8, 0, 0, 0, 0, 64, NULL, 2),
(290, 0, 0, 0, 0, 0, 'Premia Subsolo #5', 0, 8, 0, 0, 0, 0, 128, NULL, 8),
(291, 0, 0, 0, 0, 0, 'Premia Subsolo #6', 0, 8, 0, 0, 0, 0, 70, NULL, 4),
(292, 0, 0, 0, 0, 0, 'Premia Subsolo #7', 0, 8, 0, 0, 0, 0, 70, NULL, 4),
(293, 0, 0, 0, 0, 0, 'Premia Subsolo #8', 0, 8, 0, 0, 0, 0, 187, NULL, 8),
(294, 0, 0, 0, 0, 0, 'Premia Subsolo #9', 0, 8, 0, 0, 0, 0, 75, NULL, 0),
(295, 0, 0, 0, 0, 0, 'Premia Subsolo #10', 0, 8, 0, 0, 0, 0, 116, NULL, 2),
(296, 0, 0, 0, 0, 0, 'Premia Subsolo #11', 0, 8, 0, 0, 0, 0, 99, NULL, 2),
(297, 0, 0, 0, 0, 0, 'Premia Subsolo #12', 0, 8, 0, 0, 0, 0, 233, NULL, 8),
(298, 0, 0, 0, 0, 0, 'Thunder Farm #1', 0, 1, 0, 0, 0, 0, 268, NULL, 8),
(299, 0, 0, 0, 0, 0, 'Thunder House #98', 0, 1, 0, 0, 0, 0, 51, NULL, 2),
(300, 0, 0, 0, 0, 0, 'Thunder House #99', 0, 1, 0, 0, 0, 0, 25, NULL, 2),
(465, 0, 0, 0, 1644432459, 0, 'Egeu 85', 0, 2, 0, 0, 0, 0, 23, NULL, 0),
(466, 0, 0, 0, 1644432459, 0, 'Egeu 86', 0, 2, 0, 0, 0, 0, 23, NULL, 0),
(467, 0, 0, 0, 1644432459, 0, 'Unnamed House #467', 0, 7, 0, 0, 0, 0, 108, NULL, 0),
(468, 0, 0, 0, 1644432459, 0, 'Unnamed House #468', 0, 7, 0, 0, 0, 0, 144, NULL, 0),
(469, 0, 0, 0, 1644432459, 0, 'Unnamed House #469', 0, 7, 0, 0, 0, 0, 66, NULL, 0),
(470, 0, 0, 0, 1644432459, 0, 'Unnamed House #470', 0, 7, 0, 0, 0, 0, 127, NULL, 0),
(472, 0, 0, 0, 1644432459, 0, 'Unnamed House #472', 0, 7, 0, 0, 0, 0, 97, NULL, 0),
(473, 0, 0, 0, 1644432459, 0, 'Unnamed House #473', 0, 7, 0, 0, 0, 0, 110, NULL, 0),
(474, 0, 0, 0, 1644432459, 0, 'Unnamed House #474', 0, 7, 0, 0, 0, 0, 122, NULL, 0),
(476, 0, 0, 0, 1644432459, 0, 'Unnamed House #476', 0, 7, 0, 0, 0, 0, 52, NULL, 0),
(477, 0, 0, 0, 1644432459, 0, 'Unnamed House #477', 0, 7, 0, 0, 0, 0, 176, NULL, 0),
(478, 0, 0, 0, 1644432459, 0, 'Unnamed House #478', 0, 7, 0, 0, 0, 0, 78, NULL, 0),
(479, 0, 0, 0, 1644432459, 0, 'Unnamed House #479', 0, 7, 0, 0, 0, 0, 126, NULL, 0),
(480, 0, 0, 0, 1644432459, 0, 'Unnamed House #480', 0, 7, 0, 0, 0, 0, 108, NULL, 0),
(481, 0, 0, 0, 1644432459, 0, 'Unnamed House #481', 0, 7, 0, 0, 0, 0, 39, NULL, 0),
(482, 0, 0, 0, 1644432459, 0, 'Unnamed House #482', 0, 7, 0, 0, 0, 0, 50, NULL, 0),
(483, 0, 0, 0, 1644432459, 0, 'Unnamed House #483', 0, 7, 0, 0, 0, 0, 42, NULL, 0),
(484, 0, 0, 0, 1644432459, 0, 'Unnamed House #484', 0, 7, 0, 0, 0, 0, 14, NULL, 0),
(485, 0, 0, 0, 1644432459, 0, 'Unnamed House #485', 0, 7, 0, 0, 0, 0, 72, NULL, 0),
(486, 0, 0, 0, 1644432459, 0, 'Unnamed House #486', 0, 7, 0, 0, 0, 0, 371, NULL, 0),
(487, 0, 0, 0, 1644432459, 0, 'Unnamed House #487', 0, 7, 0, 0, 0, 0, 169, NULL, 0),
(488, 0, 0, 0, 1644432459, 0, 'Unnamed House #488', 0, 7, 0, 0, 0, 0, 252, NULL, 0),
(489, 0, 0, 0, 1644432459, 0, 'Unnamed House #489', 0, 7, 0, 0, 0, 0, 138, NULL, 0),
(490, 0, 0, 0, 1644432459, 0, 'Unnamed House #490', 0, 7, 0, 0, 0, 0, 263, NULL, 0),
(491, 0, 0, 0, 1644432459, 0, 'Unnamed House #491', 0, 7, 0, 0, 0, 0, 127, NULL, 0),
(492, 0, 0, 0, 1644432459, 0, 'Unnamed House #492', 0, 7, 0, 0, 0, 0, 161, NULL, 0),
(493, 0, 0, 0, 1644432459, 0, 'Unnamed House #493', 0, 7, 0, 0, 0, 0, 388, NULL, 0),
(494, 0, 0, 0, 1644432459, 0, 'Unnamed House #494', 0, 7, 0, 0, 0, 0, 153, NULL, 0),
(495, 0, 0, 0, 1644432459, 0, 'Unnamed House #495', 0, 7, 0, 0, 0, 0, 72, NULL, 0),
(496, 0, 0, 0, 1644432459, 0, 'Unnamed House #496', 0, 7, 0, 0, 0, 0, 60, NULL, 0),
(497, 0, 0, 0, 1644432459, 0, 'Unnamed House #497', 0, 7, 0, 0, 0, 0, 42, NULL, 0),
(498, 0, 0, 0, 1644432459, 0, 'Unnamed House #498', 0, 7, 0, 0, 0, 0, 215, NULL, 0),
(499, 0, 0, 0, 1644432459, 0, 'Unnamed House #499', 0, 7, 0, 0, 0, 0, 62, NULL, 0),
(500, 0, 0, 0, 1644432459, 0, 'Unnamed House #500', 0, 7, 0, 0, 0, 0, 88, NULL, 0),
(501, 0, 0, 0, 1644432459, 0, 'Unnamed House #501', 0, 7, 0, 0, 0, 0, 45, NULL, 0),
(502, 0, 0, 0, 1644432459, 0, 'Unnamed House #502', 0, 7, 0, 0, 0, 0, 125, NULL, 0),
(503, 0, 0, 0, 1644432459, 0, 'Unnamed House #503', 0, 7, 0, 0, 0, 0, 14, NULL, 0),
(504, 0, 0, 0, 1644432459, 0, 'Unnamed House #504', 0, 7, 0, 0, 0, 0, 31, NULL, 0),
(505, 0, 0, 0, 1644432459, 0, 'Unnamed House #505', 0, 7, 0, 0, 0, 0, 57, NULL, 0),
(506, 0, 0, 0, 1644432459, 0, 'Unnamed House #506', 0, 7, 0, 0, 0, 0, 83, NULL, 0),
(507, 0, 0, 0, 1644432459, 0, 'Unnamed House #507', 0, 7, 0, 0, 0, 0, 49, NULL, 0),
(508, 0, 0, 0, 1644432459, 0, 'Unnamed House #508', 0, 7, 0, 0, 0, 0, 70, NULL, 0),
(509, 0, 0, 0, 1644432459, 0, 'Unnamed House #509', 0, 7, 0, 0, 0, 0, 41, NULL, 0),
(510, 0, 0, 0, 1644432459, 0, 'Unnamed House #510', 0, 5, 0, 0, 0, 0, 95, NULL, 0),
(511, 0, 0, 0, 1644432459, 0, 'Unnamed House #511', 0, 5, 0, 0, 0, 0, 55, NULL, 0),
(512, 0, 0, 0, 1644432459, 0, 'Unnamed House #512', 0, 5, 0, 0, 0, 0, 77, NULL, 0),
(513, 0, 0, 0, 1644432459, 0, 'Unnamed House #513', 0, 5, 0, 0, 0, 0, 51, NULL, 0),
(514, 0, 0, 0, 1644432459, 0, 'Unnamed House #514', 0, 5, 0, 0, 0, 0, 80, NULL, 0),
(515, 0, 0, 0, 1644432459, 0, 'Unnamed House #515', 0, 5, 0, 0, 0, 0, 210, NULL, 0),
(516, 0, 0, 0, 1644432459, 0, 'Unnamed House #516', 0, 5, 0, 0, 0, 0, 280, NULL, 0),
(517, 0, 0, 0, 1644432459, 0, 'Unnamed House #517', 0, 5, 0, 0, 0, 0, 85, NULL, 0),
(518, 0, 0, 0, 1644432459, 0, 'Unnamed House #518', 0, 5, 0, 0, 0, 0, 105, NULL, 0),
(519, 0, 0, 0, 1644432459, 0, 'Unnamed House #519', 0, 5, 0, 0, 0, 0, 74, NULL, 0),
(520, 0, 0, 0, 1644432459, 0, 'Unnamed House #520', 0, 5, 0, 0, 0, 0, 74, NULL, 0),
(521, 0, 0, 0, 1644432459, 0, 'Unnamed House #521', 0, 5, 0, 0, 0, 0, 56, NULL, 0),
(522, 0, 0, 0, 1644432459, 0, 'Unnamed House #522', 0, 5, 0, 0, 0, 0, 176, NULL, 0),
(523, 0, 0, 0, 1644432459, 0, 'Unnamed House #523', 0, 5, 0, 0, 0, 0, 108, NULL, 0),
(524, 0, 0, 0, 1644432459, 0, 'Unnamed House #524', 0, 5, 0, 0, 0, 0, 55, NULL, 0),
(525, 0, 0, 0, 1644432459, 0, 'Unnamed House #525', 0, 5, 0, 0, 0, 0, 228, NULL, 0),
(526, 0, 0, 0, 1644432459, 0, 'Unnamed House #526', 0, 5, 0, 0, 0, 0, 52, NULL, 0),
(527, 0, 0, 0, 1644432459, 0, 'Unnamed House #527', 0, 5, 0, 0, 0, 0, 40, NULL, 0),
(528, 0, 0, 0, 1644432459, 0, 'Unnamed House #528', 0, 5, 0, 0, 0, 0, 90, NULL, 0),
(529, 0, 0, 0, 1644432459, 0, 'Unnamed House #529', 0, 5, 0, 0, 0, 0, 86, NULL, 0),
(530, 0, 0, 0, 1644432459, 0, 'Unnamed House #530', 0, 5, 0, 0, 0, 0, 39, NULL, 0),
(531, 0, 0, 0, 1644432459, 0, 'Unnamed House #531', 0, 5, 0, 0, 0, 0, 100, NULL, 0),
(532, 0, 0, 0, 1644432459, 0, 'Unnamed House #532', 0, 5, 0, 0, 0, 0, 78, NULL, 0),
(533, 0, 0, 0, 1644432459, 0, 'Unnamed House #533', 0, 5, 0, 0, 0, 0, 47, NULL, 0),
(534, 0, 0, 0, 1644432459, 0, 'Unnamed House #534', 0, 5, 0, 0, 0, 0, 40, NULL, 0),
(535, 0, 0, 0, 1644432459, 0, 'Unnamed House #535', 0, 5, 0, 0, 0, 0, 98, NULL, 0),
(536, 0, 0, 0, 1644432459, 0, 'Unnamed House #536', 0, 5, 0, 0, 0, 0, 45, NULL, 0),
(537, 0, 0, 0, 1644432459, 0, 'Unnamed House #537', 0, 5, 0, 0, 0, 0, 58, NULL, 0),
(538, 0, 0, 0, 1644432459, 0, 'Unnamed House #538', 0, 5, 0, 0, 0, 0, 65, NULL, 0),
(539, 0, 0, 0, 1644432459, 0, 'Unnamed House #539', 0, 5, 0, 0, 0, 0, 31, NULL, 0),
(540, 0, 0, 0, 1644432459, 0, 'Unnamed House #540', 0, 5, 0, 0, 0, 0, 138, NULL, 0),
(541, 0, 0, 0, 1644432459, 0, 'Unnamed House #541', 0, 5, 0, 0, 0, 0, 47, NULL, 0),
(542, 0, 0, 0, 1644432459, 0, 'Unnamed House #542', 0, 5, 0, 0, 0, 0, 51, NULL, 0),
(543, 0, 0, 0, 1644432459, 0, 'Unnamed House #543', 0, 5, 0, 0, 0, 0, 87, NULL, 0),
(544, 0, 0, 0, 1644432459, 0, 'Unnamed House #544', 0, 5, 0, 0, 0, 0, 49, NULL, 0),
(545, 0, 0, 0, 1644432459, 0, 'Unnamed House #545', 0, 5, 0, 0, 0, 0, 95, NULL, 0),
(546, 0, 0, 0, 1644432459, 0, 'Unnamed House #546', 0, 5, 0, 0, 0, 0, 127, NULL, 0),
(547, 0, 0, 0, 1644432459, 0, 'Unnamed House #547', 0, 5, 0, 0, 0, 0, 81, NULL, 0),
(548, 0, 0, 0, 1644432459, 0, 'Unnamed House #548', 0, 5, 0, 0, 0, 0, 51, NULL, 0),
(549, 0, 0, 0, 1644432459, 0, 'Unnamed House #549', 0, 5, 0, 0, 0, 0, 80, NULL, 0),
(550, 0, 0, 0, 1644432459, 0, 'Unnamed House #550', 0, 5, 0, 0, 0, 0, 80, NULL, 0),
(551, 0, 0, 0, 1644432459, 0, 'Unnamed House #551', 0, 5, 0, 0, 0, 0, 91, NULL, 0),
(552, 0, 0, 0, 1644432459, 0, 'Unnamed House #552', 0, 5, 0, 0, 0, 0, 77, NULL, 0),
(553, 0, 0, 0, 1644432459, 0, 'Unnamed House #553', 0, 5, 0, 0, 0, 0, 66, NULL, 0),
(554, 0, 0, 0, 1644432459, 0, 'Unnamed House #554', 0, 5, 0, 0, 0, 0, 46, NULL, 0),
(555, 0, 0, 0, 1644432459, 0, 'Unnamed House #555', 0, 5, 0, 0, 0, 0, 67, NULL, 0),
(556, 0, 0, 0, 1644432459, 0, 'Unnamed House #556', 0, 5, 0, 0, 0, 0, 152, NULL, 0),
(557, 0, 0, 0, 1644432459, 0, 'Unnamed House #557', 0, 5, 0, 0, 0, 0, 60, NULL, 0),
(558, 0, 0, 0, 1644432459, 0, 'Unnamed House #558', 0, 5, 0, 0, 0, 0, 73, NULL, 0),
(559, 0, 0, 0, 1644432459, 0, 'Unnamed House #559', 0, 5, 0, 0, 0, 0, 64, NULL, 2),
(560, 0, 0, 0, 1644432459, 0, 'Unnamed House #560', 0, 5, 0, 0, 0, 0, 139, NULL, 0),
(561, 0, 0, 0, 1644432459, 0, 'Unnamed House #561', 0, 5, 0, 0, 0, 0, 209, NULL, 0),
(562, 0, 0, 0, 1644432459, 0, 'Unnamed House #562', 0, 5, 0, 0, 0, 0, 39, NULL, 0),
(563, 0, 0, 0, 1644432459, 0, 'Unnamed House #563', 0, 5, 0, 0, 0, 0, 51, NULL, 0),
(564, 0, 0, 0, 1644432459, 0, 'Unnamed House #564', 0, 5, 0, 0, 0, 0, 44, NULL, 0),
(565, 0, 0, 0, 1644432459, 0, 'Unnamed House #565', 0, 5, 0, 0, 0, 0, 42, NULL, 0),
(566, 0, 0, 0, 1644432459, 0, 'Unnamed House #566', 0, 5, 0, 0, 0, 0, 48, NULL, 0),
(567, 0, 0, 0, 1644432459, 0, 'Unnamed House #567', 0, 5, 0, 0, 0, 0, 48, NULL, 0),
(568, 0, 0, 0, 1644432459, 0, 'Unnamed House #568', 0, 5, 0, 0, 0, 0, 91, NULL, 0),
(569, 0, 0, 0, 1644432459, 0, 'Unnamed House #569', 0, 5, 0, 0, 0, 0, 75, NULL, 0),
(570, 0, 0, 0, 1644432459, 0, 'Unnamed House #570', 0, 5, 0, 0, 0, 0, 52, NULL, 0),
(571, 0, 0, 0, 1644432459, 0, 'Unnamed House #571', 0, 5, 0, 0, 0, 0, 62, NULL, 0),
(572, 0, 0, 0, 1644432459, 0, 'Unnamed House #572', 0, 5, 0, 0, 0, 0, 75, NULL, 0),
(573, 0, 0, 0, 1644432459, 0, 'Unnamed House #573', 0, 5, 0, 0, 0, 0, 94, NULL, 0),
(574, 0, 0, 0, 1644432459, 0, 'Unnamed House #574', 0, 5, 0, 0, 0, 0, 185, NULL, 0),
(575, 0, 0, 0, 1644432459, 0, 'Unnamed House #575', 0, 5, 0, 0, 0, 0, 57, NULL, 0),
(576, 0, 0, 0, 1644432459, 0, 'Unnamed House #576', 0, 5, 0, 0, 0, 0, 93, NULL, 0),
(577, 0, 0, 0, 1644432459, 0, 'Unnamed House #577', 0, 5, 0, 0, 0, 0, 41, NULL, 0),
(578, 0, 0, 0, 1644432459, 0, 'Unnamed House #578', 0, 5, 0, 0, 0, 0, 74, NULL, 0),
(579, 0, 0, 0, 1644432459, 0, 'Unnamed House #579', 0, 5, 0, 0, 0, 0, 89, NULL, 0),
(580, 0, 0, 0, 1644432459, 0, 'Unnamed House #580', 0, 5, 0, 0, 0, 0, 43, NULL, 0),
(581, 0, 0, 0, 1644432459, 0, 'Unnamed House #581', 0, 5, 0, 0, 0, 0, 108, NULL, 0),
(582, 0, 0, 0, 1644432459, 0, 'Unnamed House #582', 0, 5, 0, 0, 0, 0, 59, NULL, 0),
(583, 0, 0, 0, 1644432459, 0, 'Unnamed House #583', 0, 5, 0, 0, 0, 0, 98, NULL, 0),
(584, 0, 0, 0, 1644432459, 0, 'Unnamed House #584', 0, 5, 0, 0, 0, 0, 158, NULL, 0),
(585, 0, 0, 0, 1644432459, 0, 'Unnamed House #585', 0, 5, 0, 0, 0, 0, 60, NULL, 0),
(586, 0, 0, 0, 1644432459, 0, 'Unnamed House #586', 0, 5, 0, 0, 0, 0, 111, NULL, 0),
(587, 0, 0, 0, 1644432459, 0, 'Unnamed House #587', 0, 5, 0, 0, 0, 0, 48, NULL, 0),
(588, 0, 0, 0, 1644432459, 0, 'Unnamed House #588', 0, 5, 0, 0, 0, 0, 40, NULL, 2),
(589, 0, 0, 0, 1644432459, 0, 'Unnamed House #589', 0, 5, 0, 0, 0, 0, 80, NULL, 0),
(590, 0, 0, 0, 1644432459, 0, 'Unnamed House #590', 0, 5, 0, 0, 0, 0, 48, NULL, 0),
(591, 0, 0, 0, 1644432459, 0, 'Unnamed House #591', 0, 5, 0, 0, 0, 0, 65, NULL, 0),
(592, 0, 0, 0, 1644432459, 0, 'Unnamed House #592', 0, 5, 0, 0, 0, 0, 25, NULL, 0),
(593, 0, 0, 0, 1644432459, 0, 'Unnamed House #593', 0, 6, 0, 0, 0, 0, 75, NULL, 0),
(594, 0, 0, 0, 1644432459, 0, 'Unnamed House #594', 0, 6, 0, 0, 0, 0, 69, NULL, 0),
(595, 0, 0, 0, 1644432459, 0, 'Unnamed House #595', 0, 6, 0, 0, 0, 0, 70, NULL, 0),
(596, 0, 0, 0, 1644432459, 0, 'Unnamed House #596', 0, 6, 0, 0, 0, 0, 82, NULL, 0),
(597, 0, 0, 0, 1644432459, 0, 'Unnamed House #597', 0, 6, 0, 0, 0, 0, 78, NULL, 0),
(598, 0, 0, 0, 1644432459, 0, 'Unnamed House #598', 0, 6, 0, 0, 0, 0, 91, NULL, 0),
(599, 0, 0, 0, 1644432459, 0, 'Unnamed House #599', 0, 6, 0, 0, 0, 0, 85, NULL, 0),
(600, 0, 0, 0, 1644432459, 0, 'Unnamed House #600', 0, 6, 0, 0, 0, 0, 293, NULL, 0),
(601, 0, 0, 0, 1644432459, 0, 'Unnamed House #601', 0, 6, 0, 0, 0, 0, 99, NULL, 0),
(602, 0, 0, 0, 1644432459, 0, 'Unnamed House #602', 0, 6, 0, 0, 0, 0, 131, NULL, 0),
(603, 0, 0, 0, 1644432459, 0, 'Unnamed House #603', 0, 6, 0, 0, 0, 0, 89, NULL, 0),
(604, 0, 0, 0, 1644432459, 0, 'Unnamed House #604', 0, 6, 0, 0, 0, 0, 212, NULL, 0),
(605, 0, 0, 0, 1644432459, 0, 'Unnamed House #605', 0, 6, 0, 0, 0, 0, 204, NULL, 0),
(606, 0, 0, 0, 1644432459, 0, 'Unnamed House #606', 0, 6, 0, 0, 0, 0, 104, NULL, 0),
(607, 0, 0, 0, 1644432459, 0, 'Unnamed House #607', 0, 6, 0, 0, 0, 0, 69, NULL, 0),
(608, 0, 0, 0, 1644432459, 0, 'Unnamed House #608', 0, 6, 0, 0, 0, 0, 70, NULL, 0),
(609, 0, 0, 0, 1644432459, 0, 'Unnamed House #609', 0, 6, 0, 0, 0, 0, 96, NULL, 0),
(610, 0, 0, 0, 1644432459, 0, 'Unnamed House #610', 0, 6, 0, 0, 0, 0, 73, NULL, 0),
(611, 0, 0, 0, 1644432459, 0, 'Unnamed House #611', 0, 6, 0, 0, 0, 0, 62, NULL, 0),
(612, 0, 0, 0, 1644432459, 0, 'Unnamed House #612', 0, 6, 0, 0, 0, 0, 70, NULL, 0),
(613, 0, 0, 0, 1644432459, 0, 'Unnamed House #613', 0, 6, 0, 0, 0, 0, 79, NULL, 0),
(614, 0, 0, 0, 1644432459, 0, 'Unnamed House #614', 0, 6, 0, 0, 0, 0, 112, NULL, 0),
(615, 0, 0, 0, 1644432459, 0, 'Unnamed House #615', 0, 6, 0, 0, 0, 0, 58, NULL, 0),
(616, 0, 0, 0, 1644432459, 0, 'Unnamed House #616', 0, 6, 0, 0, 0, 0, 40, NULL, 0),
(617, 0, 0, 0, 1644432459, 0, 'Unnamed House #617', 0, 6, 0, 0, 0, 0, 87, NULL, 0),
(618, 0, 0, 0, 1644432459, 0, 'Unnamed House #618', 0, 6, 0, 0, 0, 0, 65, NULL, 0),
(619, 0, 0, 0, 1644432459, 0, 'Unnamed House #619', 0, 6, 0, 0, 0, 0, 21, NULL, 0),
(620, 0, 0, 0, 1644432459, 0, 'Unnamed House #620', 0, 6, 0, 0, 0, 0, 56, NULL, 0),
(621, 0, 0, 0, 1644432459, 0, 'Unnamed House #621', 0, 6, 0, 0, 0, 0, 127, NULL, 0),
(622, 0, 0, 0, 1644432459, 0, 'Unnamed House #622', 0, 6, 0, 0, 0, 0, 57, NULL, 0),
(623, 0, 0, 0, 1644432459, 0, 'Unnamed House #623', 0, 6, 0, 0, 0, 0, 42, NULL, 0),
(624, 0, 0, 0, 1644432459, 0, 'Unnamed House #624', 0, 6, 0, 0, 0, 0, 92, NULL, 0),
(625, 0, 0, 0, 1644432459, 0, 'Unnamed House #625', 0, 6, 0, 0, 0, 0, 113, NULL, 0),
(626, 0, 0, 0, 1644432459, 0, 'Unnamed House #626', 0, 6, 0, 0, 0, 0, 117, NULL, 0),
(627, 0, 0, 0, 1644432459, 0, 'Unnamed House #627', 0, 6, 0, 0, 0, 0, 183, NULL, 0),
(628, 0, 0, 0, 1644432459, 0, 'Unnamed House #628', 0, 6, 0, 0, 0, 0, 186, NULL, 0),
(629, 0, 0, 0, 1644432459, 0, 'Unnamed House #629', 0, 6, 0, 0, 0, 0, 89, NULL, 0),
(630, 0, 0, 0, 1644432459, 0, 'Unnamed House #630', 0, 6, 0, 0, 0, 0, 61, NULL, 0),
(631, 0, 0, 0, 1644432459, 0, 'Unnamed House #631', 0, 6, 0, 0, 0, 0, 63, NULL, 0),
(632, 0, 0, 0, 1644432459, 0, 'Unnamed House #632', 0, 6, 0, 0, 0, 0, 103, NULL, 0),
(633, 0, 0, 0, 1644432459, 0, 'Unnamed House #633', 0, 6, 0, 0, 0, 0, 78, NULL, 0),
(634, 0, 0, 0, 1644432459, 0, 'Unnamed House #634', 0, 6, 0, 0, 0, 0, 77, NULL, 0),
(635, 0, 0, 0, 1644432459, 0, 'Unnamed House #635', 0, 6, 0, 0, 0, 0, 132, NULL, 0),
(636, 0, 0, 0, 1644432459, 0, 'Unnamed House #636', 0, 6, 0, 0, 0, 0, 78, NULL, 0),
(637, 0, 0, 0, 1644432459, 0, 'Unnamed House #637', 0, 6, 0, 0, 0, 0, 83, NULL, 0),
(638, 0, 0, 0, 1644432459, 0, 'Unnamed House #638', 0, 6, 0, 0, 0, 0, 98, NULL, 0),
(639, 0, 0, 0, 1644432459, 0, 'Unnamed House #639', 0, 6, 0, 0, 0, 0, 48, NULL, 0),
(640, 0, 0, 0, 1644432459, 0, 'Unnamed House #640', 0, 6, 0, 0, 0, 0, 42, NULL, 0),
(641, 0, 0, 0, 1644432459, 0, 'Unnamed House #641', 0, 6, 0, 0, 0, 0, 35, NULL, 0),
(642, 0, 0, 0, 1644432459, 0, 'Unnamed House #642', 0, 6, 0, 0, 0, 0, 50, NULL, 0),
(643, 0, 0, 0, 1644432459, 0, 'Unnamed House #643', 0, 6, 0, 0, 0, 0, 42, NULL, 0),
(644, 0, 0, 0, 1644432459, 0, 'Unnamed House #644', 0, 6, 0, 0, 0, 0, 103, NULL, 0),
(645, 0, 0, 0, 1644432459, 0, 'Unnamed House #645', 0, 6, 0, 0, 0, 0, 36, NULL, 0),
(646, 0, 0, 0, 1644432459, 0, 'Unnamed House #646', 0, 6, 0, 0, 0, 0, 105, NULL, 0),
(647, 0, 0, 0, 1644432459, 0, 'Unnamed House #647', 0, 6, 0, 0, 0, 0, 59, NULL, 0),
(648, 0, 0, 0, 1644432459, 0, 'Unnamed House #648', 0, 6, 0, 0, 0, 0, 61, NULL, 0),
(649, 0, 0, 0, 1644432459, 0, 'Unnamed House #649', 0, 6, 0, 0, 0, 0, 51, NULL, 0),
(650, 0, 0, 0, 1644432459, 0, 'Unnamed House #650', 0, 6, 0, 0, 0, 0, 69, NULL, 0),
(651, 0, 0, 0, 1644432459, 0, 'Unnamed House #651', 0, 6, 0, 0, 0, 0, 26, NULL, 0),
(652, 0, 0, 0, 1644432459, 0, 'Unnamed House #652', 0, 6, 0, 0, 0, 0, 25, NULL, 0),
(653, 0, 0, 0, 1644432459, 0, 'Unnamed House #653', 0, 6, 0, 0, 0, 0, 140, NULL, 0),
(655, 0, 0, 0, 1644432459, 0, 'Unnamed House #655', 0, 6, 0, 0, 0, 0, 90, NULL, 0),
(656, 0, 0, 0, 1644432459, 0, 'Unnamed House #656', 0, 6, 0, 0, 0, 0, 72, NULL, 0),
(657, 0, 0, 0, 1644432459, 0, 'Unnamed House #657', 0, 6, 0, 0, 0, 0, 75, NULL, 0),
(658, 0, 0, 0, 1644432459, 0, 'Unnamed House #658', 0, 6, 0, 0, 0, 0, 38, NULL, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `house_lists`
--

CREATE TABLE `house_lists` (
  `house_id` int(11) NOT NULL,
  `listid` int(11) NOT NULL,
  `list` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `house_lists`
--

INSERT INTO `house_lists` (`house_id`, `listid`, `list`) VALUES
(1, 256, 'tropeshow'),
(1, 257, 'KARBY PALADIN\n'),
(2, 256, 'Teste Ms\n');

-- --------------------------------------------------------

--
-- Estrutura da tabela `hunted_system`
--

CREATE TABLE `hunted_system` (
  `playerGuid` varchar(255) NOT NULL,
  `targetGuid` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_bans`
--

CREATE TABLE `ip_bans` (
  `ip` int(10) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `links`
--

CREATE TABLE `links` (
  `account_id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `code_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `links`
--

INSERT INTO `links` (`account_id`, `code`, `code_date`) VALUES
(3, '9uda7ak24o7waukaxyvr', 1676290318),
(3, '9uda7ak24o7waukaxyvr', 1676290318),
(3, 'ox1xblh2tcaccmis9fyx', 1676290435),
(3, 'ox1xblh2tcaccmis9fyx', 1676290435);

-- --------------------------------------------------------

--
-- Estrutura da tabela `live_casts`
--

CREATE TABLE `live_casts` (
  `player_id` int(11) NOT NULL,
  `cast_name` varchar(255) NOT NULL,
  `password` tinyint(1) NOT NULL DEFAULT 0,
  `description` varchar(255) DEFAULT NULL,
  `spectators` smallint(6) DEFAULT 0,
  `version` int(11) DEFAULT 1220
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `lottery`
--

CREATE TABLE `lottery` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `qnt` int(11) NOT NULL DEFAULT 1,
  `item_name` varchar(255) NOT NULL,
  `date` varchar(256) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `lottery`
--

INSERT INTO `lottery` (`id`, `name`, `item`, `qnt`, `item_name`, `date`) VALUES
(1, 'Administrator', '35288', 0, 'lasting exercise bow', '27/09/2022 - 13:46:12'),
(2, 'Teste MS', '35286', 0, 'lasting exercise axe', '11/03/2022 - 12:46:12'),
(3, 'Teste Ms', '3043', 90, 'crystal coin', '11/01/2023 - 13:09:35'),
(4, 'Teste Ms', '35285', 1, 'lasting exercise sword', '11/01/2023 - 14:01:35'),
(5, 'Teste Ms', '35285', 1, 'lasting exercise sword', '11/01/2023 - 15:01:35'),
(6, 'Teste Ms', '3043', 100, 'crystal coin', '11/01/2023 - 17:21:35'),
(7, 'Teste Ms', '35290', 1, 'lasting exercise wand', '23/01/2023 - 13:34:13'),
(8, 'Teste Ms', '35288', 1, 'lasting exercise bow', '25/01/2023 - 08:56:29'),
(9, 'Teste Ms', '35289', 1, 'lasting exercise rod', '26/01/2023 - 13:58:54'),
(10, 'Teste Ms', '35287', 1, 'lasting exercise club', '30/01/2023 - 19:01:21'),
(11, 'Teste Ms', '35288', 1, 'lasting exercise bow', '31/01/2023 - 09:09:12'),
(12, 'Teste Ms', '35285', 1, 'lasting exercise sword', '31/01/2023 - 10:15:38'),
(13, 'Teste Ms', '35287', 1, 'lasting exercise club', '31/01/2023 - 13:31:27'),
(14, 'Teste Ms', '35289', 1, 'lasting exercise rod', '01/02/2023 - 11:10:05'),
(15, 'Teste Ms', '35287', 1, 'lasting exercise club', '06/02/2023 - 19:28:05'),
(16, 'Teste Ms', '35288', 1, 'lasting exercise bow', '07/02/2023 - 09:59:41'),
(17, 'Teste Ms', '35288', 1, 'lasting exercise bow', '07/02/2023 - 10:59:30'),
(18, 'Teste Ms', '35289', 1, 'lasting exercise rod', '07/02/2023 - 11:22:11'),
(19, 'Teste Ms', '3043', 80, 'crystal coin', '07/02/2023 - 14:22:46'),
(20, 'Teste Ms', '3043', 80, 'crystal coin', '07/02/2023 - 14:39:52'),
(21, 'Test Reborns', '35285', 1, 'lasting exercise sword', '22/02/2023 - 14:24:07'),
(22, 'Test Reborns', '35289', 1, 'lasting exercise rod', '22/02/2023 - 19:37:32'),
(23, 'Test Reborns', '35290', 1, 'lasting exercise wand', '23/02/2023 - 13:51:32'),
(24, 'Test Reborns', '35286', 1, 'lasting exercise axe', '23/02/2023 - 19:08:10'),
(25, 'Test Reborns', '35289', 1, 'lasting exercise rod', '24/02/2023 - 13:59:37'),
(26, 'Test Oponent', '35287', 1, 'lasting exercise club', '27/02/2023 - 13:30:28'),
(27, 'Test Knight', '35288', 1, 'lasting exercise bow', '28/02/2023 - 12:22:05'),
(28, 'Test Knight', '35286', 1, 'lasting exercise axe', '28/02/2023 - 15:21:05'),
(29, 'Test Knight', '35288', 1, 'lasting exercise bow', '28/02/2023 - 17:20:20'),
(30, 'Test Reborns', '35290', 1, 'lasting exercise wand', '29/03/2023 - 10:34:31'),
(31, 'Test Knight', '35285', 1, 'lasting exercise sword', '29/03/2023 - 11:46:56'),
(32, 'Test Reborns', '35289', 1, 'lasting exercise rod', '29/03/2023 - 12:39:09'),
(33, 'Test Reborns', '35286', 1, 'lasting exercise axe', '29/03/2023 - 13:51:08'),
(34, 'Test Reborns', '3043', 40, 'crystal coin', '29/03/2023 - 14:18:08'),
(35, 'Test Reborns', '3043', 60, 'crystal coin', '29/03/2023 - 15:19:08'),
(36, 'Test Reborns', '35286', 1, 'lasting exercise axe', '29/03/2023 - 16:25:40'),
(37, 'Test Reborns', '35290', 1, 'lasting exercise wand', '29/03/2023 - 18:21:21'),
(38, 'Teste Ms', '3043', 80, 'crystal coin', '18/04/2023 - 17:13:18'),
(39, 'Teste Ms', '35285', 1, 'lasting exercise sword', '19/04/2023 - 09:48:53'),
(40, 'Teste Ms', '35288', 1, 'lasting exercise bow', '19/04/2023 - 14:35:23'),
(41, 'Teste Ms', '35286', 1, 'lasting exercise axe', '19/04/2023 - 15:50:23'),
(42, 'Teste Ms', '35286', 1, 'lasting exercise axe', '19/04/2023 - 19:31:38'),
(43, 'Karby Knight', '35289', 1, 'lasting exercise rod', '24/04/2023 - 19:59:01'),
(44, 'Karby Paladin', '35289', 1, 'lasting exercise rod', '25/04/2023 - 10:09:55'),
(45, 'Karby Paladin', '3043', 40, 'crystal coin', '25/04/2023 - 11:02:55'),
(46, 'Karby Paladin', '35287', 1, 'lasting exercise club', '25/04/2023 - 14:58:59'),
(47, 'Karby Paladin', '35289', 1, 'lasting exercise rod', '25/04/2023 - 17:39:59'),
(48, 'Karby Paladin', '35288', 1, 'lasting exercise bow', '26/04/2023 - 12:34:01'),
(49, 'Karby Paladin', '35285', 1, 'lasting exercise sword', '26/04/2023 - 13:34:01'),
(50, 'Karby Paladin', '35288', 1, 'lasting exercise bow', '26/04/2023 - 15:14:01'),
(51, 'Karby Paladin', '35285', 1, 'lasting exercise sword', '26/04/2023 - 16:18:01'),
(52, 'Karby Paladin', '35288', 1, 'lasting exercise bow', '26/04/2023 - 17:14:18'),
(53, 'Karby Paladin', '3043', 10, 'crystal coin', '26/04/2023 - 19:26:18');

-- --------------------------------------------------------

--
-- Estrutura da tabela `market_history`
--

CREATE TABLE `market_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT 0,
  `itemtype` int(10) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `expires_at` bigint(20) UNSIGNED NOT NULL,
  `inserted` bigint(20) UNSIGNED NOT NULL,
  `state` tinyint(3) UNSIGNED NOT NULL,
  `tier` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `market_history`
--

INSERT INTO `market_history` (`id`, `player_id`, `sale`, `itemtype`, `amount`, `price`, `expires_at`, `inserted`, `state`, `tier`) VALUES
(1, 10, 1, 28718, 1, 32323232, 1681963934, 1681963934, 1, 0),
(2, 9, 1, 27451, 1, 313123131, 1681995076, 1681995076, 1, 0),
(3, 9, 1, 30396, 1, 32322323, 1682007998, 1682007998, 1, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `market_offers`
--

CREATE TABLE `market_offers` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT 0,
  `itemtype` int(10) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `created` bigint(20) UNSIGNED NOT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT 0,
  `price` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tier` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `newsticker`
--

CREATE TABLE `newsticker` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` int(11) NOT NULL,
  `text` mediumtext NOT NULL,
  `icon` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `newsticker`
--

INSERT INTO `newsticker` (`id`, `date`, `text`, `icon`) VALUES
(1, 1676293288, 'New Testesadsadsa d sasa Tikers kakahsdausd Testststs ssssssssssssssssssssssssssssssssssssssssssssssssss', 'newsicon_technical');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagseguro`
--

CREATE TABLE `pagseguro` (
  `date` datetime NOT NULL,
  `code` varchar(50) NOT NULL,
  `reference` varchar(200) NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `lastEventDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagsegurotransacoes`
--

CREATE TABLE `pagsegurotransacoes` (
  `TransacaoID` varchar(36) NOT NULL,
  `VendedorEmail` varchar(200) NOT NULL,
  `Referencia` varchar(200) DEFAULT NULL,
  `TipoFrete` char(2) DEFAULT NULL,
  `ValorFrete` decimal(10,2) DEFAULT NULL,
  `Extras` decimal(10,2) DEFAULT NULL,
  `Anotacao` text DEFAULT NULL,
  `TipoPagamento` varchar(50) NOT NULL,
  `StatusTransacao` varchar(50) NOT NULL,
  `CliNome` varchar(200) NOT NULL,
  `CliEmail` varchar(200) NOT NULL,
  `CliEndereco` varchar(200) NOT NULL,
  `CliNumero` varchar(10) DEFAULT NULL,
  `CliComplemento` varchar(100) DEFAULT NULL,
  `CliBairro` varchar(100) NOT NULL,
  `CliCidade` varchar(100) NOT NULL,
  `CliEstado` char(2) NOT NULL,
  `CliCEP` varchar(9) NOT NULL,
  `CliTelefone` varchar(14) DEFAULT NULL,
  `NumItens` int(11) NOT NULL,
  `Data` datetime NOT NULL,
  `ProdQuantidade_x` int(11) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagseguro_transactions`
--

CREATE TABLE `pagseguro_transactions` (
  `transaction_code` varchar(36) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `payment_method` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `item_count` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `payment_amount` float DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `paypal_transactions`
--

CREATE TABLE `paypal_transactions` (
  `id` int(11) NOT NULL,
  `payment_status` varchar(70) NOT NULL DEFAULT '',
  `date` datetime NOT NULL,
  `payer_email` varchar(255) NOT NULL DEFAULT '',
  `payer_id` varchar(255) NOT NULL DEFAULT '',
  `item_number1` varchar(255) NOT NULL DEFAULT '',
  `mc_gross` float NOT NULL,
  `mc_currency` varchar(5) NOT NULL DEFAULT '',
  `txn_id` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL DEFAULT 1,
  `account_id` int(11) NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 1,
  `rebirth` int(11) NOT NULL DEFAULT 0,
  `vocation` int(11) NOT NULL DEFAULT 0,
  `health` int(11) NOT NULL DEFAULT 150,
  `healthmax` int(11) NOT NULL DEFAULT 150,
  `experience` bigint(20) NOT NULL DEFAULT 0,
  `exptoday` int(11) DEFAULT NULL,
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
  `town_id` int(11) NOT NULL DEFAULT 0,
  `posx` int(11) NOT NULL DEFAULT 0,
  `posy` int(11) NOT NULL DEFAULT 0,
  `posz` int(11) NOT NULL DEFAULT 0,
  `conditions` blob NOT NULL,
  `cap` int(11) NOT NULL DEFAULT 0,
  `sex` int(11) NOT NULL DEFAULT 0,
  `lastlogin` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `lastip` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `save` tinyint(1) NOT NULL DEFAULT 1,
  `skull` tinyint(1) NOT NULL DEFAULT 0,
  `skulltime` bigint(20) NOT NULL DEFAULT 0,
  `lastlogout` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `blessings` tinyint(4) NOT NULL DEFAULT 0,
  `blessings1` tinyint(4) NOT NULL DEFAULT 0,
  `blessings2` tinyint(4) NOT NULL DEFAULT 0,
  `blessings3` tinyint(4) NOT NULL DEFAULT 0,
  `blessings4` tinyint(4) NOT NULL DEFAULT 0,
  `blessings5` tinyint(4) NOT NULL DEFAULT 0,
  `blessings6` tinyint(4) NOT NULL DEFAULT 0,
  `blessings7` tinyint(4) NOT NULL DEFAULT 0,
  `blessings8` tinyint(4) NOT NULL DEFAULT 0,
  `onlinetime` bigint(20) NOT NULL DEFAULT 0,
  `deletion` bigint(20) NOT NULL DEFAULT 0,
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `bonusrerollcount` bigint(20) DEFAULT 0,
  `quickloot_fallback` tinyint(1) DEFAULT 0,
  `lookmountbody` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lookmountfeet` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lookmounthead` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lookmountlegs` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lookfamiliarstype` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `isreward` tinyint(1) NOT NULL DEFAULT 1,
  `istutorial` tinyint(1) NOT NULL DEFAULT 0,
  `offlinetraining_time` smallint(5) UNSIGNED NOT NULL DEFAULT 43200,
  `offlinetraining_skill` int(11) NOT NULL DEFAULT -1,
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
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `description` varchar(255) NOT NULL DEFAULT '',
  `comment` text DEFAULT NULL,
  `create_ip` bigint(20) NOT NULL DEFAULT 0,
  `create_date` bigint(20) NOT NULL DEFAULT 0,
  `hide_char` int(11) NOT NULL DEFAULT 0,
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
  `manashield` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `max_manashield` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `prey_stamina_1` int(11) DEFAULT NULL,
  `prey_stamina_2` int(11) DEFAULT NULL,
  `prey_stamina_3` int(11) DEFAULT NULL,
  `prey_column` smallint(6) NOT NULL DEFAULT 1,
  `xpboost_stamina` int(11) DEFAULT NULL,
  `xpboost_value` int(11) DEFAULT NULL,
  `marriage_status` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `hide_skills` int(11) DEFAULT NULL,
  `hide_set` int(11) DEFAULT NULL,
  `former` varchar(255) NOT NULL DEFAULT '-',
  `signature` varchar(255) NOT NULL DEFAULT '',
  `marriage_spouse` int(11) NOT NULL DEFAULT -1,
  `loyalty_ranking` tinyint(1) NOT NULL DEFAULT 0,
  `bonus_rerolls` bigint(20) NOT NULL DEFAULT 0,
  `critical` int(11) DEFAULT 0,
  `bonus_reroll` int(11) NOT NULL DEFAULT 0,
  `prey_wildcard` bigint(20) DEFAULT NULL,
  `task_points` bigint(20) DEFAULT NULL,
  `forge_dusts` bigint(20) NOT NULL DEFAULT 0,
  `forge_dust_level` bigint(20) NOT NULL DEFAULT 100,
  `sbw_points` int(11) NOT NULL DEFAULT 0,
  `instantrewardtokens` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `charmpoints` int(11) DEFAULT 0,
  `direction` tinyint(1) DEFAULT 0,
  `lookmount` int(11) DEFAULT 0,
  `version` int(11) DEFAULT 1000,
  `lootaction` tinyint(4) DEFAULT 0,
  `spells` blob DEFAULT NULL,
  `storages` mediumblob DEFAULT NULL,
  `items` longblob DEFAULT NULL,
  `depotitems` longblob DEFAULT NULL,
  `inboxitems` longblob DEFAULT NULL,
  `rewards` longblob DEFAULT NULL,
  `varcap` int(11) NOT NULL DEFAULT 0,
  `charmExpansion` tinyint(4) DEFAULT 0,
  `bestiarykills` longblob DEFAULT NULL,
  `charms` longblob DEFAULT NULL,
  `bestiaryTracker` longblob DEFAULT NULL,
  `autoloot` blob DEFAULT NULL,
  `lastday` bigint(20) DEFAULT 0,
  `cast` tinyint(1) NOT NULL DEFAULT 0,
  `online_time` int(11) NOT NULL DEFAULT 0,
  `online_time_month` int(11) NOT NULL DEFAULT 0,
  `shopitens` varchar(255) NOT NULL DEFAULT '''{}''',
  `shoplucro` varchar(255) NOT NULL DEFAULT '''{}''',
  `main` int(11) NOT NULL DEFAULT 0,
  `world` int(11) NOT NULL DEFAULT 0,
  `randomize_mount` smallint(6) NOT NULL DEFAULT 0,
  `boss_points` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `players`
--

INSERT INTO `players` (`id`, `name`, `group_id`, `account_id`, `level`, `rebirth`, `vocation`, `health`, `healthmax`, `experience`, `exptoday`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `lookaddons`, `maglevel`, `mana`, `manamax`, `manaspent`, `soul`, `town_id`, `posx`, `posy`, `posz`, `conditions`, `cap`, `sex`, `lastlogin`, `lastip`, `save`, `skull`, `skulltime`, `lastlogout`, `blessings`, `blessings1`, `blessings2`, `blessings3`, `blessings4`, `blessings5`, `blessings6`, `blessings7`, `blessings8`, `onlinetime`, `deletion`, `balance`, `bonusrerollcount`, `quickloot_fallback`, `lookmountbody`, `lookmountfeet`, `lookmounthead`, `lookmountlegs`, `lookfamiliarstype`, `isreward`, `istutorial`, `offlinetraining_time`, `offlinetraining_skill`, `stamina`, `skill_fist`, `skill_fist_tries`, `skill_club`, `skill_club_tries`, `skill_sword`, `skill_sword_tries`, `skill_axe`, `skill_axe_tries`, `skill_dist`, `skill_dist_tries`, `skill_shielding`, `skill_shielding_tries`, `skill_fishing`, `skill_fishing_tries`, `deleted`, `description`, `comment`, `create_ip`, `create_date`, `hide_char`, `skill_critical_hit_chance`, `skill_critical_hit_chance_tries`, `skill_critical_hit_damage`, `skill_critical_hit_damage_tries`, `skill_life_leech_chance`, `skill_life_leech_chance_tries`, `skill_life_leech_amount`, `skill_life_leech_amount_tries`, `skill_mana_leech_chance`, `skill_mana_leech_chance_tries`, `skill_mana_leech_amount`, `skill_mana_leech_amount_tries`, `skill_criticalhit_chance`, `skill_criticalhit_damage`, `skill_lifeleech_chance`, `skill_lifeleech_amount`, `skill_manaleech_chance`, `skill_manaleech_amount`, `manashield`, `max_manashield`, `prey_stamina_1`, `prey_stamina_2`, `prey_stamina_3`, `prey_column`, `xpboost_stamina`, `xpboost_value`, `marriage_status`, `hide_skills`, `hide_set`, `former`, `signature`, `marriage_spouse`, `loyalty_ranking`, `bonus_rerolls`, `critical`, `bonus_reroll`, `prey_wildcard`, `task_points`, `forge_dusts`, `forge_dust_level`, `sbw_points`, `instantrewardtokens`, `charmpoints`, `direction`, `lookmount`, `version`, `lootaction`, `spells`, `storages`, `items`, `depotitems`, `inboxitems`, `rewards`, `varcap`, `charmExpansion`, `bestiarykills`, `charms`, `bestiaryTracker`, `autoloot`, `lastday`, `cast`, `online_time`, `online_time_month`, `shopitens`, `shoplucro`, `main`, `world`, `randomize_mount`, `boss_points`) VALUES
(9, 'Administrator', 6, 2, 1999, 0, 1, 10140, 10140, 132734399400, NULL, 88, 114, 114, 114, 1288, 3, 61, 98, 59820, 0, 100, 1, 990, 1216, 7, '', 20380, 1, 1682699256, 3759753242, 1, 0, 0, 1682700736, 0, 2, 3, 3, 3, 3, 3, 2, 2, 0, 0, 2787782, 0, 0, 0, 0, 114, 0, 1367, 1, 0, 43200, -1, 2520, 80, 0, 19, 1120, 10, 0, 32, 0, 19, 0, 10, 0, 11, 0, 0, '', '', 2130706433, 1673192555, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, 7200, 50, 0, NULL, NULL, '-', '', -1, 0, 0, 0, 0, 9, 0, 30, 106, 0, 0, 0, 0, 0, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '\'{}\'', '\'{}\'', 1, 1, 0, 760),
(10, 'Teste Ms', 1, 3, 967, 0, 1, 4980, 4980, 15018459471, NULL, 94, 94, 94, 94, 130, 2, 108, 28860, 28860, 30656565, 100, 1, 991, 1227, 7, 0x010004000002ffffffff03a86100001b001c000000001f00001e0000fe, 10060, 1, 1682385865, 692886810, 1, 0, 0, 1682387093, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 100000, 0, 0, 0, 0, 0, 0, 994, 1, 0, 43200, 13, 2520, 67, 7229, 10, 0, 10, 0, 10, 0, 10, 0, 36, 2403824, 10, 0, 0, '', '', 2130706433, 1673375460, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, '-', '', -1, 0, 0, 0, 0, 4, 0, 6, 100, 0, 0, 0, 0, 0, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '\'{}\'', '\'{}\'', 1, 1, 0, 40),
(11, 'Test Reborns', 1, 3, 668, 0, 3, 5240, 6785, 4932758883, NULL, 88, 114, 114, 114, 128, 0, 18, 3638, 9990, 481799987, 9, 1, 963, 1205, 7, '', 13670, 1, 1682023008, 151038144, 1, 0, 0, 1681739953, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4305181, 0, 0, 0, 0, 0, 0, 992, 1, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 79, 5332709, 10, 0, 10, 0, 0, '', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, '-', '', -1, 0, 0, 0, 0, 0, 0, 23, 100, 0, 0, 0, 0, 0, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '\'{}\'', '\'{}\'', 1, 1, 0, 0),
(12, 'Test Knight', 1, 3, 114, 0, 4, 1132, 1775, 23625951, NULL, 113, 115, 95, 39, 144, 0, 13, 620, 620, 650000, 0, 1, 991, 1210, 7, 0x010004000002ffffffff0360ea00001b001c000000001f00001e0000fe010000000202ffffffff03d00700001b001c000000001f00001e0000fe, 3120, 1, 1682383578, 3759753242, 1, 0, 0, 1682385862, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100000, 0, 0, 0, 0, 0, 0, 0, 1, 0, 43200, -1, 2520, 64, 7261, 44, 344, 102, 0, 102, 104594, 10, 0, 30, 0, 10, 0, 0, '', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, '-', '', -1, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '\'{}\'', '\'{}\'', 0, 1, 0, 0),
(14, 'Test Wiods', 1, 15, 8, 0, 1, 185, 185, 4200, NULL, 113, 115, 95, 39, 130, 0, 0, 90, 90, 0, 0, 1, 0, 0, 0, '', 470, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, '-', '', -1, 0, 0, 0, 0, NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '\'{}\'', '\'{}\'', 1, 1, 0, 0),
(15, 'Teste Rodlss', 1, 16, 8, 0, 1, 185, 185, 4200, NULL, 113, 115, 95, 39, 130, 0, 0, 90, 90, 0, 0, 1, 0, 0, 0, '', 470, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, '-', '', -1, 0, 0, 0, 0, NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '\'{}\'', '\'{}\'', 1, 1, 0, 0),
(16, 'Test Woksh', 1, 17, 38, 0, 1, 305, 305, 825523, NULL, 113, 115, 95, 39, 130, 0, 0, 960, 960, 783, 0, 1, 216, 1246, 8, 0x010020000002ffffffff0378da02001b001c000000001f00001e000004e02e0000050100000006b80b00000702000000fe010004000002ffffffff0378e600001b001c000000001f00001e0000fe010040000002ffffffff0318ea02001b001c000000001f00001e0000150100000014c0d40100fe, 769, 1, 1682109857, 3759753242, 1, 0, 0, 1682110445, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 43200, -1, 2517, 54, 4406982, 10, 0, 10, 0, 10, 0, 10, 0, 29, 7717620, 10, 0, 0, '', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, '-', '', -1, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '\'{}\'', '\'{}\'', 1, 1, 0, 0),
(17, 'Pitt Buh', 1, 18, 430, 1, 6, 2152, 2152, 1311974616, NULL, 94, 0, 114, 91, 130, 2, 102, 12494, 12754, 4228350, 200, 1, 984, 1208, 8, 0x010004000002ffffffff0350c300001b001c000000001f00001e0000fe0110000000020000000003f82a00001b001c000000001f00001e00000b790100000c3333333f0d000000800e3333333f0f00000080fe010000000402ffffffff03606d00001b001c760000001f00001e0000fe010000000802ffffffff03606d00001b001c070000001f00001e0000fe, 4787, 1, 1682554603, 802694938, 1, 0, 0, 1682556291, 0, 5, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1664, 0, 0, 0, 0, 0, 0, 993, 1, 0, 43200, 13, 2484, 65, 8549, 10, 0, 10, 0, 10, 0, 10, 0, 36, 1852812, 10, 0, 0, '', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, '-', '', -1, 0, 0, 0, 0, 0, 0, 82, 100, 0, 0, 0, 0, 0, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '\'{}\'', '\'{}\'', 1, 1, 0, 200),
(18, 'Karby Paladin', 1, 19, 477, 1, 7, 4523, 4883, 1790609012, NULL, 114, 0, 0, 105, 130, 3, 37, 7128, 7128, 316195340, 200, 1, 978, 1224, 7, '', 9874, 1, 1682689944, 692886810, 1, 0, 0, 1682693700, 0, 5, 1, 1, 1, 1, 1, 1, 1, 0, 0, 5060540, 0, 0, 0, 0, 0, 0, 992, 1, 0, 5880, -1, 2520, 86, 50944, 10, 0, 29, 672, 10, 0, 113, 488603, 93, 45012, 10, 0, 0, '', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, '-', '', -1, 0, 0, 0, 0, 16, 0, 66, 100, 0, 0, 0, 0, 0, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '\'{}\'', '\'{}\'', 1, 1, 0, 200),
(19, 'Karby Knight', 1, 19, 529, 0, 8, 8000, 8000, 2441805457, NULL, 114, 94, 114, 94, 1127, 3, 9, 2630, 2695, 6643140, 50, 1, 973, 1227, 7, '', 13495, 1, 1682648818, 692886810, 1, 0, 0, 1682648838, 0, 5, 1, 1, 1, 1, 1, 1, 1, 0, 0, 71465, 0, 0, 0, 0, 0, 0, 991, 1, 0, 37607, 3, 2520, 69, 6309, 10, 0, 10, 0, 98, 95472, 10, 0, 90, 201403, 10, 0, 0, '', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, 120, 50, 0, NULL, NULL, '-', '', -1, 0, 0, 0, 0, 15, 0, 30, 100, 0, 0, 0, 0, 0, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '\'{}\'', '\'{}\'', 0, 1, 0, 10),
(20, 'karby Sorc', 1, 19, 259, 0, 1, 1440, 1440, 283413634, NULL, 114, 0, 0, 92, 634, 3, 72, 7522, 7620, 1434276, 10, 1, 985, 1208, 8, 0x010020000002ffffffff03d06c04001b001c000000001f00001e000004e02e0000050100000006b80b00000702000000fe010004000002ffffffff03c8af00001b001c000000001f00001e0000fe010040000002ffffffff03281103001b001c000000001f00001e0000150100000014c0d40100fe0110000000020000000003d00700001b001c000000001f00001e00000b010100000c3333333f0d000000800e3333333f0f00000080fe, 2980, 1, 1682643049, 692886810, 1, 0, 0, 1682643052, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 100000, 0, 0, 0, 0, 0, 0, 994, 1, 0, 43200, 13, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 32, 692017, 10, 0, 0, '', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, 2700, 50, 0, NULL, NULL, '-', '', -1, 0, 0, 0, 0, 25, 0, 0, 100, 0, 0, 0, 0, 0, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '\'{}\'', '\'{}\'', 0, 1, 0, 100),
(21, 'Tropeshow', 1, 20, 260, 0, 1, 1445, 1445, 287049176, NULL, 113, 115, 95, 39, 130, 2, 63, 7472, 7650, 68215, 15, 1, 985, 1208, 8, 0x0110000000020000000003487100001b001c000000001f00001e00000b560000000c9a99993e0d0000c0c10e9a99993e0f0000c0c1fe010040000002ffffffff03e01c03001b001c000000001f00001e0000150100000014c0d40100fe010020000002ffffffff0310a400001b001c000000001f00001e000004e02e0000050100000006b80b00000702000000fe010004000002ffffffff03f0d200001b001c000000001f00001e0000fe, 2990, 1, 1682387111, 3294555930, 1, 0, 0, 1682387127, 0, 2, 1, 1, 1, 1, 1, 1, 1, 0, 0, 71030, 0, 0, 0, 0, 0, 0, 994, 1, 0, 36955, 13, 2511, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 27, 14683, 10, 0, 0, '', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, '-', '', -1, 0, 0, 0, 0, 0, 0, 22, 100, 0, 0, 0, 0, 0, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '\'{}\'', '\'{}\'', 1, 1, 0, 100),
(22, 'pittbrn', 1, 18, 505, 0, 8, 7556, 7638, 2133178209, NULL, 94, 0, 114, 91, 130, 2, 9, 2273, 2573, 5069022, 200, 1, 1000, 1227, 7, 0x010004000002ffffffff03709400001b001c000000001f00001e0000fe, 12894, 1, 1682554529, 802694938, 1, 0, 0, 1682554601, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 649263, 0, 0, 0, 0, 0, 0, 991, 1, 0, 43200, 3, 2518, 32, 28, 10, 0, 10, 0, 93, 40488, 10, 0, 86, 31114, 10, 0, 0, '', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, '-', '', -1, 0, 0, 0, 0, 0, 0, 100, 100, 0, 0, 0, 0, 0, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '\'{}\'', '\'{}\'', 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `players_online`
--

CREATE TABLE `players_online` (
  `player_id` int(11) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_badges`
--

CREATE TABLE `player_badges` (
  `id` int(11) NOT NULL,
  `badge_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `view` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_binary_items`
--

CREATE TABLE `player_binary_items` (
  `player_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `items` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_bosstiary`
--

CREATE TABLE `player_bosstiary` (
  `player_id` int(11) NOT NULL,
  `bossIdSlotOne` int(11) NOT NULL DEFAULT 0,
  `bossIdSlotTwo` int(11) NOT NULL DEFAULT 0,
  `removeTimes` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `player_bosstiary`
--

INSERT INTO `player_bosstiary` (`player_id`, `bossIdSlotOne`, `bossIdSlotTwo`, `removeTimes`) VALUES
(13, 0, 0, 1),
(11, 0, 0, 1),
(16, 0, 0, 1),
(12, 0, 0, 1),
(10, 459, 0, 1),
(21, 0, 0, 1),
(22, 0, 0, 1),
(17, 0, 0, 1),
(20, 0, 0, 1),
(19, 0, 0, 1),
(18, 0, 0, 1),
(9, 0, 0, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_charms`
--

CREATE TABLE `player_charms` (
  `player_guid` int(11) NOT NULL,
  `charm_points` varchar(250) DEFAULT NULL,
  `charm_expansion` tinyint(1) DEFAULT NULL,
  `rune_wound` int(11) DEFAULT NULL,
  `rune_enflame` int(11) DEFAULT NULL,
  `rune_poison` int(11) DEFAULT NULL,
  `rune_freeze` int(11) DEFAULT NULL,
  `rune_zap` int(11) DEFAULT NULL,
  `rune_curse` int(11) DEFAULT NULL,
  `rune_cripple` int(11) DEFAULT NULL,
  `rune_parry` int(11) DEFAULT NULL,
  `rune_dodge` int(11) DEFAULT NULL,
  `rune_adrenaline` int(11) DEFAULT NULL,
  `rune_numb` int(11) DEFAULT NULL,
  `rune_cleanse` int(11) DEFAULT NULL,
  `rune_bless` int(11) DEFAULT NULL,
  `rune_scavenge` int(11) DEFAULT NULL,
  `rune_gut` int(11) DEFAULT NULL,
  `rune_low_blow` int(11) DEFAULT NULL,
  `rune_divine` int(11) DEFAULT NULL,
  `rune_vamp` int(11) DEFAULT NULL,
  `rune_void` int(11) DEFAULT NULL,
  `UsedRunesBit` varchar(250) DEFAULT NULL,
  `UnlockedRunesBit` varchar(250) DEFAULT NULL,
  `tracker list` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `player_charms`
--

INSERT INTO `player_charms` (`player_guid`, `charm_points`, `charm_expansion`, `rune_wound`, `rune_enflame`, `rune_poison`, `rune_freeze`, `rune_zap`, `rune_curse`, `rune_cripple`, `rune_parry`, `rune_dodge`, `rune_adrenaline`, `rune_numb`, `rune_cleanse`, `rune_bless`, `rune_scavenge`, `rune_gut`, `rune_low_blow`, `rune_divine`, `rune_vamp`, `rune_void`, `UsedRunesBit`, `UnlockedRunesBit`, `tracker list`) VALUES
(6, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(3, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(5, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(7, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(4, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(2, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(8, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(9, '15', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(10, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(11, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(12, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(13, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(16, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(17, '50', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(18, '50', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', 0xd101),
(19, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(20, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(21, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(22, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_deaths`
--

CREATE TABLE `player_deaths` (
  `id` int(11) NOT NULL,
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
-- Extraindo dados da tabela `player_deaths`
--

INSERT INTO `player_deaths` (`id`, `player_id`, `time`, `level`, `killed_by`, `is_player`, `mostdamage_by`, `mostdamage_is_player`, `unjustified`, `mostdamage_unjustified`) VALUES
(1, 10, 1673382165, 110, 'a pre empe', 0, 'a pre empe', 0, 0, 0),
(2, 10, 1673440032, 1500, 'Bazir', 0, 'Bazir', 0, 0, 0),
(3, 11, 1676662484, 8, 'a cyclops', 0, 'a cyclops', 0, 0, 0),
(4, 12, 1677287445, 18, 'a demon', 0, 'a demon', 0, 0, 0),
(5, 12, 1677287511, 126, 'a demon', 0, 'a demon', 0, 0, 0),
(6, 12, 1677287663, 124, 'Orshabaal', 0, 'Orshabaal', 0, 0, 0),
(7, 12, 1677287812, 123, 'Orshabaal', 0, 'Orshabaal', 0, 0, 0),
(8, 12, 1677287924, 121, 'Orshabaal', 0, 'Orshabaal', 0, 0, 0),
(9, 12, 1677288670, 119, 'Orshabaal', 0, 'Orshabaal', 0, 0, 0),
(10, 12, 1677289578, 119, 'a demon', 0, 'a demon', 0, 0, 0),
(11, 12, 1677290015, 119, 'Morgaroth', 0, 'Morgaroth', 0, 0, 0),
(12, 12, 1677290293, 118, 'Morgaroth', 0, 'Morgaroth', 0, 0, 0),
(13, 12, 1677290495, 116, 'Morgaroth', 0, 'Morgaroth', 0, 0, 0),
(14, 12, 1677291060, 116, 'Morgaroth', 0, 'Morgaroth', 0, 0, 0),
(15, 12, 1677291132, 114, 'Morgaroth', 0, 'Morgaroth', 0, 0, 0),
(16, 12, 1677291369, 112, 'a demon', 0, 'Morgaroth', 0, 0, 0),
(17, 11, 1677421454, 669, 'Morgaroth', 0, 'Morgaroth', 0, 0, 0),
(18, 11, 1677421555, 665, 'Morgaroth', 0, 'Morgaroth', 0, 0, 0),
(19, 11, 1677421836, 657, 'Morgaroth', 0, 'Morgaroth', 0, 0, 0),
(20, 11, 1677421957, 650, 'Morgaroth', 0, 'Morgaroth', 0, 0, 0),
(21, 11, 1677422106, 643, 'Morgaroth', 0, 'Morgaroth', 0, 0, 0),
(22, 11, 1677422219, 636, 'Morgaroth', 0, 'Morgaroth', 0, 0, 0),
(23, 11, 1677422539, 629, 'Morgaroth', 0, 'Morgaroth', 0, 0, 0),
(24, 11, 1677422621, 622, 'Morgaroth', 0, 'Morgaroth', 0, 0, 0),
(25, 11, 1677423043, 616, 'a demon', 0, 'Morgaroth', 0, 0, 0),
(26, 11, 1677423402, 609, 'Morgaroth', 0, 'Morgaroth', 0, 0, 0),
(27, 11, 1677423854, 602, 'Morgaroth', 0, 'Morgaroth', 0, 0, 0),
(28, 11, 1677423954, 596, 'a demon', 0, 'Morgaroth', 0, 0, 0),
(29, 11, 1677424049, 589, 'Morgaroth', 0, 'Morgaroth', 0, 0, 0),
(30, 11, 1677424334, 583, 'Morgaroth', 0, 'Morgaroth', 0, 0, 0),
(31, 11, 1677424722, 576, 'Morgaroth', 0, 'Morgaroth', 0, 0, 0),
(32, 11, 1677425094, 570, 'Morgaroth', 0, 'Morgaroth', 0, 0, 0),
(33, 11, 1677425206, 564, 'Morgaroth', 0, 'Morgaroth', 0, 0, 0),
(34, 11, 1677425999, 557, 'Morgaroth', 0, 'Morgaroth', 0, 0, 0),
(35, 11, 1677428661, 551, 'Morgaroth', 0, 'Morgaroth', 0, 0, 0),
(36, 11, 1677428778, 545, 'Morgaroth', 0, 'Morgaroth', 0, 0, 0),
(37, 11, 1677429027, 539, 'Morgaroth', 0, 'Morgaroth', 0, 0, 0),
(38, 11, 1677430108, 533, 'Morgaroth', 0, 'Morgaroth', 0, 0, 0),
(39, 11, 1677430673, 533, 'Morgaroth', 0, 'Morgaroth', 0, 0, 0),
(40, 11, 1677431000, 668, 'Morgaroth', 0, 'Morgaroth', 0, 0, 0),
(41, 11, 1677431052, 668, 'a demon', 0, 'Morgaroth', 0, 0, 0),
(42, 11, 1677431767, 668, 'Morgaroth', 0, 'Morgaroth', 0, 0, 0),
(43, 11, 1677431932, 668, 'Morgaroth', 0, 'Morgaroth', 0, 0, 0),
(44, 11, 1677432064, 668, 'Morgaroth', 0, 'Morgaroth', 0, 0, 0),
(45, 12, 1677585421, 114, 'a dragon', 0, 'a dragon', 0, 0, 0),
(46, 10, 1681848837, 1007, 'a bony sea devil', 0, 'a Hazardous Phantom', 0, 0, 0),
(47, 10, 1681869031, 1007, 'a infernal demon', 0, 'a infernal demon', 0, 0, 0),
(48, 10, 1681869355, 1007, 'a infernal demon', 0, 'a infernal demon', 0, 0, 0),
(49, 10, 1681870126, 1009, 'a infernal demon', 0, 'a infernal demon', 0, 0, 0),
(50, 10, 1681870172, 1009, 'a infernal demon', 0, 'a infernal demon', 0, 0, 0),
(51, 10, 1682087476, 1015, 'Grand Master Oberon', 0, 'Grand Master Oberon', 0, 0, 0),
(52, 17, 1682111230, 114, 'a dragon lord', 0, 'a dragon lord', 0, 0, 0),
(53, 17, 1682111457, 185, 'a hero', 0, 'a hero', 0, 0, 0),
(54, 17, 1682111851, 240, 'a hellspawn', 0, 'a hellspawn', 0, 0, 0),
(55, 17, 1682112151, 281, 'a hellspawn', 0, 'a hellspawn', 0, 0, 0),
(56, 17, 1682112948, 361, 'a hellfire fighter', 0, 'a hellfire fighter', 0, 0, 0),
(57, 17, 1682118524, 483, 'a Crazed Summer Rearguard', 0, 'a Crazed Summer Rearguard', 0, 0, 0),
(58, 18, 1682118736, 67, 'Pitt Buh', 1, 'Pitt Buh', 1, 1, 0),
(59, 17, 1682121062, 503, 'a dark torturer', 0, 'a dark torturer', 0, 0, 0),
(60, 17, 1682122315, 521, 'a dark torturer', 0, 'a dark torturer', 0, 0, 0),
(61, 18, 1682122334, 381, 'a destroyer', 0, 'a dark torturer', 0, 0, 0),
(62, 17, 1682123631, 556, 'a juggernaut', 0, 'a hellhound', 0, 0, 0),
(63, 17, 1682123897, 557, 'a grim reaper', 0, 'Orshabaal', 0, 0, 0),
(64, 18, 1682128747, 671, 'a infernal demon', 0, 'a infernal phantom', 0, 0, 0),
(65, 17, 1682128854, 693, 'a druid\'s apparition', 0, 'a druid\'s apparition', 0, 0, 0),
(66, 17, 1682129410, 707, 'a rotten golem', 0, 'a branchy crawler', 0, 0, 0),
(67, 18, 1682129421, 684, 'a mould phantom', 0, 'a branchy crawler', 0, 0, 0),
(68, 18, 1682129543, 681, 'a rotten golem', 0, 'a branchy crawler', 0, 0, 0),
(69, 17, 1682129546, 704, 'a rotten golem', 0, 'a branchy crawler', 0, 0, 0),
(70, 17, 1682290680, 772, 'a brachiodemon', 0, 'a hellhound', 0, 0, 0),
(71, 18, 1682291467, 811, 'a mirror image', 0, 'a druid\'s apparition', 0, 0, 0),
(72, 17, 1682291469, 782, 'a mirror image', 0, 'a druid\'s apparition', 0, 0, 0),
(73, 18, 1682291520, 810, 'a mirror image', 0, 'a druid\'s apparition', 0, 0, 0),
(74, 19, 1682300567, 8, 'a demon', 0, 'a demon', 0, 0, 0),
(75, 19, 1682301430, 83, 'a dragon', 0, 'a dragon', 0, 0, 0),
(76, 19, 1682358178, 538, 'a Crazed Summer Rearguard', 0, 'a frost flower asura', 0, 0, 0),
(77, 20, 1682360236, 63, 'a warlock', 0, 'a dragon hatchling', 0, 0, 0),
(78, 20, 1682360314, 63, 'a dragon lord', 0, 'a dragon lord', 0, 0, 0),
(79, 20, 1682362381, 165, 'a dragon lord hatchling', 0, 'a dragon lord', 0, 0, 0),
(80, 20, 1682362418, 168, 'a dragon lord', 0, 'a dragon lord', 0, 0, 0),
(81, 20, 1682362634, 177, 'a wyrm', 0, 'a wyrm', 0, 0, 0),
(82, 20, 1682362663, 176, 'a pirat scoundrel', 0, 'a wyrm', 0, 0, 0),
(83, 19, 1682374375, 539, 'a infernal demon', 0, 'a infernal demon', 0, 0, 0),
(84, 21, 1682374988, 52, 'Karby Knight', 1, 'Karby Knight', 1, 1, 0),
(85, 19, 1682375217, 539, 'a cyclops drone', 0, 'a cyclops smith', 0, 0, 0),
(86, 22, 1682376080, 92, 'a pirate corsair', 0, 'a pirate corsair', 0, 0, 0),
(87, 17, 1682384079, 901, 'a infernal demon', 0, 'a infernal phantom', 0, 0, 0),
(88, 21, 1682385535, 242, 'a grim reaper', 0, 'a grim reaper', 0, 0, 0),
(89, 22, 1682385911, 501, 'a infernal demon', 0, 'a brachiodemon', 0, 0, 0),
(90, 19, 1682385915, 538, 'a brachiodemon', 0, 'a brachiodemon', 0, 0, 0),
(91, 10, 1682385940, 1010, 'a infernal phantom', 0, 'a infernal demon', 0, 0, 0),
(92, 10, 1682386081, 999, 'a infernal phantom', 0, 'a infernal demon', 0, 0, 0),
(93, 17, 1682386115, 905, 'a brachiodemon', 0, 'a infernal demon', 0, 0, 0),
(94, 10, 1682386239, 995, 'a bony sea devil', 0, 'a brachiodemon', 0, 0, 0),
(95, 10, 1682386353, 990, 'a turbulent elemental', 0, 'a turbulent elemental', 0, 0, 0),
(96, 19, 1682386360, 534, 'a capricious phantom', 0, 'a capricious phantom', 0, 0, 0),
(97, 19, 1682386548, 533, 'a mirror image', 0, 'a mirror image', 0, 0, 0),
(98, 17, 1682386592, 903, 'a many faces', 0, 'a many faces', 0, 0, 0),
(99, 10, 1682386616, 986, 'a mirror image', 0, 'a many faces', 0, 0, 0),
(100, 10, 1682386741, 981, 'a mirror image', 0, 'a many faces', 0, 0, 0),
(101, 17, 1682386805, 902, 'a capricious phantom', 0, 'a turbulent elemental', 0, 0, 0),
(102, 10, 1682386819, 976, 'a bony sea devil', 0, 'a bony sea devil', 0, 0, 0),
(103, 19, 1682386836, 532, 'a capricious phantom', 0, 'a capricious phantom', 0, 0, 0),
(104, 22, 1682386944, 500, 'a bony sea devil', 0, 'a bony sea devil', 0, 0, 0),
(105, 19, 1682386954, 531, 'a capricious phantom', 0, 'a turbulent elemental', 0, 0, 0),
(106, 22, 1682387006, 499, 'a turbulent elemental', 0, 'a bony sea devil', 0, 0, 0),
(107, 19, 1682387009, 530, 'a turbulent elemental', 0, 'a turbulent elemental', 0, 0, 0),
(108, 19, 1682387038, 529, 'a turbulent elemental', 0, 'a turbulent elemental', 0, 0, 0),
(109, 22, 1682387051, 499, 'a capricious phantom', 0, 'a capricious phantom', 0, 0, 0),
(110, 10, 1682387055, 972, 'a turbulent elemental', 0, 'a turbulent elemental', 0, 0, 0),
(111, 17, 1682554080, 233, 'a hellspawn', 0, 'a frost flower asura', 0, 0, 0),
(112, 17, 1682554156, 237, 'a grim reaper', 0, 'a grim reaper', 0, 0, 0),
(113, 17, 1682554216, 244, 'a grim reaper', 0, 'a grim reaper', 0, 0, 0),
(114, 17, 1682554484, 283, 'a grim reaper', 0, 'a grim reaper', 0, 0, 0),
(115, 17, 1682554507, 281, 'a grim reaper', 0, 'a grim reaper', 0, 0, 0),
(116, 17, 1682555028, 303, 'a grim reaper', 0, 'a grim reaper', 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_depotitems`
--

CREATE TABLE `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range eg 0-100 will be reserved for depot lockers and all > 100 will be then normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `player_depotitems`
--

INSERT INTO `player_depotitems` (`player_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(9, 101, 1, 3504, 1, 0x01c873829f87010000182300323530782053757072656d65204865616c746820506f74696f6e207061636b6167652e),
(9, 102, 1, 25905, 500, 0x01f05ada9e8701000016f401),
(9, 103, 1, 35287, 14400, 0x011340da9e87010000164038),
(9, 104, 1, 3170, 10, 0x01f07eda9e870100000f0a),
(9, 105, 1, 23398, 1, 0x01c931da9e8701000012e803000000000000073900556e7772617020697420696e20796f7572206f776e20686f75736520746f206372656174652061203c6465636f726174696f6e206b69743e2e2701002901000000000000000800756e777261706964021965000000000000),
(9, 106, 2, 3504, 1, 0x01640ecb9e87010000182300323530782053757072656d65204865616c746820506f74696f6e207061636b6167652e),
(9, 107, 4, 5907, 1, ''),
(9, 108, 4, 12320, 1, ''),
(9, 109, 4, 12304, 1, ''),
(9, 110, 4, 12318, 1, ''),
(9, 111, 4, 34109, 1, ''),
(9, 112, 4, 27451, 1, ''),
(9, 113, 4, 40591, 1, ''),
(9, 114, 4, 40592, 1, ''),
(9, 115, 4, 40593, 1, ''),
(9, 116, 4, 40590, 1, ''),
(9, 117, 4, 40595, 1, ''),
(9, 118, 4, 40589, 1, ''),
(9, 119, 4, 40588, 1, ''),
(9, 120, 4, 40594, 1, ''),
(9, 121, 4, 35286, 14400, 0x164038),
(9, 122, 4, 30396, 1, ''),
(9, 123, 4, 3306, 1, ''),
(9, 124, 4, 2865, 1, 0x240026000000c0),
(9, 125, 4, 2867, 1, 0x2400),
(9, 126, 4, 3420, 1, ''),
(9, 127, 4, 34096, 1, ''),
(9, 128, 4, 3320, 1, ''),
(9, 129, 4, 34093, 1, ''),
(9, 130, 4, 30396, 1, ''),
(9, 131, 4, 30396, 1, 0x2901000000000000000300353030021840190100000000),
(9, 132, 125, 22723, 1, 0x0f01),
(18, 101, 1, 9170, 1, ''),
(18, 102, 1, 9170, 1, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_depotlockeritems`
--

CREATE TABLE `player_depotlockeritems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range eg 0-100 will be reserved for depot lockers and all > 100 will be then normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` smallint(6) NOT NULL,
  `count` smallint(6) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_display`
--

CREATE TABLE `player_display` (
  `id` int(11) NOT NULL,
  `player_id` int(11) DEFAULT 0,
  `account` int(11) DEFAULT 0,
  `outfit` int(11) DEFAULT 0,
  `inventory` int(11) DEFAULT 0,
  `health_mana` int(11) DEFAULT 0,
  `skills` int(11) DEFAULT 0,
  `bonus` int(11) DEFAULT 0,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `player_display`
--

INSERT INTO `player_display` (`id`, `player_id`, `account`, `outfit`, `inventory`, `health_mana`, `skills`, `bonus`, `comment`) VALUES
(4, 9, 0, 0, 0, 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_exp_restore`
--

CREATE TABLE `player_exp_restore` (
  `id` int(11) NOT NULL,
  `id_player` int(11) NOT NULL,
  `expBefore` bigint(20) NOT NULL,
  `expAfter` bigint(20) NOT NULL,
  `canRestore` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `player_exp_restore`
--

INSERT INTO `player_exp_restore` (`id`, `id_player`, `expBefore`, `expAfter`, `canRestore`) VALUES
(1, 9, -1, -1, -1),
(2, 11, -1, -1, -1),
(3, 10, 15230044553, 17101490561, 1),
(4, 13, -1, -1, -1),
(5, 12, -1, -1, -1),
(6, 16, -1, -1, -1),
(7, 17, 454605840, 354813840, 1),
(8, 18, 8808908062, 1777681412, 1),
(9, 19, 2453101485, 2441805457, 1),
(10, 20, 88759240, 283413634, 1),
(11, 21, 230653114, 287049176, 1),
(12, 22, 2047564852, 2101993209, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_former_names`
--

CREATE TABLE `player_former_names` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `former_name` varchar(35) NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_hirelings`
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

--
-- Extraindo dados da tabela `player_hirelings`
--

INSERT INTO `player_hirelings` (`id`, `player_id`, `name`, `active`, `sex`, `posx`, `posy`, `posz`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`) VALUES
(1, 9, 'Server Master', 1, 1, 995, 1224, 7, 34, 116, 97, 3, 128),
(2, 18, 'Doubledoor', 1, 1, 977, 1227, 7, 34, 97, 97, 3, 1132),
(3, 17, 'Kidauanus', 1, 1, 1002, 1226, 7, 34, 116, 97, 3, 128);

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_inboxitems`
--

CREATE TABLE `player_inboxitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `player_inboxitems`
--

INSERT INTO `player_inboxitems` (`player_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(10, 101, 0, 28718, 1, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_items`
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
-- Extraindo dados da tabela `player_items`
--

INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`, `attributes`) VALUES
(11, 1, 101, 3374, 1, ''),
(11, 2, 102, 3057, 1, 0x160100),
(11, 3, 103, 2854, 1, 0x24002600000080),
(11, 4, 104, 3571, 1, ''),
(11, 6, 105, 3277, 1, 0x0f01),
(11, 7, 106, 8095, 1, ''),
(11, 8, 107, 3552, 1, ''),
(11, 11, 108, 23396, 1, 0x2400),
(11, 103, 109, 35290, 14400, 0x164038),
(11, 103, 110, 35286, 14400, 0x164038),
(11, 103, 111, 35289, 14400, 0x164038),
(11, 103, 112, 35290, 14400, 0x164038),
(11, 103, 113, 21554, 1, ''),
(11, 103, 114, 35288, 11408, 0x16902c),
(11, 103, 115, 3294, 1, ''),
(11, 103, 116, 7367, 1, 0x0f01),
(11, 103, 117, 35289, 11669, 0x16952d),
(11, 103, 118, 3170, 21, 0x0f15),
(11, 103, 119, 3163, 5, 0x0f05),
(11, 103, 120, 34089, 1, ''),
(11, 103, 121, 285, 1, 0x0f01),
(11, 103, 122, 2920, 1, ''),
(11, 103, 123, 3425, 1, ''),
(11, 103, 124, 2854, 1, 0x2401),
(11, 103, 125, 3447, 50, 0x0f32),
(11, 103, 126, 266, 9, 0x0f09),
(11, 103, 127, 5710, 1, ''),
(11, 103, 128, 3003, 1, ''),
(11, 124, 129, 27451, 1, ''),
(11, 124, 130, 35286, 14400, 0x164038),
(11, 124, 131, 23374, 10, 0x0f0a),
(11, 124, 132, 3003, 1, ''),
(16, 1, 101, 7992, 1, ''),
(16, 2, 102, 3572, 1, ''),
(16, 3, 103, 2854, 1, 0x24012600000080),
(16, 4, 104, 7991, 1, ''),
(16, 5, 105, 3059, 1, ''),
(16, 7, 106, 3362, 1, ''),
(16, 8, 107, 3552, 1, ''),
(16, 10, 108, 2920, 1, ''),
(16, 11, 109, 23396, 1, ''),
(16, 103, 110, 3074, 1, ''),
(16, 103, 111, 3492, 1, 0x0f01),
(16, 103, 112, 9692, 1, 0x0f01),
(16, 103, 113, 3031, 98, 0x0f62),
(16, 103, 114, 3286, 1, ''),
(16, 103, 115, 2854, 1, ''),
(16, 103, 116, 268, 10, 0x0f0a),
(16, 103, 117, 5710, 1, ''),
(16, 103, 118, 3003, 1, ''),
(16, 115, 119, 3031, 3, 0x0f03),
(16, 115, 120, 3003, 1, ''),
(12, 3, 101, 2853, 1, 0x24012600000080),
(12, 6, 102, 7773, 1, ''),
(12, 7, 103, 3372, 1, ''),
(12, 11, 104, 23396, 1, 0x2400),
(12, 101, 105, 35285, 14400, 0x164038),
(12, 101, 106, 35288, 14400, 0x164038),
(12, 101, 107, 35286, 14233, 0x169937),
(12, 101, 108, 35288, 14400, 0x164038),
(12, 104, 109, 35289, 14387, 0x010adcbeb587010000163338),
(12, 104, 110, 35289, 14161, 0x165137046400),
(12, 104, 111, 35285, 11710, 0x16be2d046400),
(12, 104, 112, 35287, 14382, 0x162e38046400),
(12, 104, 113, 35286, 13676, 0x166c35046400),
(10, 1, 101, 39151, 1, ''),
(10, 2, 102, 3572, 1, ''),
(10, 3, 103, 2854, 1, 0x2400),
(10, 4, 104, 34095, 1, ''),
(10, 5, 105, 3059, 1, ''),
(10, 6, 106, 34090, 1, 0x280a),
(10, 7, 107, 34092, 1, ''),
(10, 8, 108, 3079, 1, ''),
(10, 10, 109, 2920, 1, ''),
(10, 11, 110, 23396, 1, 0x2401),
(10, 103, 111, 3035, 61, 0x0f3d),
(10, 103, 112, 284, 44, 0x0f2c),
(10, 103, 113, 3043, 30, 0x0f1e),
(10, 103, 114, 284, 100, 0x0f64),
(10, 103, 115, 3420, 1, ''),
(10, 103, 116, 34090, 1, ''),
(10, 103, 117, 3203, 30, 0x0f1e),
(10, 103, 118, 34099, 1, ''),
(10, 103, 119, 7643, 100, 0x0f64),
(10, 103, 120, 9170, 1, ''),
(10, 103, 121, 35287, 14400, 0x164038),
(10, 103, 122, 2855, 1, ''),
(10, 103, 123, 284, 100, 0x0f64),
(10, 103, 124, 23373, 56, 0x0f38),
(10, 103, 125, 23373, 100, 0x0f64),
(10, 103, 126, 8778, 1, ''),
(10, 103, 127, 285, 10, 0x0f0a),
(10, 103, 128, 2854, 1, 0x2404),
(10, 103, 129, 5710, 1, ''),
(10, 103, 130, 3003, 1, ''),
(10, 110, 131, 3170, 6, 0x01e66eddb5870100000f06),
(10, 110, 132, 23721, 1, 0x240026000000c0),
(10, 110, 133, 35290, 11143, 0x16872b046400),
(10, 122, 134, 3388, 1, ''),
(10, 122, 135, 3388, 1, ''),
(10, 122, 136, 35289, 14400, 0x164038),
(10, 122, 137, 35287, 14400, 0x164038),
(10, 122, 138, 35285, 14400, 0x164038),
(10, 128, 139, 3031, 55, 0x0f37),
(10, 128, 140, 3180, 95, 0x0f5f),
(10, 128, 141, 3180, 100, 0x0f64),
(10, 128, 142, 3420, 1, ''),
(10, 128, 143, 34096, 1, ''),
(10, 128, 144, 3420, 1, ''),
(10, 128, 145, 23373, 100, 0x0f64),
(10, 128, 146, 23373, 100, 0x0f64),
(10, 128, 147, 3161, 96, 0x0f60),
(10, 128, 148, 8778, 1, ''),
(10, 128, 149, 8778, 1, ''),
(10, 128, 150, 8778, 1, ''),
(10, 128, 151, 8778, 1, ''),
(10, 128, 152, 284, 9, 0x0f09),
(10, 128, 153, 3155, 11, 0x0f0b),
(10, 128, 154, 3155, 100, 0x0f64),
(10, 128, 155, 3155, 100, 0x0f64),
(10, 128, 156, 3155, 100, 0x0f64),
(10, 128, 157, 3155, 100, 0x0f64),
(10, 128, 158, 23373, 100, 0x0f64),
(10, 132, 159, 238, 2, 0x0f02),
(10, 132, 160, 7368, 2, 0x0f02),
(10, 132, 161, 3043, 100, 0x0f64),
(10, 132, 162, 3043, 100, 0x0f64),
(10, 132, 163, 21554, 1, ''),
(10, 132, 164, 3043, 100, 0x0f64),
(21, 1, 101, 7992, 1, ''),
(21, 2, 102, 3572, 1, ''),
(21, 3, 103, 2853, 1, 0x24012600000080),
(21, 4, 104, 7991, 1, ''),
(21, 5, 105, 3059, 1, ''),
(21, 6, 106, 3074, 1, ''),
(21, 7, 107, 3362, 1, ''),
(21, 8, 108, 3552, 1, ''),
(21, 10, 109, 2920, 1, ''),
(21, 11, 110, 23396, 1, 0x2400),
(21, 103, 111, 238, 9, 0x0f09),
(21, 103, 112, 2854, 1, 0x2400),
(21, 103, 113, 3421, 1, ''),
(21, 103, 114, 7643, 8, 0x0f08),
(21, 103, 115, 6499, 9, 0x0f09),
(21, 103, 116, 9660, 8, 0x0f08),
(21, 103, 117, 3453, 1, ''),
(21, 103, 118, 6558, 22, 0x0f16),
(21, 110, 119, 23398, 1, 0x073b00556e7772617020697420696e20796f7572206f776e20686f75736520746f206372656174652061203c706f6469756d206f66207669676f75723e2e2901000000000000000800756e777261706964023397000000000000),
(21, 110, 120, 35284, 1964, 0x16ac07046400),
(21, 112, 121, 3191, 78, 0x0f4e),
(21, 112, 122, 3191, 100, 0x0f64),
(21, 112, 123, 3191, 100, 0x0f64),
(21, 112, 124, 3191, 100, 0x0f64),
(21, 112, 125, 3191, 100, 0x0f64),
(21, 112, 126, 23373, 42, 0x0f2a),
(21, 112, 127, 23373, 100, 0x0f64),
(21, 112, 128, 237, 99, 0x0f63),
(21, 112, 129, 5809, 1, 0x0f01),
(21, 112, 130, 3160, 96, 0x0f60),
(21, 112, 131, 34092, 1, ''),
(21, 112, 132, 34090, 1, ''),
(21, 112, 133, 34095, 1, ''),
(21, 112, 134, 28717, 1, ''),
(21, 112, 135, 28714, 1, ''),
(21, 112, 136, 34152, 1, ''),
(21, 112, 137, 27649, 1, ''),
(21, 112, 138, 27647, 1, ''),
(21, 112, 139, 30399, 1, ''),
(21, 112, 140, 3155, 40, 0x0f28),
(22, 1, 101, 39148, 1, 0x29020000000000000003003530300230a410010000000003003530310215a4100100000000),
(22, 2, 102, 39234, 1, 0x105aa261001101),
(22, 3, 103, 2854, 1, 0x24012600000080),
(22, 4, 104, 39147, 1, 0x29010000000000000003003530300212a4100100000000),
(22, 6, 105, 28724, 1, ''),
(22, 7, 106, 28720, 1, ''),
(22, 8, 107, 34097, 1, ''),
(22, 9, 108, 39178, 1, 0x10d8b590001101),
(22, 10, 109, 2920, 1, ''),
(22, 11, 110, 23396, 1, 0x2403),
(22, 103, 111, 34085, 1, 0x280a29030000000000000003003530300218a410010000000003003530310212a410010000000003003530320230a4100100000000),
(22, 103, 112, 3031, 95, 0x0f5f),
(22, 103, 113, 3035, 64, 0x0f40),
(22, 103, 114, 3043, 54, 0x0f36),
(22, 103, 115, 284, 73, 0x0f49),
(22, 103, 116, 39235, 1, ''),
(22, 103, 117, 283, 87, 0x0f57),
(22, 103, 118, 34084, 1, 0x280a),
(22, 103, 119, 3029, 5, 0x0f05),
(22, 103, 120, 37109, 1, 0x0f01),
(22, 103, 121, 2854, 1, 0x2404),
(22, 103, 122, 3003, 1, ''),
(22, 110, 123, 34099, 1, ''),
(22, 110, 124, 35286, 14032, 0x01affcaeb58701000016d036),
(22, 110, 125, 23721, 1, 0x01c2a56ab587010000240226feff3f43),
(22, 121, 126, 23375, 41, 0x0f29),
(22, 121, 127, 23375, 100, 0x0f64),
(22, 121, 128, 23375, 100, 0x0f64),
(22, 121, 129, 23375, 100, 0x0f64),
(22, 121, 130, 23375, 100, 0x0f64),
(22, 121, 131, 23375, 100, 0x0f64),
(22, 121, 132, 3180, 98, 0x0f62),
(22, 121, 133, 3180, 100, 0x0f64),
(22, 121, 134, 237, 30, 0x0f1e),
(22, 121, 135, 237, 100, 0x0f64),
(22, 121, 136, 23375, 100, 0x0f64),
(22, 121, 137, 23375, 100, 0x0f64),
(22, 125, 138, 7418, 1, ''),
(22, 125, 139, 7418, 1, ''),
(22, 125, 140, 7418, 1, ''),
(22, 125, 141, 7418, 1, ''),
(22, 125, 142, 7452, 1, ''),
(22, 125, 143, 3369, 1, ''),
(22, 125, 144, 6499, 12, 0x0f0c),
(22, 125, 145, 3035, 48, 0x0f30),
(22, 125, 146, 3371, 1, ''),
(22, 125, 147, 3371, 1, ''),
(22, 125, 148, 3369, 1, ''),
(22, 125, 149, 23542, 1, ''),
(22, 125, 150, 830, 1, ''),
(22, 125, 151, 3318, 1, ''),
(22, 125, 152, 23542, 1, ''),
(22, 125, 153, 23529, 1, ''),
(22, 125, 154, 23529, 1, ''),
(22, 125, 155, 5922, 1, 0x0f01),
(22, 125, 156, 8093, 1, ''),
(22, 125, 157, 23529, 1, ''),
(22, 125, 158, 14042, 1, ''),
(22, 125, 159, 3344, 1, ''),
(22, 125, 160, 9633, 1, 0x0f01),
(22, 125, 161, 813, 1, ''),
(22, 125, 162, 3318, 1, ''),
(22, 125, 163, 3071, 1, ''),
(22, 125, 164, 817, 200, 0x16c800),
(22, 125, 165, 23542, 1, ''),
(22, 125, 166, 23529, 1, ''),
(22, 125, 167, 23542, 1, ''),
(22, 125, 168, 23529, 1, ''),
(22, 125, 169, 25735, 32, 0x0f20),
(22, 125, 170, 23529, 1, ''),
(22, 125, 171, 37109, 3, 0x0f03),
(22, 125, 172, 23529, 1, ''),
(22, 125, 173, 23529, 1, ''),
(22, 125, 174, 23529, 1, ''),
(22, 125, 175, 830, 1, ''),
(22, 125, 176, 813, 1, ''),
(22, 125, 177, 3318, 1, ''),
(22, 125, 178, 23529, 1, ''),
(22, 125, 179, 16163, 1, ''),
(22, 125, 180, 7419, 1, ''),
(22, 125, 181, 3554, 1, ''),
(22, 125, 182, 3554, 1, ''),
(22, 125, 183, 9058, 1, 0x0f01),
(22, 125, 184, 7412, 1, ''),
(22, 125, 185, 7427, 1, ''),
(22, 125, 186, 3033, 3, 0x0f03),
(22, 125, 187, 10298, 3, 0x0f03),
(22, 125, 188, 9661, 1, 0x0f01),
(22, 125, 189, 16163, 1, ''),
(22, 125, 190, 3318, 1, ''),
(22, 125, 191, 3320, 1, ''),
(22, 125, 192, 23529, 1, ''),
(22, 125, 193, 16163, 1, ''),
(22, 125, 194, 23542, 1, ''),
(22, 125, 195, 3320, 1, ''),
(22, 125, 196, 817, 200, 0x16c800),
(22, 125, 197, 23529, 1, ''),
(22, 125, 198, 23529, 1, ''),
(22, 125, 199, 826, 1, ''),
(22, 125, 200, 11474, 4, 0x0f04),
(22, 125, 201, 23529, 1, ''),
(22, 125, 202, 675, 7, 0x0f07),
(22, 125, 203, 3318, 1, ''),
(22, 125, 204, 3037, 5, 0x0f05),
(22, 125, 205, 16120, 24, 0x0f18),
(22, 125, 206, 9635, 39, 0x0f27),
(22, 125, 207, 16126, 26, 0x0f1a),
(22, 125, 208, 23542, 1, ''),
(22, 125, 209, 25735, 100, 0x0f64),
(22, 125, 210, 676, 38, 0x0f26),
(22, 125, 211, 7452, 1, ''),
(22, 125, 212, 21974, 2, 0x0f02),
(22, 125, 213, 3371, 1, ''),
(22, 125, 214, 3371, 1, ''),
(22, 125, 215, 6299, 1, ''),
(22, 125, 216, 8074, 1, ''),
(22, 125, 217, 3029, 2, 0x0f02),
(22, 125, 218, 7452, 1, ''),
(22, 125, 219, 3369, 1, ''),
(22, 125, 220, 21975, 2, 0x0f02),
(22, 125, 221, 3371, 1, ''),
(22, 125, 222, 8043, 1, ''),
(22, 125, 223, 3371, 1, ''),
(22, 125, 224, 8074, 1, ''),
(22, 125, 225, 3369, 1, ''),
(22, 125, 226, 3371, 1, ''),
(22, 125, 227, 3028, 7, 0x0f07),
(22, 125, 228, 21981, 1, ''),
(22, 125, 229, 3371, 1, ''),
(22, 125, 230, 6299, 1, ''),
(22, 125, 231, 10304, 62, 0x0f3e),
(22, 125, 232, 5021, 23, 0x0f17),
(22, 125, 233, 3032, 7, 0x0f07),
(22, 125, 234, 3041, 2, 0x0f02),
(22, 125, 235, 7439, 6, 0x0f06),
(22, 125, 236, 5944, 19, 0x0f13),
(22, 125, 237, 3030, 5, 0x0f05),
(22, 125, 238, 3280, 1, ''),
(22, 125, 239, 3280, 1, ''),
(22, 125, 240, 3280, 1, ''),
(22, 125, 241, 9057, 79, 0x0f4f),
(22, 125, 242, 7368, 63, 0x0f3f),
(22, 125, 243, 6499, 100, 0x0f64),
(17, 1, 101, 39153, 1, 0x29020000000000000003003530300215b4d300000000000300353031023fb4d30000000000),
(17, 2, 102, 30402, 1, 0x10f0aa38001101),
(17, 3, 103, 2854, 1, 0x2401),
(17, 4, 104, 34096, 1, 0x29010000000000000003003530300212b4d30000000000),
(17, 5, 105, 39154, 1, ''),
(17, 6, 106, 34091, 1, 0x280a29020000000000000003003530300218ca0a01000000000300353031023fca0a0100000000),
(17, 7, 107, 34093, 1, ''),
(17, 8, 108, 3554, 1, ''),
(17, 9, 109, 39187, 1, 0x106e4581001101),
(17, 11, 110, 23396, 1, 0x2402),
(17, 103, 111, 3031, 10, 0x0f0a),
(17, 103, 112, 3035, 65, 0x0f41),
(17, 103, 113, 3191, 60, 0x0f3c),
(17, 103, 114, 3191, 100, 0x0f64),
(17, 103, 115, 22721, 50, 0x0f32),
(17, 103, 116, 22516, 46, 0x0f2e),
(17, 103, 117, 3043, 3, 0x0f03),
(17, 103, 118, 23373, 34, 0x0f22),
(17, 103, 119, 7642, 3, 0x0f03),
(17, 103, 120, 2854, 1, ''),
(17, 110, 121, 35283, 2000, 0x16d007046400),
(17, 110, 122, 23721, 1, 0x0105f723a687010000240526feff3fcb),
(17, 110, 123, 31631, 1, ''),
(17, 110, 124, 35289, 11708, 0x013a121fa68701000016bc2d),
(17, 120, 125, 2854, 1, 0x2400),
(17, 120, 126, 2854, 1, ''),
(17, 122, 127, 8043, 1, ''),
(17, 122, 128, 237, 2, 0x0f02),
(17, 122, 129, 9665, 3, 0x0f03),
(17, 122, 130, 236, 3, 0x0f03),
(17, 122, 131, 823, 1, ''),
(17, 122, 132, 823, 1, ''),
(17, 122, 133, 3371, 1, ''),
(17, 122, 134, 3371, 1, ''),
(17, 122, 135, 3371, 1, ''),
(17, 122, 136, 3035, 74, 0x0f4a),
(17, 122, 137, 3371, 1, ''),
(17, 122, 138, 8043, 1, ''),
(17, 122, 139, 3033, 2, 0x0f02),
(17, 122, 140, 7452, 1, ''),
(17, 122, 141, 3371, 1, ''),
(17, 122, 142, 7452, 1, ''),
(17, 122, 143, 3371, 1, ''),
(17, 122, 144, 21981, 1, ''),
(17, 122, 145, 3035, 100, 0x0f64),
(17, 122, 146, 7452, 1, ''),
(17, 122, 147, 21975, 2, 0x0f02),
(17, 122, 148, 3054, 200, 0x16c800),
(17, 122, 149, 21974, 2, 0x0f02),
(17, 122, 150, 3371, 1, ''),
(17, 122, 151, 3035, 100, 0x0f64),
(17, 122, 152, 826, 1, ''),
(17, 122, 153, 3369, 1, ''),
(17, 122, 154, 3369, 1, ''),
(17, 122, 155, 7452, 1, ''),
(17, 122, 156, 8074, 1, ''),
(17, 122, 157, 3035, 100, 0x0f64),
(17, 122, 158, 6299, 1, ''),
(17, 122, 159, 3030, 9, 0x0f09),
(17, 122, 160, 6299, 1, ''),
(17, 122, 161, 7452, 1, ''),
(17, 122, 162, 3574, 1, ''),
(17, 122, 163, 3371, 1, ''),
(17, 122, 164, 3369, 1, ''),
(17, 122, 165, 10304, 69, 0x0f45),
(17, 122, 166, 3071, 1, ''),
(17, 122, 167, 7418, 1, ''),
(17, 122, 168, 9660, 6, 0x0f06),
(17, 122, 169, 823, 1, ''),
(17, 122, 170, 3035, 100, 0x0f64),
(17, 122, 171, 8082, 1, ''),
(17, 122, 172, 8082, 1, ''),
(17, 122, 173, 9056, 1, ''),
(17, 122, 174, 3028, 6, 0x0f06),
(17, 122, 175, 675, 2, 0x0f02),
(17, 122, 176, 23542, 1, ''),
(17, 122, 177, 23529, 1, ''),
(17, 122, 178, 16120, 4, 0x0f04),
(17, 122, 179, 23529, 1, ''),
(17, 122, 180, 16126, 7, 0x0f07),
(17, 122, 181, 676, 7, 0x0f07),
(17, 122, 182, 3280, 1, ''),
(17, 122, 183, 3567, 1, ''),
(17, 122, 184, 3567, 1, ''),
(17, 122, 185, 3280, 1, ''),
(17, 122, 186, 3032, 5, 0x0f05),
(17, 122, 187, 8043, 1, ''),
(17, 122, 188, 9057, 56, 0x0f38),
(17, 122, 189, 6499, 77, 0x0f4d),
(17, 122, 190, 5801, 1, ''),
(17, 122, 191, 16160, 1, ''),
(17, 122, 192, 23531, 1, ''),
(17, 122, 193, 8074, 1, ''),
(17, 122, 194, 3286, 1, ''),
(17, 122, 195, 9056, 1, ''),
(17, 122, 196, 8074, 1, ''),
(17, 122, 197, 8074, 1, ''),
(17, 122, 198, 8074, 1, ''),
(17, 122, 199, 8043, 1, ''),
(17, 122, 200, 16160, 1, ''),
(17, 122, 201, 23531, 1, ''),
(17, 122, 202, 8074, 1, ''),
(17, 122, 203, 6499, 100, 0x0f64),
(17, 122, 204, 8074, 1, ''),
(17, 122, 205, 8043, 1, ''),
(17, 122, 206, 8043, 1, ''),
(17, 122, 207, 6499, 100, 0x0f64),
(17, 122, 208, 8043, 1, ''),
(17, 122, 209, 8043, 1, ''),
(17, 122, 210, 8040, 1, ''),
(17, 122, 211, 8075, 1, ''),
(17, 122, 212, 8074, 1, ''),
(17, 122, 213, 8090, 1, ''),
(17, 122, 214, 8041, 1, ''),
(17, 122, 215, 8096, 1, ''),
(17, 122, 216, 5801, 1, ''),
(17, 122, 217, 5801, 1, ''),
(17, 122, 218, 8074, 1, ''),
(17, 122, 219, 3731, 89, 0x0f59),
(17, 122, 220, 6499, 100, 0x0f64),
(17, 122, 221, 23529, 1, ''),
(17, 122, 222, 23529, 1, ''),
(17, 122, 223, 23529, 1, ''),
(17, 122, 224, 23529, 1, ''),
(17, 122, 225, 3026, 53, 0x0f35),
(17, 122, 226, 7439, 23, 0x0f17),
(17, 122, 227, 6499, 100, 0x0f64),
(17, 122, 228, 8074, 1, ''),
(17, 122, 229, 4871, 1, 0x0f01),
(17, 122, 230, 6499, 100, 0x0f64),
(17, 122, 231, 23529, 1, ''),
(17, 122, 232, 23529, 1, ''),
(17, 122, 233, 23543, 1, ''),
(17, 122, 234, 23544, 1, ''),
(17, 122, 235, 23543, 1, ''),
(17, 122, 236, 23543, 1, ''),
(17, 122, 237, 27455, 1, ''),
(17, 122, 238, 3039, 33, 0x0f21),
(17, 122, 239, 3041, 13, 0x0f0d),
(17, 122, 240, 8074, 1, ''),
(17, 122, 241, 23531, 1, ''),
(17, 122, 242, 5801, 1, ''),
(17, 122, 243, 3037, 21, 0x0f15),
(17, 122, 244, 23529, 1, ''),
(17, 122, 245, 3038, 11, 0x0f0b),
(17, 122, 246, 37109, 8, 0x0f08),
(17, 122, 247, 5021, 5, 0x0f05),
(17, 122, 248, 10298, 45, 0x0f2d),
(17, 125, 249, 30401, 1, ''),
(17, 125, 250, 34158, 1, ''),
(17, 125, 251, 5801, 1, 0x2403),
(17, 217, 252, 8102, 1, ''),
(17, 217, 253, 8076, 1, ''),
(17, 251, 254, 3191, 97, 0x0f61),
(17, 251, 255, 3165, 80, 0x0f50),
(17, 251, 256, 3161, 83, 0x0f53),
(17, 251, 257, 3180, 26, 0x0f1a),
(17, 251, 258, 3180, 100, 0x0f64),
(17, 251, 259, 3165, 100, 0x0f64),
(17, 251, 260, 3161, 100, 0x0f64),
(17, 251, 261, 3155, 91, 0x0f5b),
(17, 251, 262, 3155, 100, 0x0f64),
(17, 251, 263, 3155, 100, 0x0f64),
(17, 251, 264, 3161, 100, 0x0f64),
(20, 1, 101, 7992, 1, ''),
(20, 2, 102, 3572, 1, ''),
(20, 3, 103, 2854, 1, 0x24012600000080),
(20, 4, 104, 7991, 1, ''),
(20, 5, 105, 3059, 1, ''),
(20, 6, 106, 3074, 1, ''),
(20, 7, 107, 3362, 1, ''),
(20, 8, 108, 3552, 1, ''),
(20, 10, 109, 2920, 1, ''),
(20, 11, 110, 23396, 1, 0x2402),
(20, 103, 111, 3031, 54, 0x0f36),
(20, 103, 112, 3035, 4, 0x0f04),
(20, 103, 113, 3161, 36, 0x0f24),
(20, 103, 114, 3161, 100, 0x0f64),
(20, 103, 115, 284, 61, 0x0f3d),
(20, 103, 116, 3029, 1, 0x0f01),
(20, 103, 117, 3155, 69, 0x0f45),
(20, 103, 118, 3043, 32, 0x0f20),
(20, 103, 119, 2854, 1, ''),
(20, 103, 120, 268, 10, 0x0f0a),
(20, 103, 121, 5710, 1, ''),
(20, 103, 122, 3003, 1, ''),
(20, 110, 123, 35290, 13544, 0x01b23f7fb48701000016e834),
(20, 110, 124, 23721, 1, 0x010f817cb487010000240326feff3f41),
(20, 110, 125, 23398, 1, 0x073b00556e7772617020697420696e20796f7572206f776e20686f75736520746f206372656174652061203c706f6469756d206f66207669676f75723e2e2901000000000000000800756e777261706964023397000000000000),
(20, 119, 126, 23373, 49, 0x0f31),
(20, 119, 127, 23373, 100, 0x0f64),
(20, 119, 128, 23373, 100, 0x0f64),
(20, 119, 129, 23373, 100, 0x0f64),
(20, 119, 130, 11457, 1, 0x0f01),
(20, 119, 131, 3003, 1, ''),
(20, 124, 132, 9660, 1, 0x0f01),
(20, 124, 133, 3453, 1, ''),
(20, 124, 134, 3421, 1, ''),
(20, 124, 135, 3453, 1, ''),
(20, 124, 136, 6499, 4, 0x0f04),
(20, 124, 137, 8896, 1, ''),
(20, 124, 138, 3421, 1, ''),
(20, 124, 139, 3453, 1, ''),
(20, 124, 140, 7643, 2, 0x0f02),
(20, 124, 141, 238, 3, 0x0f03),
(20, 124, 142, 6558, 6, 0x0f06),
(20, 124, 143, 236, 2, 0x0f02),
(20, 124, 144, 3428, 1, ''),
(20, 124, 145, 3322, 1, ''),
(20, 124, 146, 3029, 8, 0x0f08),
(20, 124, 147, 5948, 1, 0x0f01),
(20, 124, 148, 3071, 1, ''),
(20, 124, 149, 11457, 6, 0x0f06),
(20, 124, 150, 5882, 3, 0x0f03),
(19, 1, 101, 39148, 1, 0x290200000000000000030035303002150df10000000000030035303102300df10000000000),
(19, 3, 102, 2854, 1, 0x2403260000008029010000000000000003003530300242fbb70000000000),
(19, 4, 103, 39147, 1, 0x290100000000000000030035303002120df10000000000),
(19, 5, 104, 34099, 1, ''),
(19, 7, 105, 28720, 1, ''),
(19, 8, 106, 34097, 1, ''),
(19, 9, 107, 39178, 1, 0x1072ee93001101),
(19, 11, 108, 23396, 1, 0x2402),
(19, 102, 109, 284, 51, 0x0f33),
(19, 102, 110, 3043, 30, 0x0f1e),
(19, 102, 111, 34085, 1, 0x290300000000000000030035303002180df10000000000030035303102150df10000000000030035303202120df10000000000),
(19, 102, 112, 284, 100, 0x0f64),
(19, 102, 113, 283, 75, 0x0f4b),
(19, 102, 114, 3180, 95, 0x0f5f),
(19, 102, 115, 3180, 100, 0x0f64),
(19, 102, 116, 35289, 13589, 0x161535),
(19, 102, 117, 28724, 1, 0x2902000000000000000300353030021875ef00000000000300353031021575ef0000000000),
(19, 102, 118, 30396, 1, ''),
(19, 102, 119, 34084, 1, 0x290200000000000000030035303002180df10000000000030035303102120df10000000000),
(19, 102, 120, 8098, 1, ''),
(19, 102, 121, 5920, 1, 0x0f01),
(19, 102, 122, 11457, 10, 0x0f0a),
(19, 102, 123, 2854, 1, 0x2401),
(19, 102, 124, 3003, 1, ''),
(19, 108, 125, 30394, 1, ''),
(19, 108, 126, 35286, 12002, 0x018bf83db48701000016e22e),
(19, 108, 127, 28715, 1, 0x2901000000000000000300353030021575ef0000000000),
(19, 108, 128, 28719, 1, 0x2901000000000000000300353030021275ef0000000000),
(19, 108, 129, 31631, 1, ''),
(19, 108, 130, 28722, 1, ''),
(19, 108, 131, 23721, 1, 0x01ea4a08b187010000240026feff3f4b),
(19, 123, 132, 237, 25, 0x0f19),
(19, 123, 133, 237, 100, 0x0f64),
(19, 123, 134, 23375, 32, 0x0f20),
(19, 123, 135, 23375, 100, 0x0f64),
(19, 123, 136, 23375, 100, 0x0f64),
(19, 123, 137, 23375, 100, 0x0f64),
(19, 123, 138, 23375, 100, 0x0f64),
(19, 123, 139, 23375, 100, 0x0f64),
(19, 123, 140, 237, 100, 0x0f64),
(19, 123, 141, 237, 100, 0x0f64),
(19, 123, 142, 3410, 1, ''),
(19, 123, 143, 3003, 1, ''),
(19, 131, 144, 9657, 1, 0x0f01),
(19, 131, 145, 7427, 1, ''),
(19, 131, 146, 3320, 1, ''),
(19, 131, 147, 3065, 1, ''),
(19, 131, 148, 8094, 1, ''),
(19, 131, 149, 8082, 1, ''),
(19, 131, 150, 8092, 1, ''),
(19, 131, 151, 8084, 1, ''),
(19, 131, 152, 3067, 1, ''),
(19, 131, 153, 33937, 1, 0x0f01),
(19, 131, 154, 23531, 1, ''),
(19, 131, 155, 8074, 1, ''),
(19, 131, 156, 3333, 1, ''),
(19, 131, 157, 33936, 1, 0x0f01),
(19, 131, 158, 3324, 1, ''),
(19, 131, 159, 3326, 1, ''),
(19, 131, 160, 16126, 1, 0x0f01),
(19, 131, 161, 5921, 1, 0x0f01),
(19, 131, 162, 3369, 1, ''),
(19, 131, 163, 3070, 1, ''),
(19, 131, 164, 21981, 1, ''),
(19, 131, 165, 3371, 1, ''),
(19, 131, 166, 3371, 1, ''),
(19, 131, 167, 6299, 1, ''),
(19, 131, 168, 3016, 1, ''),
(19, 131, 169, 10304, 16, 0x0f10),
(19, 131, 170, 239, 16, 0x0f10),
(19, 131, 171, 3371, 1, ''),
(19, 131, 172, 826, 1, ''),
(19, 131, 173, 3421, 1, ''),
(19, 131, 174, 3272, 1, ''),
(19, 131, 175, 8042, 1, ''),
(19, 131, 176, 7452, 1, ''),
(19, 131, 177, 8042, 1, ''),
(19, 131, 178, 3379, 1, ''),
(19, 131, 179, 7449, 1, ''),
(19, 131, 180, 7449, 1, ''),
(19, 131, 181, 8042, 1, ''),
(19, 131, 182, 7449, 1, ''),
(19, 131, 183, 3421, 1, ''),
(19, 131, 184, 3379, 1, ''),
(19, 131, 185, 7449, 1, ''),
(19, 131, 186, 25737, 1, 0x0f01),
(19, 131, 187, 3379, 1, ''),
(19, 131, 188, 3421, 1, ''),
(19, 131, 189, 7449, 1, ''),
(19, 131, 190, 7449, 1, ''),
(19, 131, 191, 7449, 1, ''),
(19, 131, 192, 7449, 1, ''),
(19, 131, 193, 7449, 1, ''),
(19, 131, 194, 828, 1, ''),
(19, 131, 195, 3351, 1, ''),
(19, 131, 196, 24391, 4, 0x0f04),
(19, 131, 197, 7449, 1, ''),
(19, 131, 198, 7449, 1, ''),
(19, 131, 199, 33945, 6, 0x0f06),
(19, 131, 200, 22193, 1, 0x0f01),
(19, 131, 201, 676, 12, 0x0f0c),
(19, 131, 202, 9691, 15, 0x0f0f),
(19, 131, 203, 7642, 56, 0x0f38),
(19, 131, 204, 828, 1, ''),
(19, 131, 205, 675, 9, 0x0f09),
(19, 131, 206, 7386, 1, ''),
(19, 131, 207, 3450, 3, 0x0f03),
(19, 131, 208, 4831, 1, 0x0f01),
(19, 131, 209, 3061, 1, 0x0f01),
(19, 131, 210, 2903, 0, 0x0f00),
(19, 131, 211, 9694, 5, 0x0f05),
(19, 131, 212, 3732, 4, 0x0f04),
(19, 131, 213, 3016, 1, ''),
(19, 131, 214, 3016, 1, ''),
(19, 131, 215, 7404, 1, ''),
(19, 131, 216, 3016, 1, ''),
(19, 131, 217, 3017, 1, 0x0f01),
(19, 131, 218, 3016, 1, ''),
(19, 131, 219, 3016, 1, ''),
(19, 131, 220, 21981, 1, ''),
(19, 131, 221, 5911, 3, 0x0f03),
(19, 131, 222, 7404, 1, ''),
(19, 131, 223, 7452, 1, ''),
(19, 131, 224, 3028, 14, 0x0f0e),
(19, 131, 225, 3037, 1, 0x0f01),
(19, 131, 226, 8043, 1, ''),
(19, 131, 227, 7452, 1, ''),
(19, 131, 228, 3078, 3, 0x0f03),
(19, 131, 229, 7452, 1, ''),
(19, 131, 230, 21200, 80, 0x0f50),
(19, 131, 231, 11447, 75, 0x0f4b),
(19, 131, 232, 10196, 80, 0x0f50),
(19, 131, 233, 3029, 12, 0x0f0c),
(19, 131, 234, 7452, 1, ''),
(19, 131, 235, 3026, 6, 0x0f06),
(19, 131, 236, 3027, 12, 0x0f0c),
(19, 131, 237, 826, 1, ''),
(19, 131, 238, 21975, 4, 0x0f04),
(19, 131, 239, 6299, 1, ''),
(19, 131, 240, 3033, 2, 0x0f02),
(19, 131, 241, 3030, 3, 0x0f03),
(19, 131, 242, 237, 67, 0x0f43),
(19, 131, 243, 237, 100, 0x0f64),
(19, 131, 244, 23375, 27, 0x0f1b),
(19, 131, 245, 23375, 100, 0x0f64),
(19, 131, 246, 23375, 100, 0x0f64),
(19, 131, 247, 25702, 90, 0x0f5a),
(19, 131, 248, 20205, 95, 0x0f5f),
(19, 131, 249, 11444, 40, 0x0f28),
(19, 131, 250, 9663, 80, 0x0f50),
(19, 131, 251, 25694, 80, 0x0f50),
(19, 131, 252, 22728, 85, 0x0f55),
(19, 131, 253, 9633, 40, 0x0f28),
(19, 131, 254, 22730, 80, 0x0f50),
(19, 131, 255, 10311, 25, 0x0f19),
(19, 131, 256, 3041, 7, 0x0f07),
(19, 131, 257, 3016, 1, ''),
(19, 131, 258, 7452, 1, ''),
(19, 131, 259, 7452, 1, ''),
(19, 131, 260, 3032, 16, 0x0f10),
(19, 131, 261, 21974, 6, 0x0f06),
(19, 131, 262, 7368, 80, 0x0f50),
(19, 131, 263, 3139, 15, 0x0f0f),
(19, 131, 264, 10300, 16, 0x0f10),
(19, 131, 265, 9683, 3, 0x0f03),
(19, 131, 266, 3728, 25, 0x0f19),
(19, 131, 267, 3740, 1, 0x0f01),
(19, 131, 268, 6558, 25, 0x0f19),
(19, 131, 269, 7439, 3, 0x0f03),
(19, 131, 270, 3016, 1, ''),
(19, 131, 271, 5944, 13, 0x0f0d),
(19, 131, 272, 3016, 1, ''),
(19, 131, 273, 238, 21, 0x0f15),
(19, 131, 274, 6499, 76, 0x0f4c),
(19, 131, 275, 9057, 63, 0x0f3f),
(19, 131, 276, 3724, 91, 0x0f5b),
(19, 131, 277, 10304, 100, 0x0f64),
(19, 131, 278, 239, 100, 0x0f64),
(19, 131, 279, 7643, 68, 0x0f44),
(19, 131, 280, 237, 100, 0x0f64),
(19, 131, 281, 23375, 100, 0x0f64),
(18, 1, 101, 39149, 1, 0x29020000000000000003003530300215d69200000000000300353031023ed6920000000000),
(18, 2, 102, 34158, 1, ''),
(18, 3, 103, 2854, 1, 0x24022600000080),
(18, 4, 104, 34094, 1, 0x29010000000000000003003530300212d6920000000000),
(18, 5, 105, 39150, 1, 0x2401),
(18, 6, 106, 34088, 1, 0x280a29010000000000000003003530300218c1bd0000000000),
(18, 7, 107, 28720, 1, ''),
(18, 8, 108, 34098, 1, ''),
(18, 10, 109, 3249, 1, ''),
(18, 11, 110, 23396, 1, 0x2407),
(18, 103, 111, 35288, 13703, 0x168735),
(18, 103, 112, 35288, 14399, 0x163f38),
(18, 103, 113, 35288, 5181, 0x163d14),
(18, 103, 114, 3035, 11, 0x0f0b),
(18, 103, 115, 3043, 97, 0x0f61),
(18, 103, 116, 35848, 1, 0x2400),
(18, 103, 117, 9058, 22, 0x0f16),
(18, 103, 118, 9034, 1, 0x108a9cbe231101),
(18, 103, 119, 284, 5, 0x0f05),
(18, 103, 120, 35289, 5552, 0x16b015),
(18, 103, 121, 35287, 14400, 0x164038),
(18, 103, 122, 3253, 1, 0x2400),
(18, 103, 123, 2854, 1, 0x2404),
(18, 105, 124, 35901, 51, 0x0f33),
(18, 105, 125, 35901, 100, 0x0f64),
(18, 105, 126, 35901, 100, 0x0f64),
(18, 105, 127, 35901, 100, 0x0f64),
(18, 105, 128, 35901, 100, 0x0f64),
(18, 105, 129, 35902, 100, 0x0f64),
(18, 105, 130, 35901, 100, 0x0f64),
(18, 105, 131, 35901, 100, 0x0f64),
(18, 105, 132, 35901, 100, 0x0f64),
(18, 105, 133, 35901, 100, 0x0f64),
(18, 110, 134, 23374, 17, 0x0f11),
(18, 110, 135, 35288, 10501, 0x019489abb487010000160529),
(18, 110, 136, 3170, 8, 0x0141a68ab0870100000f08),
(18, 110, 137, 35283, 2000, 0x16d007046400),
(18, 110, 138, 35289, 14139, 0x0158e235a687010000163b37),
(18, 110, 139, 23721, 1, 0x01c7e527a687010000240526feff3fcb),
(18, 122, 140, 3725, 43, 0x0f2b),
(18, 122, 141, 3067, 1, ''),
(18, 122, 142, 34089, 1, 0x280a29010000000000000003003530300218acbe0000000000),
(18, 122, 143, 9016, 77, 0x0f4d),
(18, 122, 144, 31631, 1, ''),
(18, 122, 145, 39182, 1, ''),
(18, 122, 146, 3442, 1, ''),
(18, 122, 147, 3442, 1, ''),
(18, 122, 148, 6529, 1, 0x1005e6c000),
(18, 122, 149, 34150, 1, ''),
(18, 122, 150, 34088, 1, 0x29030000000000000003003530300218d892000000000003003530310215d892000000000003003530320212d8920000000000),
(18, 122, 151, 27455, 1, ''),
(18, 122, 152, 8076, 1, ''),
(18, 122, 153, 8076, 1, ''),
(18, 122, 154, 8090, 1, ''),
(18, 122, 155, 8090, 1, ''),
(18, 122, 156, 8076, 1, ''),
(18, 122, 157, 8090, 1, ''),
(18, 122, 158, 3097, 1, 0x1070640c00),
(18, 122, 159, 6561, 1, ''),
(18, 122, 160, 5791, 1, ''),
(18, 123, 161, 23374, 59, 0x0f3b),
(18, 123, 162, 23374, 100, 0x0f64),
(18, 123, 163, 238, 1, 0x0f01),
(18, 123, 164, 238, 100, 0x0f64),
(18, 123, 165, 238, 100, 0x0f64),
(18, 123, 166, 238, 100, 0x0f64),
(18, 123, 167, 238, 100, 0x0f64),
(18, 123, 168, 3161, 75, 0x0f4b),
(18, 123, 169, 3161, 100, 0x0f64),
(18, 123, 170, 3191, 100, 0x0f64),
(18, 123, 171, 3191, 100, 0x0f64),
(18, 123, 172, 3191, 100, 0x0f64),
(18, 123, 173, 3191, 100, 0x0f64),
(18, 123, 174, 3155, 30, 0x0f1e),
(18, 139, 175, 3356, 1, ''),
(18, 139, 176, 3284, 1, 0x160100),
(18, 139, 177, 3320, 1, ''),
(18, 139, 178, 3281, 1, ''),
(18, 139, 179, 3098, 1, ''),
(18, 139, 180, 3034, 1, 0x0f01),
(18, 139, 181, 3320, 1, ''),
(18, 139, 182, 5954, 2, 0x0f02),
(18, 139, 183, 7642, 6, 0x0f06),
(18, 139, 184, 3731, 11, 0x0f0b),
(18, 139, 185, 3287, 1, 0x0f01),
(18, 139, 186, 9647, 1, 0x0f01),
(18, 139, 187, 3371, 1, ''),
(18, 139, 188, 3371, 1, ''),
(18, 139, 189, 3371, 1, ''),
(18, 139, 190, 3567, 1, ''),
(18, 139, 191, 3371, 1, ''),
(18, 139, 192, 3369, 1, ''),
(18, 139, 193, 3070, 1, ''),
(18, 139, 194, 3037, 2, 0x0f02),
(18, 139, 195, 8074, 1, ''),
(18, 139, 196, 6299, 1, ''),
(18, 139, 197, 21981, 1, ''),
(18, 139, 198, 826, 1, ''),
(18, 139, 199, 3574, 1, ''),
(18, 139, 200, 3369, 1, ''),
(18, 139, 201, 3574, 1, ''),
(18, 139, 202, 7452, 1, ''),
(18, 139, 203, 5911, 4, 0x0f04),
(18, 139, 204, 3071, 1, ''),
(18, 139, 205, 3371, 1, ''),
(18, 139, 206, 3371, 1, ''),
(18, 139, 207, 21981, 1, ''),
(18, 139, 208, 3403, 1, ''),
(18, 139, 209, 3371, 1, ''),
(18, 139, 210, 7452, 1, ''),
(18, 139, 211, 3070, 1, ''),
(18, 139, 212, 3371, 1, ''),
(18, 139, 213, 3369, 1, ''),
(18, 139, 214, 8143, 1, 0x0f01),
(18, 139, 215, 3492, 35, 0x0f23),
(18, 139, 216, 9692, 1, 0x0f01),
(18, 139, 217, 21981, 1, ''),
(18, 139, 218, 21975, 3, 0x0f03),
(18, 139, 219, 3371, 1, ''),
(18, 139, 220, 3567, 1, ''),
(18, 139, 221, 3041, 4, 0x0f04),
(18, 139, 222, 3070, 1, ''),
(18, 139, 223, 3369, 1, ''),
(18, 139, 224, 3078, 5, 0x0f05),
(18, 139, 225, 3017, 1, 0x0f01),
(18, 139, 226, 3371, 1, ''),
(18, 139, 227, 3403, 1, ''),
(18, 139, 228, 21974, 3, 0x0f03),
(18, 139, 229, 5944, 7, 0x0f07),
(18, 139, 230, 3027, 7, 0x0f07),
(18, 139, 231, 3369, 1, ''),
(18, 139, 232, 3030, 16, 0x0f10),
(18, 139, 233, 8043, 1, ''),
(18, 139, 234, 7439, 5, 0x0f05),
(18, 139, 235, 3724, 37, 0x0f25),
(18, 139, 236, 7368, 84, 0x0f54),
(18, 139, 237, 8043, 1, ''),
(18, 139, 238, 9057, 61, 0x0f3d),
(18, 139, 239, 6299, 1, ''),
(18, 139, 240, 10304, 81, 0x0f51),
(18, 139, 241, 6499, 48, 0x0f30),
(18, 139, 242, 826, 1, ''),
(18, 139, 243, 5878, 1, 0x0f01),
(18, 139, 244, 11472, 1, 0x0f01),
(18, 139, 245, 11482, 1, 0x0f01),
(18, 139, 246, 11483, 2, 0x0f02),
(18, 139, 247, 238, 41, 0x0f29),
(18, 139, 248, 2903, 0, 0x0f00),
(18, 139, 249, 10313, 2, 0x0f02),
(18, 139, 250, 3033, 9, 0x0f09),
(18, 139, 251, 5912, 3, 0x0f03),
(18, 139, 252, 3029, 38, 0x0f26),
(18, 139, 253, 3032, 34, 0x0f22),
(18, 139, 254, 268, 1, 0x0f01),
(18, 139, 255, 3028, 32, 0x0f20),
(18, 139, 256, 3026, 5, 0x0f05),
(18, 139, 257, 25737, 3, 0x0f03),
(18, 139, 258, 7456, 1, ''),
(18, 139, 259, 34008, 3, 0x0f03),
(18, 139, 260, 6299, 1, ''),
(18, 139, 261, 826, 1, ''),
(18, 139, 262, 6299, 1, ''),
(18, 139, 263, 3051, 1, ''),
(18, 139, 264, 8040, 1, ''),
(18, 139, 265, 3442, 1, ''),
(18, 139, 266, 8090, 1, ''),
(18, 139, 267, 8040, 1, ''),
(18, 139, 268, 8041, 1, ''),
(18, 139, 269, 8040, 1, ''),
(18, 139, 270, 3010, 3, 0x0f03),
(18, 139, 271, 8041, 1, ''),
(18, 139, 272, 3048, 20, 0x161400),
(18, 139, 273, 3161, 9, 0x0f09),
(18, 139, 274, 3098, 1, ''),
(18, 139, 275, 3048, 20, 0x161400),
(18, 139, 276, 8098, 1, ''),
(18, 139, 277, 8041, 1, ''),
(18, 139, 278, 8040, 1, ''),
(18, 139, 279, 3442, 1, ''),
(18, 139, 280, 8041, 1, ''),
(18, 139, 281, 8775, 1, 0x0f01),
(18, 139, 282, 9655, 1, 0x0f01),
(18, 139, 283, 5944, 100, 0x0f64),
(18, 139, 284, 27874, 24, 0x0f18),
(18, 139, 285, 5925, 2, 0x0f02),
(18, 139, 286, 3054, 200, 0x16c800),
(18, 139, 287, 34156, 1, ''),
(18, 139, 288, 5887, 2, 0x0f02),
(18, 139, 289, 3093, 1, ''),
(18, 139, 290, 23529, 1, ''),
(18, 139, 291, 23529, 1, ''),
(18, 139, 292, 5922, 1, 0x0f01),
(18, 139, 293, 23529, 1, ''),
(18, 139, 294, 23529, 1, ''),
(18, 139, 295, 23529, 1, ''),
(18, 139, 296, 3575, 1, ''),
(18, 139, 297, 23529, 1, ''),
(18, 139, 298, 23529, 1, ''),
(18, 139, 299, 3575, 1, ''),
(18, 139, 300, 3575, 1, ''),
(18, 139, 301, 3575, 1, ''),
(18, 139, 302, 23529, 1, ''),
(18, 139, 303, 238, 100, 0x0f64),
(18, 139, 304, 35574, 2, 0x0f02),
(18, 139, 305, 35573, 16, 0x0f10),
(18, 139, 306, 3575, 1, ''),
(18, 139, 307, 30058, 1, 0x0f01),
(18, 139, 308, 23542, 1, ''),
(18, 139, 309, 3575, 1, ''),
(18, 139, 310, 3180, 16, 0x0f10),
(18, 139, 311, 23529, 1, ''),
(18, 139, 312, 23542, 1, ''),
(18, 139, 313, 3575, 1, ''),
(18, 139, 314, 3048, 20, 0x161400),
(18, 139, 315, 2903, 0, 0x0f00),
(18, 139, 316, 3051, 1, ''),
(18, 139, 317, 9694, 39, 0x0f27),
(18, 139, 318, 10316, 11, 0x0f0b),
(18, 139, 319, 3740, 1, 0x0f01),
(18, 139, 320, 2885, 0, 0x0f00),
(18, 139, 321, 10311, 1, 0x0f01),
(18, 139, 322, 11444, 20, 0x0f14),
(18, 139, 323, 11492, 20, 0x0f14),
(18, 139, 324, 20200, 16, 0x0f10),
(18, 139, 325, 22730, 56, 0x0f38),
(18, 139, 326, 9685, 7, 0x0f07),
(18, 139, 327, 9633, 55, 0x0f37),
(18, 139, 328, 9635, 88, 0x0f58),
(18, 139, 329, 11452, 57, 0x0f39),
(18, 139, 330, 9663, 26, 0x0f1a),
(18, 139, 331, 5944, 100, 0x0f64),
(18, 139, 332, 3004, 1, ''),
(9, 1, 101, 27647, 1, ''),
(9, 2, 102, 34158, 1, ''),
(9, 3, 103, 2854, 1, 0x24002600000080),
(9, 4, 104, 40533, 1, 0x0f01),
(9, 5, 105, 35524, 1, ''),
(9, 6, 106, 34088, 1, 0x280a),
(9, 7, 107, 34092, 1, ''),
(9, 8, 108, 6530, 1, ''),
(9, 10, 109, 3249, 1, ''),
(9, 11, 110, 23396, 1, 0x2400),
(9, 103, 111, 23531, 1, 0x105f721b00),
(9, 103, 112, 12305, 1, ''),
(9, 103, 113, 12305, 1, ''),
(9, 103, 114, 35562, 1, ''),
(9, 103, 115, 34089, 1, 0x280a),
(9, 103, 116, 34084, 1, 0x280a),
(9, 103, 117, 3155, 5, 0x0f05),
(9, 103, 118, 237, 100, 0x0f64),
(9, 103, 119, 237, 100, 0x0f64),
(9, 103, 120, 236, 99, 0x0f63),
(9, 103, 121, 236, 100, 0x0f64),
(9, 103, 122, 3253, 1, 0x2400),
(9, 103, 123, 3249, 1, ''),
(9, 103, 124, 5791, 1, ''),
(9, 103, 125, 6529, 1, ''),
(9, 103, 126, 6561, 1, ''),
(9, 103, 127, 3341, 1, ''),
(9, 103, 128, 35902, 1, 0x0f01),
(9, 103, 129, 2854, 1, 0x2403),
(9, 105, 130, 35901, 100, 0x0f64),
(9, 105, 131, 35901, 100, 0x0f64),
(9, 105, 132, 35901, 100, 0x0f64),
(9, 105, 133, 35901, 100, 0x0f64),
(9, 105, 134, 35901, 100, 0x0f64),
(9, 105, 135, 35901, 100, 0x0f64),
(9, 105, 136, 35901, 100, 0x0f64),
(9, 105, 137, 35901, 100, 0x0f64),
(9, 110, 138, 23398, 1, 0x0112dddab387010000073900556e7772617020697420696e20796f7572206f776e20686f75736520746f206372656174652061203c6465636f726174696f6e206b69743e2e2701002901000000000000000800756e777261706964021f6c000000000000),
(9, 110, 139, 23721, 1, 0x2402),
(9, 114, 140, 3447, 1, 0x0f01),
(9, 114, 141, 3447, 100, 0x0f64),
(9, 122, 142, 22724, 1, 0x0f01),
(9, 122, 143, 34091, 1, 0x280a),
(9, 122, 144, 7343, 1, 0x2400),
(9, 122, 145, 34088, 1, ''),
(9, 122, 146, 28545, 46, 0x162e00),
(9, 122, 147, 28545, 50, 0x163200),
(9, 122, 148, 16277, 1, ''),
(9, 122, 149, 23374, 99, 0x0f63),
(9, 122, 150, 23374, 100, 0x0f64),
(9, 122, 151, 23375, 99, 0x0f63),
(9, 122, 152, 23375, 100, 0x0f64),
(9, 122, 153, 23373, 100, 0x0f64),
(9, 122, 154, 23373, 100, 0x0f64),
(9, 122, 155, 7643, 99, 0x0f63),
(9, 122, 156, 7643, 100, 0x0f64),
(9, 122, 157, 7642, 100, 0x0f64),
(9, 122, 158, 7642, 99, 0x0f63),
(9, 122, 159, 239, 99, 0x0f63),
(9, 122, 160, 239, 100, 0x0f64),
(9, 122, 161, 7427, 1, ''),
(9, 122, 162, 29286, 1, ''),
(9, 122, 163, 3349, 1, ''),
(9, 129, 164, 3349, 1, ''),
(9, 129, 165, 3409, 1, ''),
(9, 129, 166, 3301, 1, ''),
(9, 129, 167, 3449, 5, 0x0f05),
(9, 129, 168, 3371, 1, ''),
(9, 129, 169, 3034, 1, 0x0f01),
(9, 129, 170, 3039, 1, 0x0f01),
(9, 129, 171, 16277, 1, ''),
(9, 129, 172, 8778, 1, ''),
(9, 129, 173, 35562, 1, 0x2400),
(9, 129, 174, 239, 1, 0x0f01),
(9, 129, 175, 3308, 1, ''),
(9, 129, 176, 40594, 1, ''),
(9, 129, 177, 8143, 1, 0x0f01),
(9, 129, 178, 3003, 1, ''),
(9, 129, 179, 3457, 1, ''),
(9, 129, 180, 3028, 2, 0x0f02),
(9, 129, 181, 282, 2, 0x0f02),
(9, 129, 182, 3041, 3, 0x0f03),
(9, 129, 183, 16096, 1, ''),
(9, 139, 184, 3170, 10, 0x0153f9a4a0870100000f0a),
(9, 139, 185, 3170, 4, 0x01c09093b0870100000f04),
(9, 139, 186, 23375, 50, 0x017b4fdab3870100000f32),
(9, 139, 187, 23375, 100, 0x017b4fdab3870100000f64),
(9, 139, 188, 23375, 100, 0x017b4fdab3870100000f64),
(9, 139, 189, 23375, 100, 0x01de2a50a0870100000f64),
(9, 139, 190, 23375, 50, 0x01de2a50a0870100000f32),
(9, 139, 191, 23375, 100, 0x01de2a50a0870100000f64),
(9, 144, 192, 22723, 4, 0x0f04),
(9, 144, 193, 22723, 97, 0x0f61),
(9, 173, 194, 35901, 45, 0x0f2d);

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_kills`
--

CREATE TABLE `player_kills` (
  `player_id` int(11) NOT NULL,
  `time` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `target` int(11) NOT NULL,
  `unavenged` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `player_kills`
--

INSERT INTO `player_kills` (`player_id`, `time`, `target`, `unavenged`) VALUES
(17, 1682118736, 18, 1),
(19, 1682374988, 21, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_misc`
--

CREATE TABLE `player_misc` (
  `player_id` int(11) NOT NULL,
  `info` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `player_misc`
--

INSERT INTO `player_misc` (`player_id`, `info`) VALUES
(6, 0x7b7d),
(5, 0x7b7d),
(8, 0x7b7d),
(7, 0x7b7d),
(4, 0x7b7d),
(3, 0x7b7d),
(2, 0x7b7d),
(11, 0x7b7d),
(13, 0x7b7d),
(16, 0x7b7d),
(12, 0x7b7d),
(10, 0x7b7d),
(21, 0x7b7d),
(22, 0x7b7d),
(17, 0x7b7d),
(20, 0x7b7d),
(19, 0x7b7d),
(18, 0x7b7d),
(9, 0x7b7d);

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_namelocks`
--

CREATE TABLE `player_namelocks` (
  `player_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `namelocked_at` bigint(20) NOT NULL,
  `namelocked_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_prey`
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
-- Extraindo dados da tabela `player_prey`
--

INSERT INTO `player_prey` (`player_id`, `slot`, `state`, `raceid`, `option`, `bonus_type`, `bonus_rarity`, `bonus_percentage`, `bonus_time`, `free_reroll`, `monster_list`) VALUES
(4, 0, 3, '0', 0, 2, 3, '19', '0', 1675182131531, 0x4f017100ba06490410029b05700368023e01),
(4, 1, 3, '0', 0, 3, 4, '22', '0', 1675182131532, 0x0f00a2021c077d0046024907db0024011900),
(4, 2, 0, '0', 0, 1, 5, '25', '0', 1675182131533, ''),
(3, 0, 3, '0', 0, 3, 2, '16', '0', 1673345073758, 0xfa03090072057c0041007802060189012701),
(3, 1, 3, '0', 0, 3, 7, '31', '0', 1673345073759, 0x3800d6080e0115000d013b00700039002600),
(3, 2, 0, '0', 0, 0, 3, '19', '0', 1673345073760, ''),
(2, 0, 3, '0', 0, 2, 6, '28', '0', 1675855990677, 0xb802fb03f505c802ea0541006d0220010f01),
(2, 1, 3, '0', 0, 0, 9, '37', '0', 1675855990679, 0xad073a0086070f029201b5013200dc001501),
(2, 2, 0, '0', 0, 3, 2, '16', '0', 1675855990681, ''),
(13, 0, 3, '0', 0, 1, 5, '25', '0', 1677582665146, 0xac079d0722061002df0567021a001b076500),
(13, 1, 3, '0', 0, 3, 4, '22', '0', 1677582665148, 0x76007504ce051d07d3001b0455040e018b07),
(13, 2, 0, '0', 0, 2, 2, '16', '0', 1677582665149, ''),
(11, 0, 3, '0', 0, 1, 8, '34', '0', 1676710503959, 0x73006c0048076900050097032c00f5033200),
(11, 1, 3, '0', 0, 3, 10, '40', '0', 1676710503961, 0x1e076405b501ee002a056005bc025202b602),
(11, 2, 0, '0', 0, 0, 3, '19', '0', 1676710503962, ''),
(16, 0, 3, '0', 0, 3, 10, '40', '0', 1682131426330, 0x99073400fe00cd05fa030600480093073600),
(16, 1, 3, '0', 0, 3, 4, '22', '0', 1682131426332, 0x2b0087015306d20838006a02970368030e02),
(16, 2, 0, '0', 0, 0, 5, '25', '0', 1682131426333, ''),
(12, 0, 3, '0', 0, 0, 4, '22', '0', 1677343274081, 0x1004760088074600f004d700be068a072c00),
(12, 1, 3, '0', 0, 2, 9, '37', '0', 1677343274083, 0x0903c40676065e0002026f0648000d024f00),
(12, 2, 0, '0', 0, 1, 9, '37', '0', 1677343274085, ''),
(10, 0, 3, '0', 0, 1, 5, '25', '0', 1673447514762, 0xd608780111004d01000249017604d8052600),
(10, 1, 3, '0', 0, 0, 8, '34', '0', 1673447514764, 0xce05df02d60344019103c2066f036a003500),
(10, 2, 0, '0', 0, 3, 10, '40', '0', 1673447514765, ''),
(21, 0, 3, '0', 0, 2, 9, '37', '0', 1682396290136, 0xbc021501ba066c001f01cf0152023e003e01),
(21, 1, 3, '0', 0, 0, 3, '19', '0', 1682396290137, 0x37006104020110070300b407330209027b06),
(21, 2, 0, '0', 0, 3, 4, '22', '0', 1682396290139, ''),
(22, 0, 3, '0', 0, 3, 10, '40', '0', 1682396740912, 0xad04d7026902190044017c0096033d005504),
(22, 1, 3, '0', 0, 2, 9, '37', '0', 1682396740913, 0x560634001e048801cc06cd034000dd002a01),
(22, 2, 0, '0', 0, 3, 5, '25', '0', 1682396740914, ''),
(17, 0, 4, '0', 0, 0, 5, '25', '0', 1682313143791, 0xfb0508074c0435080500d0053300c102bc06),
(17, 1, 4, '0', 0, 1, 4, '22', '0', 1682313144680, 0xfd007706210620074101fa03150009030803),
(17, 2, 3, '0', 0, 4, 1, '5', '0', 1682313145678, 0x2f02f00479044801c3068707e105b4070f07),
(20, 0, 2, '39', 0, 2, 10, '40', '6300', 1682371864464, 0xf7014904ec0406012a005d07e6058a04db00),
(20, 1, 3, '0', 0, 1, 9, '37', '0', 1682371864468, 0x2a050b00e5052b00d20851044d00e2053400),
(20, 2, 3, '0', 0, 4, 1, '5', '0', 1682371864471, 0xf5002b02d204040178019e0312030a031a01),
(19, 0, 2, '1134', 0, 2, 10, '40', '4680', 1682321600517, 0x2a05cf03db00490133021907920373008102),
(19, 1, 2, '1135', 0, 2, 10, '40', '4680', 1682321600520, 0xc202240020070d064600d6020a036a00ce03),
(19, 2, 2, '519', 0, 2, 10, '40', '4680', 1682321600522, 0x7b039f053600c8025e001c0398031c00f006),
(18, 0, 2, '1134', 2, 2, 10, '40', '7080', 1682140146826, 0xba063800b906c1031a005200440179044101),
(18, 1, 2, '1135', 0, 2, 10, '40', '7080', 1682670547451, 0xc7024d006e035a061a070806e005bb06fb05),
(18, 2, 2, '465', 2, 2, 10, '40', '3000', 1682311281185, 0x1b01c30219002d020a06d5031500dc00fa03),
(9, 0, 4, '0', 0, 3, 10, '40', '0', 1681916737974, 0xb8023c0810044b018506fb03ae0460041002),
(9, 1, 2, '1865', 0, 2, 10, '40', '7200', 1681916739096, 0xe1006f039d03ce0500022801ef063408),
(9, 2, 0, '0', 0, 0, 8, '34', '0', 1681811329588, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_preydata`
--

CREATE TABLE `player_preydata` (
  `player_id` int(11) NOT NULL,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_preytimes`
--

CREATE TABLE `player_preytimes` (
  `player_id` int(11) NOT NULL,
  `bonus_type1` int(11) NOT NULL,
  `bonus_value1` int(11) NOT NULL,
  `bonus_name1` varchar(50) NOT NULL,
  `bonus_type2` int(11) NOT NULL,
  `bonus_value2` int(11) NOT NULL,
  `bonus_name2` varchar(50) NOT NULL,
  `bonus_type3` int(11) NOT NULL,
  `bonus_value3` int(11) NOT NULL,
  `bonus_name3` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `player_preytimes`
--

INSERT INTO `player_preytimes` (`player_id`, `bonus_type1`, `bonus_value1`, `bonus_name1`, `bonus_type2`, `bonus_value2`, `bonus_name2`, `bonus_type3`, `bonus_value3`, `bonus_name3`) VALUES
(6, 0, 0, '', 0, 0, '', 0, 0, ''),
(3, 0, 0, '', 0, 0, '', 0, 0, ''),
(5, 0, 0, '', 0, 0, '', 0, 0, ''),
(7, 0, 0, '', 0, 0, '', 0, 0, ''),
(4, 0, 0, '', 0, 0, '', 0, 0, ''),
(2, 0, 0, '', 0, 0, '', 0, 0, ''),
(8, 0, 0, '', 0, 0, '', 0, 0, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_rewards`
--

CREATE TABLE `player_rewards` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `player_rewards`
--

INSERT INTO `player_rewards` (`player_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(11, 101, 0, 19202, 1, 0x12b808818f87010000),
(11, 102, 101, 3031, 52, 0x0f34),
(11, 103, 101, 3035, 10, 0x0f0a),
(11, 104, 101, 3265, 1, ''),
(11, 105, 101, 268, 1, 0x0f01),
(11, 106, 101, 3557, 1, ''),
(11, 107, 101, 3049, 1, ''),
(17, 101, 0, 19202, 1, 0x123147b4b087010000),
(17, 102, 0, 19202, 1, 0x128c37b5b087010000),
(17, 103, 101, 5944, 6, 0x0f06),
(17, 104, 101, 7423, 1, ''),
(17, 105, 101, 3035, 5, 0x0f05),
(17, 106, 101, 7407, 1, ''),
(17, 107, 101, 8096, 1, ''),
(17, 108, 101, 3033, 42, 0x0f2a),
(17, 109, 101, 8041, 1, ''),
(17, 110, 101, 281, 5, 0x0f05),
(17, 111, 101, 8076, 1, ''),
(17, 112, 101, 282, 3, 0x0f03),
(17, 113, 101, 3414, 1, ''),
(17, 114, 101, 3366, 1, ''),
(17, 115, 101, 3032, 79, 0x0f4f),
(17, 116, 101, 7451, 1, ''),
(17, 117, 101, 8102, 1, ''),
(17, 118, 101, 7405, 1, ''),
(17, 119, 101, 823, 1, ''),
(17, 120, 101, 3010, 1, 0x0f01),
(17, 121, 101, 822, 1, ''),
(17, 122, 101, 8090, 1, ''),
(17, 123, 101, 3439, 1, ''),
(17, 124, 101, 812, 1, ''),
(17, 125, 101, 8057, 1, ''),
(17, 126, 101, 3420, 1, ''),
(17, 127, 101, 3442, 1, ''),
(17, 128, 101, 821, 1, ''),
(17, 129, 101, 8074, 1, ''),
(17, 130, 101, 3364, 1, ''),
(17, 131, 101, 8040, 1, ''),
(17, 132, 101, 3360, 1, ''),
(17, 133, 101, 8075, 1, ''),
(17, 134, 101, 3031, 72, 0x0f48),
(17, 135, 102, 5944, 6, 0x0f06),
(17, 136, 102, 7382, 1, ''),
(17, 137, 102, 7422, 1, ''),
(17, 138, 102, 7423, 1, ''),
(17, 139, 102, 3035, 53, 0x0f35),
(17, 140, 102, 7407, 1, ''),
(17, 141, 102, 8096, 1, ''),
(17, 142, 102, 3033, 15, 0x0f0f),
(17, 143, 102, 8041, 1, ''),
(17, 144, 102, 3026, 12, 0x0f0c),
(17, 145, 102, 3029, 91, 0x0f5b),
(17, 146, 102, 7417, 1, ''),
(17, 147, 102, 281, 2, 0x0f02),
(17, 148, 102, 8076, 1, ''),
(17, 149, 102, 282, 4, 0x0f04),
(17, 150, 102, 3414, 1, ''),
(17, 151, 102, 3366, 1, ''),
(17, 152, 102, 3032, 74, 0x0f4a),
(17, 153, 102, 7451, 1, ''),
(17, 154, 102, 8102, 1, ''),
(17, 155, 102, 7405, 1, ''),
(17, 156, 102, 823, 1, ''),
(17, 157, 102, 3010, 1, 0x0f01),
(17, 158, 102, 822, 1, ''),
(17, 159, 102, 8090, 1, ''),
(17, 160, 102, 3439, 1, ''),
(17, 161, 102, 812, 1, ''),
(17, 162, 102, 8057, 1, ''),
(17, 163, 102, 3420, 1, ''),
(17, 164, 102, 3442, 1, ''),
(17, 165, 102, 821, 1, ''),
(17, 166, 102, 8074, 1, ''),
(17, 167, 102, 3364, 1, ''),
(17, 168, 102, 8040, 1, ''),
(17, 169, 102, 3360, 1, ''),
(17, 170, 102, 8075, 1, ''),
(17, 171, 102, 3031, 20, 0x0f14),
(17, 172, 102, 3031, 100, 0x0f64),
(19, 101, 0, 19202, 1, 0x122ebee3b487010000),
(19, 102, 101, 821, 1, ''),
(19, 103, 101, 3038, 2, 0x0f02),
(19, 104, 101, 3041, 1, 0x0f01),
(19, 105, 101, 31340, 1, 0x0f01),
(19, 106, 101, 34102, 1, 0x0f01),
(19, 107, 101, 9058, 1, 0x0f01),
(19, 108, 101, 7643, 1, 0x0f01),
(19, 109, 101, 3035, 11, 0x0f0b);

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_spells`
--

CREATE TABLE `player_spells` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_stash`
--

CREATE TABLE `player_stash` (
  `player_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `player_stash`
--

INSERT INTO `player_stash` (`player_id`, `item_id`, `item_count`) VALUES
(18, 238, 36),
(18, 675, 22),
(18, 676, 21),
(18, 3027, 23),
(18, 3034, 9),
(18, 3037, 8),
(18, 3039, 23),
(18, 3041, 6),
(18, 3078, 3),
(18, 3592, 10),
(18, 3731, 45),
(18, 3732, 49),
(18, 5479, 11),
(18, 5910, 6),
(18, 5911, 30),
(18, 5914, 2),
(18, 5921, 39),
(18, 5954, 5),
(18, 6499, 500),
(18, 6528, 100),
(18, 7365, 7),
(18, 7439, 7),
(18, 8016, 12),
(18, 9054, 7),
(18, 9055, 7),
(18, 9636, 7),
(18, 9637, 6),
(18, 9644, 14),
(18, 9660, 74),
(18, 9661, 1),
(18, 9664, 4),
(18, 9691, 28),
(18, 10298, 53),
(18, 10304, 100),
(18, 10306, 3),
(18, 16131, 2),
(18, 21974, 3),
(18, 21975, 4),
(18, 22193, 8),
(18, 22728, 95),
(18, 30005, 25),
(18, 33945, 11),
(18, 35588, 50),
(18, 35596, 10),
(18, 37109, 4),
(9, 284, 1),
(9, 676, 2),
(9, 3039, 4),
(9, 6499, 4),
(9, 10311, 75),
(9, 11444, 80),
(9, 16125, 1),
(9, 22728, 95),
(9, 23373, 29),
(9, 23375, 500),
(9, 40530, 1),
(9, 40531, 1),
(9, 40532, 2),
(9, 40534, 1),
(9, 40535, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_storage`
--

CREATE TABLE `player_storage` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `key` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `value` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `player_storage`
--

INSERT INTO `player_storage` (`player_id`, `key`, `value`) VALUES
(9, 0, 1),
(9, 6000, 1682385410),
(9, 7212, 1682386502),
(9, 7213, 1682300029),
(9, 8589, 1),
(9, 10000, 0),
(9, 10001, 0),
(9, 10002, 0),
(9, 10003, 0),
(9, 10004, 0),
(9, 10005, 0),
(9, 12149, 0),
(9, 12330, 1),
(9, 12332, 13),
(9, 12333, 3),
(9, 12450, 6),
(9, 13412, 1682520901),
(9, 13413, 1682693700),
(9, 13414, 4),
(9, 14897, 6),
(9, 14898, 0),
(9, 14899, 1682610901),
(9, 14903, 0),
(9, 17101, 0),
(9, 20000, 18),
(9, 20001, 4764),
(9, 20002, 1),
(9, 20067, 12),
(9, 28800, 8),
(9, 30000, 1682521217),
(9, 30020, 1),
(9, 30026, 1681868655),
(9, 30029, 0),
(9, 30051, 1682641584),
(9, 30057, 1),
(9, 30058, 1),
(9, 32943, 1),
(9, 38412, 10),
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
(9, 44956, 1),
(9, 44957, 1),
(9, 44958, 1682130271),
(9, 45751, 1),
(9, 45752, 16),
(9, 46001, 1),
(9, 46002, 1),
(9, 46003, 1),
(9, 46004, 1),
(9, 46005, 1),
(9, 46006, 1),
(9, 46007, 1),
(9, 46008, 1),
(9, 46309, 1),
(9, 46402, 1),
(9, 46403, 1),
(9, 46404, 1),
(9, 47402, 1),
(9, 47403, 1),
(9, 47512, 1),
(9, 47514, 1),
(9, 47601, 1),
(9, 48900, 100),
(9, 48901, 100),
(9, 50043, 1),
(9, 50080, 10),
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
(9, 50203, 1),
(9, 50210, 1),
(9, 50225, 1),
(9, 50226, 1),
(9, 50230, 1),
(9, 50231, 1),
(9, 50240, 1),
(9, 50245, 1),
(9, 50250, 1),
(9, 50251, 1),
(9, 50252, 1),
(9, 50255, 1),
(9, 50256, 1),
(9, 50257, 1),
(9, 50258, 1),
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
(9, 50630, 1),
(9, 50631, 2),
(9, 50632, 2),
(9, 50633, 2),
(9, 50634, 3),
(9, 50640, 1),
(9, 50641, 3),
(9, 50642, 3),
(9, 50643, 3),
(9, 50660, 23),
(9, 50662, 5),
(9, 50663, 2),
(9, 50672, 1440),
(9, 50699, 2),
(9, 50700, 2),
(9, 50701, 2),
(9, 50850, 1),
(9, 50852, 3000),
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
(9, 51140, 1),
(9, 51141, 3),
(9, 51142, 3),
(9, 51143, 3),
(9, 51160, 12),
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
(9, 51340, 1),
(9, 51341, 2),
(9, 51342, 2),
(9, 51343, 12),
(9, 51394, 8),
(9, 51396, 4),
(9, 51397, 2),
(9, 51398, 1),
(9, 51450, 1),
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
(9, 51712, 1),
(9, 52146, 2),
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
(9, 65000, 1),
(9, 74861, 0),
(9, 77124, 1682690844),
(9, 81056, 0),
(9, 81057, 1),
(9, 97814, 6),
(9, 100157, 1),
(9, 190006, 0),
(9, 300003, 1),
(9, 515206, 1),
(9, 515207, 2),
(9, 515208, 3),
(9, 515209, 3),
(9, 545484, 1682378899),
(9, 891642, 0),
(9, 10001001, 103612416),
(9, 10001002, 103677952),
(9, 10001003, 9175043),
(9, 10001004, 8650755),
(9, 10001005, 9240579),
(9, 10001006, 8716291),
(9, 10001007, 9306115),
(9, 10001008, 8781827),
(9, 10001009, 9633795),
(9, 10001010, 9371651),
(9, 10001011, 9699331),
(9, 10001012, 9437187),
(9, 10001013, 8912899),
(9, 10001014, 8388611),
(9, 10001015, 8978435),
(9, 10001016, 8454147),
(9, 10001017, 9109507),
(9, 10001018, 8585219),
(9, 10001019, 8519681),
(9, 10001020, 9043969),
(9, 10002011, 2),
(9, 61305026, 889),
(9, 61305034, 18),
(9, 61305035, 231),
(9, 61305037, 3),
(9, 61305201, 4),
(9, 61305203, 4),
(9, 61305205, 2),
(9, 61305207, 2),
(9, 61305210, 2),
(9, 61305229, 2),
(9, 61305251, 6),
(9, 61305289, 15),
(9, 61305291, 1),
(9, 61305295, 3),
(9, 61305300, 2),
(9, 61305301, 2),
(9, 61305302, 2),
(9, 61305303, 2),
(9, 61305304, 2),
(9, 61305305, 2),
(9, 61305306, 2),
(9, 61305314, 51),
(9, 61305338, 2),
(9, 61305418, 2),
(9, 61305420, 2),
(9, 61305424, 2),
(9, 61305425, 2),
(9, 61305426, 4),
(9, 61305430, 2),
(9, 61305431, 4),
(9, 61305432, 2),
(9, 61305435, 2),
(9, 61305436, 2),
(9, 61305440, 2),
(9, 61305459, 2),
(9, 61305461, 69),
(9, 61305465, 37),
(9, 61305466, 2),
(9, 61305476, 2),
(9, 61305477, 2),
(9, 61305478, 2),
(9, 61305519, 30),
(9, 61305629, 4),
(9, 61305632, 3),
(9, 61305635, 2),
(9, 61305636, 2),
(9, 61305638, 2),
(9, 61305639, 2),
(9, 61305640, 2),
(9, 61305642, 2),
(9, 61305713, 2),
(9, 61305736, 2),
(9, 61305763, 4),
(9, 61305764, 2),
(9, 61305900, 1),
(9, 61305964, 2),
(9, 61305966, 2),
(9, 61305967, 2),
(9, 61305970, 4),
(9, 61305972, 2),
(9, 61305987, 2),
(9, 61306011, 2),
(9, 61306134, 6),
(9, 61306149, 2),
(9, 61306304, 2),
(9, 61306576, 2),
(9, 61306624, 2),
(9, 61306637, 10),
(9, 61306646, 3),
(9, 61306647, 3),
(9, 61306695, 2),
(9, 61306696, 2),
(9, 61306697, 2),
(9, 61306698, 2),
(9, 61306699, 2),
(9, 61306728, 30),
(9, 61306729, 36),
(9, 61306730, 96),
(9, 61306731, 21),
(9, 61306733, 48),
(9, 61306758, 3),
(9, 61306824, 5),
(9, 61306865, 5),
(9, 61306926, 3),
(9, 61306930, 3),
(9, 61306932, 3),
(9, 61306938, 6),
(9, 61306940, 3),
(9, 61306949, 12),
(9, 61306982, 2),
(9, 61307114, 4),
(9, 61308333, 3),
(9, 61308335, 3),
(9, 61308336, 3),
(10, 0, 1681849834),
(10, 6000, 1681870392),
(10, 7212, 1682383503),
(10, 7213, 1682383450),
(10, 8589, 1),
(10, 10107, 1674674063),
(10, 10108, 97),
(10, 10109, 2),
(10, 12149, 0),
(10, 13412, 1675176900),
(10, 13413, 1682348115),
(10, 13414, 4),
(10, 14897, 5),
(10, 14898, 0),
(10, 14899, 1675266900),
(10, 14903, 0),
(10, 15000, 1000),
(10, 17101, 0),
(10, 20000, 4),
(10, 20001, 4342),
(10, 20067, 565),
(10, 30000, 1677519080),
(10, 30020, 1),
(10, 30023, 1),
(10, 30026, 1682028459),
(10, 30029, 0),
(10, 30051, 1682386926),
(10, 30057, 1),
(10, 30058, 1),
(10, 38412, 563),
(10, 44958, 1675083810),
(10, 46001, 1),
(10, 46002, 1),
(10, 48900, 0),
(10, 48901, 0),
(10, 51000, 1),
(10, 74123, 20),
(10, 74861, 0),
(10, 75148, 1677510415),
(10, 77124, 1681857298),
(10, 81056, 0),
(10, 81057, 1),
(10, 91143, 1),
(10, 891642, 0),
(10, 998899, 1),
(10, 10001001, 21233667),
(10, 10001002, 21299203),
(10, 10001003, 8519682),
(10, 10001004, 9043970),
(10, 10003001, 65142784),
(10, 61305022, 9),
(10, 61305026, 39),
(10, 61305035, 37),
(10, 61305037, 1),
(10, 61305073, 21),
(10, 61305121, 57),
(10, 61305251, 24),
(10, 61305290, 4),
(10, 61305296, 3),
(10, 61305317, 39),
(10, 61305459, 4),
(10, 61305570, 6),
(10, 61306646, 3),
(10, 61306647, 3),
(10, 61306938, 9),
(10, 61308333, 2),
(10, 61308335, 3),
(10, 61308336, 2),
(10, 61308340, 1),
(11, 0, 0),
(11, 6000, 1677189007),
(11, 7212, 1677272135),
(11, 7213, 1677426409),
(11, 13412, 1677509701),
(11, 13413, 1682002500),
(11, 13414, 4),
(11, 14897, 1),
(11, 14898, 0),
(11, 14899, 1677599701),
(11, 14903, 0),
(11, 15000, 1000),
(11, 17101, 0),
(11, 20000, 58),
(11, 20001, 2769),
(11, 20067, 2),
(11, 30000, 1677278041),
(11, 30023, 1),
(11, 30029, 0),
(11, 30051, 1677503255),
(11, 30057, 1),
(11, 30058, 1),
(11, 38412, 0),
(11, 44958, 1677192885),
(11, 48900, 100),
(11, 48901, 100),
(11, 81056, 0),
(11, 81057, 1),
(11, 97814, 26),
(11, 891642, 0),
(11, 10001001, 40566787),
(11, 10001002, 28246019),
(11, 10001003, 40632323),
(11, 10001004, 21233667),
(11, 10001005, 21299203),
(11, 10003001, 65011712),
(11, 61305022, 54),
(11, 61305026, 50),
(11, 61305035, 1),
(11, 61305251, 40),
(12, 0, 1),
(12, 6000, 1677585456),
(12, 13413, 1682348115),
(12, 13414, 4),
(12, 14898, 0),
(12, 14903, 0),
(12, 15000, 50),
(12, 17101, 0),
(12, 20000, 43),
(12, 20001, 947),
(12, 30000, 1682381477),
(12, 30023, 1),
(12, 30029, 0),
(12, 30051, 1682384194),
(12, 30057, 1),
(12, 30058, 1),
(12, 48900, 0),
(12, 48901, 0),
(12, 81056, 0),
(12, 81057, 1),
(12, 891642, 0),
(12, 61305022, 3),
(12, 61305026, 6),
(12, 61305034, 1),
(12, 61305251, 3),
(12, 61305385, 1),
(16, 0, 1),
(16, 12330, 1),
(16, 12332, 13),
(16, 12333, 3),
(16, 12450, 6),
(16, 13413, 1682088901),
(16, 13414, 4),
(16, 14898, 0),
(16, 14903, 1),
(16, 17101, 0),
(16, 20000, 29),
(16, 20001, 10),
(16, 20002, 1),
(16, 30023, 0),
(16, 30029, 0),
(16, 30051, 1682109900),
(16, 30057, 1),
(16, 30058, 1),
(16, 42701, 29),
(16, 42703, 3),
(16, 42704, 4),
(16, 42705, 1),
(16, 42706, 1),
(16, 42707, 1),
(16, 42708, 3),
(16, 42709, 2),
(16, 42710, 2),
(16, 42711, 1),
(16, 42712, 1),
(16, 42713, 1),
(16, 42715, 1),
(16, 42716, 1),
(16, 42717, 5),
(16, 42718, 2),
(16, 42720, 2),
(16, 42721, 3),
(16, 42724, 2),
(16, 42725, 1),
(16, 42729, 12),
(16, 44956, 1),
(16, 44957, 1),
(16, 45751, 1),
(16, 45752, 16),
(16, 46309, 1),
(16, 46402, 1),
(16, 46403, 1),
(16, 46404, 1),
(16, 47402, 1),
(16, 47403, 1),
(16, 47512, 1),
(16, 47514, 1),
(16, 47601, 1),
(16, 48900, 0),
(16, 48901, 0),
(16, 50043, 1),
(16, 50080, 1),
(16, 50081, 10),
(16, 50082, 2),
(16, 50083, 2),
(16, 50090, 10),
(16, 50091, 2),
(16, 50092, 2),
(16, 50115, 10),
(16, 50116, 3),
(16, 50117, 2),
(16, 50118, 2),
(16, 50139, 10),
(16, 50141, 10),
(16, 50143, 30),
(16, 50200, 7),
(16, 50203, 1),
(16, 50210, 1),
(16, 50225, 1),
(16, 50226, 1),
(16, 50230, 1),
(16, 50231, 1),
(16, 50240, 1),
(16, 50245, 1),
(16, 50250, 1),
(16, 50251, 1),
(16, 50252, 1),
(16, 50255, 1),
(16, 50256, 1),
(16, 50257, 1),
(16, 50258, 1),
(16, 50470, 1),
(16, 50471, 1),
(16, 50472, 1),
(16, 50473, 1),
(16, 50474, 1),
(16, 50475, 1),
(16, 50486, 1),
(16, 50488, 1),
(16, 50490, 1),
(16, 50492, 1),
(16, 50494, 1),
(16, 50496, 1),
(16, 50498, 1),
(16, 50501, 1),
(16, 50506, 1),
(16, 50530, 61),
(16, 50541, 2),
(16, 50600, 2),
(16, 50601, 5),
(16, 50602, 3),
(16, 50603, 3),
(16, 50604, 3),
(16, 50605, 2),
(16, 50606, 1),
(16, 50620, 2),
(16, 50630, 1),
(16, 50631, 2),
(16, 50632, 2),
(16, 50633, 2),
(16, 50634, 3),
(16, 50640, 1),
(16, 50641, 3),
(16, 50642, 3),
(16, 50643, 3),
(16, 50660, 23),
(16, 50662, 5),
(16, 50663, 2),
(16, 50672, 1440),
(16, 50699, 2),
(16, 50700, 2),
(16, 50701, 2),
(16, 50850, 1),
(16, 50852, 3000),
(16, 51060, 1),
(16, 51061, 18),
(16, 51110, 25),
(16, 51111, 7),
(16, 51112, 3),
(16, 51113, 6),
(16, 51114, 3),
(16, 51115, 3),
(16, 51116, 3),
(16, 51117, 1),
(16, 51120, 1),
(16, 51121, 1),
(16, 51123, 1),
(16, 51124, 1),
(16, 51125, 1),
(16, 51140, 1),
(16, 51141, 3),
(16, 51142, 3),
(16, 51143, 3),
(16, 51160, 12),
(16, 51161, 3),
(16, 51162, 5),
(16, 51163, 3),
(16, 51164, 2),
(16, 51165, 6),
(16, 51166, 8),
(16, 51167, 3),
(16, 51168, 4),
(16, 51169, 2),
(16, 51170, 2),
(16, 51171, 2),
(16, 51172, 6),
(16, 51210, 51),
(16, 51211, 6),
(16, 51212, 8),
(16, 51213, 6),
(16, 51214, 6),
(16, 51215, 8),
(16, 51216, 5),
(16, 51217, 5),
(16, 51218, 4),
(16, 51219, 2),
(16, 51220, 1),
(16, 51221, 1),
(16, 51222, 1),
(16, 51223, 1),
(16, 51224, 1),
(16, 51225, 1),
(16, 51228, 1),
(16, 51229, 1),
(16, 51231, 1),
(16, 51232, 1),
(16, 51234, 1),
(16, 51235, 1),
(16, 51236, 1),
(16, 51237, 1),
(16, 51238, 1),
(16, 51239, 1),
(16, 51242, 1),
(16, 51243, 1),
(16, 51244, 1),
(16, 51247, 1),
(16, 51248, 1),
(16, 51262, 3),
(16, 51263, 5),
(16, 51264, 3),
(16, 51266, 3),
(16, 51267, 1),
(16, 51268, 1),
(16, 51269, 1),
(16, 51300, 29),
(16, 51301, 3),
(16, 51302, 3),
(16, 51303, 3),
(16, 51304, 3),
(16, 51305, 3),
(16, 51306, 4),
(16, 51307, 6),
(16, 51308, 2),
(16, 51309, 2),
(16, 51310, 1),
(16, 51340, 1),
(16, 51341, 2),
(16, 51342, 2),
(16, 51343, 12),
(16, 51394, 8),
(16, 51396, 4),
(16, 51397, 2),
(16, 51398, 1),
(16, 51450, 1),
(16, 51453, 1),
(16, 51480, 1),
(16, 51486, 1),
(16, 51540, 3),
(16, 51541, 3),
(16, 51542, 2),
(16, 51543, 1),
(16, 51544, 3),
(16, 51545, 5),
(16, 51546, 1),
(16, 51547, 1),
(16, 51548, 2),
(16, 51549, 1),
(16, 51550, 4),
(16, 51590, 1),
(16, 51591, 1),
(16, 51592, 1),
(16, 51593, 1),
(16, 51594, 1),
(16, 51595, 1),
(16, 51596, 1),
(16, 51597, 1),
(16, 51598, 1),
(16, 51712, 1),
(16, 52146, 2),
(16, 55047, 1),
(16, 55136, 1),
(16, 55137, 1),
(16, 55145, 21),
(16, 55146, 2),
(16, 55148, 6),
(16, 55154, 1),
(16, 55226, 1),
(16, 55227, 1),
(16, 55230, 1),
(16, 55233, 1),
(16, 56395, 2),
(16, 81056, 0),
(16, 81057, 1),
(16, 100157, 1),
(16, 515206, 1),
(16, 515207, 2),
(16, 515208, 3),
(16, 515209, 3),
(16, 61305026, 18),
(16, 61305251, 9),
(17, 0, 1),
(17, 6000, 1682556308),
(17, 7213, 1682383507),
(17, 7957, 1),
(17, 8892, 1),
(17, 12330, 1),
(17, 12332, 13),
(17, 12333, 3),
(17, 12450, 6),
(17, 13412, 1682348115),
(17, 13413, 1682520901),
(17, 13414, 4),
(17, 14897, 2),
(17, 14898, 0),
(17, 14899, 1682438115),
(17, 14903, 0),
(17, 15000, 800),
(17, 17101, 0),
(17, 20000, 1),
(17, 20001, 701),
(17, 20002, 1),
(17, 20067, 296),
(17, 30000, 1682459397),
(17, 30018, 1),
(17, 30020, 1),
(17, 30029, 0),
(17, 30051, 1682554087),
(17, 30057, 1),
(17, 30058, 1),
(17, 38412, 294),
(17, 42701, 29),
(17, 42703, 3),
(17, 42704, 4),
(17, 42705, 1),
(17, 42706, 1),
(17, 42707, 1),
(17, 42708, 3),
(17, 42709, 2),
(17, 42710, 2),
(17, 42711, 1),
(17, 42712, 1),
(17, 42713, 1),
(17, 42715, 1),
(17, 42716, 1),
(17, 42717, 5),
(17, 42718, 2),
(17, 42720, 2),
(17, 42721, 3),
(17, 42724, 2),
(17, 42725, 1),
(17, 42729, 12),
(17, 44956, 1),
(17, 44957, 1),
(17, 44958, 1682130254),
(17, 45751, 1),
(17, 45752, 16),
(17, 46001, 1),
(17, 46002, 1),
(17, 46309, 1),
(17, 46402, 1),
(17, 46403, 1),
(17, 46404, 1),
(17, 47402, 1),
(17, 47403, 1),
(17, 47512, 1),
(17, 47514, 1),
(17, 47601, 1),
(17, 48900, 28),
(17, 48901, 90),
(17, 50043, 1),
(17, 50080, 1),
(17, 50081, 10),
(17, 50082, 2),
(17, 50083, 2),
(17, 50090, 10),
(17, 50091, 2),
(17, 50092, 2),
(17, 50115, 10),
(17, 50116, 3),
(17, 50117, 2),
(17, 50118, 2),
(17, 50139, 10),
(17, 50141, 10),
(17, 50143, 30),
(17, 50200, 7),
(17, 50203, 1),
(17, 50210, 1),
(17, 50225, 1),
(17, 50226, 1),
(17, 50230, 1),
(17, 50231, 1),
(17, 50240, 1),
(17, 50245, 1),
(17, 50250, 1),
(17, 50251, 1),
(17, 50252, 1),
(17, 50255, 1),
(17, 50256, 1),
(17, 50257, 1),
(17, 50258, 1),
(17, 50470, 1),
(17, 50471, 1),
(17, 50472, 1),
(17, 50473, 1),
(17, 50474, 1),
(17, 50475, 1),
(17, 50486, 1),
(17, 50488, 1),
(17, 50490, 1),
(17, 50492, 1),
(17, 50494, 1),
(17, 50496, 1),
(17, 50498, 1),
(17, 50501, 1),
(17, 50506, 1),
(17, 50530, 61),
(17, 50541, 2),
(17, 50600, 2),
(17, 50601, 5),
(17, 50602, 3),
(17, 50603, 3),
(17, 50604, 3),
(17, 50605, 2),
(17, 50606, 1),
(17, 50620, 2),
(17, 50630, 1),
(17, 50631, 2),
(17, 50632, 2),
(17, 50633, 2),
(17, 50634, 3),
(17, 50640, 1),
(17, 50641, 3),
(17, 50642, 3),
(17, 50643, 3),
(17, 50660, 23),
(17, 50662, 5),
(17, 50663, 2),
(17, 50672, 1440),
(17, 50699, 2),
(17, 50700, 2),
(17, 50701, 2),
(17, 50850, 1),
(17, 50852, 3000),
(17, 51000, 1),
(17, 51052, 0),
(17, 51060, 1),
(17, 51061, 18),
(17, 51110, 25),
(17, 51111, 7),
(17, 51112, 3),
(17, 51113, 6),
(17, 51114, 3),
(17, 51115, 3),
(17, 51116, 3),
(17, 51117, 1),
(17, 51120, 1),
(17, 51121, 1),
(17, 51123, 1),
(17, 51124, 1),
(17, 51125, 1),
(17, 51140, 1),
(17, 51141, 3),
(17, 51142, 3),
(17, 51143, 3),
(17, 51160, 12),
(17, 51161, 3),
(17, 51162, 5),
(17, 51163, 3),
(17, 51164, 2),
(17, 51165, 6),
(17, 51166, 8),
(17, 51167, 3),
(17, 51168, 4),
(17, 51169, 2),
(17, 51170, 2),
(17, 51171, 2),
(17, 51172, 6),
(17, 51210, 51),
(17, 51211, 6),
(17, 51212, 8),
(17, 51213, 6),
(17, 51214, 6),
(17, 51215, 8),
(17, 51216, 5),
(17, 51217, 5),
(17, 51218, 4),
(17, 51219, 2),
(17, 51220, 1),
(17, 51221, 1),
(17, 51222, 1),
(17, 51223, 1),
(17, 51224, 1),
(17, 51225, 1),
(17, 51228, 1),
(17, 51229, 1),
(17, 51231, 1),
(17, 51232, 1),
(17, 51234, 1),
(17, 51235, 1),
(17, 51236, 1),
(17, 51237, 1),
(17, 51238, 1),
(17, 51239, 1),
(17, 51242, 1),
(17, 51243, 1),
(17, 51244, 1),
(17, 51247, 1),
(17, 51248, 1),
(17, 51262, 3),
(17, 51263, 5),
(17, 51264, 3),
(17, 51266, 3),
(17, 51267, 1),
(17, 51268, 1),
(17, 51269, 1),
(17, 51300, 29),
(17, 51301, 3),
(17, 51302, 3),
(17, 51303, 3),
(17, 51304, 3),
(17, 51305, 3),
(17, 51306, 4),
(17, 51307, 6),
(17, 51308, 2),
(17, 51309, 2),
(17, 51310, 1),
(17, 51340, 1),
(17, 51341, 2),
(17, 51342, 2),
(17, 51343, 12),
(17, 51394, 8),
(17, 51396, 4),
(17, 51397, 2),
(17, 51398, 1),
(17, 51450, 1),
(17, 51453, 1),
(17, 51480, 1),
(17, 51486, 1),
(17, 51540, 3),
(17, 51541, 3),
(17, 51542, 2),
(17, 51543, 1),
(17, 51544, 3),
(17, 51545, 5),
(17, 51546, 1),
(17, 51547, 1),
(17, 51548, 2),
(17, 51549, 1),
(17, 51550, 4),
(17, 51590, 1),
(17, 51591, 1),
(17, 51592, 1),
(17, 51593, 1),
(17, 51594, 1),
(17, 51595, 1),
(17, 51596, 1),
(17, 51597, 1),
(17, 51598, 1),
(17, 51712, 1),
(17, 52146, 2),
(17, 54651, 1),
(17, 54652, 1),
(17, 55047, 1),
(17, 55136, 1),
(17, 55137, 1),
(17, 55145, 21),
(17, 55146, 2),
(17, 55148, 6),
(17, 55154, 1),
(17, 55226, 1),
(17, 55227, 1),
(17, 55230, 1),
(17, 55233, 1),
(17, 56395, 2),
(17, 77124, 1682458230),
(17, 81056, 0),
(17, 81057, 1),
(17, 97150, 1682293152),
(17, 100157, 1),
(17, 300003, 1),
(17, 515206, 1),
(17, 515207, 2),
(17, 515208, 3),
(17, 515209, 3),
(17, 891642, 0),
(17, 10001001, 77725699),
(17, 10001002, 77791235),
(17, 10001003, 49807363),
(17, 10001004, 49741827),
(17, 10001005, 73859075),
(17, 10001006, 73924611),
(17, 10001007, 63700992),
(17, 10001008, 63766528),
(17, 10001009, 17694721),
(17, 10001010, 17891329),
(17, 10001011, 55836673),
(17, 10001012, 55902209),
(17, 10001013, 40566787),
(17, 10001014, 40632323),
(17, 10001015, 8519682),
(17, 10001016, 9043970),
(17, 10002002, 524288),
(17, 10002003, 33554432),
(17, 10002004, 2097152),
(17, 10002011, 88),
(17, 61305009, 126),
(17, 61305022, 60),
(17, 61305026, 84),
(17, 61305034, 294),
(17, 61305035, 75),
(17, 61305039, 234),
(17, 61305041, 12),
(17, 61305043, 24),
(17, 61305055, 12),
(17, 61305065, 120),
(17, 61305073, 489),
(17, 61305099, 9),
(17, 61305118, 21),
(17, 61305220, 15),
(17, 61305231, 14),
(17, 61305251, 51),
(17, 61305255, 12),
(17, 61305281, 21),
(17, 61305282, 42),
(17, 61305283, 12),
(17, 61305284, 60),
(17, 61305285, 1503),
(17, 61305286, 45),
(17, 61305287, 1737),
(17, 61305289, 159),
(17, 61305291, 57),
(17, 61305294, 105),
(17, 61305295, 345),
(17, 61305299, 3),
(17, 61305313, 24),
(17, 61305314, 27),
(17, 61305385, 147),
(17, 61305386, 111),
(17, 61305389, 3),
(17, 61305391, 15),
(17, 61305459, 10),
(17, 61305461, 171),
(17, 61305465, 1839),
(17, 61305503, 15),
(17, 61305518, 12),
(17, 61305519, 1647),
(17, 61305520, 30),
(17, 61305523, 12),
(17, 61305533, 48),
(17, 61305570, 6),
(17, 61305643, 36),
(17, 61305918, 63),
(17, 61306134, 1614),
(17, 61306135, 735),
(17, 61306143, 3),
(17, 61306144, 6),
(17, 61306197, 135),
(17, 61306548, 9),
(17, 61306549, 9),
(17, 61306619, 54),
(17, 61306620, 234),
(17, 61306621, 114),
(17, 61306622, 3),
(17, 61306637, 147),
(17, 61306728, 93),
(17, 61306729, 72),
(17, 61306730, 231),
(17, 61306731, 192),
(17, 61306733, 210),
(17, 61306737, 15),
(17, 61306824, 261),
(17, 61306930, 39),
(17, 61306933, 9),
(17, 61306938, 15),
(17, 61307024, 39),
(17, 61307036, 48),
(17, 61307037, 54),
(17, 61307051, 225),
(18, 0, 1),
(18, 6000, 1682648744),
(18, 7212, 1682365958),
(18, 7213, 1682300355),
(18, 7957, 1),
(18, 8892, 1),
(18, 12149, 0),
(18, 12330, 1),
(18, 12332, 13),
(18, 12333, 3),
(18, 12450, 6),
(18, 13412, 1682520901),
(18, 13413, 1682348115),
(18, 13414, 4),
(18, 14897, 4),
(18, 14898, 3),
(18, 14899, 1682610901),
(18, 15000, 800),
(18, 17101, 0),
(18, 20000, 59),
(18, 20001, 2157),
(18, 20002, 1),
(18, 20067, 3258),
(18, 28900, 64),
(18, 30000, 1682691089),
(18, 30018, 1),
(18, 30020, 1),
(18, 30023, 0),
(18, 30026, 1682515816),
(18, 30029, 0),
(18, 30051, 1682542733),
(18, 30057, 1),
(18, 30058, 1),
(18, 38412, 3256),
(18, 42701, 29),
(18, 42703, 3),
(18, 42704, 4),
(18, 42705, 1),
(18, 42706, 1),
(18, 42707, 1),
(18, 42708, 3),
(18, 42709, 2),
(18, 42710, 2),
(18, 42711, 1),
(18, 42712, 1),
(18, 42713, 1),
(18, 42715, 1),
(18, 42716, 1),
(18, 42717, 5),
(18, 42718, 2),
(18, 42720, 2),
(18, 42721, 3),
(18, 42724, 2),
(18, 42725, 1),
(18, 42729, 12),
(18, 44956, 1),
(18, 44957, 1),
(18, 44958, 1682130159),
(18, 45751, 1),
(18, 45752, 16),
(18, 46001, 1),
(18, 46002, 1),
(18, 46003, 1),
(18, 46004, 1),
(18, 46005, 1),
(18, 46006, 1),
(18, 46007, 1),
(18, 46008, 1),
(18, 46009, 1),
(18, 46309, 1),
(18, 46402, 1),
(18, 46403, 1),
(18, 46404, 1),
(18, 47402, 1),
(18, 47403, 1),
(18, 47512, 1),
(18, 47514, 1),
(18, 47601, 1),
(18, 48900, 30),
(18, 48901, 37),
(18, 50043, 1),
(18, 50080, 1),
(18, 50081, 10),
(18, 50082, 2),
(18, 50083, 2),
(18, 50090, 10),
(18, 50091, 2),
(18, 50092, 2),
(18, 50115, 10),
(18, 50116, 3),
(18, 50117, 2),
(18, 50118, 2),
(18, 50139, 10),
(18, 50141, 10),
(18, 50143, 30),
(18, 50200, 7),
(18, 50203, 1),
(18, 50210, 1),
(18, 50225, 1),
(18, 50226, 1),
(18, 50230, 1),
(18, 50231, 1),
(18, 50240, 1),
(18, 50245, 1),
(18, 50250, 1),
(18, 50251, 1),
(18, 50252, 1),
(18, 50255, 1),
(18, 50256, 1),
(18, 50257, 1),
(18, 50258, 1),
(18, 50470, 1),
(18, 50471, 1),
(18, 50472, 1),
(18, 50473, 1),
(18, 50474, 1),
(18, 50475, 1),
(18, 50486, 1),
(18, 50488, 1),
(18, 50490, 1),
(18, 50492, 1),
(18, 50494, 1),
(18, 50496, 1),
(18, 50498, 1),
(18, 50501, 1),
(18, 50506, 1),
(18, 50530, 61),
(18, 50541, 2),
(18, 50600, 2),
(18, 50601, 5),
(18, 50602, 3),
(18, 50603, 3),
(18, 50604, 3),
(18, 50605, 2),
(18, 50606, 1),
(18, 50620, 2),
(18, 50630, 1),
(18, 50631, 2),
(18, 50632, 2),
(18, 50633, 2),
(18, 50634, 3),
(18, 50640, 1),
(18, 50641, 3),
(18, 50642, 3),
(18, 50643, 3),
(18, 50660, 23),
(18, 50662, 5),
(18, 50663, 2),
(18, 50672, 1440),
(18, 50699, 2),
(18, 50700, 2),
(18, 50701, 2),
(18, 50850, 1),
(18, 50852, 3000),
(18, 50997, 1),
(18, 51000, 1),
(18, 51002, 1),
(18, 51003, 1),
(18, 51052, 0),
(18, 51060, 1),
(18, 51061, 18),
(18, 51110, 25),
(18, 51111, 7),
(18, 51112, 3),
(18, 51113, 6),
(18, 51114, 3),
(18, 51115, 3),
(18, 51116, 3),
(18, 51117, 1),
(18, 51120, 1),
(18, 51121, 1),
(18, 51123, 1),
(18, 51124, 1),
(18, 51125, 1),
(18, 51140, 1),
(18, 51141, 3),
(18, 51142, 3),
(18, 51143, 3),
(18, 51160, 12),
(18, 51161, 3),
(18, 51162, 5),
(18, 51163, 3),
(18, 51164, 2),
(18, 51165, 6),
(18, 51166, 8),
(18, 51167, 3),
(18, 51168, 4),
(18, 51169, 2),
(18, 51170, 2),
(18, 51171, 2),
(18, 51172, 6),
(18, 51210, 51),
(18, 51211, 6),
(18, 51212, 8),
(18, 51213, 6),
(18, 51214, 6),
(18, 51215, 8),
(18, 51216, 5),
(18, 51217, 5),
(18, 51218, 4),
(18, 51219, 2),
(18, 51220, 1),
(18, 51221, 1),
(18, 51222, 1),
(18, 51223, 1),
(18, 51224, 1),
(18, 51225, 1),
(18, 51228, 1),
(18, 51229, 1),
(18, 51231, 1),
(18, 51232, 1),
(18, 51234, 1),
(18, 51235, 1),
(18, 51236, 1),
(18, 51237, 1),
(18, 51238, 1),
(18, 51239, 1),
(18, 51242, 1),
(18, 51243, 1),
(18, 51244, 1),
(18, 51247, 1),
(18, 51248, 1),
(18, 51262, 3),
(18, 51263, 5),
(18, 51264, 3),
(18, 51266, 3),
(18, 51267, 1),
(18, 51268, 1),
(18, 51269, 1),
(18, 51300, 29),
(18, 51301, 3),
(18, 51302, 3),
(18, 51303, 3),
(18, 51304, 3),
(18, 51305, 3),
(18, 51306, 4),
(18, 51307, 6),
(18, 51308, 2),
(18, 51309, 2),
(18, 51310, 1),
(18, 51340, 1),
(18, 51341, 2),
(18, 51342, 2),
(18, 51343, 12),
(18, 51394, 8),
(18, 51396, 4),
(18, 51397, 2),
(18, 51398, 1),
(18, 51450, 1),
(18, 51453, 1),
(18, 51480, 1),
(18, 51486, 1),
(18, 51540, 3),
(18, 51541, 3),
(18, 51542, 2),
(18, 51543, 1),
(18, 51544, 3),
(18, 51545, 5),
(18, 51546, 1),
(18, 51547, 1),
(18, 51548, 2),
(18, 51549, 1),
(18, 51550, 4),
(18, 51590, 1),
(18, 51591, 1),
(18, 51592, 1),
(18, 51593, 1),
(18, 51594, 1),
(18, 51595, 1),
(18, 51596, 1),
(18, 51597, 1),
(18, 51598, 1),
(18, 51712, 1),
(18, 52146, 2),
(18, 54651, 1),
(18, 54652, 1),
(18, 55047, 1),
(18, 55136, 1),
(18, 55137, 1),
(18, 55145, 21),
(18, 55146, 2),
(18, 55148, 6),
(18, 55154, 1),
(18, 55226, 1),
(18, 55227, 1),
(18, 55230, 1),
(18, 55233, 1),
(18, 56395, 2),
(18, 74861, 0),
(18, 77124, 1682690999),
(18, 81056, 0),
(18, 81057, 1),
(18, 97150, 1682290956),
(18, 100157, 1),
(18, 300003, 1),
(18, 515206, 1),
(18, 515207, 2),
(18, 515208, 3),
(18, 515209, 3),
(18, 545484, 1682517210),
(18, 891642, 0),
(18, 10001001, 63045632),
(18, 10001002, 63111168),
(18, 10001003, 97648641),
(18, 10001004, 97583105),
(18, 10001005, 90636289),
(18, 10001006, 90570753),
(18, 10001007, 40566787),
(18, 10001008, 40632323),
(18, 10001009, 8519683),
(18, 10001010, 9043971),
(18, 10001011, 8650755),
(18, 10001012, 9175043),
(18, 10002003, 16384),
(18, 10002006, 8388608),
(18, 10002011, 77),
(18, 61305005, 12),
(18, 61305006, 3),
(18, 61305008, 3),
(18, 61305009, 6),
(18, 61305022, 24),
(18, 61305024, 9),
(18, 61305025, 3),
(18, 61305026, 99),
(18, 61305029, 6),
(18, 61305034, 69),
(18, 61305035, 93),
(18, 61305037, 3),
(18, 61305039, 72),
(18, 61305041, 18),
(18, 61305043, 69),
(18, 61305049, 3),
(18, 61305051, 75),
(18, 61305059, 9),
(18, 61305060, 3),
(18, 61305073, 114),
(18, 61305079, 15),
(18, 61305080, 60),
(18, 61305083, 48),
(18, 61305099, 6),
(18, 61305118, 6),
(18, 61305120, 3),
(18, 61305220, 165),
(18, 61305231, 14),
(18, 61305251, 60),
(18, 61305255, 30),
(18, 61305281, 27),
(18, 61305282, 48),
(18, 61305283, 18),
(18, 61305284, 87),
(18, 61305285, 855),
(18, 61305286, 39),
(18, 61305287, 1164),
(18, 61305289, 177),
(18, 61305290, 78),
(18, 61305291, 51),
(18, 61305294, 96),
(18, 61305295, 246),
(18, 61305296, 3),
(18, 61305299, 3),
(18, 61305313, 21),
(18, 61305314, 87),
(18, 61305317, 21),
(18, 61305385, 57),
(18, 61305386, 9),
(18, 61305391, 3),
(18, 61305402, 51),
(18, 61305459, 14),
(18, 61305465, 2439),
(18, 61305503, 42),
(18, 61305518, 15),
(18, 61305519, 1260),
(18, 61305520, 39),
(18, 61305521, 6),
(18, 61305523, 54),
(18, 61305533, 90),
(18, 61305643, 36),
(18, 61305918, 165),
(18, 61306134, 1140),
(18, 61306135, 666),
(18, 61306197, 42),
(18, 61306619, 114),
(18, 61306620, 198),
(18, 61306621, 93),
(18, 61306622, 12),
(18, 61306637, 147),
(18, 61306728, 42),
(18, 61306729, 30),
(18, 61306730, 87),
(18, 61306731, 24),
(18, 61306733, 438),
(18, 61306735, 12),
(18, 61306930, 21),
(18, 61306933, 3),
(18, 61306938, 9),
(18, 61306965, 255),
(18, 61306966, 150),
(18, 61307036, 159),
(18, 61307037, 219),
(18, 61307114, 4),
(19, 0, 1),
(19, 6000, 1682375593),
(19, 12330, 1),
(19, 12332, 13),
(19, 12333, 3),
(19, 12450, 6),
(19, 13412, 1682609888),
(19, 13413, 1682609888),
(19, 13414, 4),
(19, 14897, 3),
(19, 14898, 1),
(19, 14899, 1682699888),
(19, 14903, 0),
(19, 15000, 300),
(19, 17101, 0),
(19, 20000, 14),
(19, 20001, 486),
(19, 20002, 1),
(19, 20067, 1338),
(19, 30000, 1682378956),
(19, 30018, 1),
(19, 30029, 0),
(19, 30051, 1682386671),
(19, 30057, 1),
(19, 30058, 1),
(19, 38412, 1336),
(19, 42701, 29),
(19, 42703, 3),
(19, 42704, 4),
(19, 42705, 1),
(19, 42706, 1),
(19, 42707, 1),
(19, 42708, 3),
(19, 42709, 2),
(19, 42710, 2),
(19, 42711, 1),
(19, 42712, 1),
(19, 42713, 1),
(19, 42715, 1),
(19, 42716, 1),
(19, 42717, 5),
(19, 42718, 2),
(19, 42720, 2),
(19, 42721, 3),
(19, 42724, 2),
(19, 42725, 1),
(19, 42729, 12),
(19, 44956, 1),
(19, 44957, 1),
(19, 45751, 1),
(19, 45752, 16),
(19, 46309, 1),
(19, 46402, 1),
(19, 46403, 1),
(19, 46404, 1),
(19, 47402, 1),
(19, 47403, 1),
(19, 47512, 1),
(19, 47514, 1),
(19, 47601, 1),
(19, 48900, 2),
(19, 48901, 0),
(19, 50043, 1),
(19, 50080, 1),
(19, 50081, 10),
(19, 50082, 2),
(19, 50083, 2),
(19, 50090, 10),
(19, 50091, 2),
(19, 50092, 2),
(19, 50115, 10),
(19, 50116, 3),
(19, 50117, 2),
(19, 50118, 2),
(19, 50139, 10),
(19, 50141, 10),
(19, 50143, 30),
(19, 50200, 7),
(19, 50203, 1),
(19, 50210, 1),
(19, 50225, 1),
(19, 50226, 1),
(19, 50230, 1),
(19, 50231, 1),
(19, 50240, 1),
(19, 50245, 1),
(19, 50250, 1),
(19, 50251, 1),
(19, 50252, 1),
(19, 50255, 1),
(19, 50256, 1),
(19, 50257, 1),
(19, 50258, 1),
(19, 50470, 1),
(19, 50471, 1),
(19, 50472, 1),
(19, 50473, 1),
(19, 50474, 1),
(19, 50475, 1),
(19, 50486, 1),
(19, 50488, 1),
(19, 50490, 1),
(19, 50492, 1),
(19, 50494, 1),
(19, 50496, 1),
(19, 50498, 1),
(19, 50501, 1),
(19, 50506, 1),
(19, 50530, 61),
(19, 50541, 2),
(19, 50600, 2),
(19, 50601, 5),
(19, 50602, 3),
(19, 50603, 3),
(19, 50604, 3),
(19, 50605, 2),
(19, 50606, 1),
(19, 50620, 2),
(19, 50630, 1),
(19, 50631, 2),
(19, 50632, 2),
(19, 50633, 2),
(19, 50634, 3),
(19, 50640, 1),
(19, 50641, 3),
(19, 50642, 3),
(19, 50643, 3),
(19, 50660, 23),
(19, 50662, 5),
(19, 50663, 2),
(19, 50672, 1440),
(19, 50699, 2),
(19, 50700, 2),
(19, 50701, 2),
(19, 50850, 1),
(19, 50852, 3000),
(19, 51052, 0),
(19, 51060, 1),
(19, 51061, 18),
(19, 51110, 25),
(19, 51111, 7),
(19, 51112, 3),
(19, 51113, 6),
(19, 51114, 3),
(19, 51115, 3),
(19, 51116, 3),
(19, 51117, 1),
(19, 51120, 1),
(19, 51121, 1),
(19, 51123, 1),
(19, 51124, 1),
(19, 51125, 1),
(19, 51140, 1),
(19, 51141, 3),
(19, 51142, 3),
(19, 51143, 3),
(19, 51160, 12),
(19, 51161, 3),
(19, 51162, 5),
(19, 51163, 3),
(19, 51164, 2),
(19, 51165, 6),
(19, 51166, 8),
(19, 51167, 3),
(19, 51168, 4),
(19, 51169, 2),
(19, 51170, 2),
(19, 51171, 2),
(19, 51172, 6),
(19, 51210, 51),
(19, 51211, 6),
(19, 51212, 8),
(19, 51213, 6),
(19, 51214, 6),
(19, 51215, 8),
(19, 51216, 5),
(19, 51217, 5),
(19, 51218, 4),
(19, 51219, 2),
(19, 51220, 1),
(19, 51221, 1),
(19, 51222, 1),
(19, 51223, 1),
(19, 51224, 1),
(19, 51225, 1),
(19, 51228, 1),
(19, 51229, 1),
(19, 51231, 1),
(19, 51232, 1),
(19, 51234, 1),
(19, 51235, 1),
(19, 51236, 1),
(19, 51237, 1),
(19, 51238, 1),
(19, 51239, 1),
(19, 51242, 1),
(19, 51243, 1),
(19, 51244, 1),
(19, 51247, 1),
(19, 51248, 1),
(19, 51262, 3),
(19, 51263, 5),
(19, 51264, 3),
(19, 51266, 3),
(19, 51267, 1),
(19, 51268, 1),
(19, 51269, 1),
(19, 51300, 29),
(19, 51301, 3),
(19, 51302, 3),
(19, 51303, 3),
(19, 51304, 3),
(19, 51305, 3),
(19, 51306, 4),
(19, 51307, 6),
(19, 51308, 2),
(19, 51309, 2),
(19, 51310, 1),
(19, 51340, 1),
(19, 51341, 2),
(19, 51342, 2),
(19, 51343, 12),
(19, 51394, 8),
(19, 51396, 4),
(19, 51397, 2),
(19, 51398, 1),
(19, 51450, 1),
(19, 51453, 1),
(19, 51480, 1),
(19, 51486, 1),
(19, 51540, 3),
(19, 51541, 3),
(19, 51542, 2),
(19, 51543, 1),
(19, 51544, 3),
(19, 51545, 5),
(19, 51546, 1),
(19, 51547, 1),
(19, 51548, 2),
(19, 51549, 1),
(19, 51550, 4),
(19, 51590, 1),
(19, 51591, 1),
(19, 51592, 1),
(19, 51593, 1),
(19, 51594, 1),
(19, 51595, 1),
(19, 51596, 1),
(19, 51597, 1),
(19, 51598, 1),
(19, 51712, 1),
(19, 52146, 2),
(19, 55047, 1),
(19, 55136, 1),
(19, 55137, 1),
(19, 55145, 21),
(19, 55146, 2),
(19, 55148, 6),
(19, 55154, 1),
(19, 55226, 1),
(19, 55227, 1),
(19, 55230, 1),
(19, 55233, 1),
(19, 56395, 2),
(19, 77124, 1682356087),
(19, 81056, 0),
(19, 81057, 1),
(19, 97150, 1682300488),
(19, 100157, 1),
(19, 515206, 1),
(19, 515207, 2),
(19, 515208, 3),
(19, 515209, 3),
(19, 891642, 0),
(19, 10001001, 73859075),
(19, 10001002, 73924611),
(19, 10002003, 16384),
(19, 10002004, 1048576),
(19, 10002011, 77),
(19, 61305022, 33),
(19, 61305026, 9),
(19, 61305034, 27),
(19, 61305120, 246),
(19, 61305220, 18),
(19, 61305251, 3),
(19, 61305385, 36),
(19, 61305391, 3),
(19, 61305459, 2),
(19, 61305511, 48),
(19, 61305519, 357),
(19, 61305521, 138),
(19, 61306134, 489),
(19, 61306135, 255),
(19, 61306619, 15),
(19, 61306733, 3),
(19, 61306930, 6),
(19, 61306933, 3),
(19, 61306938, 3),
(19, 61306965, 105),
(19, 61306966, 42),
(19, 61306982, 2),
(20, 0, 1),
(20, 6000, 1682385682),
(20, 12330, 1),
(20, 12332, 13),
(20, 12333, 3),
(20, 12450, 6),
(20, 13412, 1682348115),
(20, 13413, 1682609888),
(20, 13414, 4),
(20, 14897, 1),
(20, 14898, 0),
(20, 14899, 1682438115),
(20, 14903, 0),
(20, 15000, 50),
(20, 17101, 0),
(20, 20000, 37),
(20, 20001, 62),
(20, 20002, 1),
(20, 20067, 62),
(20, 30000, 1682362846),
(20, 30020, 1),
(20, 30029, 0),
(20, 30051, 1682360534),
(20, 30057, 1),
(20, 30058, 1),
(20, 38412, 60),
(20, 42701, 29),
(20, 42703, 3),
(20, 42704, 4),
(20, 42705, 1),
(20, 42706, 1),
(20, 42707, 1),
(20, 42708, 3),
(20, 42709, 2),
(20, 42710, 2),
(20, 42711, 1),
(20, 42712, 1),
(20, 42713, 1),
(20, 42715, 1),
(20, 42716, 1),
(20, 42717, 5),
(20, 42718, 2),
(20, 42720, 2),
(20, 42721, 3),
(20, 42724, 2),
(20, 42725, 1),
(20, 42729, 12),
(20, 44956, 1),
(20, 44957, 1),
(20, 45751, 1),
(20, 45752, 16),
(20, 46309, 1),
(20, 46402, 1),
(20, 46403, 1),
(20, 46404, 1),
(20, 47402, 1),
(20, 47403, 1),
(20, 47512, 1),
(20, 47514, 1),
(20, 47601, 1),
(20, 48900, 0),
(20, 48901, 0),
(20, 50043, 1),
(20, 50080, 1),
(20, 50081, 10),
(20, 50082, 2),
(20, 50083, 2),
(20, 50090, 10),
(20, 50091, 2),
(20, 50092, 2),
(20, 50115, 10),
(20, 50116, 3),
(20, 50117, 2),
(20, 50118, 2),
(20, 50139, 10),
(20, 50141, 10),
(20, 50143, 30),
(20, 50200, 7),
(20, 50203, 1),
(20, 50210, 1),
(20, 50225, 1),
(20, 50226, 1),
(20, 50230, 1),
(20, 50231, 1),
(20, 50240, 1),
(20, 50245, 1),
(20, 50250, 1),
(20, 50251, 1),
(20, 50252, 1),
(20, 50255, 1),
(20, 50256, 1),
(20, 50257, 1),
(20, 50258, 1),
(20, 50470, 1),
(20, 50471, 1),
(20, 50472, 1),
(20, 50473, 1),
(20, 50474, 1),
(20, 50475, 1),
(20, 50486, 1),
(20, 50488, 1),
(20, 50490, 1),
(20, 50492, 1),
(20, 50494, 1),
(20, 50496, 1),
(20, 50498, 1),
(20, 50501, 1),
(20, 50506, 1),
(20, 50530, 61),
(20, 50541, 2),
(20, 50600, 2),
(20, 50601, 5),
(20, 50602, 3),
(20, 50603, 3),
(20, 50604, 3),
(20, 50605, 2),
(20, 50606, 1),
(20, 50620, 2),
(20, 50630, 1),
(20, 50631, 2),
(20, 50632, 2),
(20, 50633, 2),
(20, 50634, 3),
(20, 50640, 1),
(20, 50641, 3),
(20, 50642, 3),
(20, 50643, 3),
(20, 50660, 23),
(20, 50662, 5),
(20, 50663, 2),
(20, 50672, 1440),
(20, 50699, 2),
(20, 50700, 2),
(20, 50701, 2),
(20, 50850, 1),
(20, 50852, 3000),
(20, 51052, 0),
(20, 51060, 1),
(20, 51061, 18),
(20, 51110, 25),
(20, 51111, 7),
(20, 51112, 3),
(20, 51113, 6),
(20, 51114, 3),
(20, 51115, 3),
(20, 51116, 3),
(20, 51117, 1),
(20, 51120, 1),
(20, 51121, 1),
(20, 51123, 1),
(20, 51124, 1),
(20, 51125, 1),
(20, 51140, 1),
(20, 51141, 3),
(20, 51142, 3),
(20, 51143, 3),
(20, 51160, 12),
(20, 51161, 3),
(20, 51162, 5),
(20, 51163, 3),
(20, 51164, 2),
(20, 51165, 6),
(20, 51166, 8),
(20, 51167, 3),
(20, 51168, 4),
(20, 51169, 2),
(20, 51170, 2),
(20, 51171, 2),
(20, 51172, 6),
(20, 51210, 51),
(20, 51211, 6),
(20, 51212, 8),
(20, 51213, 6),
(20, 51214, 6),
(20, 51215, 8),
(20, 51216, 5),
(20, 51217, 5),
(20, 51218, 4),
(20, 51219, 2),
(20, 51220, 1),
(20, 51221, 1),
(20, 51222, 1),
(20, 51223, 1),
(20, 51224, 1),
(20, 51225, 1),
(20, 51228, 1),
(20, 51229, 1),
(20, 51231, 1),
(20, 51232, 1),
(20, 51234, 1),
(20, 51235, 1),
(20, 51236, 1),
(20, 51237, 1),
(20, 51238, 1),
(20, 51239, 1),
(20, 51242, 1),
(20, 51243, 1),
(20, 51244, 1),
(20, 51247, 1),
(20, 51248, 1),
(20, 51262, 3),
(20, 51263, 5),
(20, 51264, 3),
(20, 51266, 3),
(20, 51267, 1),
(20, 51268, 1),
(20, 51269, 1),
(20, 51300, 29),
(20, 51301, 3),
(20, 51302, 3),
(20, 51303, 3),
(20, 51304, 3),
(20, 51305, 3),
(20, 51306, 4),
(20, 51307, 6),
(20, 51308, 2),
(20, 51309, 2),
(20, 51310, 1),
(20, 51340, 1),
(20, 51341, 2),
(20, 51342, 2),
(20, 51343, 12),
(20, 51394, 8),
(20, 51396, 4),
(20, 51397, 2),
(20, 51398, 1),
(20, 51450, 1),
(20, 51453, 1),
(20, 51480, 1),
(20, 51486, 1),
(20, 51540, 3),
(20, 51541, 3),
(20, 51542, 2),
(20, 51543, 1),
(20, 51544, 3),
(20, 51545, 5),
(20, 51546, 1),
(20, 51547, 1),
(20, 51548, 2),
(20, 51549, 1),
(20, 51550, 4),
(20, 51590, 1),
(20, 51591, 1),
(20, 51592, 1),
(20, 51593, 1),
(20, 51594, 1),
(20, 51595, 1),
(20, 51596, 1),
(20, 51597, 1),
(20, 51598, 1),
(20, 51712, 1),
(20, 52146, 2),
(20, 55047, 1),
(20, 55136, 1),
(20, 55137, 1),
(20, 55145, 21),
(20, 55146, 2),
(20, 55148, 6),
(20, 55154, 1),
(20, 55226, 1),
(20, 55227, 1),
(20, 55230, 1),
(20, 55233, 1),
(20, 56395, 2),
(20, 81056, 0),
(20, 81057, 1),
(20, 100157, 1),
(20, 515206, 1),
(20, 515207, 2),
(20, 515208, 3),
(20, 515209, 3),
(20, 891642, 0),
(20, 10001001, 41549827),
(20, 10001002, 41615363),
(20, 61305026, 30),
(20, 61305034, 39),
(20, 61305039, 93),
(20, 61305251, 24),
(20, 61305385, 27),
(20, 61305386, 18),
(20, 61305459, 6),
(20, 61305465, 243),
(21, 0, 1),
(21, 6000, 1682385560),
(21, 12330, 1),
(21, 12332, 13),
(21, 12333, 3),
(21, 12450, 6),
(21, 13412, 1682348115),
(21, 13413, 1682348115),
(21, 13414, 4),
(21, 14897, 1),
(21, 14898, 1),
(21, 14899, 1682438115),
(21, 14903, 1),
(21, 15000, 50),
(21, 17101, 0),
(21, 20000, 36),
(21, 20001, 35),
(21, 20002, 1),
(21, 20067, 70),
(21, 30000, 1682375116),
(21, 30020, 1),
(21, 30029, 0),
(21, 30051, 1682385545),
(21, 30057, 1),
(21, 30058, 1),
(21, 38412, 68),
(21, 42701, 29),
(21, 42703, 3),
(21, 42704, 4),
(21, 42705, 1),
(21, 42706, 1),
(21, 42707, 1),
(21, 42708, 3),
(21, 42709, 2),
(21, 42710, 2),
(21, 42711, 1),
(21, 42712, 1),
(21, 42713, 1),
(21, 42715, 1),
(21, 42716, 1),
(21, 42717, 5),
(21, 42718, 2),
(21, 42720, 2),
(21, 42721, 3),
(21, 42724, 2),
(21, 42725, 1),
(21, 42729, 12),
(21, 44956, 1),
(21, 44957, 1),
(21, 45751, 1),
(21, 45752, 16),
(21, 46309, 1),
(21, 46402, 1),
(21, 46403, 1),
(21, 46404, 1),
(21, 47402, 1),
(21, 47403, 1),
(21, 47512, 1),
(21, 47514, 1),
(21, 47601, 1),
(21, 48900, 0),
(21, 48901, 0),
(21, 50043, 1),
(21, 50080, 1),
(21, 50081, 10),
(21, 50082, 2),
(21, 50083, 2),
(21, 50090, 10),
(21, 50091, 2),
(21, 50092, 2),
(21, 50115, 10),
(21, 50116, 3),
(21, 50117, 2),
(21, 50118, 2),
(21, 50139, 10),
(21, 50141, 10),
(21, 50143, 30),
(21, 50200, 7),
(21, 50203, 1),
(21, 50210, 1),
(21, 50225, 1),
(21, 50226, 1),
(21, 50230, 1),
(21, 50231, 1),
(21, 50240, 1),
(21, 50245, 1),
(21, 50250, 1),
(21, 50251, 1),
(21, 50252, 1),
(21, 50255, 1),
(21, 50256, 1),
(21, 50257, 1),
(21, 50258, 1),
(21, 50470, 1),
(21, 50471, 1),
(21, 50472, 1),
(21, 50473, 1),
(21, 50474, 1),
(21, 50475, 1),
(21, 50486, 1),
(21, 50488, 1),
(21, 50490, 1),
(21, 50492, 1),
(21, 50494, 1),
(21, 50496, 1),
(21, 50498, 1),
(21, 50501, 1),
(21, 50506, 1),
(21, 50530, 61),
(21, 50541, 2),
(21, 50600, 2),
(21, 50601, 5),
(21, 50602, 3),
(21, 50603, 3),
(21, 50604, 3),
(21, 50605, 2),
(21, 50606, 1),
(21, 50620, 2),
(21, 50630, 1),
(21, 50631, 2),
(21, 50632, 2),
(21, 50633, 2),
(21, 50634, 3),
(21, 50640, 1),
(21, 50641, 3),
(21, 50642, 3),
(21, 50643, 3),
(21, 50660, 23),
(21, 50662, 5),
(21, 50663, 2),
(21, 50672, 1440),
(21, 50699, 2),
(21, 50700, 2),
(21, 50701, 2),
(21, 50850, 1),
(21, 50852, 3000),
(21, 51000, 1),
(21, 51060, 1),
(21, 51061, 18),
(21, 51110, 25),
(21, 51111, 7),
(21, 51112, 3),
(21, 51113, 6),
(21, 51114, 3),
(21, 51115, 3),
(21, 51116, 3),
(21, 51117, 1),
(21, 51120, 1),
(21, 51121, 1),
(21, 51123, 1),
(21, 51124, 1),
(21, 51125, 1),
(21, 51140, 1),
(21, 51141, 3),
(21, 51142, 3),
(21, 51143, 3),
(21, 51160, 12),
(21, 51161, 3),
(21, 51162, 5),
(21, 51163, 3),
(21, 51164, 2),
(21, 51165, 6),
(21, 51166, 8),
(21, 51167, 3),
(21, 51168, 4),
(21, 51169, 2),
(21, 51170, 2),
(21, 51171, 2),
(21, 51172, 6),
(21, 51210, 51),
(21, 51211, 6),
(21, 51212, 8),
(21, 51213, 6),
(21, 51214, 6),
(21, 51215, 8),
(21, 51216, 5),
(21, 51217, 5),
(21, 51218, 4),
(21, 51219, 2),
(21, 51220, 1),
(21, 51221, 1),
(21, 51222, 1),
(21, 51223, 1),
(21, 51224, 1),
(21, 51225, 1),
(21, 51228, 1),
(21, 51229, 1),
(21, 51231, 1),
(21, 51232, 1),
(21, 51234, 1),
(21, 51235, 1),
(21, 51236, 1),
(21, 51237, 1),
(21, 51238, 1),
(21, 51239, 1),
(21, 51242, 1),
(21, 51243, 1),
(21, 51244, 1),
(21, 51247, 1),
(21, 51248, 1),
(21, 51262, 3),
(21, 51263, 5),
(21, 51264, 3),
(21, 51266, 3),
(21, 51267, 1),
(21, 51268, 1),
(21, 51269, 1),
(21, 51300, 29),
(21, 51301, 3),
(21, 51302, 3),
(21, 51303, 3),
(21, 51304, 3),
(21, 51305, 3),
(21, 51306, 4),
(21, 51307, 6),
(21, 51308, 2),
(21, 51309, 2),
(21, 51310, 1),
(21, 51340, 1),
(21, 51341, 2),
(21, 51342, 2),
(21, 51343, 12),
(21, 51394, 8),
(21, 51396, 4),
(21, 51397, 2),
(21, 51398, 1),
(21, 51450, 1),
(21, 51453, 1),
(21, 51480, 1),
(21, 51486, 1),
(21, 51540, 3),
(21, 51541, 3),
(21, 51542, 2),
(21, 51543, 1),
(21, 51544, 3),
(21, 51545, 5),
(21, 51546, 1),
(21, 51547, 1),
(21, 51548, 2),
(21, 51549, 1),
(21, 51550, 4),
(21, 51590, 1),
(21, 51591, 1),
(21, 51592, 1),
(21, 51593, 1),
(21, 51594, 1),
(21, 51595, 1),
(21, 51596, 1),
(21, 51597, 1),
(21, 51598, 1),
(21, 51712, 1),
(21, 52146, 2),
(21, 55047, 1),
(21, 55136, 1),
(21, 55137, 1),
(21, 55145, 21),
(21, 55146, 2),
(21, 55148, 6),
(21, 55154, 1),
(21, 55226, 1),
(21, 55227, 1),
(21, 55230, 1),
(21, 55233, 1),
(21, 56395, 2),
(21, 81056, 0),
(21, 81057, 1),
(21, 97150, 1682375037),
(21, 100157, 1),
(21, 515206, 1),
(21, 515207, 2),
(21, 515208, 3),
(21, 515209, 3),
(21, 891642, 0),
(21, 10001001, 8519682),
(21, 10001002, 9043970),
(21, 10002002, 32768),
(21, 61305022, 114),
(21, 61305026, 33),
(21, 61305034, 3),
(21, 61305073, 21),
(21, 61305219, 3),
(21, 61305251, 24),
(21, 61305385, 15),
(21, 61305389, 18),
(21, 61305391, 63),
(21, 61305459, 6),
(21, 61305465, 261),
(21, 61305519, 78),
(22, 0, 1),
(22, 6000, 1682457929),
(22, 12330, 1),
(22, 12332, 13),
(22, 12333, 3),
(22, 12450, 6),
(22, 13413, 1682520901),
(22, 13414, 4),
(22, 14898, 0),
(22, 14903, 0),
(22, 15000, 300),
(22, 17101, 0),
(22, 20000, 55),
(22, 20001, 149),
(22, 20002, 1),
(22, 20067, 2210),
(22, 30000, 1682383367),
(22, 30018, 1),
(22, 30029, 0),
(22, 30051, 1682385821),
(22, 30057, 1),
(22, 30058, 1),
(22, 38412, 2208),
(22, 42701, 29),
(22, 42703, 3),
(22, 42704, 4),
(22, 42705, 1),
(22, 42706, 1),
(22, 42707, 1),
(22, 42708, 3),
(22, 42709, 2),
(22, 42710, 2),
(22, 42711, 1),
(22, 42712, 1),
(22, 42713, 1),
(22, 42715, 1),
(22, 42716, 1),
(22, 42717, 5),
(22, 42718, 2),
(22, 42720, 2),
(22, 42721, 3),
(22, 42724, 2),
(22, 42725, 1),
(22, 42729, 12),
(22, 44956, 1),
(22, 44957, 1),
(22, 45751, 1),
(22, 45752, 16),
(22, 46309, 1),
(22, 46402, 1),
(22, 46403, 1),
(22, 46404, 1),
(22, 47402, 1),
(22, 47403, 1),
(22, 47512, 1),
(22, 47514, 1),
(22, 47601, 1),
(22, 48900, 0),
(22, 48901, 0),
(22, 50043, 1),
(22, 50080, 1),
(22, 50081, 10),
(22, 50082, 2),
(22, 50083, 2),
(22, 50090, 10),
(22, 50091, 2),
(22, 50092, 2),
(22, 50115, 10),
(22, 50116, 3),
(22, 50117, 2),
(22, 50118, 2),
(22, 50139, 10),
(22, 50141, 10),
(22, 50143, 30),
(22, 50200, 7),
(22, 50203, 1),
(22, 50210, 1),
(22, 50225, 1),
(22, 50226, 1),
(22, 50230, 1),
(22, 50231, 1),
(22, 50240, 1),
(22, 50245, 1),
(22, 50250, 1),
(22, 50251, 1),
(22, 50252, 1),
(22, 50255, 1),
(22, 50256, 1),
(22, 50257, 1),
(22, 50258, 1),
(22, 50470, 1),
(22, 50471, 1),
(22, 50472, 1),
(22, 50473, 1),
(22, 50474, 1),
(22, 50475, 1),
(22, 50486, 1),
(22, 50488, 1),
(22, 50490, 1),
(22, 50492, 1),
(22, 50494, 1),
(22, 50496, 1),
(22, 50498, 1),
(22, 50501, 1),
(22, 50506, 1),
(22, 50530, 61),
(22, 50541, 2),
(22, 50600, 2),
(22, 50601, 5),
(22, 50602, 3),
(22, 50603, 3),
(22, 50604, 3),
(22, 50605, 2),
(22, 50606, 1),
(22, 50620, 2),
(22, 50630, 1),
(22, 50631, 2),
(22, 50632, 2),
(22, 50633, 2),
(22, 50634, 3),
(22, 50640, 1),
(22, 50641, 3),
(22, 50642, 3),
(22, 50643, 3),
(22, 50660, 23),
(22, 50662, 5),
(22, 50663, 2),
(22, 50672, 1440),
(22, 50699, 2),
(22, 50700, 2),
(22, 50701, 2),
(22, 50850, 1),
(22, 50852, 3000),
(22, 51000, 1),
(22, 51052, 0),
(22, 51060, 1),
(22, 51061, 18),
(22, 51110, 25),
(22, 51111, 7),
(22, 51112, 3),
(22, 51113, 6),
(22, 51114, 3),
(22, 51115, 3),
(22, 51116, 3),
(22, 51117, 1),
(22, 51120, 1),
(22, 51121, 1),
(22, 51123, 1),
(22, 51124, 1),
(22, 51125, 1),
(22, 51140, 1),
(22, 51141, 3),
(22, 51142, 3),
(22, 51143, 3),
(22, 51160, 12),
(22, 51161, 3),
(22, 51162, 5),
(22, 51163, 3),
(22, 51164, 2),
(22, 51165, 6),
(22, 51166, 8),
(22, 51167, 3),
(22, 51168, 4),
(22, 51169, 2),
(22, 51170, 2),
(22, 51171, 2),
(22, 51172, 6),
(22, 51210, 51),
(22, 51211, 6),
(22, 51212, 8),
(22, 51213, 6),
(22, 51214, 6),
(22, 51215, 8),
(22, 51216, 5),
(22, 51217, 5),
(22, 51218, 4),
(22, 51219, 2),
(22, 51220, 1),
(22, 51221, 1),
(22, 51222, 1),
(22, 51223, 1),
(22, 51224, 1),
(22, 51225, 1),
(22, 51228, 1),
(22, 51229, 1),
(22, 51231, 1),
(22, 51232, 1),
(22, 51234, 1),
(22, 51235, 1),
(22, 51236, 1),
(22, 51237, 1),
(22, 51238, 1),
(22, 51239, 1),
(22, 51242, 1),
(22, 51243, 1),
(22, 51244, 1),
(22, 51247, 1),
(22, 51248, 1),
(22, 51262, 3),
(22, 51263, 5),
(22, 51264, 3),
(22, 51266, 3),
(22, 51267, 1),
(22, 51268, 1),
(22, 51269, 1),
(22, 51300, 29),
(22, 51301, 3),
(22, 51302, 3),
(22, 51303, 3),
(22, 51304, 3),
(22, 51305, 3),
(22, 51306, 4),
(22, 51307, 6),
(22, 51308, 2),
(22, 51309, 2),
(22, 51310, 1),
(22, 51340, 1),
(22, 51341, 2),
(22, 51342, 2),
(22, 51343, 12),
(22, 51394, 8),
(22, 51396, 4),
(22, 51397, 2),
(22, 51398, 1),
(22, 51450, 1),
(22, 51453, 1),
(22, 51480, 1),
(22, 51486, 1),
(22, 51540, 3),
(22, 51541, 3),
(22, 51542, 2),
(22, 51543, 1),
(22, 51544, 3),
(22, 51545, 5),
(22, 51546, 1),
(22, 51547, 1),
(22, 51548, 2),
(22, 51549, 1),
(22, 51550, 4),
(22, 51590, 1),
(22, 51591, 1),
(22, 51592, 1),
(22, 51593, 1),
(22, 51594, 1),
(22, 51595, 1),
(22, 51596, 1),
(22, 51597, 1),
(22, 51598, 1),
(22, 51712, 1),
(22, 52146, 2),
(22, 55047, 1),
(22, 55136, 1),
(22, 55137, 1),
(22, 55145, 21),
(22, 55146, 2),
(22, 55148, 6),
(22, 55154, 1),
(22, 55226, 1),
(22, 55227, 1),
(22, 55230, 1),
(22, 55233, 1),
(22, 56395, 2),
(22, 81056, 0),
(22, 81057, 1),
(22, 100157, 1),
(22, 515206, 1),
(22, 515207, 2),
(22, 515208, 3),
(22, 515209, 3),
(22, 545484, 1682381211),
(22, 891642, 0),
(22, 10001001, 41680899),
(22, 10001002, 41746435),
(22, 10001003, 8519682),
(22, 10001004, 9043970),
(22, 10002005, 1024),
(22, 10002011, 135),
(22, 61305022, 105),
(22, 61305025, 6),
(22, 61305026, 18),
(22, 61305029, 12),
(22, 61305034, 135),
(22, 61305039, 63),
(22, 61305073, 96),
(22, 61305247, 6),
(22, 61305248, 21),
(22, 61305249, 18),
(22, 61305285, 42),
(22, 61305287, 42),
(22, 61305317, 6),
(22, 61305385, 99),
(22, 61305386, 24),
(22, 61305389, 12),
(22, 61305391, 39),
(22, 61305402, 3),
(22, 61305465, 315),
(22, 61305519, 306),
(22, 61306134, 375),
(22, 61306135, 72),
(22, 61306619, 15),
(22, 61306728, 15),
(22, 61306733, 357),
(22, 61306735, 15),
(22, 61307024, 6),
(22, 61307051, 69);

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_taskhunt`
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
-- Extraindo dados da tabela `player_taskhunt`
--

INSERT INTO `player_taskhunt` (`player_id`, `slot`, `state`, `raceid`, `upgrade`, `rarity`, `kills`, `disabled_time`, `free_reroll`, `monster_list`) VALUES
(4, 0, 2, '0', 0, 1, '0', 0, 1675182131533, 0x0f008f02f905fc05020391035302f8000600),
(4, 1, 2, '0', 0, 1, '0', 0, 1675182131536, 0x7a037c001d028a041300f300c2030d027a04),
(4, 2, 0, '0', 0, 1, '0', 0, 1675182131539, ''),
(3, 0, 2, '0', 0, 1, '0', 0, 1673345073760, 0xc602ff002c0801021b000e073f014d011d03),
(3, 1, 2, '0', 0, 1, '0', 0, 1673345073761, 0xcf01f1041104fc0531000300e1054e004f01),
(3, 2, 0, '0', 0, 1, '0', 0, 1673345073763, ''),
(2, 0, 2, '0', 0, 1, '0', 0, 1675855990681, 0x1a009c074d01ee00880703007e033e01ba02),
(2, 1, 2, '0', 0, 1, '0', 0, 1675855990682, 0x390050001304ad0464034e017604f4071500),
(2, 2, 0, '0', 0, 1, '0', 0, 1675855990683, ''),
(13, 0, 2, '0', 0, 1, '0', 0, 1677582665149, 0xdb0009007b0454060600da0044020501ae04),
(13, 1, 2, '0', 0, 1, '0', 0, 1677582665151, 0x4e007503e9022d020d029c07e100c0022b00),
(13, 2, 0, '0', 0, 1, '0', 0, 1677582665153, ''),
(11, 0, 2, '0', 0, 1, '0', 0, 1676710503962, 0x4801b5019207e0001d04d5034b0136000f02),
(11, 1, 2, '0', 0, 1, '0', 0, 1676710503964, 0x0700880712034602db021c0014008106d603),
(11, 2, 0, '0', 0, 1, '0', 0, 1676710503966, ''),
(16, 0, 2, '0', 0, 1, '0', 0, 1682131426333, 0xe605b601cf01f4031900ef00040203006005),
(16, 1, 2, '0', 0, 1, '0', 0, 1682131426335, 0x8d070b00dc029603d30395075b031b002b00),
(16, 2, 2, '0', 0, 1, '0', 0, 1682131426336, 0xf006cd0215026d021600c5024901d3046900),
(12, 0, 2, '0', 0, 1, '0', 0, 1677343274085, 0xe2052f02030240001d007303e00046018901),
(12, 1, 2, '0', 0, 1, '0', 0, 1677343274087, 0x76069002950328005e007b007c047000a305),
(12, 2, 0, '0', 0, 1, '0', 0, 1677343274089, ''),
(10, 0, 2, '0', 0, 1, '0', 0, 1673447514765, 0x2e02fa002b08db00410021063200ff001c00),
(10, 1, 2, '0', 0, 1, '0', 0, 1673447514767, 0xe302e9021f011c01420120070a037900f701),
(10, 2, 0, '0', 0, 1, '0', 0, 1673447514769, ''),
(21, 0, 2, '0', 0, 1, '0', 0, 1682396290139, 0x6c024d043e01c2066d021c00f7036d004c00),
(21, 1, 2, '0', 0, 1, '0', 0, 1682396290140, 0xd001f4001d040e03c4063e001d0755060203),
(21, 2, 2, '0', 0, 1, '0', 0, 1682396290142, 0x9e052f0878023200d2080e071e0081028b06),
(22, 0, 2, '0', 0, 1, '0', 0, 1682396740914, 0x28014d01d30308027800150110006f025606),
(22, 1, 2, '0', 0, 1, '0', 0, 1682396740916, 0x160409069e0568037b004e002401d302d608),
(22, 2, 2, '0', 0, 1, '0', 0, 1682396740917, 0x0e070602c203d802ac041700fb002b02c406),
(17, 0, 2, '0', 0, 1, '0', 0, 1682131464334, 0xf505c804e3055300fb004800c0021b002c00),
(17, 1, 2, '0', 0, 1, '0', 0, 1682131464336, 0x8f025606a305550474015c041700d3006405),
(17, 2, 2, '0', 0, 1, '0', 0, 1682131464337, 0x770273019103c402c102090646007a009e03),
(20, 0, 2, '0', 0, 1, '0', 0, 1682371864471, 0xc2067b01470092037200a10276032d005504),
(20, 1, 2, '0', 0, 1, '0', 0, 1682371864473, 0x9c05a30208075202730389012900e9021b04),
(20, 2, 2, '0', 0, 1, '0', 0, 1682371864475, 0x02013b0018008801060701022400e805d600),
(19, 0, 2, '0', 0, 1, '0', 0, 1682321600522, 0x4e001d025d0328000f0151042c0272008901),
(19, 1, 2, '0', 0, 1, '0', 0, 1682321600525, 0xfd0078015d071400d8000802fd03f7017901),
(19, 2, 2, '0', 0, 1, '0', 0, 1682321600529, 0x20046506f0002c004907130008030c002500),
(18, 0, 2, '0', 0, 1, '0', 0, 1682140146830, 0x73053d0820047304c80464030d0195035306),
(18, 1, 2, '0', 0, 1, '0', 0, 1682140146831, 0x1c0412007904cf0235001d007902ba060c02),
(18, 2, 2, '0', 0, 1, '0', 0, 1682140146833, 0x0103be021b076405ec03d8007000c9054c00),
(9, 0, 2, '0', 0, 1, '0', 0, 1681811329588, 0x780248014602e80565066e06bc02be063d08),
(9, 1, 2, '0', 0, 1, '0', 0, 1681811329588, 0xff00f00645022808c801ac07f7005506c106),
(9, 2, 0, '0', 0, 1, '0', 0, 1681811329589, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `prey_slots`
--

CREATE TABLE `prey_slots` (
  `player_id` int(11) NOT NULL,
  `num` smallint(6) NOT NULL,
  `state` smallint(6) NOT NULL DEFAULT 1,
  `unlocked` tinyint(1) NOT NULL DEFAULT 0,
  `current` varchar(40) NOT NULL DEFAULT '',
  `monster_list` varchar(360) NOT NULL,
  `free_reroll_in` int(11) NOT NULL DEFAULT 0,
  `time_left` smallint(6) NOT NULL DEFAULT 0,
  `next_use` int(11) NOT NULL DEFAULT 0,
  `bonus_type` smallint(6) NOT NULL,
  `bonus_value` smallint(6) NOT NULL DEFAULT 0,
  `bonus_grade` smallint(6) NOT NULL DEFAULT 0,
  `tick` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `quickloot_containers`
--

CREATE TABLE `quickloot_containers` (
  `player_id` int(11) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `cid` int(10) UNSIGNED NOT NULL,
  `sid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sellchar`
--

CREATE TABLE `sellchar` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `vocation` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `status` varchar(40) NOT NULL,
  `oldid` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sell_players`
--

CREATE TABLE `sell_players` (
  `player_id` int(11) NOT NULL,
  `account` int(11) NOT NULL,
  `create` bigint(20) NOT NULL,
  `createip` bigint(20) NOT NULL,
  `coin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sell_players_history`
--

CREATE TABLE `sell_players_history` (
  `player_id` int(11) NOT NULL,
  `accountold` int(11) NOT NULL,
  `accountnew` int(11) NOT NULL,
  `create` bigint(20) NOT NULL,
  `createip` bigint(20) NOT NULL,
  `buytime` bigint(20) NOT NULL,
  `buyip` bigint(20) NOT NULL,
  `coin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_config`
--

CREATE TABLE `server_config` (
  `config` varchar(50) NOT NULL,
  `value` varchar(256) NOT NULL DEFAULT '',
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `server_config`
--

INSERT INTO `server_config` (`config`, `value`, `timestamp`) VALUES
('db_version', '5', '2023-04-17 03:54:16'),
('double', 'desactived', '2023-02-13 14:07:03'),
('motd_hash', '7fddc3e9cdb48371cfa308f527a97a292705e325', '2023-02-13 14:07:03'),
('motd_num', '4', '2023-02-13 14:07:03'),
('players_record', '5', '2023-04-25 01:03:17');

-- --------------------------------------------------------

--
-- Estrutura da tabela `snake_game`
--

CREATE TABLE `snake_game` (
  `id` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `snake_game`
--

INSERT INTO `snake_game` (`id`, `guid`, `points`) VALUES
(1, 9, 6),
(2, 11, 26);

-- --------------------------------------------------------

--
-- Estrutura da tabela `snowballwar`
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
-- Estrutura da tabela `store_history`
--

CREATE TABLE `store_history` (
  `id` int(11) NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `mode` smallint(6) NOT NULL DEFAULT 0,
  `description` varchar(3500) NOT NULL,
  `coin_type` tinyint(1) NOT NULL DEFAULT 0,
  `coin_amount` int(11) NOT NULL,
  `time` bigint(20) UNSIGNED NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `store_history`
--

INSERT INTO `store_history` (`id`, `account_id`, `mode`, `description`, `coin_type`, `coin_amount`, `time`, `timestamp`) VALUES
(1, 1, 0, 'All Regular Blessings', 0, -650, 1641852798, 0),
(2, 2, 0, '30 Days of Premium Time', 0, -250, 1673294594, 0),
(3, 2, 0, 'Animate Dead Rune', 0, -75, 1673294610, 0),
(4, 2, 0, 'XP Boost', 0, -30, 1673376500, 0),
(5, 3, 0, '[Monster Hunt] - Winner', 2, 100, 1674495410, 0),
(6, 3, 0, '[Monster Hunt] - Winner', 2, 100, 1674496070, 0),
(7, 3, 0, 'Tournament Carpet', 2, -70, 1674580468, 0),
(8, 2, 0, 'Jousting Eagle Baby', 2, -800, 1674580543, 0),
(9, 3, 0, '[Snowball Event] - Winner', 2, 300, 1674674188, 0),
(10, 2, 0, '[SafeZone Event] - Winner', 2, 300, 1674755600, 0),
(11, 2, 0, '[SafeZone Event] - Winner', 2, 300, 1674756761, 0),
(12, 2, 0, '[SafeZone Event] - Winner', 2, 300, 1674759662, 0),
(13, 2, 0, '[SafeZone Event] - Winner', 2, 300, 1674759979, 0),
(14, 3, 0, '[SafeZone Event] - Winner', 2, 300, 1674760442, 0),
(15, 2, 0, '[SafeZone Event] - Winner', 2, 300, 1674761066, 0),
(16, 3, 0, '[SafeZone Event] - Winner', 2, 300, 1674762541, 0),
(17, 2, 0, '[SafeZone Event] - Winner', 2, 300, 1674763078, 0),
(18, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1675038800, 0),
(19, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1675039160, 0),
(20, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1675086646, 0),
(21, 2, 0, '[Monster Hunt] - Winner', 2, 300, 1675087246, 0),
(22, 3, 0, '[Online Time] Tournament Coins', 2, 10, 1675087426, 0),
(23, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1675175136, 0),
(24, 3, 0, '[Online Time] Tournament Coins', 2, 10, 1675261325, 0),
(25, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1675261385, 0),
(26, 3, 0, '[Online Time] Tournament Coins', 2, 10, 1675269928, 0),
(27, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1675269988, 0),
(28, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1675273648, 0),
(29, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1675277308, 0),
(30, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1675280968, 0),
(31, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1675701178, 0),
(32, 3, 0, '[Online Time] Tournament Coins', 2, 10, 1675722485, 0),
(33, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1676246925, 0),
(34, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1676313308, 0),
(35, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1676316969, 0),
(36, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1676321469, 0),
(37, 3, 0, '[Online Time] Tournament Coins', 2, 10, 1676323688, 0),
(38, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1676325128, 0),
(39, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1676497215, 0),
(40, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1676641547, 0),
(41, 3, 0, '[Online Time] Tournament Coins', 2, 10, 1676642147, 0),
(42, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1676645207, 0),
(43, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1676667763, 0),
(44, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1677247031, 0),
(45, 3, 0, '[Online Time] Tournament Coins', 2, 10, 1677247031, 0),
(46, 2, 0, 'Lasting Exercise Bow', 0, -720, 1677270130, 0),
(47, 3, 0, '[Online Time] Tournament Coins', 2, 10, 1677278320, 0),
(48, 3, 0, '[Online Time] Tournament Coins', 2, 10, 1677282973, 0),
(49, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1677282973, 0),
(50, 3, 0, '[Online Time] Tournament Coins', 2, 10, 1677345063, 0),
(51, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1677347223, 0),
(52, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1677352422, 0),
(53, 3, 0, '[Online Time] Tournament Coins', 2, 10, 1677352422, 0),
(54, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1677356081, 0),
(55, 2, 0, '[BOMBERMAN] - Winner', 2, 100, 1677370374, 0),
(56, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1677374151, 0),
(57, 2, 0, '30 Days of VIP Time', 0, -250, 1677436164, 0),
(58, 2, 0, '7 Days of VIP Time', 2, -250, 1677436411, 0),
(59, 2, 0, '7 Days of VIP Time', 2, -250, 1677436528, 0),
(60, 2, 0, '7 Days of VIP Time', 2, -250, 1677436634, 0),
(61, 2, 0, '7 Days of VIP Time', 2, -250, 1677436701, 0),
(62, 2, 0, '7 Days of VIP Time', 2, -250, 1677436748, 0),
(63, 2, 0, '7 Days of VIP Time', 2, -250, 1677436763, 0),
(64, 2, 0, 'Great Health Cask', 0, -22, 1677438756, 0),
(65, 3, 0, 'Great Health Cask', 2, -88, 1677438779, 0),
(66, 2, 0, 'Hireling Apprentice (Server Master)', 0, -150, 1677443340, 0),
(67, 2, 0, 'Lasting Exercise Axe', 0, -250, 1677456043, 0),
(68, 2, 0, 'Alicorn Headguard', 0, -1100, 1677501844, 0),
(69, 2, 0, 'Lasting Exercise Bow', 0, -250, 1677501910, 0),
(70, 2, 0, 'Bag You Desire', 0, -800, 1677502189, 0),
(71, 2, 0, 'Bag You Desire', 0, -800, 1677502199, 0),
(72, 2, 0, 'Cobra Boots', 0, -75, 1677502217, 0),
(73, 2, 0, 'Great Health Keg', 0, -103, 1677502228, 0),
(74, 2, 0, 'Alchemistic Cupboard', 2, -50, 1677502331, 0),
(75, 2, 0, 'Alchemistic Cabinet', 2, -100, 1677502520, 0),
(76, 2, 0, 'Frozen Rune', 0, -75, 1677502544, 0),
(77, 2, 0, 'Mana Rune', 0, -75, 1677502940, 0),
(78, 3, 0, 'Lasting Exercise Wand', 2, -1000, 1677511714, 0),
(79, 3, 0, 'Lasting Exercise Axe', 2, -1000, 1677518665, 0),
(80, 3, 0, 'Lasting Exercise Club', 2, -1000, 1677518672, 0),
(81, 3, 0, 'Lasting Exercise Sword', 2, -1000, 1677518677, 0),
(82, 3, 0, 'Lasting Exercise Rod', 2, -1000, 1677518686, 0),
(83, 3, 0, '[Online Time] Tournament Coins', 2, 10, 1677590159, 0),
(84, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1677590159, 0),
(85, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1677593819, 0),
(86, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1677600965, 0),
(87, 3, 0, '[Online Time] Tournament Coins', 2, 10, 1677600965, 0),
(88, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1677604625, 0),
(89, 3, 0, '[Online Time] Tournament Coins', 2, 10, 1677604625, 0),
(90, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1677608285, 0),
(91, 3, 0, '[Online Time] Tournament Coins', 2, 10, 1677608285, 0),
(92, 3, 0, '[Online Time] Tournament Coins', 2, 10, 1677612920, 0),
(93, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1677613040, 0),
(94, 3, 0, '[Online Time] Tournament Coins', 2, 10, 1677616580, 0),
(95, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1677616700, 0),
(96, 3, 0, '[Online Time] Tournament Coins', 2, 10, 1677620240, 0),
(97, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1677620360, 0),
(98, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1677679548, 0),
(99, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1677711367, 0),
(100, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1677800644, 0),
(101, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1677853753, 0),
(102, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1679674866, 0),
(103, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1679683391, 0),
(104, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1679687050, 0),
(105, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1679924053, 0),
(106, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1679934208, 0),
(107, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1679949069, 0),
(108, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1679954853, 0),
(109, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1679958513, 0),
(110, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1680111008, 0),
(111, 3, 0, '[Online Time] Tournament Coins', 2, 10, 1680111008, 0),
(112, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1680114668, 0),
(113, 3, 0, '[Online Time] Tournament Coins', 2, 10, 1680115808, 0),
(114, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1680124881, 0),
(115, 3, 0, '[Online Time] Tournament Coins', 2, 10, 1680125121, 0),
(116, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1681748758, 0),
(117, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1681752418, 0),
(118, 3, 0, 'Bag You Desire', 2, -2200, 1681849309, 0),
(119, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1681851678, 0),
(120, 2, 0, '180 Days of VIP Time', 0, -1500, 1681851825, 0),
(121, 2, 0, 'Bag You Desire', 2, -2200, 1681851853, 0),
(122, 2, 0, 'Bag You Desire', 0, -800, 1681851861, 0),
(123, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1681855449, 0),
(124, 2, 0, 'Gold Pouch', 2, -1800, 1681857107, 0),
(125, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1681862837, 0),
(126, 3, 0, 'Gold Pouch', 2, -1800, 1681869800, 0),
(127, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1681914330, 0),
(128, 2, 0, 'Hireling Trader', 0, -250, 1681922201, 0),
(129, 3, 0, '[Online Time] Tournament Coins', 2, 10, 1681927283, 0),
(130, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1681927403, 0),
(131, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1681931063, 0),
(132, 3, 0, '[Online Time] Tournament Coins', 2, 10, 1681931664, 0),
(133, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1681934723, 0),
(134, 2, 0, 'Lasting Exercise Axe', 2, -1000, 1681934870, 0),
(135, 3, 0, 'Demon Exercise Dummy', 2, -1800, 1681935016, 0),
(136, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1681947038, 0),
(137, 3, 0, '[Online Time] Tournament Coins', 2, 10, 1681947098, 0),
(138, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1681951263, 0),
(139, 3, 0, '[Online Time] Tournament Coins', 2, 10, 1681951503, 0),
(140, 3, 0, '[Online Time] Tournament Coins', 2, 10, 1681961373, 0),
(141, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1681961373, 0),
(142, 3, 0, 'Bag You Desire', 2, -2200, 1681963505, 0),
(143, 3, 0, 'Falcon Bow', 2, -425, 1681963510, 0),
(144, 2, 0, 'Cobra Axe', 2, -375, 1681993674, 0),
(145, 2, 0, 'Bag You Desire', 0, -800, 1681994785, 0),
(146, 2, 0, 'Axe of Destruction', 2, -350, 1681994823, 0),
(147, 2, 0, 'Falcon Bow', 2, -425, 1681994883, 0),
(148, 2, 0, 'Bag You Desire', 2, -2200, 1681994900, 0),
(149, 2, 0, 'Supreme Health Potion', 2, -452, 1681996320, 0),
(150, 2, 0, 'Alchemistic Bookstand', 2, -100, 1681996567, 0),
(151, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1681996899, 0),
(152, 2, 0, 'Great Health Cask', 2, -88, 1681997312, 0),
(153, 2, 0, 'Lasting Exercise Club', 2, -1000, 1681997316, 0),
(154, 2, 0, 'Great Health Keg', 2, -412, 1681997323, 0),
(155, 2, 0, 'Frozen Rune', 2, -300, 1681997332, 0),
(156, 2, 0, 'Daily Reward Shrine', 2, -300, 1681997342, 0),
(157, 2, 0, 'Temple Teleport', 2, -30, 1681997353, 0),
(158, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682000559, 0),
(159, 2, 0, 'Supreme Health Potion', 0, -113, 1682008339, 0),
(160, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682009637, 0),
(161, 2, 0, 'Supreme Health Potion', 2, -452, 1682010485, 0),
(162, 2, 0, 'Supreme Health Potion', 2, -452, 1682010590, 0),
(163, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682014126, 0),
(164, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682017786, 0),
(165, 3, 0, 'Alchemistic Bookstand', 2, -100, 1682017787, 0),
(166, 2, 0, 'Supreme Health Potion', 2, -452, 1682021626, 0),
(167, 2, 0, 'Supreme Health Potion', 2, -452, 1682021821, 0),
(168, 2, 0, 'Blade Of Destruction', 2, -350, 1682023036, 0),
(169, 2, 0, 'Axe of Destruction', 2, -350, 1682023157, 0),
(170, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682024985, 0),
(171, 3, 0, 'Alchemistic Bookstand', 2, -100, 1682027244, 0),
(172, 2, 0, 'Frozen Rune', 2, -300, 1682027379, 0),
(173, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682029859, 0),
(174, 3, 0, '[Online Time] Tournament Coins', 2, 10, 1682030698, 0),
(175, 3, 0, 'Alchemistic Bookstand', 2, -100, 1682032374, 0),
(176, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682097992, 0),
(177, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682114399, 0),
(178, 18, 0, '[Online Time] Tournament Coins', 2, 10, 1682114879, 0),
(179, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682118059, 0),
(180, 18, 0, 'Bag You Desire', 0, -800, 1682118992, 0),
(181, 19, 0, 'Bag You Desire', 0, -800, 1682119001, 0),
(182, 18, 0, 'Primal Bag', 0, -950, 1682119003, 0),
(183, 19, 0, 'Bag You Desire', 0, -800, 1682119022, 0),
(184, 19, 0, 'Bag You Desire', 0, -800, 1682119034, 0),
(185, 19, 0, 'Primal Bag', 0, -950, 1682119041, 0),
(186, 18, 0, 'Bag You Desire', 2, -2200, 1682119044, 0),
(187, 19, 0, 'Primal Bag', 0, -950, 1682119047, 0),
(188, 18, 0, 'Bag You Desire', 2, -2200, 1682119047, 0),
(189, 19, 0, 'Primal Bag', 0, -950, 1682119051, 0),
(190, 18, 0, 'Bag You Desire', 2, -2200, 1682119051, 0),
(191, 19, 0, 'Primal Bag', 0, -950, 1682119054, 0),
(192, 18, 0, 'Bag You Desire', 2, -2200, 1682119057, 0),
(193, 19, 0, 'Primal Bag', 0, -950, 1682119057, 0),
(194, 19, 0, 'Bag You Desire', 0, -800, 1682119059, 0),
(195, 18, 0, 'Bag You Desire', 2, -2200, 1682119060, 0),
(196, 19, 0, 'Bag You Desire', 0, -800, 1682119061, 0),
(197, 18, 0, 'Primal Bag', 2, -2350, 1682119064, 0),
(198, 19, 0, 'Bag You Desire', 0, -800, 1682119067, 0),
(199, 18, 0, 'Primal Bag', 2, -2350, 1682119067, 0),
(200, 19, 0, 'Bag You Desire', 0, -800, 1682119069, 0),
(201, 18, 0, 'Primal Bag', 2, -2350, 1682119071, 0),
(202, 18, 0, 'Primal Bag', 2, -2350, 1682119075, 0),
(203, 18, 0, '360 Days of VIP Time', 0, -3000, 1682119144, 0),
(204, 18, 0, 'Tempest', 0, -500, 1682119167, 0),
(205, 18, 0, 'Prismatic Unicorn', 0, -400, 1682119189, 0),
(206, 18, 0, 'Nightdweller', 0, -400, 1682119199, 0),
(207, 18, 0, 'Full Guidon Bearer Outfit', 2, -800, 1682119223, 0),
(208, 18, 0, 'Full Royal Pumpkin Outfit', 2, -840, 1682119236, 0),
(209, 18, 0, 'Lasting Exercise Rod', 2, -1000, 1682119266, 0),
(210, 18, 0, 'Soulshroud', 2, -2500, 1682119285, 0),
(211, 18, 0, 'Soulhexer', 2, -2500, 1682119296, 0),
(212, 18, 0, 'Arboreal Crown', 2, -2650, 1682119311, 0),
(213, 18, 0, 'Arboreal Tome', 2, -2650, 1682119319, 0),
(214, 18, 0, 'Cobra Amulet', 2, -375, 1682119392, 0),
(215, 18, 0, 'Lion Amulet', 2, -375, 1682119411, 0),
(216, 18, 0, 'Full Pumpkin Mummy Outfit', 2, -800, 1682119533, 0),
(217, 18, 0, 'Charm Expansion', 0, -400, 1682119582, 0),
(218, 18, 0, 'Gold Pouch', 2, -1800, 1682119587, 0),
(219, 18, 0, 'Permanent Prey Slot', 0, -900, 1682119596, 0),
(220, 18, 0, 'XP Boost', 0, -30, 1682119610, 0),
(221, 19, 0, 'XP Boost', 0, -30, 1682119624, 0),
(222, 19, 0, 'Void Watcher', 0, -400, 1682119679, 0),
(223, 19, 0, 'Retro Warrior', 0, -400, 1682119711, 0),
(224, 19, 0, 'Gold Pouch', 0, -900, 1682119845, 0),
(225, 18, 0, 'Ferumbras Exercise Dummy', 2, -1800, 1682120272, 0),
(226, 18, 0, 'Gilded Imbuing Shrine', 2, -400, 1682120279, 0),
(227, 18, 0, 'Shiny Daily Reward Shrine', 2, -400, 1682120287, 0),
(228, 18, 0, 'Vengothic Cabinet', 2, -100, 1682120303, 0),
(229, 18, 0, 'Vengothic Chair', 2, -50, 1682120309, 0),
(230, 18, 0, 'Vengothic Chest', 2, -80, 1682120313, 0),
(231, 18, 0, 'Vengothic Table', 2, -50, 1682120317, 0),
(232, 18, 0, 'Patterned Carpet', 2, -30, 1682120443, 0),
(233, 19, 0, 'Anglerfish Lamp', 2, -120, 1682120556, 0),
(234, 19, 0, 'Baby Polar Bear', 2, -250, 1682120560, 0),
(235, 19, 0, 'Ferumbras Exercise Dummy', 0, -900, 1682120572, 0),
(236, 19, 0, 'Gilded Imbuing Shrine', 0, -200, 1682120576, 0),
(237, 19, 0, 'Ornate Mailbox', 0, -200, 1682120579, 0),
(238, 18, 0, 'Verdant Carpet', 2, -30, 1682120580, 0),
(239, 19, 0, 'Shiny Daily Reward Shrine', 0, -200, 1682120581, 0),
(240, 18, 0, 'Verdant Carpet', 2, -30, 1682120583, 0),
(241, 18, 0, 'Verdant Carpet', 2, -30, 1682120588, 0),
(242, 18, 0, 'Verdant Carpet', 2, -30, 1682120595, 0),
(243, 18, 0, 'Verdant Carpet', 2, -30, 1682120599, 0),
(244, 18, 0, 'Verdant Carpet', 2, -30, 1682120605, 0),
(245, 18, 0, 'Violet Square Cushion', 2, -50, 1682120609, 0),
(246, 18, 0, 'Violet Square Cushion', 2, -50, 1682120616, 0),
(247, 19, 0, 'Vengothic Cabinet', 2, -100, 1682120620, 0),
(248, 18, 0, 'Violet Square Cushion', 2, -50, 1682120620, 0),
(249, 19, 0, 'Vengothic Chair', 2, -50, 1682120624, 0),
(250, 18, 0, 'Violet Square Cushion', 2, -50, 1682120624, 0),
(251, 19, 0, 'Vengothic Chest', 2, -80, 1682120627, 0),
(252, 19, 0, 'Vengothic Table', 2, -50, 1682120630, 0),
(253, 18, 0, 'Vengothic Chair', 2, -50, 1682120702, 0),
(254, 18, 0, 'Vengothic Chair', 2, -50, 1682120706, 0),
(255, 18, 0, 'Vengothic Chair', 2, -50, 1682120710, 0),
(256, 19, 0, 'Prey Wildcard', 0, -50, 1682120738, 0),
(257, 19, 0, 'Permanent Prey Slot', 0, -900, 1682120744, 0),
(258, 19, 0, 'Lasting Exercise Rod', 0, -250, 1682120761, 0),
(259, 19, 0, 'Lion Amulet', 0, -75, 1682121937, 0),
(260, 19, 0, 'Lion Longbow', 0, -75, 1682121940, 0),
(261, 19, 0, 'Lion Spangenhelm', 0, -75, 1682121980, 0),
(262, 18, 0, 'Retro Hunter', 2, -800, 1682122839, 0),
(263, 19, 0, 'Falcon Greaves', 0, -125, 1682123056, 0),
(264, 19, 0, 'Falcon Greaves', 0, -125, 1682123088, 0),
(265, 19, 0, '7 Days of VIP Time', 0, -60, 1682123112, 0),
(266, 19, 0, 'Falcon Greaves', 2, -425, 1682123128, 0),
(267, 19, 0, 'Pair of Soulstalkers', 0, -950, 1682123144, 0),
(268, 19, 0, 'Alicorn Ring', 0, -1100, 1682123160, 0),
(269, 19, 0, 'Soulpiercer', 0, -950, 1682123180, 0),
(270, 18, 0, 'All Regular Blessings', 0, -130, 1682123733, 0),
(271, 18, 0, 'All Regular Blessings', 0, -130, 1682123911, 0),
(272, 19, 0, 'Cobra Amulet', 0, -75, 1682125361, 0),
(273, 19, 0, 'Batcat', 0, -400, 1682125862, 0),
(274, 19, 0, 'XP Boost', 0, -30, 1682127211, 0),
(275, 19, 0, 'Hireling Apprentice (Doubledoor)', 0, -150, 1682127459, 0),
(276, 18, 0, 'Hireling Apprentice (Kidauanus)', 0, -150, 1682128178, 0),
(277, 19, 0, 'All Regular Blessings', 0, -130, 1682128794, 0),
(278, 19, 0, '[Monster Hunt] - Winner', 2, 300, 1682129415, 0),
(279, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682129416, 0),
(280, 18, 0, 'All Regular Blessings', 0, -130, 1682129475, 0),
(281, 19, 0, 'All Regular Blessings', 0, -130, 1682129487, 0),
(282, 19, 0, 'All Regular Blessings', 0, -130, 1682129557, 0),
(283, 18, 0, 'All Regular Blessings', 0, -130, 1682129559, 0),
(284, 18, 0, 'XP Boost', 0, -30, 1682131251, 0),
(285, 18, 0, 'All Regular Blessings', 0, -130, 1682290696, 0),
(286, 19, 0, 'Ferumbras Dress', 0, -900, 1682291269, 0),
(287, 19, 0, 'All Regular Blessings', 0, -130, 1682291486, 0),
(288, 19, 0, 'All Regular Blessings', 0, -130, 1682291533, 0),
(289, 19, 0, 'XP Boost', 0, -30, 1682292627, 0),
(290, 19, 0, 'Frozen Rune', 0, -75, 1682294089, 0),
(291, 19, 0, 'Prey Wildcard', 0, -50, 1682294407, 0),
(292, 2, 0, 'Frozen Rune', 2, -300, 1682294673, 0),
(293, 18, 0, '[Online Time] Tournament Coins', 2, 20, 1682295099, 0),
(294, 19, 0, 'Soulbleeder', 0, -950, 1682296406, 0),
(295, 19, 0, 'Soulbleeder', 0, -950, 1682297691, 0),
(296, 18, 0, 'Soulhexer', 2, -2500, 1682297767, 0),
(297, 18, 0, 'Soulhexer', 2, -2500, 1682297803, 0),
(298, 18, 0, '[Online Time] Tournament Coins', 2, 20, 1682298884, 0),
(299, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682298884, 0),
(300, 19, 0, '[Online Time] Tournament Coins', 2, 20, 1682298884, 0),
(301, 19, 0, 'All Regular Blessings', 0, -130, 1682300220, 0),
(302, 19, 0, 'Artic Unicorn', 0, -400, 1682300414, 0),
(303, 19, 0, 'Full Pumpkin Mummy Outfit', 0, -400, 1682300431, 0),
(304, 19, 0, 'Permanent Prey Slot', 0, -900, 1682300899, 0),
(305, 19, 0, 'XP Boost', 0, -30, 1682300924, 0),
(306, 19, 0, 'Gold Pouch', 0, -900, 1682302323, 0),
(307, 19, 0, 'Prey Wildcard', 0, -50, 1682302605, 0),
(308, 19, 0, 'Prey Wildcard', 0, -50, 1682302608, 0),
(309, 19, 0, 'Falcon Battleaxe', 0, -125, 1682303425, 0),
(310, 19, 0, 'Falcon Coif', 0, -125, 1682339544, 0),
(311, 19, 0, 'Falcon Greaves', 0, -125, 1682339548, 0),
(312, 19, 0, 'Falcon Plate', 0, -125, 1682339553, 0),
(313, 19, 0, 'Falcon Escutcheon', 0, -125, 1682339559, 0),
(314, 19, 0, 'Lion Amulet', 0, -75, 1682339582, 0),
(315, 19, 0, 'Cobra Amulet', 0, -75, 1682339590, 0),
(316, 19, 0, 'Cobra Boots', 0, -75, 1682339607, 0),
(317, 19, 0, 'Spiritthorn Armor', 0, -1100, 1682340650, 0),
(318, 19, 0, 'Spiritthorn Helmet', 0, -1100, 1682340654, 0),
(319, 19, 0, 'Spiritthorn Ring', 0, -1100, 1682340658, 0),
(320, 19, 0, 'Soulbiter', 0, -950, 1682340905, 0),
(321, 19, 0, 'Souleater', 0, -950, 1682340913, 0),
(322, 19, 0, 'SoulBastion', 0, -950, 1682340929, 0),
(323, 19, 0, 'Pair of Soulwalkers', 0, -950, 1682341936, 0),
(324, 19, 0, '[Online Time] Tournament Coins', 2, 20, 1682343188, 0),
(325, 19, 0, '360 Days of VIP Time', 0, -3000, 1682343454, 0),
(326, 19, 0, 'Cobra Axe', 0, -75, 1682345048, 0),
(327, 19, 0, '[Online Time] Tournament Coins', 2, 20, 1682346912, 0),
(328, 19, 0, '[Monster Hunt] - Winner', 2, 300, 1682346912, 0),
(329, 19, 0, 'Batcat', 0, -400, 1682348286, 0),
(330, 2, 0, 'Supreme Health Potion', 0, -113, 1682349641, 0),
(331, 2, 0, 'Alchemistic Bookstand', 2, -100, 1682349677, 0),
(332, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682353238, 0),
(333, 19, 0, '[Online Time] Tournament Coins', 2, 20, 1682354558, 0),
(334, 19, 0, 'Lasting Exercise Axe', 0, -250, 1682356172, 0),
(335, 19, 0, 'XP Boost', 0, -30, 1682357338, 0),
(336, 19, 0, 'All Regular Blessings', 0, -130, 1682358209, 0),
(337, 19, 0, 'Permanent Prey Slot', 0, -900, 1682359661, 0),
(338, 19, 0, 'Prey Wildcard', 0, -50, 1682359666, 0),
(339, 19, 0, 'Prey Wildcard', 0, -50, 1682359669, 0),
(340, 19, 0, 'Gold Pouch', 0, -900, 1682360271, 0),
(341, 19, 0, 'XP Boost', 0, -30, 1682360296, 0),
(342, 19, 0, 'Lasting Exercise Wand', 0, -250, 1682360450, 0),
(343, 19, 0, 'Full Conjurer Outfit', 0, -350, 1682360567, 0),
(344, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682360881, 0),
(345, 19, 0, 'Lasting Exercise Bow', 0, -250, 1682363353, 0),
(346, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682364541, 0),
(347, 19, 0, '[Online Time] Tournament Coins', 2, 20, 1682371141, 0),
(348, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682371141, 0),
(349, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682374801, 0),
(350, 18, 0, 'XP Boost', 0, -30, 1682375243, 0),
(351, 18, 0, 'Bag You Desire', 2, -2200, 1682375259, 0),
(352, 18, 0, 'Festive Snowman', 0, -500, 1682375327, 0),
(353, 19, 0, 'Cobra Wand', 0, -75, 1682375334, 0),
(354, 18, 0, 'Full Beastmaster Outfit', 2, -800, 1682375338, 0),
(355, 19, 0, 'Gnome Helmet', 0, -100, 1682375339, 0),
(356, 19, 0, 'Gnome Legs', 0, -100, 1682375341, 0),
(357, 19, 0, 'Lion Wand', 0, -75, 1682375358, 0),
(358, 19, 0, 'Falcon Circlet', 0, -125, 1682375374, 0),
(359, 19, 0, 'Falcon Wand', 0, -125, 1682375379, 0),
(360, 19, 0, 'Soulmantle', 0, -950, 1682375390, 0),
(361, 19, 0, 'Soultainter', 0, -950, 1682375404, 0),
(362, 19, 0, 'Soulshanks', 0, -950, 1682375410, 0),
(363, 18, 0, 'Gold Pouch', 2, -1800, 1682375878, 0),
(364, 18, 0, 'All Regular Blessings', 0, -130, 1682376101, 0),
(365, 18, 0, 'Axe of Destruction', 2, -350, 1682376809, 0),
(366, 18, 0, 'Chopper Of Destruction', 2, -350, 1682376818, 0),
(367, 18, 0, 'Cobra Hood', 2, -375, 1682376838, 0),
(368, 18, 0, 'Falcon Greaves', 2, -425, 1682376852, 0),
(369, 18, 0, 'Falcon Plate', 2, -425, 1682376858, 0),
(370, 18, 0, 'Pair of Soulwalkers', 2, -2500, 1682376871, 0),
(371, 18, 0, 'Soulbiter', 2, -2500, 1682376880, 0),
(372, 18, 0, 'Souleater', 2, -2500, 1682376888, 0),
(373, 19, 0, '[Online Time] Tournament Coins', 2, 20, 1682377921, 0),
(374, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682378461, 0),
(375, 18, 0, '[Online Time] Tournament Coins', 2, 20, 1682378761, 0),
(376, 18, 0, 'Falcon Battleaxe', 2, -425, 1682379064, 0),
(377, 18, 0, 'Spiritthorn Helmet', 2, -2650, 1682380077, 0),
(378, 18, 0, 'Spiritthorn Armor', 2, -2650, 1682380082, 0),
(379, 18, 0, 'Spiritthorn Ring', 2, -2650, 1682380095, 0),
(380, 18, 0, 'Character Sex Change', 0, -100, 1682380169, 0),
(381, 18, 0, 'Lasting Exercise Axe', 2, -1000, 1682380356, 0),
(382, 2, 0, 'Gnome Helmet', 2, -400, 1682380678, 0),
(383, 3, 0, 'Lasting Exercise Rod', 2, -1000, 1682381397, 0),
(384, 3, 0, 'Frozen Rune', 2, -300, 1682383400, 0),
(385, 2, 0, 'All Regular Blessings', 0, -130, 1682384135, 0),
(386, 2, 0, 'All Regular Blessings', 0, -130, 1682384171, 0),
(387, 20, 0, 'Flamesteed', 0, -500, 1682384711, 0),
(388, 20, 0, 'All Regular Blessings', 0, -130, 1682385546, 0),
(389, 20, 0, 'Twist of Fate', 0, -8, 1682385552, 0),
(390, 18, 0, 'SoulBastion', 2, -2500, 1682385832, 0),
(391, 19, 0, 'All Regular Blessings', 0, -130, 1682385937, 0),
(392, 19, 0, 'Twist of Fate', 0, -8, 1682385942, 0),
(393, 19, 0, 'Primal Bag', 0, -950, 1682386059, 0),
(394, 19, 0, 'Primal Bag', 0, -950, 1682386063, 0),
(395, 19, 0, 'All Regular Blessings', 0, -130, 1682386409, 0),
(396, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682386495, 0),
(397, 3, 0, 'Soulshanks', 2, -2500, 1682386760, 0),
(398, 3, 0, 'Arcanomancer Regalia', 2, -2650, 1682386775, 0),
(399, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682428736, 0),
(400, 19, 0, '[Online Time] Tournament Coins', 2, 20, 1682430056, 0),
(401, 19, 0, '[Online Time] Tournament Coins', 2, 20, 1682433716, 0),
(402, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682438939, 0),
(403, 19, 0, '[Online Time] Tournament Coins', 2, 20, 1682438939, 0),
(404, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682442599, 0),
(405, 19, 0, '[Online Time] Tournament Coins', 2, 20, 1682442599, 0),
(406, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682446259, 0),
(407, 19, 0, '[Online Time] Tournament Coins', 2, 20, 1682446739, 0),
(408, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682449919, 0),
(409, 19, 0, '[Online Time] Tournament Coins', 2, 20, 1682450399, 0),
(410, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682453579, 0),
(411, 19, 0, '[Online Time] Tournament Coins', 2, 20, 1682454059, 0),
(412, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682457239, 0),
(413, 19, 0, '[Online Time] Tournament Coins', 2, 20, 1682458319, 0),
(414, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682460899, 0),
(415, 19, 0, '[Online Time] Tournament Coins', 2, 20, 1682461979, 0),
(416, 18, 0, '[Online Time] Tournament Coins', 2, 20, 1682462999, 0),
(417, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682464559, 0),
(418, 19, 0, '[Online Time] Tournament Coins', 2, 20, 1682465639, 0),
(419, 19, 0, '[Online Time] Tournament Coins', 2, 20, 1682469299, 0),
(420, 19, 0, '[Online Time] Tournament Coins', 2, 20, 1682472959, 0),
(421, 19, 0, '[Online Time] Tournament Coins', 2, 20, 1682517786, 0),
(422, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682519106, 0),
(423, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682524741, 0),
(424, 19, 0, '[Online Time] Tournament Coins', 2, 20, 1682527981, 0),
(425, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682528401, 0),
(426, 19, 0, '[Online Time] Tournament Coins', 2, 20, 1682531641, 0),
(427, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682532061, 0),
(428, 19, 0, '[Online Time] Tournament Coins', 2, 20, 1682535301, 0),
(429, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682535721, 0),
(430, 19, 0, '[Online Time] Tournament Coins', 2, 20, 1682538961, 0),
(431, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682539381, 0),
(432, 19, 0, 'Prey Wildcard', 0, -50, 1682542787, 0),
(433, 19, 0, '[Online Time] Tournament Coins', 2, 20, 1682543058, 0),
(434, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682543058, 0),
(435, 19, 0, '[Online Time] Tournament Coins', 2, 20, 1682546718, 0),
(436, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682546718, 0),
(437, 19, 0, '[Online Time] Tournament Coins', 2, 20, 1682550378, 0),
(438, 19, 0, '[Online Time] Tournament Coins', 2, 20, 1682554038, 0),
(439, 2, 0, 'Alicorn Quiver', 0, -1100, 1682634449, 0),
(440, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682637898, 0),
(441, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682641558, 0),
(442, 2, 0, '[Online Time] Tournament Coins', 2, 20, 1682645569, 0),
(443, 19, 0, '[Online Time] Tournament Coins', 2, 20, 1682693583, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `s_attributes`
--

CREATE TABLE `s_attributes` (
  `item_id` int(11) NOT NULL,
  `attack` varchar(11) DEFAULT NULL,
  `armor` varchar(11) DEFAULT NULL,
  `defense` varchar(11) DEFAULT NULL,
  `extraDef` varchar(4) DEFAULT NULL,
  `range` varchar(11) DEFAULT NULL,
  `speed` varchar(4) DEFAULT NULL,
  `elementFire` varchar(11) DEFAULT NULL,
  `elementIce` varchar(11) DEFAULT NULL,
  `elementEarth` varchar(11) DEFAULT NULL,
  `elementEnergy` varchar(11) DEFAULT NULL,
  `skillShield` varchar(4) DEFAULT NULL,
  `skillDist` varchar(4) DEFAULT NULL,
  `skillFist` varchar(4) DEFAULT NULL,
  `skillClub` varchar(4) DEFAULT NULL,
  `skillAxe` varchar(4) DEFAULT NULL,
  `skillSword` varchar(4) DEFAULT NULL,
  `magicLevelPoints` varchar(4) DEFAULT NULL,
  `absorbPercentAll` varchar(3) DEFAULT NULL,
  `absorbPercentFire` varchar(3) DEFAULT NULL,
  `absorbPercentEarth` varchar(3) DEFAULT NULL,
  `absorbPercentEnergy` varchar(3) DEFAULT NULL,
  `absorbPercentIce` varchar(3) DEFAULT NULL,
  `absorbPercentDeath` varchar(3) DEFAULT NULL,
  `absorbPercentHoly` varchar(3) DEFAULT NULL,
  `absorbPercentPhysical` varchar(3) DEFAULT NULL,
  `absorbPercentManaDrain` varchar(3) DEFAULT NULL,
  `absorbPercentLifeDrain` varchar(3) DEFAULT NULL,
  `charges` varchar(11) DEFAULT NULL,
  `duration` varchar(11) DEFAULT NULL,
  `preventDrop` varchar(11) DEFAULT NULL,
  `containerSize` varchar(11) DEFAULT NULL,
  `hitChance` varchar(11) DEFAULT NULL,
  `shootType` varchar(12) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `s_items`
--

CREATE TABLE `s_items` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `descr` text DEFAULT NULL,
  `weight` int(11) NOT NULL,
  `itemid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `ticket_subject` varchar(255) DEFAULT NULL,
  `ticket_author` varchar(255) DEFAULT NULL,
  `ticket_author_acc_id` int(11) NOT NULL,
  `ticket_last_reply` varchar(11) DEFAULT NULL,
  `ticket_admin_reply` int(11) DEFAULT NULL,
  `ticket_date` varchar(255) DEFAULT NULL,
  `ticket_ended` varchar(255) DEFAULT NULL,
  `ticket_status` varchar(255) DEFAULT NULL,
  `ticket_category` varchar(255) DEFAULT NULL,
  `ticket_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tickets_reply`
--

CREATE TABLE `tickets_reply` (
  `reply_id` int(11) NOT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `reply_author` varchar(255) DEFAULT NULL,
  `reply_message` varchar(255) DEFAULT NULL,
  `reply_date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tile_store`
--

CREATE TABLE `tile_store` (
  `house_id` int(11) NOT NULL,
  `data` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `tile_store`
--

INSERT INTO `tile_store` (`house_id`, `data`) VALUES
(1, 0xe803c70407020000000366006f0d00),
(1, 0xe903c7040706000000036600050c0f0e004d5b0f64004d5b0f64004d5b0f64004d5b0f6400),
(1, 0xea03c6040701000000422000),
(1, 0xea03c7040705000000036600f17901d7b933a68701000000ed1c005e0d002b85280129010000000000000003003530300218d10e010000000000),
(1, 0xeb03c7040703000000036600876201aaf92ea687010000005e0d00),
(1, 0xec03c7040705000000036600f17901b8ca33a68701000000ed1c005e0d002b852902000000000000000300353030021833e200000000000300353031023f33e2000000000000),
(1, 0xe803c80407010000008c62170000000000),
(1, 0xe803c90407010000005e620192842ea68701000000),
(1, 0xe803ca040701000000906f0173692ea68701000000),
(1, 0xe803cb040701000000c402141600000015e9be496400),
(1, 0xe903ca040715000000fa1c00fa1c00fa1c00fa1c00fa1c007d1f00921f00921f00921f00fa1c007d1f00921f00921f00bc250f260063190f6400203f00921f00fa1c00c62800930e0f640063190f6400),
(1, 0xe903cb040701000000c502141600000015e9be496400),
(1, 0xea03c8040702000000036600866201651835a68701000000),
(1, 0xea03c9040702000000f17901b8aa33a68701000000a21f00),
(1, 0xea03ca0407010000007d1f00),
(1, 0xea03cb0407020000006d5f009062170000000000),
(1, 0xeb03c80407020000008962016a192fa687010000003397182500706f6469756d206f66207669676f757220646973706c6179696e6720466572756d62726173290a000000000000000b00626f737376697369626c650201000000000000000a006c6f6f6b6164646f6e7302000000000000000008006c6f6f6b626f64790200000000000000000d006c6f6f6b646972656374696f6e02020000000000000008006c6f6f6b6665657402000000000000000008006c6f6f6b6865616402000000000000000008006c6f6f6b6c65677302000000000000000008006c6f6f6b7479706502e5000000000000000c00706f6469756d626f7373696402e7000000000000000d00706f6469756d76697369626c6502010000000000000000),
(1, 0xeb03c90407020000008562012a0b35a68701000000a21f00),
(1, 0xeb03ca040701000000bd7600),
(1, 0xeb03cb040703000000a1250f0f00bf250f0500d5250f1900),
(1, 0xec03c804070100000088620133fb34a68701000000),
(1, 0xec03c9040702000000f17901b69033a68701000000a21f00),
(1, 0xec03ca0407010000002f7000),
(1, 0xec03cb0407010000007b640134a32ea68701000000),
(2, 0xdf03c70407010000001f6c01aeeaa2a08701000000),
(2, 0xdf03cb040701000000c402140a000000159530476400),
(2, 0xe003c70407010000007964018fa7da9e8701000027010000),
(2, 0xe203c6040701000000422000),
(2, 0xe003c80407010000004d5b0f1400),
(2, 0xe003cb040701000000c502140a000000159530476400),
(2, 0xe103c8040701000000665b073900556e7772617020697420696e20796f7572206f776e20686f75736520746f206372656174652061203c6465636f726174696f6e206b69743e2e2701002901000000000000000800756e77726170696402339700000000000000),
(3, 0xd903c6040701000000412000),
(3, 0xda03cb040701000000e00200),
(3, 0xdb03cb040701000000e10200),
(4, 0xcd03c70407010000008c62170000000000),
(4, 0xce03c70407010000005f62016c0e33a68701000000),
(4, 0xcf03c70407010000007b64015c2333a68701000000),
(4, 0xcd03c80407010000004a231093e89f18110100),
(4, 0xcd03c90407010000003397182500706f6469756d206f66207669676f757220646973706c6179696e6720466572756d62726173290a000000000000000b00626f737376697369626c650201000000000000000a006c6f6f6b6164646f6e7302000000000000000008006c6f6f6b626f64790200000000000000000d006c6f6f6b646972656374696f6e02020000000000000008006c6f6f6b6665657402000000000000000008006c6f6f6b6865616402000000000000000008006c6f6f6b6c65677302000000000000000008006c6f6f6b7479706502e5000000000000000c00706f6469756d626f7373696402e7000000000000000d00706f6469756d76697369626c6502010000000000000000),
(4, 0xcd03cb040701000000c402141300000015062f4b6400),
(4, 0xce03c8040701000000d58916403800),
(4, 0xce03c9040701000000d58916343800),
(4, 0xce03cb040701000000c502141300000015062f4b6400),
(4, 0xcf03cb0407010000008d6217050000003b6b005e0d00a01f00f31c006f0d0000),
(4, 0xd003c6040702000000422000d21c0f0b00),
(4, 0xd203c70407010000008f6f01cdff32a68701000000),
(4, 0xd003c8040701000000876201dbc733a68701000000),
(4, 0xd003c9040701000000896201ace033a68701000000),
(4, 0xd003cb040701000000695b00),
(4, 0xd203ca04070100000003700193c032a68701000000),
(4, 0xd203cb04070100000016800108d132a68701000000),
(5, 0xbf03c9040701000000240900),
(5, 0xc003c6040701000000412000),
(5, 0xc203c7040701000000e00200),
(5, 0xc303c7040701000000e10200),
(5, 0xc103c80407010000003f2000),
(6, 0xb403c6040701000000412000),
(6, 0xb603c7040701000000e00200),
(6, 0xb703c7040701000000e10200),
(6, 0xb303c9040701000000240900),
(6, 0xb503c80407010000003f2000),
(7, 0xea03be040601000000412000),
(7, 0xe903c1040601000000e00200),
(7, 0xea03c1040601000000e10200),
(8, 0xdc03b3040601000000e00200),
(8, 0xdd03b3040601000000e10200),
(8, 0xdf03b8040601000000412000),
(9, 0xdd03bc040601000000412000),
(9, 0xda03c0040601000000de0200),
(9, 0xda03c1040601000000df0200),
(10, 0xd603b3040601000000e00200),
(10, 0xd703b3040601000000e10200),
(10, 0xd403b8040601000000412000),
(11, 0xea03c6040601000000412000),
(11, 0xec03ca040601000000de0200),
(11, 0xec03cb040601000000df0200),
(12, 0xdf03ca040601000000de0200),
(12, 0xdf03cb040601000000df0200),
(12, 0xe203c6040601000000412000),
(13, 0xd903c6040601000000412000),
(13, 0xdb03ca040601000000de0200),
(13, 0xdb03cb040601000000df0200),
(14, 0xbd03ca040601000000de0200),
(14, 0xbd03cb040601000000df0200),
(14, 0xc203c90406010000003f2000),
(15, 0xb203c7040601000000e00200),
(15, 0xb303c7040601000000e10200),
(15, 0xb603c90406010000003f2000),
(16, 0xa503c6040701000000412000),
(16, 0xa203ca040701000000de0200),
(16, 0xa203cb040701000000df0200),
(17, 0xa203bf0407010000003f2000),
(17, 0xa503bf0407010000003f2000),
(17, 0xa003c1040701000000e00200),
(17, 0xa103c1040701000000e10200),
(18, 0xa003b3040701000000e00200),
(18, 0xa103b3040701000000e10200),
(18, 0xa103b5040701000000412000),
(18, 0xa503b60407010000003f2000),
(19, 0xa003ab040701000000de0200),
(19, 0xa003ac040701000000df0200),
(19, 0xa503ad0407010000003f2000),
(20, 0xab03af040701000000de0200),
(20, 0xae03ac040701000000412000),
(20, 0xab03b0040701000000df0200),
(21, 0xa103a0040701000000e00200),
(21, 0xa203a0040701000000e10200),
(21, 0xa203a3040701000000412000),
(21, 0xa603a40407010000003f2000),
(22, 0xaf03a0040701000000de0200),
(22, 0xaf03a1040701000000df0200),
(22, 0xb103a5040701000000412000),
(23, 0xa10398040701000000e00200),
(23, 0xa20398040701000000e10200),
(23, 0xa6039a0407010000003f2000),
(24, 0xab038a040601000000de0200),
(24, 0xab038b040601000000df0200),
(24, 0xad038a040601000000de0200),
(24, 0xad038b040601000000df0200),
(24, 0xae038a040601000000de0200),
(24, 0xae038b040601000000df0200),
(24, 0xa6038d040701000000de0200),
(24, 0xa6038e040701000000df0200),
(24, 0xa9038f0407010000003f2000),
(24, 0xae038e040601000000412000),
(24, 0xb0038a040601000000de0200),
(24, 0xb0038b040601000000df0200),
(24, 0xb2038f0407010000003f2000),
(24, 0xb5038d040701000000de0200),
(24, 0xb5038e040701000000df0200),
(24, 0xae0396040701000000412000),
(25, 0xbc038c040701000000412000),
(25, 0xb90391040701000000de0200),
(25, 0xb90392040701000000df0200),
(26, 0xc20393040701000000e00200),
(26, 0xc30393040701000000e10200),
(26, 0xc80393040701000000e00200),
(26, 0xc90393040701000000e10200),
(26, 0xc60396040701000000412000),
(26, 0xc60399040701000000412000),
(27, 0xb90396040701000000de0200),
(27, 0xb90397040701000000df0200),
(27, 0xbc039c040701000000412000),
(28, 0xcf038f040701000000de0200),
(28, 0xd2038f040701000000de0200),
(28, 0xcf0390040701000000df0200),
(28, 0xd20390040701000000df0200),
(28, 0xd30395040701000000412000),
(29, 0xc20389040701000000de0200),
(29, 0xc2038a040701000000df0200),
(29, 0xc50389040701000000de0200),
(29, 0xc5038a040701000000df0200),
(29, 0xc4038c040701000000412000),
(29, 0xca038d0407010000003f2000),
(30, 0xcd0387040701000000de0200),
(30, 0xcd0388040701000000df0200),
(30, 0xd0038b040701000000412000),
(31, 0xd60387040701000000de0200),
(31, 0xd60388040701000000df0200),
(31, 0xd9038b040701000000412000),
(32, 0xdf0387040701000000de0200),
(32, 0xdf0388040701000000df0200),
(32, 0xe2038b040701000000412000),
(33, 0xdc038f040701000000de0200),
(33, 0xe2038f040701000000de0200),
(33, 0xdc0390040701000000df0200),
(33, 0xdf0395040701000000412000),
(33, 0xe20390040701000000df0200),
(34, 0xe80392040701000000412000),
(34, 0xef0392040701000000412000),
(34, 0xe60395040601000000e60200),
(34, 0xe60396040601000000e70200),
(34, 0xea0395040601000000e60200),
(34, 0xea0396040601000000e70200),
(34, 0xeb0397040701000000412000),
(34, 0xec0395040601000000e60200),
(34, 0xec0396040601000000e70200),
(34, 0xf00395040601000000e60200),
(34, 0xf00396040601000000e70200),
(35, 0xf90394040701000000de0200),
(35, 0xf90395040701000000df0200),
(35, 0xf80398040701000000412000),
(36, 0x010494040701000000de0200),
(36, 0x010495040701000000df0200),
(36, 0x000498040701000000412000),
(37, 0x090494040701000000de0200),
(37, 0x090495040701000000df0200),
(37, 0x080498040701000000412000),
(38, 0x070488040701000000e00200),
(38, 0x080488040701000000e10200),
(38, 0x090488040701000000e00200),
(38, 0x0a0488040701000000e10200),
(38, 0x09048c040701000000412000),
(38, 0x0b0490040701000000412000),
(39, 0x0a049d040701000000de0200),
(39, 0x0a049e040701000000df0200),
(39, 0x0f04a00407010000003f2000),
(40, 0x06049d040701000000de0200),
(40, 0x06049e040701000000df0200),
(40, 0x0104a00407010000003f2000),
(41, 0xf9039d040701000000de0200),
(41, 0xf9039e040701000000df0200),
(41, 0xfe039e0407010000003f2000),
(42, 0xf903a1040701000000de0200),
(42, 0xf903a2040701000000df0200),
(42, 0xfe03a20407010000003f2000),
(43, 0xf1039e0407010000003f2000),
(43, 0xf6039d040701000000de0200),
(43, 0xf6039e040701000000df0200),
(44, 0xf103a20407010000003f2000),
(44, 0xf603a1040701000000de0200),
(44, 0xf603a2040701000000df0200),
(45, 0xe5039a040701000000de0200),
(45, 0xe5039b040701000000df0200),
(45, 0xe8039f040701000000412000),
(46, 0xe903a3040701000000e00200),
(46, 0xea03a3040701000000e10200),
(46, 0xe603a5040701000000412000),
(46, 0xe903a8040701000000412000),
(47, 0xe703ac040601000000de0200),
(47, 0xe703ad040601000000df0200),
(47, 0xe503af040701000000412000),
(48, 0xee03ad0407010000003f2000),
(48, 0xf103ab040701000000e00200),
(48, 0xf203ab040701000000e10200),
(49, 0xf803ab040701000000e00200),
(49, 0xf903ab040701000000e10200),
(49, 0xf903b0040701000000412000),
(50, 0x0104b0040701000000e00200),
(50, 0x0204b0040701000000e10200),
(50, 0x0404b6040701000000412000),
(51, 0x0604a7040701000000de0200),
(51, 0x0004aa0407010000003f2000),
(51, 0x0604a8040701000000df0200),
(52, 0x0904a7040701000000de0200),
(52, 0x0904a8040701000000df0200),
(52, 0x0f04aa0407010000003f2000),
(53, 0x0e04b0040701000000de0200),
(53, 0x0e04b1040701000000df0200),
(53, 0x0c04b6040701000000412000),
(54, 0x0104b0040601000000de0200),
(54, 0x0104b1040601000000df0200),
(54, 0x0404b6040601000000412000),
(55, 0x0e04bb040701000000de0200),
(55, 0x0704bd0407010000003f2000),
(55, 0x0e04bc040701000000df0200),
(56, 0x0704c20407010000003f2000),
(56, 0x0e04c0040701000000de0200),
(56, 0x0e04c1040701000000df0200),
(57, 0xfd03c0040701000000de0200),
(57, 0xfd03c1040701000000df0200),
(57, 0x0304c20407010000003f2000),
(58, 0xfd03bb040701000000de0200),
(58, 0xfd03bc040701000000df0200),
(58, 0x0304bd0407010000003f2000),
(59, 0xf403b7040701000000de0200),
(59, 0xf403b8040701000000df0200),
(59, 0xf403bb0407010000003f2000),
(59, 0xf703b9040701000000412000),
(60, 0xf403c20407010000003f2000),
(60, 0xf803c3040701000000e00200),
(60, 0xf903c3040701000000e10200),
(61, 0xdb03ac040601000000de0200),
(61, 0xdb03ad040601000000df0200),
(61, 0xd903af040701000000412000),
(62, 0xd603a7040601000000e00200),
(62, 0xd703a7040601000000e10200),
(62, 0xde03a7040601000000412000),
(63, 0xd603a3040701000000de0200),
(63, 0xde03a3040701000000de0200),
(63, 0xd603a4040701000000df0200),
(63, 0xda03a7040701000000412000),
(63, 0xde03a4040701000000df0200),
(64, 0xd7039a040701000000e00200),
(64, 0xd8039a040701000000e10200),
(64, 0xda039f040701000000412000),
(65, 0xcd039d040701000000e00200),
(65, 0xce039d040701000000e10200),
(65, 0xd1039f0407010000003f2000),
(66, 0xcd03a5040701000000412000),
(66, 0xca03a9040701000000e00200),
(66, 0xcb03a9040701000000e10200),
(67, 0xc903af0407010000003f2000),
(67, 0xcf03af040701000000412000),
(67, 0xce03b1040701000000e00200),
(67, 0xcf03b1040701000000e10200),
(68, 0xc303ad040601000000de0200),
(68, 0xc303ae040601000000df0200),
(68, 0xc103ac040701000000412000),
(69, 0xba03ad040601000000de0200),
(69, 0xba03ae040601000000df0200),
(69, 0xb803ac040701000000412000),
(70, 0xb603a0040701000000de0200),
(70, 0xb603a1040701000000df0200),
(70, 0xb903a5040701000000412000),
(71, 0xc003a0040701000000de0200),
(71, 0xc003a1040701000000df0200),
(71, 0xc303a5040701000000412000),
(72, 0xaf03a0040601000000de0200),
(72, 0xaf03a1040601000000df0200),
(72, 0xb103a5040601000000412000),
(73, 0xb603a0040601000000e00200),
(73, 0xb703a0040601000000e10200),
(73, 0xb903a5040601000000412000),
(74, 0xc003a0040601000000e00200),
(74, 0xc103a0040601000000e10200),
(74, 0xc303a5040601000000412000),
(75, 0xab03b4040601000000e00200),
(75, 0xac03b4040601000000e10200),
(75, 0xad03b60406010000003f2000),
(76, 0xb003b60406010000003f2000),
(76, 0xb103b4040601000000e00200),
(76, 0xb203b4040601000000e10200),
(77, 0xab03b9040601000000e00200),
(77, 0xac03b9040601000000e10200),
(77, 0xad03bb0406010000003f2000),
(78, 0xb003bb0406010000003f2000),
(78, 0xb103b9040601000000e00200),
(78, 0xb203b9040601000000e10200),
(79, 0xab03b9040701000000e00200),
(79, 0xac03b9040701000000e10200),
(79, 0xad03bb0407010000003f2000),
(80, 0xab03b4040701000000e00200),
(80, 0xac03b4040701000000e10200),
(80, 0xad03b60407010000003f2000),
(81, 0xb003b60407010000003f2000),
(81, 0xb103b4040701000000e00200),
(81, 0xb203b4040701000000e10200),
(82, 0xb003bb0407010000003f2000),
(82, 0xb103b9040701000000e00200),
(82, 0xb203b9040701000000e10200),
(83, 0xba03ce040701000000412000),
(83, 0xbd03d1040601000000de0200),
(83, 0xbd03d2040601000000df0200),
(84, 0xcf038f040601000000e00200),
(84, 0xd0038f040601000000e10200),
(84, 0xd10395040601000000412000),
(85, 0xd4038f040601000000e00200),
(85, 0xd5038f040601000000e10200),
(85, 0xd60395040601000000412000),
(86, 0xf803ab040601000000e00200),
(86, 0xf903ab040601000000e10200),
(86, 0xf903b0040601000000412000),
(87, 0xf403b7040601000000e00200),
(87, 0xf503b7040601000000e10200),
(87, 0xf703ba040601000000412000),
(87, 0xf703be040601000000412000),
(88, 0xfd03bb040601000000e00200),
(88, 0xfe03bb040601000000e10200),
(88, 0x0004c2040601000000412000),
(89, 0x0804bb040601000000e00200),
(89, 0x0904bb040601000000e10200),
(89, 0x0a04bb040601000000e00200),
(89, 0x0b04bb040601000000e10200),
(89, 0x0a04be040601000000412000),
(89, 0x0b04c2040601000000412000),
(90, 0xa103a0040601000000e00200),
(90, 0xa203a0040601000000e10200),
(90, 0xa303a6040601000000412000),
(91, 0xa10398040601000000de0200),
(91, 0xa10399040601000000df0200),
(91, 0xa4039a0406010000003f2000),
(92, 0xb903be040401000000b70900),
(92, 0xb903bf040401000000b80900),
(92, 0xbd03bf040401000000741b00),
(92, 0xba03c2040401000000731b00),
(92, 0xbb03c2040401000000731b00),
(92, 0xbd03c0040401000000f71a00),
(93, 0xb903b9040401000000bd0900),
(93, 0xba03b9040401000000be0900),
(93, 0xbd03ba040401000000741b00),
(93, 0xbd03bb040401000000f71a00),
(94, 0xb903b4040401000000bd0900),
(94, 0xba03b4040401000000be0900),
(94, 0xbf03b8040401000000731b00),
(94, 0xc003b8040401000000ee1a00),
(94, 0xc103b8040401000000731b00),
(95, 0xbd03bb040301000000ee1a00),
(95, 0xbe03bb040301000000731b00),
(95, 0xbb03c0040301000000b70900),
(95, 0xbb03c1040301000000b80900),
(95, 0xbd03c2040301000000731b00),
(95, 0xbe03c2040301000000731b00),
(96, 0xbb03b4040301000000bd0900),
(96, 0xbc03b4040301000000be0900),
(96, 0xbd03b7040301000000ee1a00),
(96, 0xbe03b7040301000000731b00),
(97, 0xc90270050601000000f71a00),
(97, 0xc80273050701000000ee1a00),
(97, 0xc90270050701000000f71a00),
(97, 0xc90272050701000000f71a00),
(97, 0xcb0273050701000000731b00),
(97, 0xce0270050601000000741b00),
(97, 0xcc0271050701000000de0200),
(97, 0xcc0272050701000000df0200),
(97, 0xcd0271050701000000e20200),
(97, 0xcd0272050701000000e30200),
(97, 0xcd0273050701000000731b00),
(97, 0xce0270050701000000741b00),
(97, 0xce0272050701000000741b00),
(98, 0xd70276050601000000f71a00),
(98, 0xd40276050701000000f71a00),
(98, 0xd40277050701000000741b00),
(98, 0xd70275050701000000f71a00),
(98, 0xdb0276050601000000741b00),
(98, 0xd90277050701000000e20200),
(98, 0xda0277050701000000e20200),
(98, 0xdb0275050701000000f71a00),
(98, 0xdb0276050701000000741b00),
(98, 0xd60279050701000000731b00),
(98, 0xd90278050701000000e30200),
(98, 0xd90279050701000000731b00),
(98, 0xda0278050701000000e30200),
(99, 0xd6027e050601000000f71a00),
(99, 0xd4027d050701000000f71a00),
(99, 0xd4027e050701000000741b00),
(99, 0xd7027e050701000000e20200),
(99, 0xd7027f050701000000e30200),
(99, 0xd9027d050601000000741b00),
(99, 0xd9027f050601000000741b00),
(99, 0xd8027e050701000000e20200),
(99, 0xd8027f050701000000e30200),
(99, 0xd9027d050701000000741b00),
(99, 0xd9027f050701000000741b00),
(99, 0xd60280050701000000731b00),
(99, 0xd80280050601000000731b00),
(99, 0xd80280050701000000731b00),
(100, 0xca027b050701000000f71a00),
(100, 0xcc0279050701000000ee1a00),
(100, 0xce027b050701000000741b00),
(100, 0xc7027f050601000000741b00),
(100, 0xca027f050601000000f71a00),
(100, 0xc8027e050701000000e20200),
(100, 0xc8027f050701000000e30200),
(100, 0xc9027e050701000000e20200),
(100, 0xc9027f050701000000e30200),
(100, 0xcc027c050601000000ee1a00),
(100, 0xce027f050601000000741b00),
(100, 0xcc027c050701000000ee1a00),
(100, 0xce027f050701000000741b00),
(100, 0xc90280050601000000731b00),
(100, 0xc90280050701000000731b00),
(100, 0xcb0280050701000000731b00),
(100, 0xcd0280050601000000731b00),
(100, 0xcd0280050701000000731b00),
(101, 0xbc0279050701000000ee1a00),
(101, 0xbf027a050701000000e20200),
(101, 0xbf027b050701000000e30200),
(101, 0xbb027c050701000000ee1a00),
(101, 0xbc027f050701000000731b00),
(101, 0xbe027f050701000000731b00),
(101, 0xbf027d050701000000e20200),
(101, 0xbf027e050701000000e30200),
(101, 0xc0027b050701000000741b00),
(101, 0xc0027d050701000000741b00),
(102, 0xb30279050701000000731b00),
(102, 0xb40279050701000000ee1a00),
(102, 0xb3027c050701000000ee1a00),
(102, 0xb3027f050701000000731b00),
(102, 0xb4027e050701000000f71a00),
(102, 0xb5027f050701000000731b00),
(102, 0xb6027d050701000000e20200),
(102, 0xb6027e050701000000e30200),
(102, 0xb7027e050701000000741b00),
(103, 0xaf0279050701000000ee1a00),
(103, 0xad027d050701000000e20200),
(103, 0xad027e050701000000e30200),
(103, 0xae027d050701000000e20200),
(103, 0xae027e050701000000e30200),
(103, 0xae027f050701000000731b00),
(103, 0xb0027b050701000000ee1a00),
(103, 0xb0027f050701000000731b00),
(104, 0xad026e050701000000e20200),
(104, 0xad026f050701000000e30200),
(104, 0xb0026f050701000000f71a00),
(104, 0xae0270050701000000ee1a00),
(104, 0xae0273050701000000731b00),
(104, 0xaf0273050701000000ee1a00),
(104, 0xb00272050701000000741b00),
(105, 0x9f0275050701000000e20200),
(105, 0x9f0276050701000000e30200),
(105, 0xa20273050701000000f71a00),
(105, 0xa00274050701000000ee1a00),
(105, 0xa10277050701000000731b00),
(105, 0xa40277050701000000731b00),
(105, 0xa50274050701000000f71a00),
(105, 0xa50275050701000000741b00),
(106, 0x9f026c050701000000e20200),
(106, 0x9f026d050701000000e30200),
(106, 0xa0026b050701000000ee1a00),
(106, 0xa2026a050701000000f71a00),
(106, 0xa5026b050701000000f71a00),
(106, 0xa1026e050701000000731b00),
(106, 0xa4026e050701000000731b00),
(106, 0xa5026c050701000000741b00),
(107, 0xad0263050701000000e20200),
(107, 0xae0263050701000000e20200),
(107, 0xae0265050601000000731b00),
(107, 0xad0264050701000000e30200),
(107, 0xae0264050701000000e30200),
(107, 0xae0265050701000000731b00),
(107, 0xb20262050601000000741b00),
(107, 0xb00263050701000000f71a00),
(107, 0xb30260050701000000ee1a00),
(107, 0xb40262050701000000741b00),
(107, 0xb10265050601000000731b00),
(107, 0xb20264050601000000741b00),
(107, 0xb20265050701000000731b00),
(107, 0xb40264050701000000741b00),
(108, 0xbe0262050601000000ee1a00),
(108, 0xbe0262050701000000ee1a00),
(108, 0xbb0265050601000000731b00),
(108, 0xbb0265050701000000731b00),
(108, 0xbe0265050601000000731b00),
(108, 0xbf0264050601000000741b00),
(108, 0xbc0264050701000000f71a00),
(108, 0xbe0265050701000000731b00),
(108, 0xbf0264050701000000741b00),
(109, 0xd00262050701000000e20200),
(109, 0xd00263050701000000e30200),
(109, 0xd30263050701000000f71a00),
(109, 0xd10264050701000000ee1a00),
(109, 0xd10267050701000000731b00),
(109, 0xd20267050701000000ee1a00),
(109, 0xd30266050701000000741b00),
(110, 0xcd0257050601000000731b00),
(110, 0xce0257050601000000ee1a00),
(110, 0xcd0257050701000000ee1a00),
(110, 0xcd025a050701000000731b00),
(110, 0xce025a050701000000ee1a00),
(110, 0xd00256050601000000f71a00),
(110, 0xd00256050701000000f71a00),
(110, 0xd20257050701000000ee1a00),
(110, 0xd30255050701000000e20200),
(110, 0xd30256050701000000e30200),
(110, 0xd40256050701000000721b00),
(111, 0x9e0255050701000000c90900),
(111, 0x9f0255050701000000ca0900),
(111, 0xa002560507010000003b1900),
(111, 0xa202540507010000003c1900),
(111, 0xa202550507010000009e0600),
(112, 0x9e024d050701000000c90900),
(112, 0x9f024d050701000000ca0900),
(112, 0xa2024e0507010000003c1900),
(112, 0xa2024f0507010000009e0600),
(112, 0xa002500507010000003b1900),
(113, 0xaa0244050701000000c70900),
(113, 0xaa0245050701000000c80900),
(113, 0xab02450507010000003c1900),
(113, 0xa80248050701000000950600),
(114, 0xaf0248050701000000950600),
(114, 0xb10244050701000000c70900),
(114, 0xb10245050701000000c80900),
(114, 0xb202450507010000003c1900),
(115, 0xae0244050601000000c90900),
(115, 0xaf0244050601000000ca0900),
(115, 0xaf0247050601000000950600),
(115, 0xb202460506010000003a1900),
(116, 0xa70244050601000000c90900),
(116, 0xa80244050601000000ca0900),
(116, 0xa80247050601000000950600),
(116, 0xab02460506010000003a1900),
(117, 0x9e024d050601000000c90900),
(117, 0x9f024d050601000000ca0900),
(117, 0xa1024e0506010000009e0600),
(118, 0x9e0255050601000000c90900),
(118, 0x9f0255050601000000ca0900),
(118, 0xa102540506010000009e0600),
(119, 0xd0041d0506010000007a0600),
(120, 0xdd041d0506010000007a0600),
(121, 0xe0041a0506010000007a0600),
(122, 0xcc041a0506010000007a0600),
(123, 0xd50407050601000000e80200),
(123, 0xd60407050601000000e90200),
(123, 0xd4040c050601000000780600),
(124, 0xcf040d050601000000e80200),
(124, 0xd20409050601000000780600),
(124, 0xd0040d050601000000e90200),
(125, 0xdd040b050501000000e60200),
(125, 0xdf040b050501000000e60200),
(125, 0xdd040c050501000000e70200),
(125, 0xde040f0505010000007a0600),
(125, 0xdf040c050501000000e70200),
(125, 0xe0040d050501000000361900),
(125, 0xdd0411050601000000351900),
(125, 0xde04110506010000007a0600),
(126, 0xe1040e050601000000bb0900),
(126, 0xe1040f050601000000bc0900),
(126, 0xe4040f050601000000361900),
(126, 0xe204110506010000007a0600),
(126, 0xe30411050601000000351900),
(127, 0xe9040b050601000000e60200),
(127, 0xe9040c050601000000e70200),
(127, 0xeb04110506010000007a0600),
(128, 0xef040b050601000000bb0900),
(128, 0xef040c050601000000bc0900),
(128, 0xf104110506010000007a0600),
(129, 0xea040f050501000000780600),
(129, 0xed040d050501000000e60200),
(129, 0xed040e050501000000e70200),
(129, 0xef040d050501000000e60200),
(129, 0xef040e050501000000e70200),
(130, 0xb7041f050601000000361900),
(130, 0xb8041c050601000000351900),
(130, 0xb8041f050601000000b90900),
(130, 0xb9041c0506010000007a0600),
(130, 0xb9041f050601000000ba0900),
(131, 0xbd041d050601000000e80200),
(131, 0xbd041f050601000000e80200),
(131, 0xbe041d050601000000e90200),
(131, 0xbe041f050601000000e90200),
(131, 0xc0041c0506010000007a0600),
(132, 0xc1041a050601000000780600),
(132, 0xc20418050601000000b90900),
(132, 0xc30418050601000000ba0900),
(133, 0xc004190505010000007a0600),
(133, 0xc1041a050501000000bb0900),
(133, 0xc1041b050501000000bc0900),
(134, 0xd10409050501000000e60200),
(134, 0xd1040a050501000000e70200),
(134, 0xd3040c0505010000007a0600),
(135, 0xb50402050401000000780600),
(135, 0xb80402050501000000401900),
(135, 0xb20404050401000000e40200),
(135, 0xb30404050401000000e50200),
(135, 0xb304050505010000003f1900),
(135, 0xb50404050501000000780600),
(136, 0xb4040b050401000000e40200),
(136, 0xb5040b050401000000e50200),
(136, 0xb6040a050401000000780600),
(136, 0xb504080505010000007a0600),
(137, 0xc30400050301000000e20200),
(137, 0xc30401050301000000e30200),
(137, 0xc40401050301000000401900),
(137, 0xc40400050401000000780600),
(137, 0xc50403050401000000401900),
(137, 0xc204040504010000003f1900),
(138, 0xcb04f6040301000000e60200),
(138, 0xcb04f7040301000000e70200),
(138, 0xc904f90404010000003f1900),
(138, 0xcb04f80404010000007a0600),
(139, 0xe104fe040601000000351900),
(139, 0xe204fe0406010000007a0600),
(139, 0xe304ff040601000000e60200),
(139, 0xe20400050501000000780600),
(139, 0xe20401050601000000351900),
(139, 0xe30400050601000000e70200),
(139, 0xe40400050601000000361900),
(140, 0xe704ff040601000000780600),
(140, 0xea04fe040601000000bb0900),
(140, 0xea04ff040601000000bc0900),
(140, 0xea0401050601000000351900),
(141, 0xe804fe040501000000bb0900),
(141, 0xe804ff040501000000bc0900),
(141, 0xeb04fe040501000000780600),
(141, 0xeb0400050501000000361900),
(142, 0xe804f2040501000000e20200),
(142, 0xe804f3040501000000e30200),
(142, 0xeb04f2040501000000e20200),
(142, 0xeb04f3040501000000e30200),
(142, 0xea04f80405010000007a0600),
(143, 0xf404f8040501000000780600),
(143, 0xf604fa040501000000351900),
(143, 0xf804f8040501000000bb0900),
(143, 0xf804f9040501000000bc0900),
(143, 0xf904f8040501000000361900),
(144, 0xea04f30404010000007a0600),
(144, 0xe804f4040401000000e60200),
(144, 0xe804f5040401000000e70200),
(144, 0xec04f5040401000000361900),
(145, 0xd804ed040601000000351900),
(145, 0xd804ee040601000000bb0900),
(145, 0xd804ef040601000000bc0900),
(145, 0xda04ed0406010000007a0600),
(145, 0xdc04ef040601000000361900),
(146, 0xd504f20406010000007a0600),
(146, 0xd704f2040601000000351900),
(146, 0xd804f3040601000000bb0900),
(146, 0xd704f5040601000000351900),
(146, 0xd804f4040601000000bc0900),
(147, 0xea04f10406010000007a0600),
(147, 0xec04f1040601000000351900),
(147, 0xec04f2040601000000e20200),
(147, 0xec04f3040601000000e30200),
(148, 0xdf04f20406010000007a0600),
(148, 0xdc04f5040601000000e40200),
(148, 0xdc04f7040601000000e40200),
(148, 0xdd04f5040601000000e50200),
(148, 0xdd04f7040601000000e50200),
(149, 0xde04f7040701000000bb0900),
(149, 0xde04f8040701000000bc0900),
(149, 0xe104f9040701000000780600),
(150, 0xde04f2040701000000bb0900),
(150, 0xde04f3040701000000bc0900),
(150, 0xe104f4040701000000780600),
(151, 0xde04ee040701000000bb0900),
(151, 0xde04ef040701000000bc0900),
(151, 0xe104ef040701000000780600),
(152, 0xe604ef040701000000780600),
(152, 0xe904ee040701000000bb0900),
(152, 0xe904ef040701000000bc0900),
(153, 0xe904f2040701000000bb0900),
(153, 0xe904f3040701000000bc0900),
(153, 0xe604f4040701000000780600),
(154, 0xe904f7040701000000bb0900),
(154, 0xe604f9040701000000780600),
(154, 0xe904f8040701000000bc0900),
(155, 0xa80422050701000000b90900),
(155, 0xa90422050701000000ba0900),
(155, 0xac0424050701000000780600),
(156, 0x0105d5040701000000b90900),
(156, 0x0205d5040701000000ba0900),
(156, 0x0205d7040701000000750600),
(157, 0xfc04cd040701000000b90900),
(157, 0xfd04cd040701000000ba0900),
(157, 0xfc04d40407010000007a0600),
(158, 0x0305ce040701000000bb0900),
(158, 0x0305cf040701000000bc0900),
(158, 0x0805d3040701000000750600),
(159, 0xfd041f050701000000720600),
(159, 0xfe041d050701000000bb0900),
(159, 0xfe041e050701000000bc0900),
(160, 0xeb041b050601000000bb0900),
(160, 0xe7041d050601000000780600),
(160, 0xeb041c050601000000bc0900),
(161, 0xe004270506010000007a0600),
(162, 0xcc04270506010000007a0600),
(163, 0xe80387040701000000de0200),
(163, 0xe80388040701000000df0200),
(163, 0xeb038b040701000000412000),
(164, 0xe10387050701000000780600),
(164, 0xe20384050701000000b90900),
(164, 0xe30384050701000000ba0900),
(165, 0xe90384050701000000b90900),
(165, 0xea0384050701000000ba0900),
(165, 0xeb0387050701000000780600),
(165, 0xe90388050701000000bb0900),
(165, 0xe90389050701000000bc0900),
(165, 0xea0388050701000000bb0900),
(165, 0xea0389050701000000bc0900),
(165, 0xed038a0507010000007a0600),
(166, 0xe5037c0507010000007a0600),
(166, 0xe20381050701000000bb0900),
(166, 0xe20382050701000000bc0900),
(166, 0xe503800507010000007a0600),
(166, 0xe70381050701000000bb0900),
(166, 0xe70382050701000000bc0900),
(167, 0xec037c0507010000007a0600),
(167, 0xea03800507010000007a0600),
(167, 0xeb0381050701000000bb0900),
(167, 0xeb0382050701000000bc0900),
(167, 0xed03800507010000007a0600),
(167, 0xee0381050701000000bb0900),
(167, 0xee0382050701000000bc0900),
(168, 0xfc037a0507010000007a0600),
(168, 0xfd0378050701000000b90900),
(168, 0xfd0379050701000000b90900),
(168, 0xfe0378050701000000ba0900),
(168, 0xfe0379050701000000ba0900),
(168, 0xfb037e0507010000007a0600),
(169, 0xf8036e050701000000780600),
(169, 0xfc036c050701000000bb0900),
(169, 0xfc036d050701000000bc0900),
(170, 0xfc035f050701000000bb0900),
(170, 0xf80361050701000000780600),
(170, 0xfc0360050701000000bc0900),
(171, 0xdf0350050701000000bb0900),
(171, 0xdf0351050701000000bc0900),
(171, 0xdf0352050701000000bb0900),
(171, 0xdf0353050701000000bc0900),
(171, 0xe303540507010000007a0600),
(172, 0xe4034d050701000000bb0900),
(172, 0xe4034e050701000000bc0900),
(172, 0xe8034d050701000000780600),
(173, 0xde034d050701000000780600),
(173, 0xe1034b050701000000b90900),
(173, 0xe2034b050701000000ba0900),
(174, 0xd1034d050701000000bb0900),
(174, 0xd1034e050701000000bc0900),
(174, 0xd5034d050701000000780600),
(175, 0xcc0350050701000000bb0900),
(175, 0xcc0351050701000000bc0900),
(175, 0xcc0352050701000000bb0900),
(175, 0xcc0353050701000000bc0900),
(175, 0xd003540507010000007a0600),
(176, 0xce034b050701000000b90900),
(176, 0xcf034b050701000000ba0900),
(176, 0xcb034d050701000000780600),
(177, 0xbe034d050701000000bb0900),
(177, 0xbe034e050701000000bc0900),
(177, 0xc2034d050701000000780600),
(178, 0xbe0359050701000000bb0900),
(178, 0xbe035a050701000000bc0900),
(178, 0xc20359050701000000780600),
(179, 0xc20365050701000000b90900),
(179, 0xc20366050701000000b90900),
(179, 0xc30365050701000000ba0900),
(179, 0xc30366050701000000ba0900),
(179, 0xc103690507010000007a0600),
(180, 0xc00365050601000000bb0900),
(180, 0xc00366050601000000bc0900),
(180, 0xc30366050601000000780600),
(181, 0xb2037e050701000000b90900),
(181, 0xb3037e050701000000ba0900),
(181, 0xad0380050701000000780600),
(181, 0xaf03830507010000007a0600),
(181, 0xb00380050701000000780600),
(181, 0xb20381050701000000bb0900),
(181, 0xb20382050701000000bc0900),
(181, 0xb30381050701000000bb0900),
(181, 0xb30382050701000000bc0900),
(182, 0xae0388050701000000bb0900),
(182, 0xae0389050701000000bc0900),
(182, 0xaf0388050701000000bb0900),
(182, 0xaf0389050701000000bc0900),
(182, 0xb00385050701000000780600),
(182, 0xb00387050701000000780600),
(183, 0xa80384050701000000b90900),
(183, 0xa90384050701000000ba0900),
(183, 0xad0385050701000000780600),
(183, 0xa80388050701000000bb0900),
(183, 0xa80389050701000000bc0900),
(184, 0xaa0383050601000000b90900),
(184, 0xab0383050601000000ba0900),
(184, 0xac0381050601000000780600),
(185, 0xaa0385050601000000b90900),
(185, 0xab0385050601000000ba0900),
(185, 0xac0387050601000000780600),
(186, 0xaf0381050601000000780600),
(186, 0xb00383050601000000b90900),
(186, 0xb10383050601000000ba0900),
(187, 0xaf0387050601000000780600),
(187, 0xb00385050601000000b90900),
(187, 0xb10385050601000000ba0900),
(188, 0xac0382050501000000bb0900),
(188, 0xac0383050501000000bc0900),
(188, 0xb00384050501000000780600),
(189, 0xe60384050601000000b90900),
(189, 0xe70384050601000000ba0900),
(189, 0xe603880506010000007a0600),
(190, 0xe90384050601000000bb0900),
(190, 0xe90385050601000000bc0900),
(190, 0xed0386050601000000780600),
(191, 0xe30381050601000000780600),
(191, 0xe60382050601000000b90900),
(191, 0xe70382050601000000ba0900),
(192, 0xe9037f050601000000bb0900),
(192, 0xe90380050601000000bc0900),
(192, 0xed0381050601000000780600),
(193, 0xe803800505010000007a0600),
(193, 0xe60384050501000000bb0900),
(193, 0xe60385050501000000bc0900),
(193, 0xea0384050501000000bb0900),
(193, 0xea0385050501000000bc0900),
(194, 0xfb037a050601000000bb0900),
(194, 0xfb037b050601000000bc0900),
(194, 0xfe037b050601000000780600),
(195, 0xe6036b050701000000220900),
(195, 0xe4036e050701000000bb0900),
(195, 0xe4036f050701000000bc0900),
(196, 0xec036b050701000000220900),
(196, 0xee036e050701000000bb0900),
(196, 0xee036f050701000000bc0900),
(197, 0xe4035f050701000000bb0900),
(197, 0xe40360050701000000bc0900),
(197, 0xe60363050701000000220900),
(198, 0xee035f050701000000bb0900),
(198, 0xec0363050701000000220900),
(198, 0xee0360050701000000bc0900),
(199, 0x2c0337040701000000de0200),
(199, 0x260338040701000000f41a00),
(199, 0x2c0338040701000000df0200),
(199, 0x2c033a040701000000de0200),
(199, 0x2c033b040701000000df0200),
(199, 0x2b033c040701000000731b00),
(200, 0x160337040701000000de0200),
(200, 0x1e0337040701000000f41a00),
(200, 0x160338040701000000df0200),
(200, 0x160339040701000000de0200),
(200, 0x16033a040701000000df0200),
(200, 0x18033b040701000000731b00),
(200, 0x1c033b040701000000ee1a00),
(200, 0x1d033b040701000000731b00),
(201, 0x300335040701000000e20200),
(201, 0x300336040701000000e30200),
(201, 0x330336040701000000f41a00),
(201, 0x330338040701000000741b00),
(202, 0x3c0336040701000000741b00),
(202, 0x370338040701000000f41a00),
(202, 0x3c033a040601000000741b00),
(203, 0x3c0346040701000000f71a00),
(203, 0x3f0344040701000000e20200),
(203, 0x3f0345040701000000e30200),
(203, 0x3f0347040701000000e20200),
(203, 0x3f0348040701000000e30200),
(203, 0x400345040601000000741b00),
(203, 0x400347040601000000741b00),
(204, 0x460347040701000000f41a00),
(204, 0x470348040601000000e20200),
(204, 0x470349040601000000e30200),
(204, 0x4b034a040601000000e40200),
(204, 0x4c034a040601000000e50200),
(204, 0x4f0348040601000000e20200),
(204, 0x4f0349040601000000e30200),
(204, 0x500344040701000000eb1a00),
(205, 0x3f034e040701000000e20200),
(205, 0x3f034f040701000000e30200),
(205, 0x42034c040701000000ee1a00),
(205, 0x45034d040601000000e20200),
(205, 0x45034e040601000000e30200),
(206, 0x48033d040701000000eb1a00),
(206, 0x49033d040701000000731b00),
(207, 0x2e0350040701000000eb1a00),
(208, 0x080342040701000000eb1a00),
(208, 0x090346040701000000de0200),
(208, 0x090347040701000000df0200),
(208, 0x0a0344040701000000741b00),
(208, 0x0a0347040701000000741b00),
(208, 0x090348040601000000731b00),
(209, 0x020339040701000000741b00),
(209, 0x00033f040701000000731b00),
(209, 0x02033c040701000000f41a00),
(210, 0x07032f040701000000741b00),
(210, 0x070330040701000000f41a00),
(210, 0x070331040701000000741b00),
(210, 0x0b0333040701000000731b00),
(211, 0x14032d040701000000eb1a00),
(211, 0x15032d040701000000731b00),
(211, 0x160332040701000000741b00),
(212, 0x1f0330040701000000f41a00),
(213, 0x0d0326040701000000731b00),
(213, 0x0f0326040701000000eb1a00),
(213, 0x110326040701000000731b00),
(214, 0x1e0322040701000000741b00),
(214, 0x180325040701000000731b00),
(214, 0x1a0325040701000000eb1a00),
(214, 0x1e0324040701000000741b00),
(215, 0x2e031f040601000000de0200),
(215, 0x2e031f040701000000de0200),
(215, 0x270322040701000000f41a00),
(215, 0x2e0320040601000000df0200),
(215, 0x2e0320040701000000df0200),
(215, 0x2f0321040701000000741b00),
(215, 0x2f0323040701000000741b00),
(215, 0x2b0326040701000000731b00),
(215, 0x2e0324040601000000de0200),
(215, 0x2e0325040601000000df0200),
(216, 0x0c031c040701000000f41a00),
(216, 0x12031c040601000000741b00),
(216, 0x12031c040701000000f41a00),
(217, 0x20030f040701000000741b00),
(217, 0x1a0313040701000000731b00),
(217, 0x1e0314040701000000eb1a00),
(218, 0x2a0317040701000000f41a00),
(219, 0x2c0317040701000000f41a00),
(220, 0x320316040701000000de0200),
(220, 0x320317040701000000df0200),
(220, 0x390319040701000000f41a00),
(221, 0x3e0316040701000000de0200),
(221, 0x3e0317040701000000df0200),
(221, 0x410314040701000000eb1a00),
(221, 0x440316040601000000721b00),
(222, 0x3e030e040701000000eb1a00),
(223, 0x2c030d040701000000eb1a00),
(224, 0x350420050701000000a51400),
(225, 0x170427050701000000a31400),
(225, 0x1b0425050701000000a31400),
(225, 0x1c0425050601000000a51400),
(226, 0x19042f050701000000a31400),
(227, 0x1c043a050701000000a51400),
(228, 0x22043a050701000000a51400),
(229, 0x190457050401000000660600),
(230, 0x2f044e050601000000a31400),
(230, 0x32044d050601000000a31400),
(230, 0x36044e050501000000a31400),
(231, 0x49044d050701000000a51400),
(231, 0x52044b050601000000a51400),
(232, 0x3b042e050701000000a51400),
(232, 0x3d042c050601000000481900),
(232, 0x3d042d050701000000a31400),
(232, 0x3f042e050701000000a31400),
(233, 0x0c0420050701000000a51400),
(233, 0x0d0423050701000000a31400),
(234, 0xfe0333050701000000a31400),
(234, 0xfa0335050701000000b90900),
(234, 0xfb0335050701000000ba0900),
(235, 0x0b0432050701000000a31400),
(235, 0x100436050701000000a51400),
(236, 0x5c045b050701000000a31400),
(237, 0xec0404040701000000a11400),
(238, 0xec040b040701000000a11400),
(239, 0xe904080406010000009e1400),
(239, 0xec040b040601000000481900),
(240, 0xe904060406010000009e1400),
(240, 0xec0404040601000000461900),
(241, 0x1205f5030601000000471900),
(241, 0x1305f50307010000009e1400),
(241, 0x1405f5030601000000451900),
(242, 0x0705260407010000009e1400),
(243, 0x0d05260407010000009e1400),
(244, 0x090523040601000000a01400),
(244, 0x070526040601000000451900),
(244, 0x080526040601000000451900),
(245, 0x0b0523040601000000a01400),
(245, 0x0d0526040601000000451900),
(245, 0x0e0526040601000000471900),
(246, 0xfe0423040501000000481900),
(246, 0xfe0423040601000000461900),
(246, 0xf804260406010000009e1400),
(246, 0xfe0425040501000000461900),
(246, 0xfc04260406010000009e1400),
(246, 0xfe0425040601000000461900),
(247, 0xf6042a040701000000a51400),
(248, 0xeb0421040701000000a31400),
(249, 0x0d05170407010000009f1400),
(249, 0x0e051a0406010000009e1400),
(249, 0x0f0518040601000000a21400),
(249, 0x0f0518040701000000a31400),
(249, 0x12051b040601000000471900),
(249, 0x130519040601000000481900),
(249, 0x13051a040601000000461900),
(250, 0x2e03e4040701000000b70900),
(250, 0x2e03e5040701000000b80900),
(250, 0x2f03e7040701000000251900),
(250, 0x3103e70407010000005f0600),
(250, 0x3203e5040701000000101400),
(251, 0x2c03de040701000000251900),
(251, 0x2c03df040701000000bd0900),
(251, 0x2d03df040701000000be0900),
(251, 0x2b03e1040701000000261900),
(251, 0x2c03e2040701000000bd0900),
(251, 0x2d03e2040701000000be0900),
(251, 0x3203e2040701000000101400),
(251, 0x3303e1040701000000261900),
(252, 0x2e03e3040601000000b70900),
(252, 0x2d03e5040601000000261900),
(252, 0x2e03e4040601000000b80900),
(252, 0x3003e7040601000000251900),
(252, 0x3203e4040601000000101400),
(252, 0x3303e6040601000000261900),
(253, 0x2c03df040601000000b70900),
(253, 0x2f03de040601000000251900),
(253, 0x2b03e1040601000000261900),
(253, 0x2c03e0040601000000b80900),
(253, 0x3203e1040601000000101400),
(253, 0x3303e0040601000000261900),
(254, 0x3803e5040701000000471900),
(254, 0x3b03e60407010000009d1400),
(254, 0x3d03e6040701000000b90900),
(254, 0x3e03e6040701000000ba0900),
(254, 0x3f03e7040701000000481900),
(254, 0x3603e8040701000000481900),
(254, 0x3803eb040701000000471900),
(254, 0x3b03eb040701000000471900),
(254, 0x3c03e8040701000000a01400),
(255, 0x3803e5040601000000251900),
(255, 0x3903e50406010000005f0600),
(255, 0x3603e8040601000000261900),
(255, 0x3703e9040601000000b70900),
(255, 0x3703ea040601000000b80900),
(255, 0x3903eb040601000000251900),
(255, 0x3b03e9040601000000b70900),
(255, 0x3b03ea040601000000b80900),
(255, 0x3c03e9040601000000261900),
(256, 0x4603df040701000000251900),
(256, 0x4203e2040701000000261900),
(256, 0x4703e2040701000000131400),
(256, 0x4403e4040701000000b90900),
(256, 0x4503e4040701000000ba0900),
(257, 0x4c03df040701000000471900),
(257, 0x4a03e3040701000000a31400),
(257, 0x4b03e0040701000000b90900),
(257, 0x4c03e0040701000000ba0900),
(257, 0x4e03e3040701000000481900),
(258, 0x4e03d5040701000000bb0900),
(258, 0x4e03d6040701000000bc0900),
(258, 0x4f03d7040701000000481900),
(258, 0x4c03d9040701000000471900),
(258, 0x4d03d90407010000009d1400),
(259, 0x4303d1040701000000261900),
(259, 0x4303d2040701000000141400),
(259, 0x4903d1040701000000b70900),
(259, 0x4903d2040701000000b80900),
(259, 0x4903d3040701000000251900),
(259, 0x4603d4040701000000680600),
(260, 0x4603cf040601000000b90900),
(260, 0x4703cf040601000000ba0900),
(260, 0x4303d2040601000000261900),
(260, 0x4603d30406010000005f0600),
(260, 0x4903d3040601000000251900),
(260, 0x4a03d2040601000000261900),
(261, 0x4903e2040601000000a31400),
(261, 0x4d03e2040601000000481900),
(261, 0x4d03e3040601000000a01400),
(261, 0x4a03e4040601000000b90900),
(261, 0x4b03e4040601000000ba0900),
(262, 0x4503e7040601000000261900),
(262, 0x4703e50406010000005f0600),
(262, 0x4a03e7040601000000261900),
(262, 0x4803e8040601000000b90900),
(262, 0x4903e8040601000000ba0900),
(262, 0x4903e9040601000000251900),
(263, 0x8d03a7040701000000451900),
(263, 0x8b03a9040701000000461900),
(263, 0x8c03a8040701000000bb0900),
(263, 0x8c03a9040701000000bc0900),
(263, 0x8d03ab040701000000451900),
(263, 0x9003a9040701000000a31400),
(264, 0x8b03a3040701000000461900),
(264, 0x8c03a2040701000000b90900),
(264, 0x8d03a1040701000000451900),
(264, 0x8d03a2040701000000ba0900),
(264, 0x8d03a5040701000000451900),
(264, 0x9003a3040701000000a31400),
(265, 0x8d039b040701000000451900),
(265, 0x8b039d040701000000461900),
(265, 0x8c039c040701000000bb0900),
(265, 0x8c039d040701000000bc0900),
(265, 0x8d039f040701000000451900),
(265, 0x90039d040701000000a31400),
(266, 0x97039d040701000000a31400),
(266, 0x99039c040701000000b90900),
(266, 0x9a039c040701000000ba0900),
(267, 0x9703a3040701000000a31400),
(267, 0x9a03a2040701000000bb0900),
(267, 0x9a03a3040701000000bc0900),
(268, 0xc10147050501000000e60200),
(268, 0xc40145050501000000e80200),
(268, 0xc50145050501000000e90200),
(268, 0xc80145050501000000e80200),
(268, 0xc90145050501000000e90200),
(268, 0xcc0147050501000000e60200),
(268, 0xc10148050501000000e70200),
(268, 0xcc0148050501000000e70200),
(268, 0xcd0149050601000000b71400),
(268, 0xc3014e0505010000008c1500),
(268, 0xc3014e0506010000008c1500),
(268, 0xca014e0505010000008c1500),
(268, 0xca014e0506010000008c1500),
(268, 0xc20152050601000000b61400),
(268, 0xc30152050601000000b61400),
(268, 0xc60150050601000000b61400),
(268, 0xc701500506010000008c1500),
(268, 0xc80150050601000000b61400),
(268, 0xcb0152050601000000b61400),
(268, 0xcc0152050601000000b61400),
(269, 0xc4015b0505010000008a1500),
(269, 0xc4015b0506010000008a1500),
(269, 0xc7015a0506010000008c1500),
(269, 0xc9015b0505010000008a1500),
(269, 0xc9015b0506010000008a1500),
(269, 0xcd015a050401000000b71400),
(269, 0xc10160050501000000e60200),
(269, 0xc10161050501000000e70200),
(269, 0xcc0160050501000000e60200),
(269, 0xcc0161050501000000e70200),
(269, 0xc10164050501000000e60200),
(269, 0xc10165050501000000e70200),
(269, 0xcc0164050501000000e60200),
(269, 0xcc0165050501000000e70200),
(269, 0xc50168050601000000b61400),
(269, 0xc70168050601000000b61400),
(269, 0xc90168050601000000b61400),
(270, 0xc7016f0506010000008c1500),
(270, 0xc20172050401000000e60200),
(270, 0xc20173050401000000e70200),
(270, 0xc40170050401000000e80200),
(270, 0xc50170050401000000e90200),
(270, 0xc80170050401000000e80200),
(270, 0xc90170050401000000e90200),
(270, 0xc60177050401000000b61400),
(270, 0xc60177050501000000b61400),
(270, 0xc50177050601000000b61400),
(270, 0xc80177050401000000b61400),
(270, 0xc80177050501000000b61400),
(270, 0xc90177050601000000b61400),
(270, 0xcc0174050401000000b71400),
(270, 0xcc0174050501000000b71400),
(270, 0xcc0174050601000000b71400),
(271, 0xd5016f050401000000b61400),
(271, 0xd7016f050401000000b61400),
(271, 0xd6016f0506010000008c1500),
(271, 0xd10172050401000000e60200),
(271, 0xd10173050401000000e70200),
(271, 0xd30170050401000000e80200),
(271, 0xd40170050401000000e90200),
(271, 0xd70170050401000000e80200),
(271, 0xd80170050401000000e90200),
(271, 0xd00174050401000000b71400),
(271, 0xd50177050401000000b61400),
(271, 0xd70177050401000000b61400),
(271, 0xd50177050501000000b61400),
(271, 0xd70177050501000000b61400),
(271, 0xd40177050601000000b61400),
(271, 0xdb0174050401000000b71400),
(271, 0xdb0174050501000000b71400),
(271, 0xd80177050601000000b61400),
(271, 0xdb0174050601000000b71400),
(272, 0xe4016f050401000000b61400),
(272, 0xe6016f050401000000b61400),
(272, 0xe4016f050501000000b61400),
(272, 0xe6016f050501000000b61400),
(272, 0xe5016f0506010000008c1500),
(272, 0xdf0174050401000000b71400),
(272, 0xdf0174050501000000b71400),
(272, 0xe00172050401000000e60200),
(272, 0xe00173050401000000e70200),
(272, 0xe20170050401000000e80200),
(272, 0xe30170050401000000e90200),
(272, 0xe60170050401000000e80200),
(272, 0xe70170050401000000e90200),
(272, 0xe30177050601000000b61400),
(272, 0xe40177050401000000b61400),
(272, 0xe60177050401000000b61400),
(272, 0xe40177050501000000b61400),
(272, 0xe60177050501000000b61400),
(272, 0xe70177050601000000b61400),
(272, 0xea0174050401000000b71400),
(272, 0xea0174050501000000b71400),
(272, 0xea0174050601000000b71400),
(273, 0xf0016f050501000000e80200),
(273, 0xf1016f050501000000e90200),
(273, 0xf3016f050501000000e80200),
(273, 0xf4016f050501000000e90200),
(273, 0xf6016f050501000000e80200),
(273, 0xf7016f050501000000e90200),
(273, 0xf4016e0506010000008c1500),
(273, 0xed0173050501000000e60200),
(273, 0xed0174050501000000e70200),
(273, 0xfa0173050501000000e60200),
(273, 0xfa0174050501000000e70200),
(273, 0xfb0174050601000000b71400),
(273, 0xf1017a050601000000b61400),
(273, 0xf7017a050601000000b61400),
(274, 0xf701630506010000008a1500),
(274, 0xfc0168050601000000b61400),
(274, 0x000260050601000000e60200),
(274, 0x000261050601000000e70200),
(274, 0x010262050601000000b71400),
(274, 0x010264050601000000b71400),
(275, 0xf701560506010000008a1500),
(275, 0xfc015b050601000000b61400),
(275, 0x000253050601000000e60200),
(275, 0x000254050601000000e70200),
(275, 0x010255050601000000b71400),
(275, 0x010257050601000000b71400),
(276, 0xf701450506010000008a1500),
(276, 0xfc014a050601000000b61400),
(276, 0x000242050601000000e60200),
(276, 0x000243050601000000e70200),
(276, 0x010244050601000000b71400),
(276, 0x010246050601000000b71400),
(277, 0xe9012d050601000000e60200),
(277, 0xe9012e050601000000e70200),
(277, 0xea012c050601000000e80200),
(277, 0xeb012c050601000000e90200),
(277, 0xf0012e0505010000008a1500),
(277, 0xf0012e0506010000008a1500),
(277, 0xf1012c050601000000e60200),
(277, 0xf1012d050601000000e70200),
(277, 0xf6012e0505010000008a1500),
(277, 0xf5012c050601000000e60200),
(277, 0xf5012d050601000000e70200),
(277, 0xf6012e0506010000008a1500),
(277, 0xfa012c050601000000e80200),
(277, 0xfb012c050601000000e90200),
(277, 0xfc012d050601000000e60200),
(277, 0xfc012e050601000000e70200),
(277, 0xeb0138050601000000b61400),
(277, 0xee0138050601000000b61400),
(277, 0xf301320506010000008c1500),
(277, 0xfd0130050601000000b71400),
(277, 0xf001350505010000008a1500),
(277, 0xf001350506010000008a1500),
(277, 0xf601350505010000008a1500),
(277, 0xf601350506010000008a1500),
(277, 0xfd0134050601000000b71400),
(277, 0xf301390506010000008c1500),
(277, 0xf80138050601000000b61400),
(277, 0xfb0138050601000000b61400),
(278, 0xdc0129050501000000e80200),
(278, 0xdd0129050501000000e90200),
(278, 0xde0129050501000000e80200),
(278, 0xdf0129050501000000e90200),
(278, 0xdc012c0506010000008c1500),
(278, 0xe3012f050601000000b71400),
(278, 0xd90131050601000000b61400),
(278, 0xdb0131050601000000b61400),
(278, 0xdc01310506010000008c1500),
(278, 0xdd0131050601000000b61400),
(278, 0xdf0131050601000000b61400),
(279, 0xcc0123050501000000e80200),
(279, 0xcd0122050501000000b61400),
(279, 0xcd0123050501000000e90200),
(279, 0xcf0122050501000000b61400),
(279, 0xcf0123050501000000e80200),
(279, 0xc90127050501000000b71400),
(279, 0xce012c0505010000008c1500),
(279, 0xce012f0506010000008a1500),
(279, 0xd00123050501000000e90200),
(279, 0xd30127050501000000b71400),
(279, 0xd30127050601000000b71400),
(279, 0xca0130050501000000b71400),
(279, 0xcb0131050601000000b61400),
(279, 0xcd0131050501000000b61400),
(279, 0xcc01310506010000008c1500),
(279, 0xd00131050501000000b61400),
(279, 0xd20130050501000000b71400),
(279, 0xd00131050601000000b61400),
(279, 0xd20130050601000000b71400),
(280, 0xb3013b050401000000b71400),
(280, 0xb3013b050501000000b71400),
(280, 0xb60138050401000000e80200),
(280, 0xb70138050401000000e90200),
(280, 0xb4013a050501000000e60200),
(280, 0xb4013b050501000000e70200),
(280, 0xb60138050501000000e80200),
(280, 0xb70138050501000000e90200),
(280, 0xb3013c050401000000b71400),
(280, 0xb3013d050401000000b71400),
(280, 0xb3013e050401000000b71400),
(280, 0xb3013d050501000000b71400),
(280, 0xb3013f050501000000b71400),
(280, 0xb4013c050401000000e60200),
(280, 0xb4013d050401000000e70200),
(280, 0xb4013e050501000000e60200),
(280, 0xb4013f050501000000e70200),
(280, 0xbf013c050401000000b71400),
(280, 0xbf013d0504010000008a1500),
(280, 0xbf013e050401000000b71400),
(280, 0xbf013d0505010000008a1500),
(280, 0xcb013b050601000000b71400),
(280, 0xc0013d0506010000008a1500),
(280, 0xcb013d0506010000008a1500),
(280, 0xcb013f050601000000b71400),
(280, 0xb60141050401000000e80200),
(280, 0xb70141050401000000e90200),
(280, 0xb60141050501000000e80200),
(280, 0xb70141050501000000e90200),
(281, 0xe701450506010000008a1500),
(281, 0xec014a050601000000b61400),
(281, 0xf00142050601000000e60200),
(281, 0xf00143050601000000e70200),
(281, 0xf10144050601000000b71400),
(281, 0xf10146050601000000b71400),
(282, 0xe70155050601000000b71400),
(282, 0xe701560506010000008a1500),
(282, 0xe70157050601000000b71400),
(282, 0xec015b050601000000b61400),
(282, 0xf00153050601000000e60200),
(282, 0xf00154050601000000e70200),
(282, 0xf10157050601000000b71400),
(283, 0xe70162050601000000b71400),
(283, 0xe701630506010000008a1500),
(283, 0xe70164050601000000b71400),
(283, 0xec0168050601000000b61400),
(283, 0xf00160050601000000e60200),
(283, 0xf00161050601000000e70200),
(283, 0xf10162050601000000b71400),
(283, 0xf10164050601000000b71400),
(284, 0xce017c0506010000008c1500),
(284, 0xd2017f050601000000e60200),
(284, 0xcd0186050601000000b61400),
(284, 0xce01860506010000008c1500),
(284, 0xcf0186050601000000b61400),
(284, 0xd20180050601000000e70200),
(284, 0xd30181050601000000b71400),
(285, 0xdd017c050601000000b61400),
(285, 0xde017c0506010000008c1500),
(285, 0xdf017c050601000000b61400),
(285, 0xe2017f050601000000e60200),
(285, 0xdd0186050601000000b61400),
(285, 0xde01860506010000008c1500),
(285, 0xdf0186050601000000b61400),
(285, 0xe20180050601000000e70200),
(285, 0xe30181050601000000b71400),
(286, 0xb50145050701000000e60200),
(286, 0xb50146050701000000e70200),
(286, 0xbb0147050701000000b71400),
(286, 0xbb01480507010000008a1500),
(286, 0xbb0149050701000000b71400),
(287, 0xc10147050701000000b71400),
(287, 0xc70145050701000000e60200),
(287, 0xc70146050701000000e70200),
(287, 0xc101480507010000008a1500),
(287, 0xc10149050701000000b71400),
(288, 0xb5013b050701000000e60200),
(288, 0xb5013c050701000000e70200),
(288, 0xbb013d050701000000b71400),
(288, 0xbb013e0507010000008a1500),
(288, 0xbb013f050701000000b71400),
(289, 0xc7013b050701000000e60200),
(289, 0xc1013d050701000000b71400),
(289, 0xc1013e0507010000008a1500),
(289, 0xc1013f050701000000b71400),
(289, 0xc7013c050701000000e70200),
(290, 0xd701400507010000008a1500),
(290, 0xd90142050701000000b61400),
(290, 0xda01420507010000008c1500),
(290, 0xdb0142050701000000b61400),
(290, 0xdd01400507010000008a1500),
(290, 0xd30147050701000000e60200),
(290, 0xd40147050701000000e60200),
(290, 0xd70146050701000000b71400),
(290, 0xd70147050701000000b71400),
(290, 0xd30148050701000000e70200),
(290, 0xd40148050701000000e70200),
(290, 0xe00147050701000000e60200),
(290, 0xe10147050701000000e60200),
(290, 0xe00148050701000000e70200),
(290, 0xe10148050701000000e70200),
(291, 0xd30136050701000000e80200),
(291, 0xd40136050701000000e90200),
(291, 0xd70136050701000000e80200),
(291, 0xd80136050701000000e90200),
(291, 0xd601390507010000008c1500),
(291, 0xdc0138050701000000b71400),
(291, 0xdc01390507010000008a1500),
(291, 0xdc013a050701000000b71400),
(292, 0xd3012d050701000000e60200),
(292, 0xd3012e050701000000e70200),
(292, 0xdc012f050701000000b71400),
(292, 0xd30132050701000000e60200),
(292, 0xd30133050701000000e70200),
(292, 0xdc01300507010000008a1500),
(292, 0xdc0131050701000000b71400),
(293, 0xe60149050701000000b71400),
(293, 0xe6014a0507010000008a1500),
(293, 0xf20143050701000000e60200),
(293, 0xf50143050701000000e60200),
(293, 0xf20144050701000000e70200),
(293, 0xf401460507010000008c1500),
(293, 0xf50144050701000000e70200),
(293, 0xf2014f050701000000e60200),
(293, 0xf4014d0507010000008c1500),
(293, 0xf5014f050701000000e60200),
(293, 0xf20150050701000000e70200),
(293, 0xf50150050701000000e70200),
(294, 0xe7015c050701000000b71400),
(294, 0xe7015d0507010000008a1500),
(295, 0xe70163050801000000e60200),
(295, 0xe70164050701000000b71400),
(295, 0xe701650507010000008a1500),
(295, 0xe70164050801000000e70200),
(296, 0xe7016b050801000000e60200),
(296, 0xe7016c050701000000b71400),
(296, 0xe7016d0507010000008a1500),
(296, 0xe7016c050801000000e70200),
(297, 0xcb016c0507010000008a1500),
(297, 0xd401630507010000008a1500),
(297, 0xdc0168050701000000e80200),
(297, 0xdc016b050701000000e80200),
(297, 0xdd0168050701000000e90200),
(297, 0xdd016b050701000000e90200),
(297, 0xde0168050701000000e80200),
(297, 0xde016b050701000000e80200),
(297, 0xdf0168050701000000e90200),
(297, 0xdf016b050701000000e90200),
(297, 0xd0016c0507010000008a1500),
(297, 0xce01710507010000008c1500);
INSERT INTO `tile_store` (`house_id`, `data`) VALUES
(298, 0xb403de040601000000731b00),
(298, 0xb403de040701000000731b00),
(298, 0xb803df040601000000e20200),
(298, 0xba03de040601000000731b00),
(298, 0xbb03df040601000000e20200),
(298, 0xb903de040701000000731b00),
(298, 0xb203e0040601000000741b00),
(298, 0xb203e0040701000000741b00),
(298, 0xb703e2040601000000f71a00),
(298, 0xb603e0040701000000f71a00),
(298, 0xb803e0040601000000e30200),
(298, 0xbb03e0040601000000e30200),
(298, 0xbc03e2040601000000e20200),
(298, 0xbc03e3040601000000e30200),
(298, 0xbd03e3040701000000f71a00),
(298, 0xb203e4040601000000741b00),
(298, 0xb403e6040601000000731b00),
(298, 0xb403e6040701000000731b00),
(298, 0xb903e6040601000000731b00),
(298, 0xba03e6040601000000ee1a00),
(298, 0xbb03e5040601000000e40200),
(298, 0xbb03e6040601000000731b00),
(298, 0xbc03e5040601000000e50200),
(298, 0xbd03e4040601000000741b00),
(298, 0xbd03e4040701000000741b00),
(298, 0xb703e8040701000000741b00),
(298, 0xba03e9040701000000ee1a00),
(298, 0xbd03e8040701000000741b00),
(299, 0xe603b3040601000000e00200),
(299, 0xe703b3040601000000e10200),
(299, 0xe903b8040601000000412000),
(300, 0xd103bf040701000000de0200),
(300, 0xd003c2040701000000412000),
(300, 0xd103c0040701000000df0200);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tmpwoe`
--

CREATE TABLE `tmpwoe` (
  `started` int(11) NOT NULL,
  `guild` int(11) NOT NULL,
  `breaker` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `indexer` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `tmpwoe`
--

INSERT INTO `tmpwoe` (`started`, `guild`, `breaker`, `time`, `indexer`) VALUES
(1682639794, 3, 268435465, 1681862387, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `towns`
--

CREATE TABLE `towns` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `posx` int(11) NOT NULL DEFAULT 0,
  `posy` int(11) NOT NULL DEFAULT 0,
  `posz` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `towns`
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
-- Estrutura da tabela `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `categoria` int(11) NOT NULL,
  `link` varchar(11) NOT NULL,
  `ativo` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `videos_categorias`
--

CREATE TABLE `videos_categorias` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `videos_comentarios`
--

CREATE TABLE `videos_comentarios` (
  `id` int(11) NOT NULL,
  `mensagem` text NOT NULL,
  `character` varchar(255) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `topico` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT current_timestamp(),
  `ativo` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `woe`
--

CREATE TABLE `woe` (
  `id` int(11) NOT NULL,
  `started` int(11) NOT NULL,
  `guild` int(11) NOT NULL,
  `breaker` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `woe`
--

INSERT INTO `woe` (`id`, `started`, `guild`, `breaker`, `time`) VALUES
(1, 1673381353, 0, 0, 0),
(2, 1673382052, 0, 0, 0),
(3, 1673382987, 0, 0, 0),
(4, 1673384175, 3, 268435465, 1673384265),
(5, 1673384175, 3, 268435465, 1673384265),
(6, 1674772015, 4, 268435466, 1674772383),
(7, 1674773149, 4, 268435466, 1674773198),
(8, 1676246145, 3, 268435465, 1674773198),
(9, 1677507374, 4, 268435466, 1677507705),
(10, 1681862117, 3, 268435465, 1681862387),
(11, 1681948539, 3, 268435465, 1681862387),
(12, 1682466959, 3, 268435465, 1681862387),
(13, 1682553366, 3, 268435465, 1681862387);

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_changelogs`
--

CREATE TABLE `z_changelogs` (
  `id_changelog` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `description` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_forum`
--

CREATE TABLE `z_forum` (
  `id` int(11) NOT NULL,
  `first_post` int(11) NOT NULL DEFAULT 0,
  `last_post` int(11) NOT NULL DEFAULT 0,
  `section` int(11) NOT NULL DEFAULT 0,
  `replies` int(11) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0,
  `author_aid` int(11) NOT NULL DEFAULT 0,
  `author_guid` int(11) NOT NULL DEFAULT 0,
  `post_text` text NOT NULL,
  `post_topic` varchar(255) NOT NULL,
  `post_smile` tinyint(1) NOT NULL DEFAULT 0,
  `post_date` int(11) NOT NULL DEFAULT 0,
  `last_edit_aid` int(11) NOT NULL DEFAULT 0,
  `edit_date` int(11) NOT NULL DEFAULT 0,
  `post_ip` varchar(15) NOT NULL DEFAULT '0.0.0.0',
  `icon_id` int(11) NOT NULL,
  `news_icon` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `z_forum`
--

INSERT INTO `z_forum` (`id`, `first_post`, `last_post`, `section`, `replies`, `views`, `author_aid`, `author_guid`, `post_text`, `post_topic`, `post_smile`, `post_date`, `last_edit_aid`, `edit_date`, `post_ip`, `icon_id`, `news_icon`) VALUES
(1, 1, 1642011224, 3, 0, 2, 1, 7, '<p>adasdasdasdasdasdsa</p>', 'Teste', 0, 1642011224, 0, 0, '127.0.0.1', 27, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_helpdesk`
--

CREATE TABLE `z_helpdesk` (
  `account` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `text` text NOT NULL,
  `id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL,
  `reply` int(11) NOT NULL,
  `who` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `tag` int(11) NOT NULL,
  `registered` timestamp NOT NULL DEFAULT current_timestamp(),
  `t_id` varchar(11) NOT NULL,
  `c_name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_hunt_wiki`
--

CREATE TABLE `z_hunt_wiki` (
  `id` int(11) NOT NULL,
  `city` int(11) NOT NULL DEFAULT 0,
  `monster` varchar(50) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  `image_url` varchar(255) NOT NULL DEFAULT '0',
  `video_url` varchar(500) NOT NULL DEFAULT '0',
  `id_user` int(11) NOT NULL DEFAULT 1,
  `active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `z_hunt_wiki`
--

INSERT INTO `z_hunt_wiki` (`id`, `city`, `monster`, `level`, `type`, `image_url`, `video_url`, `id_user`, `active`) VALUES
(1, 1, 'Dragon Lord', 50, 5, 'http://127.0.0.1/layouts/realsoft/images/wiki/hunts/artemisias-hunts.png', 'https://www.youtube-nocookie.com/embed/g9Wu0FMP68A', 1, 1),
(2, 6, 'Dragon Lair', 30, 2, 'http://127.0.0.1/layouts/realsoft/images/wiki/hunts/Nissea-hunts.png', 'https://www.youtube-nocookie.com/embed/g9Wu0FMP68A', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_network_box`
--

CREATE TABLE `z_network_box` (
  `id` int(11) NOT NULL,
  `network_name` varchar(10) NOT NULL,
  `network_link` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_news_tickers`
--

CREATE TABLE `z_news_tickers` (
  `date` int(11) NOT NULL DEFAULT 1,
  `author` int(11) NOT NULL,
  `image_id` int(11) NOT NULL DEFAULT 0,
  `text` text NOT NULL,
  `hide_ticker` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_ots_comunication`
--

CREATE TABLE `z_ots_comunication` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` int(11) NOT NULL,
  `param2` int(11) NOT NULL,
  `param3` int(11) NOT NULL,
  `param4` int(11) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` int(11) NOT NULL,
  `param8` int(11) NOT NULL,
  `param9` varchar(255) NOT NULL,
  `delete_it` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_ots_guildcomunication`
--

CREATE TABLE `z_ots_guildcomunication` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_polls`
--

CREATE TABLE `z_polls` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `end` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `answers` int(11) NOT NULL,
  `votes_all` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_polls_answers`
--

CREATE TABLE `z_polls_answers` (
  `poll_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `votes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_replay`
--

CREATE TABLE `z_replay` (
  `title` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shopguild_history_item`
--

CREATE TABLE `z_shopguild_history_item` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT 0,
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `offer_id` int(11) NOT NULL DEFAULT 0,
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT 0,
  `trans_real` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shopguild_history_pacc`
--

CREATE TABLE `z_shopguild_history_pacc` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT 0,
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `pacc_days` int(11) NOT NULL DEFAULT 0,
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT 0,
  `trans_real` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shopguild_offer`
--

CREATE TABLE `z_shopguild_offer` (
  `id` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT 0,
  `itemid1` int(11) NOT NULL DEFAULT 0,
  `count1` int(11) NOT NULL DEFAULT 0,
  `itemid2` int(11) NOT NULL DEFAULT 0,
  `count2` int(11) NOT NULL DEFAULT 0,
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_category`
--

CREATE TABLE `z_shop_category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `button` varchar(50) NOT NULL,
  `hide` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `z_shop_category`
--

INSERT INTO `z_shop_category` (`id`, `name`, `desc`, `button`, `hide`) VALUES
(2, 'Extra Services', 'Buy an extra service to transfer a character to another game world, to change your character name or sex, to change your account name, or to get a new recovery key.', '_sbutton_getextraservice.gif', 0),
(3, 'Mounts', 'Buy your characters one or more of the fabulous mounts offered here.', '_sbutton_getmount.gif', 0),
(4, 'Outfits', 'Buy your characters one or more of the fancy outfits offered here.', '_sbutton_getoutfit.gif', 0),
(5, 'Items', 'Buy items for your character be more stronger in the game.', '_sbutton_getitem.gif', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_donates`
--

CREATE TABLE `z_shop_donates` (
  `id` int(11) NOT NULL,
  `date` bigint(20) NOT NULL,
  `reference` varchar(50) NOT NULL,
  `account_name` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `price` varchar(20) NOT NULL,
  `coins` int(11) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `z_shop_donates`
--

INSERT INTO `z_shop_donates` (`id`, `date`, `reference`, `account_name`, `method`, `price`, `coins`, `status`) VALUES
(1, 1673371307, 'mercadoPago-618', 'GU985423', 'mercadoPago', '10', 10, 'rejected'),
(2, 1673371331, 'picpay-1917', 'GU985423', 'picpay', '40', 40, 'rejected'),
(3, 1676289841, 'mercadoPago-4732', 'GU985423', 'mercadoPago', '160', 200, 'rejected');

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_donate_confirm`
--

CREATE TABLE `z_shop_donate_confirm` (
  `id` int(11) NOT NULL,
  `date` bigint(20) NOT NULL,
  `account_name` varchar(50) NOT NULL,
  `donate_id` int(11) NOT NULL,
  `msg` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `z_shop_donate_confirm`
--

INSERT INTO `z_shop_donate_confirm` (`id`, `date`, `account_name`, `donate_id`, `msg`) VALUES
(1, 1676292584, 'GU985423', 3, 'asdfsaafSfsads\r\nadsadas\r\ndsadasdasdasdasdsadas'),
(2, 1676292897, 'GU985423', 1, 'saddsadasdasdasdasdassdsadasdadassdadsa'),
(3, 1676292936, 'GU985423', 2, 'sadsadsadasdasdasd\r\nasdsadsad\r\nasdasdsadasdasdasdsdad');

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_history_item`
--

CREATE TABLE `z_shop_history_item` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT 0,
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `offer_id` varchar(255) NOT NULL DEFAULT '',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT 0,
  `trans_real` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_offer`
--

CREATE TABLE `z_shop_offer` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `coins` int(11) NOT NULL DEFAULT 0,
  `price` varchar(50) NOT NULL,
  `itemid` int(11) NOT NULL DEFAULT 0,
  `mount_id` varchar(100) NOT NULL,
  `addon_name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  `offer_date` int(11) NOT NULL,
  `default_image` varchar(50) NOT NULL,
  `hide` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `z_shop_offer`
--

INSERT INTO `z_shop_offer` (`id`, `category`, `coins`, `price`, `itemid`, `mount_id`, `addon_name`, `count`, `offer_type`, `offer_description`, `offer_name`, `offer_date`, `default_image`, `hide`) VALUES
(1, 2, 250, '0', 0, '0', '', 1, 'changename', 'Buy a character name change to rename one of your characters.', 'Character Change Name', 1637974191, 'changename.png', 0),
(2, 2, 250, '0', 0, '0', '', 1, 'changesex', 'Buy a character sex change to turn your male character into a female one, or your female character into a male one.', 'Character Change Sex', 1637974191, 'changesex.png', 1),
(3, 2, 250, '0', 0, '0', '', 1, 'changeaccountname', 'Buy an account name change to select a different name for your account.', 'Account Name Change', 1637974191, 'changeaccountname.png', 0),
(4, 2, 250, '0', 0, '0', '', 1, 'newrk', 'If you need a new recovery key, you can order it here. Note that the letter for the new recovery key can only be sent to the address in the account registration.', 'Recovery Key', 1637974191, 'newrk.png', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_payment`
--

CREATE TABLE `z_shop_payment` (
  `id` int(11) NOT NULL,
  `ref` varchar(10) NOT NULL,
  `account_name` varchar(50) NOT NULL,
  `service_id` int(11) NOT NULL,
  `service_category_id` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `price` varchar(50) NOT NULL,
  `coins` int(10) UNSIGNED NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'waiting',
  `date` int(11) NOT NULL,
  `gift` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices para tabela `accounts_storage`
--
ALTER TABLE `accounts_storage`
  ADD PRIMARY KEY (`account_id`,`key`);

--
-- Índices para tabela `account_authentication`
--
ALTER TABLE `account_authentication`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `account_bans`
--
ALTER TABLE `account_bans`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `banned_by` (`banned_by`);

--
-- Índices para tabela `account_ban_history`
--
ALTER TABLE `account_ban_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `banned_by` (`banned_by`),
  ADD KEY `account_id_2` (`account_id`),
  ADD KEY `account_id_3` (`account_id`),
  ADD KEY `account_id_4` (`account_id`),
  ADD KEY `account_id_5` (`account_id`);

--
-- Índices para tabela `account_character_sale`
--
ALTER TABLE `account_character_sale`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_player_UNIQUE` (`id_player`),
  ADD KEY `account_character_sale_ibfk_2` (`id_account`);

--
-- Índices para tabela `account_registration`
--
ALTER TABLE `account_registration`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD UNIQUE KEY `account_player_index` (`account_id`,`player_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `atr_wikki_category`
--
ALTER TABLE `atr_wikki_category`
  ADD PRIMARY KEY (`id_atr_wikki_category`);

--
-- Índices para tabela `atr_wikki_subcategory`
--
ALTER TABLE `atr_wikki_subcategory`
  ADD PRIMARY KEY (`id_atr_wikki_subcategory`),
  ADD KEY `FK_ID_WIKKI_CATEGORY_idx` (`id_atr_wikki_category`);

--
-- Índices para tabela `blessings_history`
--
ALTER TABLE `blessings_history`
  ADD KEY `blessings_history_ibfk_1` (`player_id`);

--
-- Índices para tabela `boosted_boss`
--
ALTER TABLE `boosted_boss`
  ADD PRIMARY KEY (`date`);

--
-- Índices para tabela `boosted_creature`
--
ALTER TABLE `boosted_creature`
  ADD PRIMARY KEY (`date`);

--
-- Índices para tabela `canary_achievements`
--
ALTER TABLE `canary_achievements`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_badges`
--
ALTER TABLE `canary_badges`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_boss`
--
ALTER TABLE `canary_boss`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_compendium`
--
ALTER TABLE `canary_compendium`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_countdowns`
--
ALTER TABLE `canary_countdowns`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_creatures`
--
ALTER TABLE `canary_creatures`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_groups`
--
ALTER TABLE `canary_groups`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_items`
--
ALTER TABLE `canary_items`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_news`
--
ALTER TABLE `canary_news`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_payments`
--
ALTER TABLE `canary_payments`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_polls`
--
ALTER TABLE `canary_polls`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_polls_answers`
--
ALTER TABLE `canary_polls_answers`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_polls_questions`
--
ALTER TABLE `canary_polls_questions`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_products`
--
ALTER TABLE `canary_products`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_samples`
--
ALTER TABLE `canary_samples`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_towns`
--
ALTER TABLE `canary_towns`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_uploads`
--
ALTER TABLE `canary_uploads`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_website`
--
ALTER TABLE `canary_website`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_worldquests`
--
ALTER TABLE `canary_worldquests`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_worlds`
--
ALTER TABLE `canary_worlds`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `castle`
--
ALTER TABLE `castle`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `coins_transactions`
--
ALTER TABLE `coins_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `coins_transactions_pk` (`account_id`);

--
-- Índices para tabela `daily_reward_history`
--
ALTER TABLE `daily_reward_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `exclusive_hunts`
--
ALTER TABLE `exclusive_hunts`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `forge_history`
--
ALTER TABLE `forge_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `free_pass`
--
ALTER TABLE `free_pass`
  ADD KEY `free_pass_ibfk_1` (`player_id`);

--
-- Índices para tabela `global_storage`
--
ALTER TABLE `global_storage`
  ADD UNIQUE KEY `key` (`key`);

--
-- Índices para tabela `guilds`
--
ALTER TABLE `guilds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `ownerid` (`ownerid`);

--
-- Índices para tabela `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warid` (`warid`);

--
-- Índices para tabela `guild_actions_h`
--
ALTER TABLE `guild_actions_h`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `guild_events`
--
ALTER TABLE `guild_events`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD PRIMARY KEY (`player_id`,`guild_id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Índices para tabela `guild_membership`
--
ALTER TABLE `guild_membership`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `guild_id` (`guild_id`),
  ADD KEY `rank_id` (`rank_id`);

--
-- Índices para tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Índices para tabela `guild_transfer_h`
--
ALTER TABLE `guild_transfer_h`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `guild_wars`
--
ALTER TABLE `guild_wars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild1` (`guild1`),
  ADD KEY `guild2` (`guild2`);

--
-- Índices para tabela `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner` (`owner`),
  ADD KEY `town_id` (`town_id`);

--
-- Índices para tabela `house_lists`
--
ALTER TABLE `house_lists`
  ADD KEY `house_id` (`house_id`);

--
-- Índices para tabela `ip_bans`
--
ALTER TABLE `ip_bans`
  ADD PRIMARY KEY (`ip`),
  ADD KEY `banned_by` (`banned_by`);

--
-- Índices para tabela `live_casts`
--
ALTER TABLE `live_casts`
  ADD UNIQUE KEY `player_id_2` (`player_id`);

--
-- Índices para tabela `lottery`
--
ALTER TABLE `lottery`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `market_history`
--
ALTER TABLE `market_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`,`sale`);

--
-- Índices para tabela `market_offers`
--
ALTER TABLE `market_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale` (`sale`,`itemtype`),
  ADD KEY `created` (`created`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `newsticker`
--
ALTER TABLE `newsticker`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pagseguro_transactions`
--
ALTER TABLE `pagseguro_transactions`
  ADD UNIQUE KEY `transaction_code` (`transaction_code`,`status`),
  ADD KEY `name` (`name`),
  ADD KEY `status` (`status`);

--
-- Índices para tabela `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `vocation` (`vocation`);

--
-- Índices para tabela `players_online`
--
ALTER TABLE `players_online`
  ADD PRIMARY KEY (`player_id`);

--
-- Índices para tabela `player_badges`
--
ALTER TABLE `player_badges`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `player_binary_items`
--
ALTER TABLE `player_binary_items`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`type`);

--
-- Índices para tabela `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `killed_by` (`killed_by`),
  ADD KEY `mostdamage_by` (`mostdamage_by`);

--
-- Índices para tabela `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`);

--
-- Índices para tabela `player_depotlockeritems`
--
ALTER TABLE `player_depotlockeritems`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`);

--
-- Índices para tabela `player_display`
--
ALTER TABLE `player_display`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `player_exp_restore`
--
ALTER TABLE `player_exp_restore`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `player_former_names`
--
ALTER TABLE `player_former_names`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `player_hirelings`
--
ALTER TABLE `player_hirelings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`);

--
-- Índices para tabela `player_items`
--
ALTER TABLE `player_items`
  ADD KEY `player_id` (`player_id`),
  ADD KEY `sid` (`sid`);

--
-- Índices para tabela `player_kills`
--
ALTER TABLE `player_kills`
  ADD KEY `player_kills_ibfk_1` (`player_id`),
  ADD KEY `player_kills_ibfk_2` (`target`);

--
-- Índices para tabela `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `namelocked_by` (`namelocked_by`);

--
-- Índices para tabela `player_preydata`
--
ALTER TABLE `player_preydata`
  ADD PRIMARY KEY (`player_id`);

--
-- Índices para tabela `player_rewards`
--
ALTER TABLE `player_rewards`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`);

--
-- Índices para tabela `player_spells`
--
ALTER TABLE `player_spells`
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `player_storage`
--
ALTER TABLE `player_storage`
  ADD PRIMARY KEY (`player_id`,`key`);

--
-- Índices para tabela `prey_slots`
--
ALTER TABLE `prey_slots`
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `quickloot_containers`
--
ALTER TABLE `quickloot_containers`
  ADD KEY `fk_quickloot_containers_player_id` (`player_id`);

--
-- Índices para tabela `sellchar`
--
ALTER TABLE `sellchar`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sell_players`
--
ALTER TABLE `sell_players`
  ADD PRIMARY KEY (`player_id`);

--
-- Índices para tabela `sell_players_history`
--
ALTER TABLE `sell_players_history`
  ADD PRIMARY KEY (`player_id`,`buytime`) USING BTREE;

--
-- Índices para tabela `server_config`
--
ALTER TABLE `server_config`
  ADD PRIMARY KEY (`config`);

--
-- Índices para tabela `snake_game`
--
ALTER TABLE `snake_game`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `snowballwar`
--
ALTER TABLE `snowballwar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Índices para tabela `store_history`
--
ALTER TABLE `store_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `store_history_pk` (`account_id`);

--
-- Índices para tabela `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `tickets_ibfk_1` (`ticket_author_acc_id`);

--
-- Índices para tabela `tickets_reply`
--
ALTER TABLE `tickets_reply`
  ADD PRIMARY KEY (`reply_id`),
  ADD KEY `tickets_reply_ibfk_1` (`ticket_id`);

--
-- Índices para tabela `tile_store`
--
ALTER TABLE `tile_store`
  ADD KEY `house_id` (`house_id`);

--
-- Índices para tabela `towns`
--
ALTER TABLE `towns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices para tabela `woe`
--
ALTER TABLE `woe`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices para tabela `z_forum`
--
ALTER TABLE `z_forum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section` (`section`);

--
-- Índices para tabela `z_hunt_wiki`
--
ALTER TABLE `z_hunt_wiki`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `z_ots_comunication`
--
ALTER TABLE `z_ots_comunication`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `z_ots_guildcomunication`
--
ALTER TABLE `z_ots_guildcomunication`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `z_shop_category`
--
ALTER TABLE `z_shop_category`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `z_shop_donates`
--
ALTER TABLE `z_shop_donates`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `z_shop_donate_confirm`
--
ALTER TABLE `z_shop_donate_confirm`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `z_shop_offer`
--
ALTER TABLE `z_shop_offer`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `z_shop_payment`
--
ALTER TABLE `z_shop_payment`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `account_authentication`
--
ALTER TABLE `account_authentication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `account_ban_history`
--
ALTER TABLE `account_ban_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `account_character_sale`
--
ALTER TABLE `account_character_sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `account_registration`
--
ALTER TABLE `account_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `atr_wikki_category`
--
ALTER TABLE `atr_wikki_category`
  MODIFY `id_atr_wikki_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `atr_wikki_subcategory`
--
ALTER TABLE `atr_wikki_subcategory`
  MODIFY `id_atr_wikki_subcategory` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `canary_achievements`
--
ALTER TABLE `canary_achievements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `canary_badges`
--
ALTER TABLE `canary_badges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `canary_boss`
--
ALTER TABLE `canary_boss`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `canary_compendium`
--
ALTER TABLE `canary_compendium`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `canary_countdowns`
--
ALTER TABLE `canary_countdowns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `canary_creatures`
--
ALTER TABLE `canary_creatures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `canary_groups`
--
ALTER TABLE `canary_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `canary_items`
--
ALTER TABLE `canary_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `canary_news`
--
ALTER TABLE `canary_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `canary_payments`
--
ALTER TABLE `canary_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `canary_polls`
--
ALTER TABLE `canary_polls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `canary_polls_answers`
--
ALTER TABLE `canary_polls_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `canary_polls_questions`
--
ALTER TABLE `canary_polls_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `canary_products`
--
ALTER TABLE `canary_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `canary_samples`
--
ALTER TABLE `canary_samples`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `canary_towns`
--
ALTER TABLE `canary_towns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `canary_uploads`
--
ALTER TABLE `canary_uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `canary_website`
--
ALTER TABLE `canary_website`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `canary_worldquests`
--
ALTER TABLE `canary_worldquests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `canary_worlds`
--
ALTER TABLE `canary_worlds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `castle`
--
ALTER TABLE `castle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `coins_transactions`
--
ALTER TABLE `coins_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `daily_reward_history`
--
ALTER TABLE `daily_reward_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de tabela `exclusive_hunts`
--
ALTER TABLE `exclusive_hunts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `forge_history`
--
ALTER TABLE `forge_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8970;

--
-- AUTO_INCREMENT de tabela `guilds`
--
ALTER TABLE `guilds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `guild_actions_h`
--
ALTER TABLE `guild_actions_h`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `guild_events`
--
ALTER TABLE `guild_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `guild_transfer_h`
--
ALTER TABLE `guild_transfer_h`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `guild_wars`
--
ALTER TABLE `guild_wars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `houses`
--
ALTER TABLE `houses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=659;

--
-- AUTO_INCREMENT de tabela `lottery`
--
ALTER TABLE `lottery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de tabela `market_history`
--
ALTER TABLE `market_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `market_offers`
--
ALTER TABLE `market_offers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `newsticker`
--
ALTER TABLE `newsticker`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `player_badges`
--
ALTER TABLE `player_badges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `player_deaths`
--
ALTER TABLE `player_deaths`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT de tabela `player_display`
--
ALTER TABLE `player_display`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `player_exp_restore`
--
ALTER TABLE `player_exp_restore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `player_former_names`
--
ALTER TABLE `player_former_names`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `player_hirelings`
--
ALTER TABLE `player_hirelings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `sellchar`
--
ALTER TABLE `sellchar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `snake_game`
--
ALTER TABLE `snake_game`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `snowballwar`
--
ALTER TABLE `snowballwar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `store_history`
--
ALTER TABLE `store_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=444;

--
-- AUTO_INCREMENT de tabela `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tickets_reply`
--
ALTER TABLE `tickets_reply`
  MODIFY `reply_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `towns`
--
ALTER TABLE `towns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `woe`
--
ALTER TABLE `woe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `z_forum`
--
ALTER TABLE `z_forum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `z_hunt_wiki`
--
ALTER TABLE `z_hunt_wiki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `z_ots_comunication`
--
ALTER TABLE `z_ots_comunication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `z_ots_guildcomunication`
--
ALTER TABLE `z_ots_guildcomunication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `z_shop_category`
--
ALTER TABLE `z_shop_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `z_shop_donates`
--
ALTER TABLE `z_shop_donates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `z_shop_donate_confirm`
--
ALTER TABLE `z_shop_donate_confirm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `z_shop_offer`
--
ALTER TABLE `z_shop_offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `z_shop_payment`
--
ALTER TABLE `z_shop_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `accounts_storage`
--
ALTER TABLE `accounts_storage`
  ADD CONSTRAINT `accounts_storage_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `account_bans`
--
ALTER TABLE `account_bans`
  ADD CONSTRAINT `account_bans_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_bans_ibfk_2` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `account_ban_history`
--
ALTER TABLE `account_ban_history`
  ADD CONSTRAINT `account_ban_history_ibfk_2` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_ban_history_ibfk_3` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_ban_history_ibfk_4` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_ban_history_ibfk_5` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_ban_history_ibfk_6` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `account_character_sale`
--
ALTER TABLE `account_character_sale`
  ADD CONSTRAINT `account_character_sale_ibfk_1` FOREIGN KEY (`id_player`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_character_sale_ibfk_2` FOREIGN KEY (`id_account`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD CONSTRAINT `account_viplist_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_viplist_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `atr_wikki_subcategory`
--
ALTER TABLE `atr_wikki_subcategory`
  ADD CONSTRAINT `FK_ID_WIKKI_CATEGORY` FOREIGN KEY (`id_atr_wikki_category`) REFERENCES `atr_wikki_category` (`id_atr_wikki_category`);

--
-- Limitadores para a tabela `blessings_history`
--
ALTER TABLE `blessings_history`
  ADD CONSTRAINT `blessings_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `forge_history`
--
ALTER TABLE `forge_history`
  ADD CONSTRAINT `forge_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `free_pass`
--
ALTER TABLE `free_pass`
  ADD CONSTRAINT `free_pass_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guilds`
--
ALTER TABLE `guilds`
  ADD CONSTRAINT `guilds_ibfk_1` FOREIGN KEY (`ownerid`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  ADD CONSTRAINT `guildwar_kills_ibfk_1` FOREIGN KEY (`warid`) REFERENCES `guild_wars` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD CONSTRAINT `guild_invites_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_invites_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guild_membership`
--
ALTER TABLE `guild_membership`
  ADD CONSTRAINT `guild_membership_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guild_membership_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guild_membership_ibfk_3` FOREIGN KEY (`rank_id`) REFERENCES `guild_ranks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD CONSTRAINT `guild_ranks_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `house_lists`
--
ALTER TABLE `house_lists`
  ADD CONSTRAINT `house_lists_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `ip_bans`
--
ALTER TABLE `ip_bans`
  ADD CONSTRAINT `ip_bans_ibfk_1` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `live_casts`
--
ALTER TABLE `live_casts`
  ADD CONSTRAINT `live_casts_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `market_history`
--
ALTER TABLE `market_history`
  ADD CONSTRAINT `market_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `market_offers`
--
ALTER TABLE `market_offers`
  ADD CONSTRAINT `market_offers_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD CONSTRAINT `player_deaths_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD CONSTRAINT `player_depotitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_depotlockeritems`
--
ALTER TABLE `player_depotlockeritems`
  ADD CONSTRAINT `player_depotlockeritems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_hirelings`
--
ALTER TABLE `player_hirelings`
  ADD CONSTRAINT `player_hirelings_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
  ADD CONSTRAINT `player_inboxitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_items`
--
ALTER TABLE `player_items`
  ADD CONSTRAINT `player_items_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_kills`
--
ALTER TABLE `player_kills`
  ADD CONSTRAINT `player_kills_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `player_kills_ibfk_2` FOREIGN KEY (`target`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD CONSTRAINT `player_namelocks_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `player_namelocks_ibfk_2` FOREIGN KEY (`namelocked_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `player_preydata`
--
ALTER TABLE `player_preydata`
  ADD CONSTRAINT `player_preydata_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `player_rewards`
--
ALTER TABLE `player_rewards`
  ADD CONSTRAINT `player_rewards_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_spells`
--
ALTER TABLE `player_spells`
  ADD CONSTRAINT `player_spells_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_storage`
--
ALTER TABLE `player_storage`
  ADD CONSTRAINT `player_storage_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `prey_slots`
--
ALTER TABLE `prey_slots`
  ADD CONSTRAINT `prey_slots_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `quickloot_containers`
--
ALTER TABLE `quickloot_containers`
  ADD CONSTRAINT `fk_quickloot_containers_player_id` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`);

--
-- Limitadores para a tabela `sellchar`
--
ALTER TABLE `sellchar`
  ADD CONSTRAINT `sellchar_ibfk_1` FOREIGN KEY (`id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `sell_players`
--
ALTER TABLE `sell_players`
  ADD CONSTRAINT `sell_players_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `sell_players_history`
--
ALTER TABLE `sell_players_history`
  ADD CONSTRAINT `sell_players_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`ticket_author_acc_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tickets_reply`
--
ALTER TABLE `tickets_reply`
  ADD CONSTRAINT `tickets_reply_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tile_store`
--
ALTER TABLE `tile_store`
  ADD CONSTRAINT `tile_store_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
