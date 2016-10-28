-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 28, 2016 at 05:39 PM
-- Server version: 5.7.13-0ubuntu0.16.04.2
-- PHP Version: 7.0.8-0ubuntu0.16.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elior_concepts`
--

-- --------------------------------------------------------

--
-- Table structure for table `address_client`
--

CREATE TABLE `address_client` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `updator_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_label_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_label_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_label_3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `addressType_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `address_client`
--

INSERT INTO `address_client` (`id`, `client_id`, `creator_id`, `updator_id`, `name`, `description`, `address_label_1`, `address_label_2`, `address_label_3`, `postal_code`, `city`, `created_at`, `updated_at`, `deleted_at`, `country_id`, `addressType_id`) VALUES
(1, 1, 1, NULL, 'addess client mo', NULL, NULL, NULL, NULL, '75008', 'PARIS', '2016-10-25 00:00:00', NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `address_type`
--

CREATE TABLE `address_type` (
  `id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `address_type`
--

INSERT INTO `address_type` (`id`, `label`) VALUES
(4, 'former invoicing address'),
(3, 'former shipping address'),
(2, 'invoicing address'),
(1, 'shipping address');

-- --------------------------------------------------------

--
-- Table structure for table `address_user`
--

CREATE TABLE `address_user` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `updator_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_label_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_label_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_label_3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `addressType_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `address_user`
--

INSERT INTO `address_user` (`id`, `user_id`, `creator_id`, `updator_id`, `name`, `description`, `address_label_1`, `address_label_2`, `address_label_3`, `postal_code`, `city`, `created_at`, `updated_at`, `deleted_at`, `country_id`, `addressType_id`) VALUES
(1, 1, 1, NULL, 'address user mo', NULL, NULL, NULL, NULL, '75008', 'PARIS', '2016-10-25 00:00:00', NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `creator_id` int(11) NOT NULL,
  `updator_id` int(11) DEFAULT NULL,
  `clientType_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `reference`, `email`, `first_name`, `last_name`, `company_name`, `description`, `created_at`, `updated_at`, `deleted_at`, `creator_id`, `updator_id`, `clientType_id`) VALUES
(1, 'mo', 'moamben@gmail.com', 'mohamed', 'benabdallah', NULL, NULL, '2016-10-25 00:00:00', NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_type`
--

CREATE TABLE `client_type` (
  `id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `client_type`
--

INSERT INTO `client_type` (`id`, `label`) VALUES
(1, 'client'),
(2, 'prospect');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `authorEmail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `publishedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `post_id`, `content`, `authorEmail`, `publishedAt`) VALUES
(1, 1, 'Nunc viverra elit ac laoreet suscipit Ut eleifend mauris et risus ultrices egestas Pellentesque et sapien pulvinar consectetur Curabitur aliquam euismod dolor non ornare', 'john_user@symfony.com', '2016-10-24 12:25:51'),
(2, 1, 'Sed varius a risus eget aliquam Ut eleifend mauris et risus ultrices egestas Ut suscipit posuere justo at vulputate Curabitur aliquam euismod dolor non ornare Nunc viverra elit ac laoreet suscipit Morbi tempus commodo mattis Nulla porta lobortis ligula vel egestas Mauris dapibus risus quis suscipit vulputate Pellentesque et sapien pulvinar consectetur Eros diam egestas libero eu vulputate risus In hac habitasse platea dictumst Urna nisl sollicitudin id varius orci quam id turpis Lorem ipsum dolor sit amet consectetur adipiscing elit Aliquam sodales odio id eleifend tristique', 'john_user@symfony.com', '2016-10-24 12:25:52'),
(3, 1, 'Nunc viverra elit ac laoreet suscipit In hac habitasse platea dictumst Nulla porta lobortis ligula vel egestas Urna nisl sollicitudin id varius orci quam id turpis Aliquam sodales odio id eleifend tristique Morbi tempus commodo mattis', 'john_user@symfony.com', '2016-10-24 12:25:53'),
(4, 1, 'Urna nisl sollicitudin id varius orci quam id turpis Sed varius a risus eget aliquam Mauris dapibus risus quis suscipit vulputate In hac habitasse platea dictumst', 'john_user@symfony.com', '2016-10-24 12:25:54'),
(5, 1, 'Ut suscipit posuere justo at vulputate Pellentesque et sapien pulvinar consectetur Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi tempus commodo mattis Pellentesque vitae velit ex Mauris dapibus risus quis suscipit vulputate Curabitur aliquam euismod dolor non ornare In hac habitasse platea dictumst Aliquam sodales odio id eleifend tristique Sed varius a risus eget aliquam Eros diam egestas libero eu vulputate risus Nulla porta lobortis ligula vel egestas', 'john_user@symfony.com', '2016-10-24 12:25:55'),
(6, 2, 'Nunc viverra elit ac laoreet suscipit Lorem ipsum dolor sit amet consectetur adipiscing elit Pellentesque et sapien pulvinar consectetur Aliquam sodales odio id eleifend tristique Ut eleifend mauris et risus ultrices egestas Morbi tempus commodo mattis Curabitur aliquam euismod dolor non ornare Ut suscipit posuere justo at vulputate Sed varius a risus eget aliquam Mauris dapibus risus quis suscipit vulputate Pellentesque vitae velit ex Nulla porta lobortis ligula vel egestas Eros diam egestas libero eu vulputate risus In hac habitasse platea dictumst', 'john_user@symfony.com', '2016-10-24 12:25:52'),
(7, 2, 'Mauris dapibus risus quis suscipit vulputate Morbi tempus commodo mattis Nunc viverra elit ac laoreet suscipit Ut eleifend mauris et risus ultrices egestas Nulla porta lobortis ligula vel egestas Eros diam egestas libero eu vulputate risus Lorem ipsum dolor sit amet consectetur adipiscing elit Ut suscipit posuere justo at vulputate Curabitur aliquam euismod dolor non ornare Sed varius a risus eget aliquam', 'john_user@symfony.com', '2016-10-24 12:25:53'),
(8, 2, 'Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi tempus commodo mattis', 'john_user@symfony.com', '2016-10-24 12:25:54'),
(9, 2, 'Eros diam egestas libero eu vulputate risus Curabitur aliquam euismod dolor non ornare Pellentesque et sapien pulvinar consectetur Urna nisl sollicitudin id varius orci quam id turpis Lorem ipsum dolor sit amet consectetur adipiscing elit Ut eleifend mauris et risus ultrices egestas Nunc viverra elit ac laoreet suscipit Aliquam sodales odio id eleifend tristique Mauris dapibus risus quis suscipit vulputate Morbi tempus commodo mattis Sed varius a risus eget aliquam Pellentesque vitae velit ex', 'john_user@symfony.com', '2016-10-24 12:25:55'),
(10, 2, 'Aliquam sodales odio id eleifend tristique Sed varius a risus eget aliquam Curabitur aliquam euismod dolor non ornare Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi tempus commodo mattis', 'john_user@symfony.com', '2016-10-24 12:25:56'),
(11, 3, 'Mauris dapibus risus quis suscipit vulputate Aliquam sodales odio id eleifend tristique Morbi tempus commodo mattis Curabitur aliquam euismod dolor non ornare Ut eleifend mauris et risus ultrices egestas Ut suscipit posuere justo at vulputate Eros diam egestas libero eu vulputate risus', 'john_user@symfony.com', '2016-10-24 12:25:53'),
(12, 3, 'Ut suscipit posuere justo at vulputate Ut eleifend mauris et risus ultrices egestas Eros diam egestas libero eu vulputate risus Sed varius a risus eget aliquam Aliquam sodales odio id eleifend tristique Morbi tempus commodo mattis Mauris dapibus risus quis suscipit vulputate Lorem ipsum dolor sit amet consectetur adipiscing elit', 'john_user@symfony.com', '2016-10-24 12:25:54'),
(13, 3, 'Mauris dapibus risus quis suscipit vulputate In hac habitasse platea dictumst Curabitur aliquam euismod dolor non ornare Pellentesque vitae velit ex Urna nisl sollicitudin id varius orci quam id turpis Aliquam sodales odio id eleifend tristique Ut eleifend mauris et risus ultrices egestas Nunc viverra elit ac laoreet suscipit Eros diam egestas libero eu vulputate risus', 'john_user@symfony.com', '2016-10-24 12:25:55'),
(14, 3, 'Curabitur aliquam euismod dolor non ornare Aliquam sodales odio id eleifend tristique Pellentesque vitae velit ex Nulla porta lobortis ligula vel egestas Lorem ipsum dolor sit amet consectetur adipiscing elit In hac habitasse platea dictumst Mauris dapibus risus quis suscipit vulputate Sed varius a risus eget aliquam Morbi tempus commodo mattis Nunc viverra elit ac laoreet suscipit Ut suscipit posuere justo at vulputate Urna nisl sollicitudin id varius orci quam id turpis Pellentesque et sapien pulvinar consectetur Eros diam egestas libero eu vulputate risus', 'john_user@symfony.com', '2016-10-24 12:25:56'),
(15, 3, 'Nulla porta lobortis ligula vel egestas Nunc viverra elit ac laoreet suscipit Ut eleifend mauris et risus ultrices egestas Sed varius a risus eget aliquam Urna nisl sollicitudin id varius orci quam id turpis Morbi tempus commodo mattis Pellentesque et sapien pulvinar consectetur Pellentesque vitae velit ex Eros diam egestas libero eu vulputate risus Curabitur aliquam euismod dolor non ornare Ut suscipit posuere justo at vulputate In hac habitasse platea dictumst', 'john_user@symfony.com', '2016-10-24 12:25:57'),
(16, 4, 'Ut eleifend mauris et risus ultrices egestas Sed varius a risus eget aliquam Urna nisl sollicitudin id varius orci quam id turpis Eros diam egestas libero eu vulputate risus In hac habitasse platea dictumst Aliquam sodales odio id eleifend tristique Nulla porta lobortis ligula vel egestas Curabitur aliquam euismod dolor non ornare Ut suscipit posuere justo at vulputate', 'john_user@symfony.com', '2016-10-24 12:25:54'),
(17, 4, 'Ut eleifend mauris et risus ultrices egestas Mauris dapibus risus quis suscipit vulputate Pellentesque et sapien pulvinar consectetur Nulla porta lobortis ligula vel egestas Lorem ipsum dolor sit amet consectetur adipiscing elit Curabitur aliquam euismod dolor non ornare Morbi tempus commodo mattis Urna nisl sollicitudin id varius orci quam id turpis Sed varius a risus eget aliquam', 'john_user@symfony.com', '2016-10-24 12:25:55'),
(18, 4, 'Pellentesque et sapien pulvinar consectetur Aliquam sodales odio id eleifend tristique Lorem ipsum dolor sit amet consectetur adipiscing elit Eros diam egestas libero eu vulputate risus Ut eleifend mauris et risus ultrices egestas Ut suscipit posuere justo at vulputate Nulla porta lobortis ligula vel egestas Nunc viverra elit ac laoreet suscipit Pellentesque vitae velit ex Sed varius a risus eget aliquam', 'john_user@symfony.com', '2016-10-24 12:25:56'),
(19, 4, 'Nunc viverra elit ac laoreet suscipit Curabitur aliquam euismod dolor non ornare Ut eleifend mauris et risus ultrices egestas Pellentesque et sapien pulvinar consectetur Pellentesque vitae velit ex Nulla porta lobortis ligula vel egestas Eros diam egestas libero eu vulputate risus Aliquam sodales odio id eleifend tristique Morbi tempus commodo mattis', 'john_user@symfony.com', '2016-10-24 12:25:57'),
(20, 4, 'Pellentesque et sapien pulvinar consectetur Ut suscipit posuere justo at vulputate Nulla porta lobortis ligula vel egestas Ut eleifend mauris et risus ultrices egestas Lorem ipsum dolor sit amet consectetur adipiscing elit Aliquam sodales odio id eleifend tristique In hac habitasse platea dictumst', 'john_user@symfony.com', '2016-10-24 12:25:58'),
(21, 5, 'Urna nisl sollicitudin id varius orci quam id turpis In hac habitasse platea dictumst Pellentesque et sapien pulvinar consectetur Pellentesque vitae velit ex Eros diam egestas libero eu vulputate risus Mauris dapibus risus quis suscipit vulputate Ut suscipit posuere justo at vulputate', 'john_user@symfony.com', '2016-10-24 12:25:55'),
(22, 5, 'Mauris dapibus risus quis suscipit vulputate Sed varius a risus eget aliquam Aliquam sodales odio id eleifend tristique Ut eleifend mauris et risus ultrices egestas Pellentesque vitae velit ex Pellentesque et sapien pulvinar consectetur', 'john_user@symfony.com', '2016-10-24 12:25:56'),
(23, 5, 'Sed varius a risus eget aliquam Eros diam egestas libero eu vulputate risus Pellentesque et sapien pulvinar consectetur Nunc viverra elit ac laoreet suscipit', 'john_user@symfony.com', '2016-10-24 12:25:57'),
(24, 5, 'Pellentesque et sapien pulvinar consectetur', 'john_user@symfony.com', '2016-10-24 12:25:58'),
(25, 5, 'Pellentesque vitae velit ex Aliquam sodales odio id eleifend tristique Mauris dapibus risus quis suscipit vulputate Morbi tempus commodo mattis Pellentesque et sapien pulvinar consectetur Curabitur aliquam euismod dolor non ornare Ut eleifend mauris et risus ultrices egestas Ut suscipit posuere justo at vulputate Sed varius a risus eget aliquam Eros diam egestas libero eu vulputate risus', 'john_user@symfony.com', '2016-10-24 12:25:59'),
(26, 6, 'Eros diam egestas libero eu vulputate risus Aliquam sodales odio id eleifend tristique Ut suscipit posuere justo at vulputate Urna nisl sollicitudin id varius orci quam id turpis Nunc viverra elit ac laoreet suscipit Curabitur aliquam euismod dolor non ornare In hac habitasse platea dictumst Lorem ipsum dolor sit amet consectetur adipiscing elit Pellentesque et sapien pulvinar consectetur Pellentesque vitae velit ex Ut eleifend mauris et risus ultrices egestas', 'john_user@symfony.com', '2016-10-24 12:25:56'),
(27, 6, 'Curabitur aliquam euismod dolor non ornare Ut eleifend mauris et risus ultrices egestas Nunc viverra elit ac laoreet suscipit Mauris dapibus risus quis suscipit vulputate Morbi tempus commodo mattis Ut suscipit posuere justo at vulputate Sed varius a risus eget aliquam Urna nisl sollicitudin id varius orci quam id turpis Nulla porta lobortis ligula vel egestas In hac habitasse platea dictumst Pellentesque vitae velit ex Eros diam egestas libero eu vulputate risus Pellentesque et sapien pulvinar consectetur', 'john_user@symfony.com', '2016-10-24 12:25:57'),
(28, 6, 'Curabitur aliquam euismod dolor non ornare Lorem ipsum dolor sit amet consectetur adipiscing elit In hac habitasse platea dictumst Eros diam egestas libero eu vulputate risus Nunc viverra elit ac laoreet suscipit Aliquam sodales odio id eleifend tristique Ut eleifend mauris et risus ultrices egestas Mauris dapibus risus quis suscipit vulputate Morbi tempus commodo mattis Pellentesque vitae velit ex Ut suscipit posuere justo at vulputate Sed varius a risus eget aliquam', 'john_user@symfony.com', '2016-10-24 12:25:58'),
(29, 6, 'Lorem ipsum dolor sit amet consectetur adipiscing elit Pellentesque vitae velit ex Nulla porta lobortis ligula vel egestas Curabitur aliquam euismod dolor non ornare Nunc viverra elit ac laoreet suscipit Urna nisl sollicitudin id varius orci quam id turpis Ut eleifend mauris et risus ultrices egestas Ut suscipit posuere justo at vulputate Sed varius a risus eget aliquam In hac habitasse platea dictumst Aliquam sodales odio id eleifend tristique Pellentesque et sapien pulvinar consectetur', 'john_user@symfony.com', '2016-10-24 12:25:59'),
(30, 6, 'Mauris dapibus risus quis suscipit vulputate Urna nisl sollicitudin id varius orci quam id turpis Curabitur aliquam euismod dolor non ornare Lorem ipsum dolor sit amet consectetur adipiscing elit Ut eleifend mauris et risus ultrices egestas Nunc viverra elit ac laoreet suscipit Morbi tempus commodo mattis In hac habitasse platea dictumst Pellentesque et sapien pulvinar consectetur', 'john_user@symfony.com', '2016-10-24 12:26:00'),
(31, 7, 'Nulla porta lobortis ligula vel egestas Ut eleifend mauris et risus ultrices egestas Pellentesque et sapien pulvinar consectetur', 'john_user@symfony.com', '2016-10-24 12:25:57'),
(32, 7, 'Pellentesque vitae velit ex Urna nisl sollicitudin id varius orci quam id turpis Curabitur aliquam euismod dolor non ornare Morbi tempus commodo mattis Sed varius a risus eget aliquam Nulla porta lobortis ligula vel egestas Nunc viverra elit ac laoreet suscipit Eros diam egestas libero eu vulputate risus Pellentesque et sapien pulvinar consectetur', 'john_user@symfony.com', '2016-10-24 12:25:58'),
(33, 7, 'Ut suscipit posuere justo at vulputate Pellentesque et sapien pulvinar consectetur Aliquam sodales odio id eleifend tristique', 'john_user@symfony.com', '2016-10-24 12:25:59'),
(34, 7, 'Nunc viverra elit ac laoreet suscipit Sed varius a risus eget aliquam Ut eleifend mauris et risus ultrices egestas In hac habitasse platea dictumst', 'john_user@symfony.com', '2016-10-24 12:26:00'),
(35, 7, 'Ut suscipit posuere justo at vulputate Pellentesque et sapien pulvinar consectetur Sed varius a risus eget aliquam Nunc viverra elit ac laoreet suscipit Pellentesque vitae velit ex In hac habitasse platea dictumst Eros diam egestas libero eu vulputate risus Lorem ipsum dolor sit amet consectetur adipiscing elit', 'john_user@symfony.com', '2016-10-24 12:26:01'),
(36, 8, 'Mauris dapibus risus quis suscipit vulputate', 'john_user@symfony.com', '2016-10-24 12:25:58'),
(37, 8, 'Nulla porta lobortis ligula vel egestas Morbi tempus commodo mattis Pellentesque vitae velit ex Lorem ipsum dolor sit amet consectetur adipiscing elit Mauris dapibus risus quis suscipit vulputate Ut suscipit posuere justo at vulputate Nunc viverra elit ac laoreet suscipit Ut eleifend mauris et risus ultrices egestas Sed varius a risus eget aliquam Urna nisl sollicitudin id varius orci quam id turpis Curabitur aliquam euismod dolor non ornare Pellentesque et sapien pulvinar consectetur Aliquam sodales odio id eleifend tristique', 'john_user@symfony.com', '2016-10-24 12:25:59'),
(38, 8, 'Sed varius a risus eget aliquam Ut eleifend mauris et risus ultrices egestas', 'john_user@symfony.com', '2016-10-24 12:26:00'),
(39, 8, 'Aliquam sodales odio id eleifend tristique Mauris dapibus risus quis suscipit vulputate Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi tempus commodo mattis Nunc viverra elit ac laoreet suscipit Sed varius a risus eget aliquam Pellentesque vitae velit ex Ut eleifend mauris et risus ultrices egestas Nulla porta lobortis ligula vel egestas Curabitur aliquam euismod dolor non ornare', 'john_user@symfony.com', '2016-10-24 12:26:01'),
(40, 8, 'Morbi tempus commodo mattis In hac habitasse platea dictumst Pellentesque et sapien pulvinar consectetur Pellentesque vitae velit ex Curabitur aliquam euismod dolor non ornare Lorem ipsum dolor sit amet consectetur adipiscing elit Mauris dapibus risus quis suscipit vulputate Ut suscipit posuere justo at vulputate', 'john_user@symfony.com', '2016-10-24 12:26:02'),
(41, 9, 'Pellentesque vitae velit ex Lorem ipsum dolor sit amet consectetur adipiscing elit Eros diam egestas libero eu vulputate risus Nunc viverra elit ac laoreet suscipit Sed varius a risus eget aliquam Aliquam sodales odio id eleifend tristique Pellentesque et sapien pulvinar consectetur Ut suscipit posuere justo at vulputate Curabitur aliquam euismod dolor non ornare Ut eleifend mauris et risus ultrices egestas In hac habitasse platea dictumst Urna nisl sollicitudin id varius orci quam id turpis Morbi tempus commodo mattis', 'john_user@symfony.com', '2016-10-24 12:25:59'),
(42, 9, 'Urna nisl sollicitudin id varius orci quam id turpis Morbi tempus commodo mattis Sed varius a risus eget aliquam Nulla porta lobortis ligula vel egestas Mauris dapibus risus quis suscipit vulputate Curabitur aliquam euismod dolor non ornare', 'john_user@symfony.com', '2016-10-24 12:26:00'),
(43, 9, 'Nulla porta lobortis ligula vel egestas Pellentesque et sapien pulvinar consectetur Urna nisl sollicitudin id varius orci quam id turpis Curabitur aliquam euismod dolor non ornare Sed varius a risus eget aliquam Nunc viverra elit ac laoreet suscipit Eros diam egestas libero eu vulputate risus Pellentesque vitae velit ex Mauris dapibus risus quis suscipit vulputate Ut eleifend mauris et risus ultrices egestas Aliquam sodales odio id eleifend tristique Ut suscipit posuere justo at vulputate In hac habitasse platea dictumst Lorem ipsum dolor sit amet consectetur adipiscing elit', 'john_user@symfony.com', '2016-10-24 12:26:01'),
(44, 9, 'Nunc viverra elit ac laoreet suscipit Pellentesque et sapien pulvinar consectetur Pellentesque vitae velit ex Ut suscipit posuere justo at vulputate Morbi tempus commodo mattis Aliquam sodales odio id eleifend tristique Nulla porta lobortis ligula vel egestas Eros diam egestas libero eu vulputate risus Curabitur aliquam euismod dolor non ornare Mauris dapibus risus quis suscipit vulputate Lorem ipsum dolor sit amet consectetur adipiscing elit Urna nisl sollicitudin id varius orci quam id turpis', 'john_user@symfony.com', '2016-10-24 12:26:02'),
(45, 9, 'Urna nisl sollicitudin id varius orci quam id turpis Nulla porta lobortis ligula vel egestas Morbi tempus commodo mattis Curabitur aliquam euismod dolor non ornare Aliquam sodales odio id eleifend tristique Ut eleifend mauris et risus ultrices egestas Pellentesque vitae velit ex Sed varius a risus eget aliquam Ut suscipit posuere justo at vulputate Pellentesque et sapien pulvinar consectetur', 'john_user@symfony.com', '2016-10-24 12:26:03'),
(46, 10, 'Eros diam egestas libero eu vulputate risus Urna nisl sollicitudin id varius orci quam id turpis Ut eleifend mauris et risus ultrices egestas Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi tempus commodo mattis', 'john_user@symfony.com', '2016-10-24 12:26:00'),
(47, 10, 'Sed varius a risus eget aliquam Curabitur aliquam euismod dolor non ornare Pellentesque vitae velit ex Morbi tempus commodo mattis Mauris dapibus risus quis suscipit vulputate Urna nisl sollicitudin id varius orci quam id turpis Nulla porta lobortis ligula vel egestas', 'john_user@symfony.com', '2016-10-24 12:26:01'),
(48, 10, 'Mauris dapibus risus quis suscipit vulputate Curabitur aliquam euismod dolor non ornare Eros diam egestas libero eu vulputate risus Pellentesque vitae velit ex', 'john_user@symfony.com', '2016-10-24 12:26:02'),
(49, 10, 'Pellentesque et sapien pulvinar consectetur Ut suscipit posuere justo at vulputate In hac habitasse platea dictumst Curabitur aliquam euismod dolor non ornare Eros diam egestas libero eu vulputate risus Aliquam sodales odio id eleifend tristique Nunc viverra elit ac laoreet suscipit Pellentesque vitae velit ex Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi tempus commodo mattis', 'john_user@symfony.com', '2016-10-24 12:26:03'),
(50, 10, 'Morbi tempus commodo mattis Sed varius a risus eget aliquam Lorem ipsum dolor sit amet consectetur adipiscing elit Nulla porta lobortis ligula vel egestas Aliquam sodales odio id eleifend tristique Pellentesque vitae velit ex', 'john_user@symfony.com', '2016-10-24 12:26:04'),
(51, 11, 'Lorem ipsum dolor sit amet consectetur adipiscing elit Nulla porta lobortis ligula vel egestas Nunc viverra elit ac laoreet suscipit Ut suscipit posuere justo at vulputate Morbi tempus commodo mattis Ut eleifend mauris et risus ultrices egestas Mauris dapibus risus quis suscipit vulputate', 'john_user@symfony.com', '2016-10-24 12:26:01'),
(52, 11, 'Ut eleifend mauris et risus ultrices egestas In hac habitasse platea dictumst Pellentesque et sapien pulvinar consectetur', 'john_user@symfony.com', '2016-10-24 12:26:02'),
(53, 11, 'Aliquam sodales odio id eleifend tristique In hac habitasse platea dictumst Ut eleifend mauris et risus ultrices egestas', 'john_user@symfony.com', '2016-10-24 12:26:03'),
(54, 11, 'Eros diam egestas libero eu vulputate risus Ut suscipit posuere justo at vulputate Lorem ipsum dolor sit amet consectetur adipiscing elit In hac habitasse platea dictumst Nulla porta lobortis ligula vel egestas Morbi tempus commodo mattis', 'john_user@symfony.com', '2016-10-24 12:26:04'),
(55, 11, 'Eros diam egestas libero eu vulputate risus Aliquam sodales odio id eleifend tristique In hac habitasse platea dictumst Morbi tempus commodo mattis Ut eleifend mauris et risus ultrices egestas Lorem ipsum dolor sit amet consectetur adipiscing elit Urna nisl sollicitudin id varius orci quam id turpis Pellentesque vitae velit ex Sed varius a risus eget aliquam Nulla porta lobortis ligula vel egestas Curabitur aliquam euismod dolor non ornare Pellentesque et sapien pulvinar consectetur Ut suscipit posuere justo at vulputate Mauris dapibus risus quis suscipit vulputate', 'john_user@symfony.com', '2016-10-24 12:26:05'),
(56, 12, 'Urna nisl sollicitudin id varius orci quam id turpis Nulla porta lobortis ligula vel egestas Lorem ipsum dolor sit amet consectetur adipiscing elit Aliquam sodales odio id eleifend tristique Pellentesque et sapien pulvinar consectetur Morbi tempus commodo mattis Ut eleifend mauris et risus ultrices egestas', 'john_user@symfony.com', '2016-10-24 12:26:02'),
(57, 12, 'Curabitur aliquam euismod dolor non ornare Urna nisl sollicitudin id varius orci quam id turpis Lorem ipsum dolor sit amet consectetur adipiscing elit Pellentesque et sapien pulvinar consectetur Ut suscipit posuere justo at vulputate Morbi tempus commodo mattis Mauris dapibus risus quis suscipit vulputate Pellentesque vitae velit ex In hac habitasse platea dictumst Sed varius a risus eget aliquam Nulla porta lobortis ligula vel egestas', 'john_user@symfony.com', '2016-10-24 12:26:03'),
(58, 12, 'Mauris dapibus risus quis suscipit vulputate Nunc viverra elit ac laoreet suscipit Eros diam egestas libero eu vulputate risus Ut suscipit posuere justo at vulputate Morbi tempus commodo mattis Nulla porta lobortis ligula vel egestas Lorem ipsum dolor sit amet consectetur adipiscing elit', 'john_user@symfony.com', '2016-10-24 12:26:04'),
(59, 12, 'Mauris dapibus risus quis suscipit vulputate Pellentesque vitae velit ex Sed varius a risus eget aliquam', 'john_user@symfony.com', '2016-10-24 12:26:05'),
(60, 12, 'Curabitur aliquam euismod dolor non ornare Lorem ipsum dolor sit amet consectetur adipiscing elit Sed varius a risus eget aliquam Morbi tempus commodo mattis Urna nisl sollicitudin id varius orci quam id turpis Pellentesque vitae velit ex Pellentesque et sapien pulvinar consectetur Eros diam egestas libero eu vulputate risus Nulla porta lobortis ligula vel egestas Nunc viverra elit ac laoreet suscipit', 'john_user@symfony.com', '2016-10-24 12:26:06'),
(61, 13, 'Eros diam egestas libero eu vulputate risus Sed varius a risus eget aliquam Lorem ipsum dolor sit amet consectetur adipiscing elit', 'john_user@symfony.com', '2016-10-24 12:26:03'),
(62, 13, 'Mauris dapibus risus quis suscipit vulputate', 'john_user@symfony.com', '2016-10-24 12:26:04'),
(63, 13, 'Urna nisl sollicitudin id varius orci quam id turpis Pellentesque et sapien pulvinar consectetur Curabitur aliquam euismod dolor non ornare Pellentesque vitae velit ex Eros diam egestas libero eu vulputate risus Sed varius a risus eget aliquam Morbi tempus commodo mattis Nunc viverra elit ac laoreet suscipit In hac habitasse platea dictumst Mauris dapibus risus quis suscipit vulputate', 'john_user@symfony.com', '2016-10-24 12:26:05'),
(64, 13, 'Pellentesque vitae velit ex Nulla porta lobortis ligula vel egestas Ut suscipit posuere justo at vulputate Aliquam sodales odio id eleifend tristique Mauris dapibus risus quis suscipit vulputate Curabitur aliquam euismod dolor non ornare', 'john_user@symfony.com', '2016-10-24 12:26:06'),
(65, 13, 'Mauris dapibus risus quis suscipit vulputate In hac habitasse platea dictumst Urna nisl sollicitudin id varius orci quam id turpis Lorem ipsum dolor sit amet consectetur adipiscing elit Ut eleifend mauris et risus ultrices egestas Morbi tempus commodo mattis Curabitur aliquam euismod dolor non ornare Sed varius a risus eget aliquam Pellentesque et sapien pulvinar consectetur Pellentesque vitae velit ex Eros diam egestas libero eu vulputate risus Aliquam sodales odio id eleifend tristique Nunc viverra elit ac laoreet suscipit', 'john_user@symfony.com', '2016-10-24 12:26:07'),
(66, 14, 'Curabitur aliquam euismod dolor non ornare In hac habitasse platea dictumst Eros diam egestas libero eu vulputate risus Nulla porta lobortis ligula vel egestas Pellentesque vitae velit ex', 'john_user@symfony.com', '2016-10-24 12:26:04'),
(67, 14, 'Pellentesque vitae velit ex In hac habitasse platea dictumst Eros diam egestas libero eu vulputate risus Ut suscipit posuere justo at vulputate Nulla porta lobortis ligula vel egestas Aliquam sodales odio id eleifend tristique Lorem ipsum dolor sit amet consectetur adipiscing elit Urna nisl sollicitudin id varius orci quam id turpis Morbi tempus commodo mattis Mauris dapibus risus quis suscipit vulputate', 'john_user@symfony.com', '2016-10-24 12:26:05'),
(68, 14, 'Pellentesque et sapien pulvinar consectetur Eros diam egestas libero eu vulputate risus Pellentesque vitae velit ex Nulla porta lobortis ligula vel egestas Sed varius a risus eget aliquam Curabitur aliquam euismod dolor non ornare In hac habitasse platea dictumst Morbi tempus commodo mattis Ut eleifend mauris et risus ultrices egestas Ut suscipit posuere justo at vulputate', 'john_user@symfony.com', '2016-10-24 12:26:06'),
(69, 14, 'Urna nisl sollicitudin id varius orci quam id turpis Morbi tempus commodo mattis Eros diam egestas libero eu vulputate risus Ut suscipit posuere justo at vulputate Mauris dapibus risus quis suscipit vulputate', 'john_user@symfony.com', '2016-10-24 12:26:07'),
(70, 14, 'Sed varius a risus eget aliquam Nunc viverra elit ac laoreet suscipit Eros diam egestas libero eu vulputate risus Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi tempus commodo mattis Urna nisl sollicitudin id varius orci quam id turpis Mauris dapibus risus quis suscipit vulputate Ut suscipit posuere justo at vulputate In hac habitasse platea dictumst Ut eleifend mauris et risus ultrices egestas Curabitur aliquam euismod dolor non ornare', 'john_user@symfony.com', '2016-10-24 12:26:08'),
(71, 15, 'In hac habitasse platea dictumst Sed varius a risus eget aliquam Eros diam egestas libero eu vulputate risus Pellentesque et sapien pulvinar consectetur Pellentesque vitae velit ex Curabitur aliquam euismod dolor non ornare Aliquam sodales odio id eleifend tristique Ut eleifend mauris et risus ultrices egestas Morbi tempus commodo mattis Nulla porta lobortis ligula vel egestas Nunc viverra elit ac laoreet suscipit Urna nisl sollicitudin id varius orci quam id turpis Ut suscipit posuere justo at vulputate', 'john_user@symfony.com', '2016-10-24 12:26:05'),
(72, 15, 'Ut eleifend mauris et risus ultrices egestas Curabitur aliquam euismod dolor non ornare In hac habitasse platea dictumst Nulla porta lobortis ligula vel egestas Pellentesque et sapien pulvinar consectetur Eros diam egestas libero eu vulputate risus Sed varius a risus eget aliquam Nunc viverra elit ac laoreet suscipit Aliquam sodales odio id eleifend tristique Lorem ipsum dolor sit amet consectetur adipiscing elit', 'john_user@symfony.com', '2016-10-24 12:26:06'),
(73, 15, 'Eros diam egestas libero eu vulputate risus Urna nisl sollicitudin id varius orci quam id turpis Ut suscipit posuere justo at vulputate Pellentesque vitae velit ex', 'john_user@symfony.com', '2016-10-24 12:26:07'),
(74, 15, 'Curabitur aliquam euismod dolor non ornare Sed varius a risus eget aliquam Ut suscipit posuere justo at vulputate Pellentesque et sapien pulvinar consectetur Morbi tempus commodo mattis Mauris dapibus risus quis suscipit vulputate Lorem ipsum dolor sit amet consectetur adipiscing elit Nulla porta lobortis ligula vel egestas Eros diam egestas libero eu vulputate risus Pellentesque vitae velit ex In hac habitasse platea dictumst', 'john_user@symfony.com', '2016-10-24 12:26:08'),
(75, 15, 'Nulla porta lobortis ligula vel egestas Nunc viverra elit ac laoreet suscipit Mauris dapibus risus quis suscipit vulputate Aliquam sodales odio id eleifend tristique Curabitur aliquam euismod dolor non ornare', 'john_user@symfony.com', '2016-10-24 12:26:09'),
(76, 16, 'Pellentesque et sapien pulvinar consectetur Morbi tempus commodo mattis Pellentesque vitae velit ex Lorem ipsum dolor sit amet consectetur adipiscing elit Urna nisl sollicitudin id varius orci quam id turpis Ut suscipit posuere justo at vulputate Sed varius a risus eget aliquam In hac habitasse platea dictumst Ut eleifend mauris et risus ultrices egestas', 'john_user@symfony.com', '2016-10-24 12:26:06'),
(77, 16, 'Nulla porta lobortis ligula vel egestas Mauris dapibus risus quis suscipit vulputate In hac habitasse platea dictumst Pellentesque vitae velit ex Ut suscipit posuere justo at vulputate Pellentesque et sapien pulvinar consectetur Nunc viverra elit ac laoreet suscipit Urna nisl sollicitudin id varius orci quam id turpis Eros diam egestas libero eu vulputate risus Ut eleifend mauris et risus ultrices egestas', 'john_user@symfony.com', '2016-10-24 12:26:07'),
(78, 16, 'Curabitur aliquam euismod dolor non ornare In hac habitasse platea dictumst Lorem ipsum dolor sit amet consectetur adipiscing elit Pellentesque vitae velit ex Mauris dapibus risus quis suscipit vulputate Eros diam egestas libero eu vulputate risus Pellentesque et sapien pulvinar consectetur Ut eleifend mauris et risus ultrices egestas Nulla porta lobortis ligula vel egestas Morbi tempus commodo mattis Ut suscipit posuere justo at vulputate Aliquam sodales odio id eleifend tristique Urna nisl sollicitudin id varius orci quam id turpis Nunc viverra elit ac laoreet suscipit', 'john_user@symfony.com', '2016-10-24 12:26:08'),
(79, 16, 'Nunc viverra elit ac laoreet suscipit Curabitur aliquam euismod dolor non ornare In hac habitasse platea dictumst Pellentesque et sapien pulvinar consectetur Lorem ipsum dolor sit amet consectetur adipiscing elit Urna nisl sollicitudin id varius orci quam id turpis Aliquam sodales odio id eleifend tristique', 'john_user@symfony.com', '2016-10-24 12:26:09'),
(80, 16, 'Sed varius a risus eget aliquam Pellentesque et sapien pulvinar consectetur Curabitur aliquam euismod dolor non ornare Urna nisl sollicitudin id varius orci quam id turpis In hac habitasse platea dictumst Pellentesque vitae velit ex Aliquam sodales odio id eleifend tristique Ut eleifend mauris et risus ultrices egestas Nunc viverra elit ac laoreet suscipit', 'john_user@symfony.com', '2016-10-24 12:26:10'),
(81, 17, 'Nulla porta lobortis ligula vel egestas Nunc viverra elit ac laoreet suscipit Ut suscipit posuere justo at vulputate Pellentesque vitae velit ex Morbi tempus commodo mattis Aliquam sodales odio id eleifend tristique Sed varius a risus eget aliquam Mauris dapibus risus quis suscipit vulputate', 'john_user@symfony.com', '2016-10-24 12:26:07'),
(82, 17, 'In hac habitasse platea dictumst Nulla porta lobortis ligula vel egestas Mauris dapibus risus quis suscipit vulputate Pellentesque vitae velit ex Lorem ipsum dolor sit amet consectetur adipiscing elit Ut eleifend mauris et risus ultrices egestas Morbi tempus commodo mattis Eros diam egestas libero eu vulputate risus', 'john_user@symfony.com', '2016-10-24 12:26:08'),
(83, 17, 'Ut eleifend mauris et risus ultrices egestas Ut suscipit posuere justo at vulputate Nunc viverra elit ac laoreet suscipit In hac habitasse platea dictumst Lorem ipsum dolor sit amet consectetur adipiscing elit Curabitur aliquam euismod dolor non ornare Pellentesque vitae velit ex Pellentesque et sapien pulvinar consectetur Urna nisl sollicitudin id varius orci quam id turpis Sed varius a risus eget aliquam', 'john_user@symfony.com', '2016-10-24 12:26:09'),
(84, 17, 'Aliquam sodales odio id eleifend tristique Pellentesque vitae velit ex Nunc viverra elit ac laoreet suscipit Pellentesque et sapien pulvinar consectetur Morbi tempus commodo mattis Curabitur aliquam euismod dolor non ornare Nulla porta lobortis ligula vel egestas Lorem ipsum dolor sit amet consectetur adipiscing elit', 'john_user@symfony.com', '2016-10-24 12:26:10'),
(85, 17, 'Nunc viverra elit ac laoreet suscipit In hac habitasse platea dictumst Pellentesque et sapien pulvinar consectetur Morbi tempus commodo mattis Mauris dapibus risus quis suscipit vulputate Ut suscipit posuere justo at vulputate Lorem ipsum dolor sit amet consectetur adipiscing elit Ut eleifend mauris et risus ultrices egestas Urna nisl sollicitudin id varius orci quam id turpis Nulla porta lobortis ligula vel egestas Pellentesque vitae velit ex', 'john_user@symfony.com', '2016-10-24 12:26:11'),
(86, 18, 'Curabitur aliquam euismod dolor non ornare', 'john_user@symfony.com', '2016-10-24 12:26:08'),
(87, 18, 'Lorem ipsum dolor sit amet consectetur adipiscing elit', 'john_user@symfony.com', '2016-10-24 12:26:09'),
(88, 18, 'Pellentesque et sapien pulvinar consectetur Ut suscipit posuere justo at vulputate Eros diam egestas libero eu vulputate risus In hac habitasse platea dictumst Mauris dapibus risus quis suscipit vulputate', 'john_user@symfony.com', '2016-10-24 12:26:10'),
(89, 18, 'Urna nisl sollicitudin id varius orci quam id turpis Curabitur aliquam euismod dolor non ornare Ut eleifend mauris et risus ultrices egestas Ut suscipit posuere justo at vulputate Pellentesque et sapien pulvinar consectetur Morbi tempus commodo mattis Lorem ipsum dolor sit amet consectetur adipiscing elit Sed varius a risus eget aliquam', 'john_user@symfony.com', '2016-10-24 12:26:11'),
(90, 18, 'Sed varius a risus eget aliquam Pellentesque et sapien pulvinar consectetur Ut eleifend mauris et risus ultrices egestas Aliquam sodales odio id eleifend tristique Lorem ipsum dolor sit amet consectetur adipiscing elit Eros diam egestas libero eu vulputate risus Pellentesque vitae velit ex Urna nisl sollicitudin id varius orci quam id turpis In hac habitasse platea dictumst Mauris dapibus risus quis suscipit vulputate', 'john_user@symfony.com', '2016-10-24 12:26:12'),
(91, 19, 'In hac habitasse platea dictumst Lorem ipsum dolor sit amet consectetur adipiscing elit Pellentesque et sapien pulvinar consectetur Aliquam sodales odio id eleifend tristique Pellentesque vitae velit ex Mauris dapibus risus quis suscipit vulputate Nulla porta lobortis ligula vel egestas Sed varius a risus eget aliquam Ut suscipit posuere justo at vulputate Urna nisl sollicitudin id varius orci quam id turpis', 'john_user@symfony.com', '2016-10-24 12:26:09'),
(92, 19, 'Ut eleifend mauris et risus ultrices egestas Urna nisl sollicitudin id varius orci quam id turpis Lorem ipsum dolor sit amet consectetur adipiscing elit Ut suscipit posuere justo at vulputate Nunc viverra elit ac laoreet suscipit', 'john_user@symfony.com', '2016-10-24 12:26:10'),
(93, 19, 'Mauris dapibus risus quis suscipit vulputate Ut eleifend mauris et risus ultrices egestas Urna nisl sollicitudin id varius orci quam id turpis Nulla porta lobortis ligula vel egestas Lorem ipsum dolor sit amet consectetur adipiscing elit Nunc viverra elit ac laoreet suscipit Pellentesque et sapien pulvinar consectetur Sed varius a risus eget aliquam Pellentesque vitae velit ex Curabitur aliquam euismod dolor non ornare Aliquam sodales odio id eleifend tristique Ut suscipit posuere justo at vulputate Eros diam egestas libero eu vulputate risus', 'john_user@symfony.com', '2016-10-24 12:26:11'),
(94, 19, 'Sed varius a risus eget aliquam Eros diam egestas libero eu vulputate risus Mauris dapibus risus quis suscipit vulputate Nunc viverra elit ac laoreet suscipit Ut eleifend mauris et risus ultrices egestas Ut suscipit posuere justo at vulputate Morbi tempus commodo mattis', 'john_user@symfony.com', '2016-10-24 12:26:12'),
(95, 19, 'Morbi tempus commodo mattis Aliquam sodales odio id eleifend tristique Pellentesque vitae velit ex Pellentesque et sapien pulvinar consectetur Nunc viverra elit ac laoreet suscipit Eros diam egestas libero eu vulputate risus', 'john_user@symfony.com', '2016-10-24 12:26:13'),
(96, 20, 'Nulla porta lobortis ligula vel egestas Curabitur aliquam euismod dolor non ornare Sed varius a risus eget aliquam Aliquam sodales odio id eleifend tristique Ut eleifend mauris et risus ultrices egestas Pellentesque et sapien pulvinar consectetur Mauris dapibus risus quis suscipit vulputate Nunc viverra elit ac laoreet suscipit', 'john_user@symfony.com', '2016-10-24 12:26:10'),
(97, 20, 'Aliquam sodales odio id eleifend tristique Pellentesque vitae velit ex Sed varius a risus eget aliquam Urna nisl sollicitudin id varius orci quam id turpis Morbi tempus commodo mattis Curabitur aliquam euismod dolor non ornare Lorem ipsum dolor sit amet consectetur adipiscing elit', 'john_user@symfony.com', '2016-10-24 12:26:11'),
(98, 20, 'Nunc viverra elit ac laoreet suscipit Ut suscipit posuere justo at vulputate Nulla porta lobortis ligula vel egestas Eros diam egestas libero eu vulputate risus In hac habitasse platea dictumst Urna nisl sollicitudin id varius orci quam id turpis Curabitur aliquam euismod dolor non ornare Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi tempus commodo mattis Sed varius a risus eget aliquam Aliquam sodales odio id eleifend tristique', 'john_user@symfony.com', '2016-10-24 12:26:12'),
(99, 20, 'Mauris dapibus risus quis suscipit vulputate Ut eleifend mauris et risus ultrices egestas Pellentesque et sapien pulvinar consectetur Nulla porta lobortis ligula vel egestas Pellentesque vitae velit ex Sed varius a risus eget aliquam Curabitur aliquam euismod dolor non ornare Eros diam egestas libero eu vulputate risus Lorem ipsum dolor sit amet consectetur adipiscing elit', 'john_user@symfony.com', '2016-10-24 12:26:13'),
(100, 20, 'Aliquam sodales odio id eleifend tristique Nulla porta lobortis ligula vel egestas In hac habitasse platea dictumst Urna nisl sollicitudin id varius orci quam id turpis Sed varius a risus eget aliquam Morbi tempus commodo mattis Ut suscipit posuere justo at vulputate Lorem ipsum dolor sit amet consectetur adipiscing elit Mauris dapibus risus quis suscipit vulputate Curabitur aliquam euismod dolor non ornare', 'john_user@symfony.com', '2016-10-24 12:26:14'),
(101, 21, 'Ut eleifend mauris et risus ultrices egestas Eros diam egestas libero eu vulputate risus Mauris dapibus risus quis suscipit vulputate Nunc viverra elit ac laoreet suscipit Aliquam sodales odio id eleifend tristique Sed varius a risus eget aliquam Curabitur aliquam euismod dolor non ornare Morbi tempus commodo mattis Pellentesque et sapien pulvinar consectetur Urna nisl sollicitudin id varius orci quam id turpis', 'john_user@symfony.com', '2016-10-24 12:26:11'),
(102, 21, 'Sed varius a risus eget aliquam', 'john_user@symfony.com', '2016-10-24 12:26:12'),
(103, 21, 'Morbi tempus commodo mattis', 'john_user@symfony.com', '2016-10-24 12:26:13'),
(104, 21, 'Eros diam egestas libero eu vulputate risus In hac habitasse platea dictumst Lorem ipsum dolor sit amet consectetur adipiscing elit Mauris dapibus risus quis suscipit vulputate Aliquam sodales odio id eleifend tristique Urna nisl sollicitudin id varius orci quam id turpis Ut suscipit posuere justo at vulputate Pellentesque vitae velit ex Pellentesque et sapien pulvinar consectetur', 'john_user@symfony.com', '2016-10-24 12:26:14'),
(105, 21, 'In hac habitasse platea dictumst Urna nisl sollicitudin id varius orci quam id turpis Aliquam sodales odio id eleifend tristique Curabitur aliquam euismod dolor non ornare Morbi tempus commodo mattis Ut suscipit posuere justo at vulputate Eros diam egestas libero eu vulputate risus', 'john_user@symfony.com', '2016-10-24 12:26:15'),
(106, 22, 'Ut suscipit posuere justo at vulputate Nunc viverra elit ac laoreet suscipit Urna nisl sollicitudin id varius orci quam id turpis Ut eleifend mauris et risus ultrices egestas Mauris dapibus risus quis suscipit vulputate Lorem ipsum dolor sit amet consectetur adipiscing elit Pellentesque et sapien pulvinar consectetur Curabitur aliquam euismod dolor non ornare Aliquam sodales odio id eleifend tristique In hac habitasse platea dictumst Pellentesque vitae velit ex Morbi tempus commodo mattis', 'john_user@symfony.com', '2016-10-24 12:26:12'),
(107, 22, 'Pellentesque et sapien pulvinar consectetur Morbi tempus commodo mattis In hac habitasse platea dictumst Lorem ipsum dolor sit amet consectetur adipiscing elit Ut eleifend mauris et risus ultrices egestas Sed varius a risus eget aliquam Ut suscipit posuere justo at vulputate', 'john_user@symfony.com', '2016-10-24 12:26:13'),
(108, 22, 'Ut eleifend mauris et risus ultrices egestas', 'john_user@symfony.com', '2016-10-24 12:26:14'),
(109, 22, 'Morbi tempus commodo mattis Aliquam sodales odio id eleifend tristique Eros diam egestas libero eu vulputate risus Curabitur aliquam euismod dolor non ornare Urna nisl sollicitudin id varius orci quam id turpis Pellentesque vitae velit ex In hac habitasse platea dictumst Sed varius a risus eget aliquam Nunc viverra elit ac laoreet suscipit Nulla porta lobortis ligula vel egestas Ut eleifend mauris et risus ultrices egestas', 'john_user@symfony.com', '2016-10-24 12:26:15'),
(110, 22, 'Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi tempus commodo mattis Curabitur aliquam euismod dolor non ornare Nunc viverra elit ac laoreet suscipit Ut eleifend mauris et risus ultrices egestas Pellentesque et sapien pulvinar consectetur In hac habitasse platea dictumst Nulla porta lobortis ligula vel egestas Urna nisl sollicitudin id varius orci quam id turpis Mauris dapibus risus quis suscipit vulputate', 'john_user@symfony.com', '2016-10-24 12:26:16'),
(111, 23, 'Aliquam sodales odio id eleifend tristique Pellentesque vitae velit ex Urna nisl sollicitudin id varius orci quam id turpis Eros diam egestas libero eu vulputate risus Morbi tempus commodo mattis', 'john_user@symfony.com', '2016-10-24 12:26:13'),
(112, 23, 'Ut eleifend mauris et risus ultrices egestas Pellentesque vitae velit ex Curabitur aliquam euismod dolor non ornare Mauris dapibus risus quis suscipit vulputate In hac habitasse platea dictumst', 'john_user@symfony.com', '2016-10-24 12:26:14'),
(113, 23, 'Pellentesque et sapien pulvinar consectetur Ut suscipit posuere justo at vulputate Eros diam egestas libero eu vulputate risus Curabitur aliquam euismod dolor non ornare Urna nisl sollicitudin id varius orci quam id turpis', 'john_user@symfony.com', '2016-10-24 12:26:15'),
(114, 23, 'Lorem ipsum dolor sit amet consectetur adipiscing elit', 'john_user@symfony.com', '2016-10-24 12:26:16'),
(115, 23, 'Eros diam egestas libero eu vulputate risus Aliquam sodales odio id eleifend tristique Mauris dapibus risus quis suscipit vulputate Pellentesque vitae velit ex Lorem ipsum dolor sit amet consectetur adipiscing elit', 'john_user@symfony.com', '2016-10-24 12:26:17'),
(116, 24, 'Morbi tempus commodo mattis Nulla porta lobortis ligula vel egestas', 'john_user@symfony.com', '2016-10-24 12:26:14'),
(117, 24, 'Curabitur aliquam euismod dolor non ornare Aliquam sodales odio id eleifend tristique Eros diam egestas libero eu vulputate risus Mauris dapibus risus quis suscipit vulputate Ut eleifend mauris et risus ultrices egestas Sed varius a risus eget aliquam Pellentesque et sapien pulvinar consectetur', 'john_user@symfony.com', '2016-10-24 12:26:15'),
(118, 24, 'Ut suscipit posuere justo at vulputate Sed varius a risus eget aliquam Pellentesque vitae velit ex Eros diam egestas libero eu vulputate risus Mauris dapibus risus quis suscipit vulputate Nulla porta lobortis ligula vel egestas', 'john_user@symfony.com', '2016-10-24 12:26:16'),
(119, 24, 'Aliquam sodales odio id eleifend tristique Pellentesque et sapien pulvinar consectetur Pellentesque vitae velit ex Mauris dapibus risus quis suscipit vulputate', 'john_user@symfony.com', '2016-10-24 12:26:17'),
(120, 24, 'Nulla porta lobortis ligula vel egestas Lorem ipsum dolor sit amet consectetur adipiscing elit Ut eleifend mauris et risus ultrices egestas Sed varius a risus eget aliquam Urna nisl sollicitudin id varius orci quam id turpis', 'john_user@symfony.com', '2016-10-24 12:26:18'),
(121, 25, 'Mauris dapibus risus quis suscipit vulputate Pellentesque et sapien pulvinar consectetur Ut eleifend mauris et risus ultrices egestas Urna nisl sollicitudin id varius orci quam id turpis Nulla porta lobortis ligula vel egestas Eros diam egestas libero eu vulputate risus In hac habitasse platea dictumst Pellentesque vitae velit ex Sed varius a risus eget aliquam Lorem ipsum dolor sit amet consectetur adipiscing elit Nunc viverra elit ac laoreet suscipit', 'john_user@symfony.com', '2016-10-24 12:26:15'),
(122, 25, 'In hac habitasse platea dictumst Morbi tempus commodo mattis Mauris dapibus risus quis suscipit vulputate Curabitur aliquam euismod dolor non ornare Ut eleifend mauris et risus ultrices egestas Nunc viverra elit ac laoreet suscipit Eros diam egestas libero eu vulputate risus Pellentesque vitae velit ex Urna nisl sollicitudin id varius orci quam id turpis Pellentesque et sapien pulvinar consectetur Nulla porta lobortis ligula vel egestas Sed varius a risus eget aliquam', 'john_user@symfony.com', '2016-10-24 12:26:16'),
(123, 25, 'Sed varius a risus eget aliquam Eros diam egestas libero eu vulputate risus Pellentesque et sapien pulvinar consectetur Nunc viverra elit ac laoreet suscipit Lorem ipsum dolor sit amet consectetur adipiscing elit Mauris dapibus risus quis suscipit vulputate Aliquam sodales odio id eleifend tristique Ut suscipit posuere justo at vulputate Urna nisl sollicitudin id varius orci quam id turpis Ut eleifend mauris et risus ultrices egestas Curabitur aliquam euismod dolor non ornare Pellentesque vitae velit ex In hac habitasse platea dictumst Nulla porta lobortis ligula vel egestas', 'john_user@symfony.com', '2016-10-24 12:26:17'),
(124, 25, 'Nulla porta lobortis ligula vel egestas', 'john_user@symfony.com', '2016-10-24 12:26:18'),
(125, 25, 'Sed varius a risus eget aliquam Lorem ipsum dolor sit amet consectetur adipiscing elit Mauris dapibus risus quis suscipit vulputate Urna nisl sollicitudin id varius orci quam id turpis Pellentesque vitae velit ex Nunc viverra elit ac laoreet suscipit', 'john_user@symfony.com', '2016-10-24 12:26:19'),
(126, 26, 'Morbi tempus commodo mattis Aliquam sodales odio id eleifend tristique Curabitur aliquam euismod dolor non ornare In hac habitasse platea dictumst Eros diam egestas libero eu vulputate risus Urna nisl sollicitudin id varius orci quam id turpis Nulla porta lobortis ligula vel egestas Mauris dapibus risus quis suscipit vulputate Sed varius a risus eget aliquam', 'john_user@symfony.com', '2016-10-24 12:26:16'),
(127, 26, 'Mauris dapibus risus quis suscipit vulputate', 'john_user@symfony.com', '2016-10-24 12:26:17'),
(128, 26, 'Eros diam egestas libero eu vulputate risus Nulla porta lobortis ligula vel egestas Nunc viverra elit ac laoreet suscipit Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi tempus commodo mattis Aliquam sodales odio id eleifend tristique Curabitur aliquam euismod dolor non ornare Ut eleifend mauris et risus ultrices egestas Sed varius a risus eget aliquam Mauris dapibus risus quis suscipit vulputate', 'john_user@symfony.com', '2016-10-24 12:26:18'),
(129, 26, 'Sed varius a risus eget aliquam Ut eleifend mauris et risus ultrices egestas Pellentesque vitae velit ex', 'john_user@symfony.com', '2016-10-24 12:26:19'),
(130, 26, 'Pellentesque vitae velit ex', 'john_user@symfony.com', '2016-10-24 12:26:20'),
(131, 27, 'Pellentesque et sapien pulvinar consectetur Nulla porta lobortis ligula vel egestas Curabitur aliquam euismod dolor non ornare Eros diam egestas libero eu vulputate risus Ut eleifend mauris et risus ultrices egestas Lorem ipsum dolor sit amet consectetur adipiscing elit Ut suscipit posuere justo at vulputate Sed varius a risus eget aliquam Mauris dapibus risus quis suscipit vulputate Aliquam sodales odio id eleifend tristique In hac habitasse platea dictumst Morbi tempus commodo mattis', 'john_user@symfony.com', '2016-10-24 12:26:17'),
(132, 27, 'Ut suscipit posuere justo at vulputate In hac habitasse platea dictumst', 'john_user@symfony.com', '2016-10-24 12:26:18'),
(133, 27, 'Morbi tempus commodo mattis Urna nisl sollicitudin id varius orci quam id turpis', 'john_user@symfony.com', '2016-10-24 12:26:19'),
(134, 27, 'Morbi tempus commodo mattis In hac habitasse platea dictumst Nunc viverra elit ac laoreet suscipit Eros diam egestas libero eu vulputate risus Sed varius a risus eget aliquam Pellentesque et sapien pulvinar consectetur Mauris dapibus risus quis suscipit vulputate Lorem ipsum dolor sit amet consectetur adipiscing elit Aliquam sodales odio id eleifend tristique Ut suscipit posuere justo at vulputate Nulla porta lobortis ligula vel egestas Pellentesque vitae velit ex', 'john_user@symfony.com', '2016-10-24 12:26:20'),
(135, 27, 'Eros diam egestas libero eu vulputate risus Nulla porta lobortis ligula vel egestas Curabitur aliquam euismod dolor non ornare Nunc viverra elit ac laoreet suscipit Aliquam sodales odio id eleifend tristique Urna nisl sollicitudin id varius orci quam id turpis', 'john_user@symfony.com', '2016-10-24 12:26:21'),
(136, 28, 'Curabitur aliquam euismod dolor non ornare Nunc viverra elit ac laoreet suscipit Mauris dapibus risus quis suscipit vulputate Pellentesque et sapien pulvinar consectetur Ut eleifend mauris et risus ultrices egestas Urna nisl sollicitudin id varius orci quam id turpis Sed varius a risus eget aliquam In hac habitasse platea dictumst Morbi tempus commodo mattis Pellentesque vitae velit ex Lorem ipsum dolor sit amet consectetur adipiscing elit', 'john_user@symfony.com', '2016-10-24 12:26:18');
INSERT INTO `comment` (`id`, `post_id`, `content`, `authorEmail`, `publishedAt`) VALUES
(137, 28, 'Ut eleifend mauris et risus ultrices egestas Morbi tempus commodo mattis Pellentesque vitae velit ex Mauris dapibus risus quis suscipit vulputate In hac habitasse platea dictumst Nunc viverra elit ac laoreet suscipit', 'john_user@symfony.com', '2016-10-24 12:26:19'),
(138, 28, 'In hac habitasse platea dictumst Sed varius a risus eget aliquam Aliquam sodales odio id eleifend tristique Ut suscipit posuere justo at vulputate Nulla porta lobortis ligula vel egestas Pellentesque vitae velit ex Pellentesque et sapien pulvinar consectetur Ut eleifend mauris et risus ultrices egestas', 'john_user@symfony.com', '2016-10-24 12:26:20'),
(139, 28, 'Ut eleifend mauris et risus ultrices egestas Nunc viverra elit ac laoreet suscipit Pellentesque vitae velit ex Eros diam egestas libero eu vulputate risus Urna nisl sollicitudin id varius orci quam id turpis Mauris dapibus risus quis suscipit vulputate Pellentesque et sapien pulvinar consectetur Morbi tempus commodo mattis Curabitur aliquam euismod dolor non ornare Aliquam sodales odio id eleifend tristique Nulla porta lobortis ligula vel egestas Sed varius a risus eget aliquam', 'john_user@symfony.com', '2016-10-24 12:26:21'),
(140, 28, 'Curabitur aliquam euismod dolor non ornare Sed varius a risus eget aliquam Eros diam egestas libero eu vulputate risus Pellentesque vitae velit ex Morbi tempus commodo mattis Nunc viverra elit ac laoreet suscipit Urna nisl sollicitudin id varius orci quam id turpis Mauris dapibus risus quis suscipit vulputate Nulla porta lobortis ligula vel egestas Ut suscipit posuere justo at vulputate', 'john_user@symfony.com', '2016-10-24 12:26:22'),
(141, 29, 'Pellentesque et sapien pulvinar consectetur Urna nisl sollicitudin id varius orci quam id turpis Aliquam sodales odio id eleifend tristique Mauris dapibus risus quis suscipit vulputate Curabitur aliquam euismod dolor non ornare', 'john_user@symfony.com', '2016-10-24 12:26:19'),
(142, 29, 'Nunc viverra elit ac laoreet suscipit Pellentesque vitae velit ex Sed varius a risus eget aliquam Curabitur aliquam euismod dolor non ornare Nulla porta lobortis ligula vel egestas In hac habitasse platea dictumst Ut eleifend mauris et risus ultrices egestas', 'john_user@symfony.com', '2016-10-24 12:26:20'),
(143, 29, 'Ut eleifend mauris et risus ultrices egestas Nulla porta lobortis ligula vel egestas Mauris dapibus risus quis suscipit vulputate Sed varius a risus eget aliquam Morbi tempus commodo mattis Curabitur aliquam euismod dolor non ornare Ut suscipit posuere justo at vulputate In hac habitasse platea dictumst Urna nisl sollicitudin id varius orci quam id turpis Pellentesque et sapien pulvinar consectetur Nunc viverra elit ac laoreet suscipit', 'john_user@symfony.com', '2016-10-24 12:26:21'),
(144, 29, 'Curabitur aliquam euismod dolor non ornare Pellentesque et sapien pulvinar consectetur Eros diam egestas libero eu vulputate risus Pellentesque vitae velit ex Nunc viverra elit ac laoreet suscipit Nulla porta lobortis ligula vel egestas Sed varius a risus eget aliquam', 'john_user@symfony.com', '2016-10-24 12:26:22'),
(145, 29, 'Lorem ipsum dolor sit amet consectetur adipiscing elit Pellentesque vitae velit ex Eros diam egestas libero eu vulputate risus Sed varius a risus eget aliquam Mauris dapibus risus quis suscipit vulputate Pellentesque et sapien pulvinar consectetur In hac habitasse platea dictumst Nunc viverra elit ac laoreet suscipit', 'john_user@symfony.com', '2016-10-24 12:26:23'),
(146, 30, 'Morbi tempus commodo mattis Curabitur aliquam euismod dolor non ornare Eros diam egestas libero eu vulputate risus', 'john_user@symfony.com', '2016-10-24 12:26:20'),
(147, 30, 'Curabitur aliquam euismod dolor non ornare Pellentesque et sapien pulvinar consectetur Morbi tempus commodo mattis Aliquam sodales odio id eleifend tristique', 'john_user@symfony.com', '2016-10-24 12:26:21'),
(148, 30, 'Curabitur aliquam euismod dolor non ornare', 'john_user@symfony.com', '2016-10-24 12:26:22'),
(149, 30, 'Pellentesque et sapien pulvinar consectetur Eros diam egestas libero eu vulputate risus Sed varius a risus eget aliquam Ut suscipit posuere justo at vulputate Nunc viverra elit ac laoreet suscipit Pellentesque vitae velit ex Ut eleifend mauris et risus ultrices egestas', 'john_user@symfony.com', '2016-10-24 12:26:23'),
(150, 30, 'Lorem ipsum dolor sit amet consectetur adipiscing elit In hac habitasse platea dictumst Pellentesque vitae velit ex Nunc viverra elit ac laoreet suscipit Mauris dapibus risus quis suscipit vulputate Morbi tempus commodo mattis Sed varius a risus eget aliquam Urna nisl sollicitudin id varius orci quam id turpis Aliquam sodales odio id eleifend tristique', 'john_user@symfony.com', '2016-10-24 12:26:24');

-- --------------------------------------------------------

--
-- Table structure for table `concept`
--

CREATE TABLE `concept` (
  `id` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `updator_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `conceptStatus_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `concept`
--

INSERT INTO `concept` (`id`, `creator_id`, `updator_id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`, `conceptStatus_id`) VALUES
(1, 2, 1, 'Name Concept 1', 'Description concept 1 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2016-10-26 18:29:49', '2016-10-28 14:02:53', NULL, 1),
(2, 1, 1, 'Name Concept 2', 'Description concept 2 ... Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2016-10-26 18:47:19', '2016-10-27 16:19:18', '2016-10-26 18:47:28', 1),
(3, 1, 1, 'Name Concept 3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2016-10-27 16:54:47', '2016-10-27 16:55:59', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `concept_media`
--

CREATE TABLE `concept_media` (
  `id` int(11) NOT NULL,
  `concept_id` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `updator_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `comment` longtext COLLATE utf8_unicode_ci,
  `media_path` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `conceptMediaType_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `concept_media`
--

INSERT INTO `concept_media` (`id`, `concept_id`, `creator_id`, `updator_id`, `name`, `description`, `comment`, `media_path`, `created_at`, `updated_at`, `deleted_at`, `conceptMediaType_id`) VALUES
(1, 1, 1, 1, 'Concept  image name for Concept 1', 'Concept image description for Concept 1', 'Concept Media 1 for Concept 1', '....', '2016-10-27 12:09:58', '2016-10-27 16:14:08', NULL, 2),
(2, 1, 1, 1, 'Concept banner name for Concept 1', 'Concept banner description for Concept 1', 'banner', '/media/banner/banner-sample.jpg', '2016-10-27 15:18:32', '2016-10-27 17:23:30', NULL, 3),
(3, 2, 1, 1, 'Concept banner name for Concept 2', 'Concept description for Concept 2 Lorem ipsum dolor sit amet, consectetur adipiscing elit, ...', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '/media/banner/banner-sample-2.png', '2016-10-27 16:45:04', '2016-10-27 17:10:19', NULL, 3),
(4, 3, 1, 1, 'Concept banner name for Concept 3', 'Concept banner description for Concept 3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '/media/banner/banner-sample-3.jpg', '2016-10-27 16:57:17', '2016-10-27 17:24:20', NULL, 3),
(5, 1, 1, 1, 'Concept  video name for Concept 1', 'Concept  video name for Concept 1', 'Concept  video name for Concept 1', 'https://www.youtube.com/embed/cqNmVJk7Zyg', '2016-10-28 17:01:26', '2016-10-28 17:11:15', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `concept_media_type`
--

CREATE TABLE `concept_media_type` (
  `id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `concept_media_type`
--

INSERT INTO `concept_media_type` (`id`, `label`) VALUES
(3, 'banner'),
(2, 'image'),
(1, 'video');

-- --------------------------------------------------------

--
-- Table structure for table `concept_product`
--

CREATE TABLE `concept_product` (
  `id` int(11) NOT NULL,
  `concept_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `updator_id` int(11) DEFAULT NULL,
  `is_mandatory` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `concept_product`
--

INSERT INTO `concept_product` (`id`, `concept_id`, `product_id`, `creator_id`, `updator_id`, `is_mandatory`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 4, 1, 1, 1, '2016-10-28 13:36:50', NULL, NULL),
(2, 1, 2, 1, 1, 0, '2016-10-28 13:42:32', NULL, NULL),
(3, 1, 1, 3, 1, 1, '2016-10-28 13:44:43', '2016-10-28 13:44:57', '2016-10-28 13:45:04'),
(4, 1, 1, 1, 1, 0, '2016-10-28 14:41:11', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `concept_status`
--

CREATE TABLE `concept_status` (
  `id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `concept_status`
--

INSERT INTO `concept_status` (`id`, `label`) VALUES
(1, 'Active'),
(2, 'Inactive');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `iso_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `label`, `iso_code`) VALUES
(1, 'France', 'FR');

-- --------------------------------------------------------

--
-- Table structure for table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migration_versions`
--

INSERT INTO `migration_versions` (`version`) VALUES
('20161025123907'),
('20161025130119'),
('20161025155035'),
('20161025165542'),
('20161026110715'),
('20161026112005'),
('20161026113205'),
('20161026114606'),
('20161026115457'),
('20161026120916');

-- --------------------------------------------------------

--
-- Table structure for table `note`
--

CREATE TABLE `note` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `updator_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `note_comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `note`
--

INSERT INTO `note` (`id`, `order_id`, `creator_id`, `updator_id`, `name`, `note_comment`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 2, 2, 'note for order 1', 'lqkdnfklsdnlqdknldqkfnglqksdngflqksdnglskdnglskdng', '2016-10-25 14:47:27', '2016-10-25 15:01:38', NULL),
(2, 1, 2, 2, 'note 2 for order 1', 'qlsdlqks,dlkqsn,dlkqsndlkqnsdlkqnsdlkqndlkqndlkqnsdlqksndlqkndlqksnd', '2016-10-25 14:52:35', '2016-10-25 15:00:42', '2016-10-25 15:07:11'),
(3, 1, 1, 2, 'note 3 for order 1', 'fdffffffffffffffffffffffffffffffffffffffff ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff', '2016-10-25 15:11:56', '2016-10-25 15:30:35', NULL),
(4, 1, 2, 1, 'note 4 for order 1', 'dsqdsqdqsd', '2016-10-25 16:46:41', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `products_total_price` double NOT NULL,
  `delivery_price_ht` double NOT NULL,
  `discount_price_ht` double NOT NULL,
  `final_price_ht` double NOT NULL,
  `final_price_ttc` double NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `validated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `orderType_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `currentOrderStatus_id` int(11) DEFAULT NULL,
  `creator_id` int(11) NOT NULL,
  `updator_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `products_total_price`, `delivery_price_ht`, `discount_price_ht`, `final_price_ht`, `final_price_ttc`, `created_at`, `updated_at`, `validated_at`, `deleted_at`, `orderType_id`, `client_id`, `currentOrderStatus_id`, `creator_id`, `updator_id`) VALUES
(1, 20, 10, 5, 25, 25, '2016-10-25 00:00:00', NULL, NULL, NULL, 1, 1, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_line`
--

CREATE TABLE `order_line` (
  `id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price_per_unit_ht` double NOT NULL,
  `price_per_unit_ttc` double NOT NULL,
  `price_ht` double NOT NULL,
  `price_ttc` double NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `creator_id` int(11) NOT NULL,
  `updator_id` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_status_label`
--

CREATE TABLE `order_status_label` (
  `id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_status_label`
--

INSERT INTO `order_status_label` (`id`, `label`) VALUES
(5, 'cancelled'),
(1, 'draft'),
(2, 'in progress'),
(3, 'on hold'),
(4, 'validated');

-- --------------------------------------------------------

--
-- Table structure for table `order_type`
--

CREATE TABLE `order_type` (
  `id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_type`
--

INSERT INTO `order_type` (`id`, `label`) VALUES
(2, 'order'),
(1, 'quotation');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `summary` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `authorEmail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `publishedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `title`, `slug`, `summary`, `content`, `authorEmail`, `publishedAt`) VALUES
(1, 'Eros diam egestas libero eu vulputate risus', 'eros-diam-egestas-libero-eu-vulputate-risus', 'Pellentesque et sapien pulvinar consectetur Sed varius a risus eget aliquam Morbi tempus commodo mattis Ut suscipit posuere justo at vulputate Aliquam sodales odio id eleifend tristique Curabitur aliquam euismod dolor non ornare Pellentesque vitae velit e', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', 'anna_admin@symfony.com', '2016-10-23 12:25:49'),
(2, 'Pellentesque et sapien pulvinar consectetur', 'pellentesque-et-sapien-pulvinar-consectetur', 'Nunc viverra elit ac laoreet suscipit Ut suscipit posuere justo at vulputate Aliquam sodales odio id eleifend tristique Pellentesque vitae velit ex Sed varius a risus eget aliquam Morbi tempus commodo mattis Pellentesque et sapien pulvinar consectetur', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', 'anna_admin@symfony.com', '2016-10-22 12:25:49'),
(3, 'Eros diam egestas libero eu vulputate risus', 'eros-diam-egestas-libero-eu-vulputate-risus', 'Eros diam egestas libero eu vulputate risus Nulla porta lobortis ligula vel egestas Sed varius a risus eget aliquam Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi tempus commodo mattis Urna nisl sollicitudin id varius orci quam id turpis', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', 'anna_admin@symfony.com', '2016-10-21 12:25:49'),
(4, 'Urna nisl sollicitudin id varius orci quam id turpis', 'urna-nisl-sollicitudin-id-varius-orci-quam-id-turpis', 'Pellentesque vitae velit ex Mauris dapibus risus quis suscipit vulputate Curabitur aliquam euismod dolor non ornare Lorem ipsum dolor sit amet consectetur adipiscing elit Ut suscipit posuere justo at vulputate Aliquam sodales odio id eleifend tristique Se', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', 'anna_admin@symfony.com', '2016-10-20 12:25:49'),
(5, 'Aliquam sodales odio id eleifend tristique', 'aliquam-sodales-odio-id-eleifend-tristique', 'Urna nisl sollicitudin id varius orci quam id turpis Mauris dapibus risus quis suscipit vulputate Nunc viverra elit ac laoreet suscipit Ut suscipit posuere justo at vulputate In hac habitasse platea dictumst', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', 'anna_admin@symfony.com', '2016-10-19 12:25:49'),
(6, 'Lorem ipsum dolor sit amet consectetur adipiscing elit', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit', 'Mauris dapibus risus quis suscipit vulputate Nunc viverra elit ac laoreet suscipit Aliquam sodales odio id eleifend tristique Lorem ipsum dolor sit amet consectetur adipiscing elit Urna nisl sollicitudin id varius orci quam id turpis Pellentesque vitae ve', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', 'anna_admin@symfony.com', '2016-10-18 12:25:49'),
(7, 'Sed varius a risus eget aliquam', 'sed-varius-a-risus-eget-aliquam', 'Ut suscipit posuere justo at vulputate In hac habitasse platea dictumst Sed varius a risus eget aliquam Ut eleifend mauris et risus ultrices egestas Nunc viverra elit ac laoreet suscipit Morbi tempus commodo mattis Lorem ipsum dolor sit amet consectetur a', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', 'anna_admin@symfony.com', '2016-10-17 12:25:49'),
(8, 'Lorem ipsum dolor sit amet consectetur adipiscing elit', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit', 'Lorem ipsum dolor sit amet consectetur adipiscing elit Sed varius a risus eget aliquam Nunc viverra elit ac laoreet suscipit Mauris dapibus risus quis suscipit vulputate Aliquam sodales odio id eleifend tristique Nulla porta lobortis ligula vel egestas Ut', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', 'anna_admin@symfony.com', '2016-10-16 12:25:49'),
(9, 'Pellentesque et sapien pulvinar consectetur', 'pellentesque-et-sapien-pulvinar-consectetur', 'Pellentesque et sapien pulvinar consectetur Curabitur aliquam euismod dolor non ornare Lorem ipsum dolor sit amet consectetur adipiscing elit Urna nisl sollicitudin id varius orci quam id turpis Morbi tempus commodo mattis Nulla porta lobortis ligula vel ', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', 'anna_admin@symfony.com', '2016-10-15 12:25:49'),
(10, 'Curabitur aliquam euismod dolor non ornare', 'curabitur-aliquam-euismod-dolor-non-ornare', 'Pellentesque et sapien pulvinar consectetur In hac habitasse platea dictumst Nunc viverra elit ac laoreet suscipit Ut eleifend mauris et risus ultrices egestas Morbi tempus commodo mattis Ut suscipit posuere justo at vulputate', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', 'anna_admin@symfony.com', '2016-10-14 12:25:49'),
(11, 'In hac habitasse platea dictumst', 'in-hac-habitasse-platea-dictumst', 'Mauris dapibus risus quis suscipit vulputate Curabitur aliquam euismod dolor non ornare Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi tempus commodo mattis In hac habitasse platea dictumst Ut eleifend mauris et risus ultrices egestas Nunc v', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', 'anna_admin@symfony.com', '2016-10-13 12:25:49'),
(12, 'Ut eleifend mauris et risus ultrices egestas', 'ut-eleifend-mauris-et-risus-ultrices-egestas', 'Ut suscipit posuere justo at vulputate Ut eleifend mauris et risus ultrices egestas Curabitur aliquam euismod dolor non ornare Aliquam sodales odio id eleifend tristique Urna nisl sollicitudin id varius orci quam id turpis Nulla porta lobortis ligula vel ', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', 'anna_admin@symfony.com', '2016-10-12 12:25:49'),
(13, 'Nunc viverra elit ac laoreet suscipit', 'nunc-viverra-elit-ac-laoreet-suscipit', 'In hac habitasse platea dictumst Sed varius a risus eget aliquam Pellentesque vitae velit ex Nulla porta lobortis ligula vel egestas Mauris dapibus risus quis suscipit vulputate Aliquam sodales odio id eleifend tristique', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', 'anna_admin@symfony.com', '2016-10-11 12:25:49'),
(14, 'Sed varius a risus eget aliquam', 'sed-varius-a-risus-eget-aliquam', 'Urna nisl sollicitudin id varius orci quam id turpis Pellentesque et sapien pulvinar consectetur Nulla porta lobortis ligula vel egestas Nunc viverra elit ac laoreet suscipit Eros diam egestas libero eu vulputate risus Ut eleifend mauris et risus ultrices', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', 'anna_admin@symfony.com', '2016-10-10 12:25:49'),
(15, 'Lorem ipsum dolor sit amet consectetur adipiscing elit', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit', 'Curabitur aliquam euismod dolor non ornare Nulla porta lobortis ligula vel egestas Lorem ipsum dolor sit amet consectetur adipiscing elit Pellentesque vitae velit ex Eros diam egestas libero eu vulputate risus Nunc viverra elit ac laoreet suscipit', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', 'anna_admin@symfony.com', '2016-10-09 12:25:49'),
(16, 'Eros diam egestas libero eu vulputate risus', 'eros-diam-egestas-libero-eu-vulputate-risus', 'Ut suscipit posuere justo at vulputate In hac habitasse platea dictumst Mauris dapibus risus quis suscipit vulputate Ut eleifend mauris et risus ultrices egestas Sed varius a risus eget aliquam', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', 'anna_admin@symfony.com', '2016-10-08 12:25:49'),
(17, 'Pellentesque et sapien pulvinar consectetur', 'pellentesque-et-sapien-pulvinar-consectetur', 'Pellentesque vitae velit ex Ut eleifend mauris et risus ultrices egestas Urna nisl sollicitudin id varius orci quam id turpis Eros diam egestas libero eu vulputate risus Nulla porta lobortis ligula vel egestas Curabitur aliquam euismod dolor non ornare Al', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', 'anna_admin@symfony.com', '2016-10-07 12:25:49'),
(18, 'Eros diam egestas libero eu vulputate risus', 'eros-diam-egestas-libero-eu-vulputate-risus', 'Sed varius a risus eget aliquam Ut eleifend mauris et risus ultrices egestas Pellentesque vitae velit ex Morbi tempus commodo mattis Pellentesque et sapien pulvinar consectetur Nulla porta lobortis ligula vel egestas Mauris dapibus risus quis suscipit vul', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', 'anna_admin@symfony.com', '2016-10-06 12:25:49'),
(19, 'Ut suscipit posuere justo at vulputate', 'ut-suscipit-posuere-justo-at-vulputate', 'Aliquam sodales odio id eleifend tristique Ut suscipit posuere justo at vulputate Lorem ipsum dolor sit amet consectetur adipiscing elit Urna nisl sollicitudin id varius orci quam id turpis Pellentesque et sapien pulvinar consectetur Mauris dapibus risus ', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', 'anna_admin@symfony.com', '2016-10-05 12:25:49'),
(20, 'Ut eleifend mauris et risus ultrices egestas', 'ut-eleifend-mauris-et-risus-ultrices-egestas', 'Nunc viverra elit ac laoreet suscipit Nulla porta lobortis ligula vel egestas Lorem ipsum dolor sit amet consectetur adipiscing elit Aliquam sodales odio id eleifend tristique Eros diam egestas libero eu vulputate risus Pellentesque vitae velit ex Urna ni', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', 'anna_admin@symfony.com', '2016-10-04 12:25:49'),
(21, 'Urna nisl sollicitudin id varius orci quam id turpis', 'urna-nisl-sollicitudin-id-varius-orci-quam-id-turpis', 'Lorem ipsum dolor sit amet consectetur adipiscing elit Curabitur aliquam euismod dolor non ornare Aliquam sodales odio id eleifend tristique Ut eleifend mauris et risus ultrices egestas Mauris dapibus risus quis suscipit vulputate Pellentesque vitae velit', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', 'anna_admin@symfony.com', '2016-10-03 12:25:49');
INSERT INTO `post` (`id`, `title`, `slug`, `summary`, `content`, `authorEmail`, `publishedAt`) VALUES
(22, 'In hac habitasse platea dictumst', 'in-hac-habitasse-platea-dictumst', 'Ut suscipit posuere justo at vulputate Nulla porta lobortis ligula vel egestas In hac habitasse platea dictumst Curabitur aliquam euismod dolor non ornare Aliquam sodales odio id eleifend tristique Nunc viverra elit ac laoreet suscipit Ut eleifend mauris ', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', 'anna_admin@symfony.com', '2016-10-02 12:25:49'),
(23, 'Nulla porta lobortis ligula vel egestas', 'nulla-porta-lobortis-ligula-vel-egestas', 'Morbi tempus commodo mattis Lorem ipsum dolor sit amet consectetur adipiscing elit Pellentesque vitae velit ex Nunc viverra elit ac laoreet suscipit Ut suscipit posuere justo at vulputate Mauris dapibus risus quis suscipit vulputate', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', 'anna_admin@symfony.com', '2016-10-01 12:25:49'),
(24, 'Pellentesque vitae velit ex', 'pellentesque-vitae-velit-ex', 'Aliquam sodales odio id eleifend tristique Ut eleifend mauris et risus ultrices egestas Pellentesque vitae velit ex Curabitur aliquam euismod dolor non ornare Nulla porta lobortis ligula vel egestas Urna nisl sollicitudin id varius orci quam id turpis Ut ', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', 'anna_admin@symfony.com', '2016-09-30 12:25:49'),
(25, 'Mauris dapibus risus quis suscipit vulputate', 'mauris-dapibus-risus-quis-suscipit-vulputate', 'Curabitur aliquam euismod dolor non ornare Pellentesque et sapien pulvinar consectetur Mauris dapibus risus quis suscipit vulputate Morbi tempus commodo mattis Aliquam sodales odio id eleifend tristique', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', 'anna_admin@symfony.com', '2016-09-29 12:25:49'),
(26, 'Morbi tempus commodo mattis', 'morbi-tempus-commodo-mattis', 'Pellentesque vitae velit ex Mauris dapibus risus quis suscipit vulputate Nulla porta lobortis ligula vel egestas Nunc viverra elit ac laoreet suscipit In hac habitasse platea dictumst Eros diam egestas libero eu vulputate risus Urna nisl sollicitudin id v', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', 'anna_admin@symfony.com', '2016-09-28 12:25:49'),
(27, 'Ut eleifend mauris et risus ultrices egestas', 'ut-eleifend-mauris-et-risus-ultrices-egestas', 'Mauris dapibus risus quis suscipit vulputate Ut suscipit posuere justo at vulputate Pellentesque vitae velit ex Morbi tempus commodo mattis Lorem ipsum dolor sit amet consectetur adipiscing elit Nulla porta lobortis ligula vel egestas Sed varius a risus e', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', 'anna_admin@symfony.com', '2016-09-27 12:25:49'),
(28, 'Ut suscipit posuere justo at vulputate', 'ut-suscipit-posuere-justo-at-vulputate', 'Lorem ipsum dolor sit amet consectetur adipiscing elit Urna nisl sollicitudin id varius orci quam id turpis Ut suscipit posuere justo at vulputate Pellentesque vitae velit ex Aliquam sodales odio id eleifend tristique', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', 'anna_admin@symfony.com', '2016-09-26 12:25:49'),
(29, 'Nulla porta lobortis ligula vel egestas', 'nulla-porta-lobortis-ligula-vel-egestas', 'Pellentesque vitae velit ex In hac habitasse platea dictumst Urna nisl sollicitudin id varius orci quam id turpis Nulla porta lobortis ligula vel egestas Lorem ipsum dolor sit amet consectetur adipiscing elit Curabitur aliquam euismod dolor non ornare Ali', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', 'anna_admin@symfony.com', '2016-09-25 12:25:49'),
(30, 'Nunc viverra elit ac laoreet suscipit', 'nunc-viverra-elit-ac-laoreet-suscipit', 'Morbi tempus commodo mattis Ut eleifend mauris et risus ultrices egestas Lorem ipsum dolor sit amet consectetur adipiscing elit Eros diam egestas libero eu vulputate risus Nulla porta lobortis ligula vel egestas Ut suscipit posuere justo at vulputate Nunc', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', 'anna_admin@symfony.com', '2016-09-24 12:25:49');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `updator_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `long_description` longtext COLLATE utf8_unicode_ci,
  `sku` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price_per_unit_ht` double NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `productStatus_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `creator_id`, `updator_id`, `name`, `short_description`, `long_description`, `sku`, `supplier_reference`, `price_per_unit_ht`, `created_at`, `updated_at`, `deleted_at`, `productStatus_id`) VALUES
(1, 1, 1, 'fake product', 'This is a fake product', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '12345', '98745', 9.99, '2016-10-25 17:27:17', '2016-10-28 14:47:44', NULL, 2),
(2, 1, 1, 'fake product 2', 'This is a fake product', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '67891', '12345', 19.99, '2016-10-25 17:30:55', '2016-10-28 14:47:58', '2016-10-25 17:32:17', 1),
(4, 1, 1, 'fake product 3', 'This is a fake product', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '123456', '98745', 10, '2016-10-25 17:49:33', '2016-10-28 14:48:13', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_media`
--

CREATE TABLE `product_media` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `updator_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `comment` longtext COLLATE utf8_unicode_ci,
  `media_path` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `productMediaType_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_media`
--

INSERT INTO `product_media` (`id`, `product_id`, `creator_id`, `updator_id`, `name`, `description`, `comment`, `media_path`, `created_at`, `updated_at`, `deleted_at`, `productMediaType_id`) VALUES
(1, 1, 1, 1, 'Product Media name for product 1', 'Product Media name for product 1', 'Product Media name for product 1', '/media/img/img-sample.jpeg', '2016-10-28 15:33:46', '2016-10-28 15:44:16', NULL, 2),
(2, 4, 1, 1, 'Product Media name for product 3', 'Product Media name for product 3', 'Product Media name for product 3', '/media/img/img-sample-3.png', '2016-10-28 16:40:01', NULL, NULL, 2),
(3, 2, 1, 1, 'Product Media name for product 2', 'Product Media name for product 2', 'Product Media name for product 2', '/media/img/img-sample-2.png', '2016-10-28 16:41:07', NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `product_media_type`
--

CREATE TABLE `product_media_type` (
  `id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_media_type`
--

INSERT INTO `product_media_type` (`id`, `label`) VALUES
(2, 'image'),
(1, 'video');

-- --------------------------------------------------------

--
-- Table structure for table `product_status`
--

CREATE TABLE `product_status` (
  `id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_status`
--

INSERT INTO `product_status` (`id`, `label`) VALUES
(1, 'Active'),
(2, 'Inactive');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `updator_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `supplierStatus_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `creator_id`, `updator_id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`, `supplierStatus_id`) VALUES
(1, 1, 2, 'Supplier number 1', 'this is a fake supplier', '2016-10-25 17:10:39', NULL, NULL, 1),
(3, 2, 1, 'Supplier number 2', 'this is a fake supplier', '2016-10-25 17:14:29', NULL, '2016-10-25 17:14:37', 1);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_product`
--

CREATE TABLE `supplier_product` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_status`
--

CREATE TABLE `supplier_status` (
  `id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `supplier_status`
--

INSERT INTO `supplier_status` (`id`, `label`) VALUES
(1, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `roles`, `first_name`, `last_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'john_user', 'john_user@symfony.com', '$2y$13$Fl/6qNz1r.MGAKVlFqC.2ulLImEjvRhdFiPE5AzkRBZNy1.xKXexW', '[]', '', '', '1970-01-01 00:00:00', NULL, NULL),
(2, 'anna_admin', 'anna_admin@symfony.com', '$2y$13$XzP.W71A2Kl89cb4UdnV5OAiyH5bxtoPjbzc.66kuG/OTc3frX4Ya', '["ROLE_ADMIN"]', '', '', '1970-01-01 00:00:00', NULL, NULL),
(3, 'MOMO', 'moamben@gmail.com', '$2y$13$lrjY3sKrcmN18DN39W5k.e9I8cGgeJkwtn4HANb1xyR6CtmbiSXiW', '["ROLE_ADMIN"]', 'MO', 'BENA', '2016-10-26 16:11:19', NULL, NULL),
(4, 'Tao', 'taotao@tao.com', '$2y$13$YAvpuKIJyIdhDp5Zl5cCueX./amLRl2aAvA9cBM0YmvmsrOaV5aLC', '[]', 'Tao', 'Jin', '2016-10-26 17:25:19', NULL, NULL),
(5, 'Fake man', 'man@fake.com', '$2y$13$AgmwBuCcwMyMI7w5avSgKO9bGQdiMYTgtlXjc2073jjETfwOfQcUK', '["ROLE_FAKE"]', 'fake', 'man', '2016-10-26 18:52:48', '2016-10-26 18:53:22', '2016-10-26 18:52:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address_client`
--
ALTER TABLE `address_client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FC1D81EA19EB6921` (`client_id`),
  ADD KEY `IDX_FC1D81EA61220EA6` (`creator_id`),
  ADD KEY `IDX_FC1D81EAA9CED711` (`updator_id`),
  ADD KEY `IDX_FC1D81EAC89BD733` (`addressType_id`),
  ADD KEY `IDX_FC1D81EAF92F3E70` (`country_id`);

--
-- Indexes for table `address_type`
--
ALTER TABLE `address_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_F19287C2EA750E8` (`label`);

--
-- Indexes for table `address_user`
--
ALTER TABLE `address_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F0DF06A2A76ED395` (`user_id`),
  ADD KEY `IDX_F0DF06A261220EA6` (`creator_id`),
  ADD KEY `IDX_F0DF06A2A9CED711` (`updator_id`),
  ADD KEY `IDX_F0DF06A2C89BD733` (`addressType_id`),
  ADD KEY `IDX_F0DF06A2F92F3E70` (`country_id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C7440455AEA34913` (`reference`),
  ADD UNIQUE KEY `UNIQ_C7440455E7927C74` (`email`),
  ADD KEY `IDX_C7440455A664193F` (`clientType_id`),
  ADD KEY `IDX_C744045561220EA6` (`creator_id`),
  ADD KEY `IDX_C7440455A9CED711` (`updator_id`);

--
-- Indexes for table `client_type`
--
ALTER TABLE `client_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_5D42944BEA750E8` (`label`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9474526C4B89032C` (`post_id`);

--
-- Indexes for table `concept`
--
ALTER TABLE `concept`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_E74A60505E237E06` (`name`),
  ADD KEY `IDX_E74A6050A08562DE` (`conceptStatus_id`),
  ADD KEY `IDX_E74A605061220EA6` (`creator_id`),
  ADD KEY `IDX_E74A6050A9CED711` (`updator_id`);

--
-- Indexes for table `concept_media`
--
ALTER TABLE `concept_media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2DAC4C565E237E06` (`name`),
  ADD KEY `IDX_2DAC4C56F909284E` (`concept_id`),
  ADD KEY `IDX_2DAC4C56ECEAA4D5` (`conceptMediaType_id`),
  ADD KEY `IDX_2DAC4C5661220EA6` (`creator_id`),
  ADD KEY `IDX_2DAC4C56A9CED711` (`updator_id`);

--
-- Indexes for table `concept_media_type`
--
ALTER TABLE `concept_media_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_47220437EA750E8` (`label`);

--
-- Indexes for table `concept_product`
--
ALTER TABLE `concept_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_4DA56836F909284E` (`concept_id`),
  ADD KEY `IDX_4DA568364584665A` (`product_id`),
  ADD KEY `IDX_4DA5683661220EA6` (`creator_id`),
  ADD KEY `IDX_4DA56836A9CED711` (`updator_id`);

--
-- Indexes for table `concept_status`
--
ALTER TABLE `concept_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_F0F95D1BEA750E8` (`label`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_5373C966EA750E8` (`label`),
  ADD UNIQUE KEY `UNIQ_5373C96662B6A45E` (`iso_code`);

--
-- Indexes for table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_CFBDFA148D9F6D38` (`order_id`),
  ADD KEY `IDX_CFBDFA1461220EA6` (`creator_id`),
  ADD KEY `IDX_CFBDFA14A9CED711` (`updator_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E52FFDEE304D4259` (`orderType_id`),
  ADD KEY `IDX_E52FFDEE19EB6921` (`client_id`),
  ADD KEY `IDX_E52FFDEE55F4A7DB` (`currentOrderStatus_id`),
  ADD KEY `IDX_E52FFDEE61220EA6` (`creator_id`),
  ADD KEY `IDX_E52FFDEEA9CED711` (`updator_id`);

--
-- Indexes for table `order_line`
--
ALTER TABLE `order_line`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9CE58EE161220EA6` (`creator_id`),
  ADD KEY `IDX_9CE58EE1A9CED711` (`updator_id`),
  ADD KEY `IDX_9CE58EE18D9F6D38` (`order_id`),
  ADD KEY `IDX_9CE58EE14584665A` (`product_id`),
  ADD KEY `IDX_9CE58EE12ADD6D8C` (`supplier_id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B88F75C933B92F39` (`label_id`),
  ADD KEY `IDX_B88F75C98D9F6D38` (`order_id`);

--
-- Indexes for table `order_status_label`
--
ALTER TABLE `order_status_label`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_FD3D9572EA750E8` (`label`);

--
-- Indexes for table `order_type`
--
ALTER TABLE `order_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C12F6D3EEA750E8` (`label`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D34A04ADF9038C4` (`sku`),
  ADD KEY `IDX_D34A04ADC76ADE9` (`productStatus_id`),
  ADD KEY `IDX_D34A04AD61220EA6` (`creator_id`),
  ADD KEY `IDX_D34A04ADA9CED711` (`updator_id`);

--
-- Indexes for table `product_media`
--
ALTER TABLE `product_media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_CB70DA505E237E06` (`name`),
  ADD KEY `IDX_CB70DA50A5183F4B` (`productMediaType_id`),
  ADD KEY `IDX_CB70DA504584665A` (`product_id`),
  ADD KEY `IDX_CB70DA5061220EA6` (`creator_id`),
  ADD KEY `IDX_CB70DA50A9CED711` (`updator_id`);

--
-- Indexes for table `product_media_type`
--
ALTER TABLE `product_media_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_DCFED7D1EA750E8` (`label`);

--
-- Indexes for table `product_status`
--
ALTER TABLE `product_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_197C24B8EA750E8` (`label`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9B2A6C7E5E237E06` (`name`),
  ADD KEY `IDX_9B2A6C7E4A4FAFFF` (`supplierStatus_id`),
  ADD KEY `IDX_9B2A6C7E61220EA6` (`creator_id`),
  ADD KEY `IDX_9B2A6C7EA9CED711` (`updator_id`);

--
-- Indexes for table `supplier_product`
--
ALTER TABLE `supplier_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_522F70B22ADD6D8C` (`supplier_id`),
  ADD KEY `IDX_522F70B24584665A` (`product_id`);

--
-- Indexes for table `supplier_status`
--
ALTER TABLE `supplier_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_A062B7C8EA750E8` (`label`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address_client`
--
ALTER TABLE `address_client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `address_type`
--
ALTER TABLE `address_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `address_user`
--
ALTER TABLE `address_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `client_type`
--
ALTER TABLE `client_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;
--
-- AUTO_INCREMENT for table `concept`
--
ALTER TABLE `concept`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `concept_media`
--
ALTER TABLE `concept_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `concept_media_type`
--
ALTER TABLE `concept_media_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `concept_product`
--
ALTER TABLE `concept_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `concept_status`
--
ALTER TABLE `concept_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `note`
--
ALTER TABLE `note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `order_line`
--
ALTER TABLE `order_line`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_status_label`
--
ALTER TABLE `order_status_label`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `order_type`
--
ALTER TABLE `order_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `product_media`
--
ALTER TABLE `product_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `product_media_type`
--
ALTER TABLE `product_media_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `product_status`
--
ALTER TABLE `product_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `supplier_product`
--
ALTER TABLE `supplier_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `supplier_status`
--
ALTER TABLE `supplier_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `address_client`
--
ALTER TABLE `address_client`
  ADD CONSTRAINT `FK_FC1D81EA19EB6921` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `FK_FC1D81EA61220EA6` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_FC1D81EAA9CED711` FOREIGN KEY (`updator_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_FC1D81EAC89BD733` FOREIGN KEY (`addressType_id`) REFERENCES `address_type` (`id`),
  ADD CONSTRAINT `FK_FC1D81EAF92F3E70` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`);

--
-- Constraints for table `address_user`
--
ALTER TABLE `address_user`
  ADD CONSTRAINT `FK_F0DF06A261220EA6` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_F0DF06A2A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_F0DF06A2A9CED711` FOREIGN KEY (`updator_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_F0DF06A2C89BD733` FOREIGN KEY (`addressType_id`) REFERENCES `address_type` (`id`),
  ADD CONSTRAINT `FK_F0DF06A2F92F3E70` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`);

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `FK_C744045561220EA6` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_C7440455A664193F` FOREIGN KEY (`clientType_id`) REFERENCES `client_type` (`id`),
  ADD CONSTRAINT `FK_C7440455A9CED711` FOREIGN KEY (`updator_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526C4B89032C` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`);

--
-- Constraints for table `concept`
--
ALTER TABLE `concept`
  ADD CONSTRAINT `FK_E74A605061220EA6` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_E74A6050A08562DE` FOREIGN KEY (`conceptStatus_id`) REFERENCES `concept_status` (`id`),
  ADD CONSTRAINT `FK_E74A6050A9CED711` FOREIGN KEY (`updator_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `concept_media`
--
ALTER TABLE `concept_media`
  ADD CONSTRAINT `FK_2DAC4C5661220EA6` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_2DAC4C56A9CED711` FOREIGN KEY (`updator_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_2DAC4C56ECEAA4D5` FOREIGN KEY (`conceptMediaType_id`) REFERENCES `concept_media_type` (`id`),
  ADD CONSTRAINT `FK_2DAC4C56F909284E` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`id`);

--
-- Constraints for table `concept_product`
--
ALTER TABLE `concept_product`
  ADD CONSTRAINT `FK_4DA568364584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_4DA5683661220EA6` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_4DA56836A9CED711` FOREIGN KEY (`updator_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_4DA56836F909284E` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`id`);

--
-- Constraints for table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `FK_CFBDFA1461220EA6` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_CFBDFA148D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `FK_CFBDFA14A9CED711` FOREIGN KEY (`updator_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_E52FFDEE19EB6921` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `FK_E52FFDEE304D4259` FOREIGN KEY (`orderType_id`) REFERENCES `order_type` (`id`),
  ADD CONSTRAINT `FK_E52FFDEE55F4A7DB` FOREIGN KEY (`currentOrderStatus_id`) REFERENCES `order_status` (`id`),
  ADD CONSTRAINT `FK_E52FFDEE61220EA6` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_E52FFDEEA9CED711` FOREIGN KEY (`updator_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `order_line`
--
ALTER TABLE `order_line`
  ADD CONSTRAINT `FK_9CE58EE12ADD6D8C` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`),
  ADD CONSTRAINT `FK_9CE58EE14584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_9CE58EE161220EA6` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_9CE58EE18D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `FK_9CE58EE1A9CED711` FOREIGN KEY (`updator_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `order_status`
--
ALTER TABLE `order_status`
  ADD CONSTRAINT `FK_B88F75C933B92F39` FOREIGN KEY (`label_id`) REFERENCES `order_status_label` (`id`),
  ADD CONSTRAINT `FK_B88F75C98D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD61220EA6` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_D34A04ADA9CED711` FOREIGN KEY (`updator_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_D34A04ADC76ADE9` FOREIGN KEY (`productStatus_id`) REFERENCES `product_status` (`id`);

--
-- Constraints for table `product_media`
--
ALTER TABLE `product_media`
  ADD CONSTRAINT `FK_CB70DA504584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_CB70DA5061220EA6` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_CB70DA50A5183F4B` FOREIGN KEY (`productMediaType_id`) REFERENCES `product_media_type` (`id`),
  ADD CONSTRAINT `FK_CB70DA50A9CED711` FOREIGN KEY (`updator_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `FK_9B2A6C7E4A4FAFFF` FOREIGN KEY (`supplierStatus_id`) REFERENCES `supplier_status` (`id`),
  ADD CONSTRAINT `FK_9B2A6C7E61220EA6` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_9B2A6C7EA9CED711` FOREIGN KEY (`updator_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `supplier_product`
--
ALTER TABLE `supplier_product`
  ADD CONSTRAINT `FK_522F70B22ADD6D8C` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`),
  ADD CONSTRAINT `FK_522F70B24584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
