-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2017 at 03:44 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_car`
--
CREATE DATABASE IF NOT EXISTS `project_car` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `project_car`;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Surname` varchar(20) NOT NULL,
  `Mail` varchar(50) NOT NULL,
  `Mobile` varchar(20) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `Range` bigint(20) NOT NULL DEFAULT '10',
  `Image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `Name`, `Surname`, `Mail`, `Mobile`, `Password`, `Type_id`, `Range`, `Image`) VALUES
(4, 'Mattia', 'Pozzi', 'abc@def.it', '333333', '189bbbb0c5f1fb7fba9ad9285f193d1', 1, 10, 'C:/xampp/htdocs/easytravel/pcws/propics/0.jpeg'),
(5, 'Alessandro', 'Bertolotti', 'abc@def.com', '334338848', 'boh', 2, 10, ''),
(6, 'Andrea', 'Quadriglia', 'abc@def.bbb', '3311', '189bbbb00c5f1fb7fba9ad9285f193d1', NULL, 10, ''),
(8, 'Andrea', 'Ocera', 'abc@def.bbc', '3482467286', 'occy', NULL, 10, ''),
(12, 'Paolo', 'Bertolotti', 'pcbertolotti@gmail.com', '3355761144', '189bbbb00c5f1fb7fba9ad9285f193d1', NULL, 100, 'C:/xampp/htdocs/easytravel/pcws/propics/67.jpeg'),
(13, 'Giorgio', 'Bertolotti', 'giorgiobertol@gmail.com', '3290358217', '189bbbb00c5f1fb7fba9ad9285f193d1', NULL, 50, 'C:/xampp/htdocs/easytravel/pcws/propics/69.jpeg'),
(14, 'Ciao', 'Ciao', 'giongi@gio.com', '3408812553', 'e268724caade7065c48790389788a526', NULL, 10, 'C:/xampp/htdocs/easytravel/pcws/propics/42.jpeg'),
(16, 'Mattia', 'Pozzi', 'pozzi.mattia98@gmail.com', '3347581938', '18bd309054afe1ef98bff8422b5b9271', 2, 61, 'C:/xampp/htdocs/easytravel/pcws/propics/52.jpeg'),
(17, 'Giorgio', 'Prova', 'abc@gmajl.com', '633386891', 'e32ae4e0d9158c00684ec73ce7803ab1', NULL, 10, NULL),
(18, 'Davide', 'Turini', 'turotakun98@gmail.com', '3779981795', 'd2f6928fbf6463480d42ebbf5028e573', NULL, 10, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_contacts`
--

CREATE TABLE `user_contacts` (
  `Caller_id` bigint(20) UNSIGNED NOT NULL,
  `Receiver_id` bigint(20) UNSIGNED NOT NULL,
  `Datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Contact_Type` varchar(20) DEFAULT NULL,
  `Feedback` int(11) NOT NULL DEFAULT '0',
  `State` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_contacts`
--

INSERT INTO `user_contacts` (`Caller_id`, `Receiver_id`, `Datetime`, `Contact_Type`, `Feedback`, `State`) VALUES
(12, 4, '2017-06-06 20:02:35', NULL, 0, 0),
(12, 4, '2017-06-06 20:05:46', NULL, 0, 0),
(12, 8, '2017-06-06 18:56:37', NULL, 0, 0),
(12, 8, '2017-06-06 18:59:20', NULL, 0, 0),
(12, 8, '2017-06-06 20:04:47', NULL, 0, 0),
(12, 13, '2017-06-01 12:22:42', 'Call', 0, 4),
(12, 13, '2017-06-01 12:22:44', 'Call', 0, 4),
(12, 13, '2017-06-01 12:22:53', 'Call', 0, 4),
(12, 13, '2017-06-01 12:23:07', 'Call', 0, 4),
(12, 13, '2017-06-01 12:23:09', 'Call', 0, 4),
(12, 13, '2017-06-01 12:23:20', 'Call', 0, 4),
(12, 13, '2017-06-01 12:23:44', 'Call', 0, 4),
(12, 13, '2017-06-01 12:23:47', 'Call', 0, 4),
(12, 13, '2017-06-01 12:24:07', 'Call', 0, 4),
(12, 13, '2017-06-01 12:24:58', 'Call', 0, 4),
(12, 13, '2017-06-01 12:25:01', 'Call', 0, 4),
(12, 13, '2017-06-01 12:25:02', 'Call', 0, 4),
(12, 13, '2017-06-01 12:26:24', 'Call', 0, 4),
(12, 13, '2017-06-01 12:26:25', 'Call', 0, 4),
(12, 13, '2017-06-01 12:26:27', 'Call', 0, 4),
(12, 13, '2017-06-01 12:26:38', 'Call', 0, 4),
(12, 13, '2017-06-01 12:26:39', 'Call', 0, 4),
(12, 13, '2017-06-01 12:26:41', 'Call', 0, 4),
(12, 13, '2017-06-04 14:11:42', NULL, 0, 0),
(12, 13, '2017-06-05 16:03:21', NULL, 0, 0),
(12, 13, '2017-06-05 16:03:27', NULL, 0, 0),
(12, 13, '2017-06-05 17:13:07', NULL, 0, 0),
(12, 13, '2017-06-05 17:13:25', NULL, 0, 0),
(12, 13, '2017-06-05 17:13:59', NULL, 0, 0),
(12, 13, '2017-06-05 17:14:47', NULL, 0, 0),
(12, 13, '2017-06-05 17:14:58', NULL, 0, 0),
(12, 13, '2017-06-05 17:15:03', NULL, 0, 0),
(12, 13, '2017-06-05 17:15:18', NULL, 0, 0),
(12, 13, '2017-06-05 17:15:25', NULL, 0, 0),
(12, 13, '2017-06-05 17:17:36', NULL, 0, 0),
(12, 13, '2017-06-05 17:17:40', NULL, 0, 0),
(12, 13, '2017-06-05 17:17:50', NULL, 0, 0),
(12, 13, '2017-06-05 17:23:28', NULL, 0, 0),
(12, 13, '2017-06-05 17:29:55', NULL, 0, 0),
(12, 13, '2017-06-05 19:06:38', NULL, 0, 0),
(12, 13, '2017-06-05 19:06:41', 'Call', 0, 4),
(12, 13, '2017-06-05 20:19:35', NULL, 0, 0),
(12, 13, '2017-06-05 20:19:36', 'Call', 0, 4),
(12, 13, '2017-06-05 20:21:06', 'Call', 4, 5),
(12, 13, '2017-06-05 20:40:14', 'Call', 4, 5),
(12, 13, '2017-06-05 20:41:58', 'Call', 0, 4),
(12, 13, '2017-06-05 20:42:38', 'Call', 5, 5),
(12, 13, '2017-06-05 20:54:48', 'Call', 0, 4),
(12, 13, '2017-06-05 20:55:56', 'Call', 5, 4),
(12, 13, '2017-06-06 16:26:42', NULL, 0, 0),
(12, 13, '2017-06-06 16:26:56', NULL, 0, 0),
(12, 13, '2017-06-06 16:27:07', NULL, 0, 0),
(12, 13, '2017-06-06 16:28:18', NULL, 0, 0),
(12, 13, '2017-06-06 16:40:07', NULL, 0, 0),
(12, 13, '2017-06-06 16:40:09', 'Call', 5, 5),
(12, 13, '2017-06-06 16:40:41', NULL, 0, 0),
(12, 13, '2017-06-06 16:40:42', 'Call', 0, 4),
(12, 13, '2017-06-06 16:40:43', 'Call', 0, 4),
(12, 13, '2017-06-06 16:40:44', 'Call', 0, 4),
(12, 13, '2017-06-06 16:40:46', 'Call', 0, 4),
(12, 13, '2017-06-06 16:40:47', 'Call', 0, 4),
(12, 13, '2017-06-06 16:40:48', 'Call', 0, 4),
(12, 13, '2017-06-06 16:40:49', 'Call', 0, 4),
(12, 13, '2017-06-06 16:40:51', 'Call', 0, 4),
(12, 13, '2017-06-06 16:40:52', 'Call', 0, 4),
(12, 13, '2017-06-06 16:40:53', 'Call', 0, 4),
(12, 13, '2017-06-06 16:40:54', 'Call', 0, 4),
(12, 13, '2017-06-06 16:40:55', 'Call', 0, 4),
(12, 13, '2017-06-06 16:40:56', 'Call', 0, 4),
(12, 13, '2017-06-06 16:40:57', 'Call', 0, 4),
(12, 13, '2017-06-06 16:40:59', 'Call', 0, 4),
(12, 13, '2017-06-06 16:41:00', 'Call', 0, 4),
(12, 13, '2017-06-06 17:07:32', NULL, 0, 0),
(12, 13, '2017-06-06 17:07:33', 'Call', 0, 4),
(12, 13, '2017-06-06 17:07:34', 'Call', 0, 4),
(12, 13, '2017-06-06 17:14:45', 'Call', 0, 4),
(12, 13, '2017-06-06 17:14:46', 'Mail', 0, 4),
(12, 13, '2017-06-06 17:14:49', 'Call', 0, 4),
(12, 13, '2017-06-06 17:30:10', 'Call', 0, 4),
(12, 13, '2017-06-06 19:26:58', NULL, 0, 0),
(12, 13, '2017-06-06 19:27:12', 'Call', 1, 5),
(12, 13, '2017-06-06 19:28:34', NULL, 0, 0),
(12, 13, '2017-06-06 19:31:49', NULL, 0, 0),
(12, 13, '2017-06-06 20:01:53', NULL, 0, 0),
(12, 13, '2017-06-07 07:59:20', NULL, 0, 0),
(12, 13, '2017-06-07 07:59:21', 'Call', 1, 4),
(12, 13, '2017-06-07 10:09:45', NULL, 0, 0),
(12, 13, '2017-06-07 10:10:03', 'Call', 0, 4),
(12, 13, '2017-06-07 10:26:30', NULL, 0, 0),
(12, 13, '2017-06-07 10:26:31', 'Call', 0, 4),
(12, 13, '2017-06-16 10:31:27', NULL, 0, 0),
(12, 13, '2017-06-16 10:31:38', NULL, 0, 0),
(12, 13, '2017-06-16 10:31:46', NULL, 0, 0),
(12, 13, '2017-06-16 10:32:07', NULL, 0, 0),
(12, 13, '2017-06-16 10:32:10', 'Mail', 1, 5),
(12, 13, '2017-06-16 10:32:13', 'Call', 1, 5),
(13, 4, '2017-06-04 14:19:10', NULL, 0, 0),
(13, 4, '2017-06-04 14:34:21', 'Mail', 0, 1),
(13, 4, '2017-06-04 14:42:15', NULL, 0, 0),
(13, 4, '2017-06-05 19:10:48', NULL, 0, 0),
(13, 4, '2017-06-05 19:10:52', NULL, 0, 0),
(13, 4, '2017-06-05 19:12:43', NULL, 0, 0),
(13, 4, '2017-06-05 19:13:06', NULL, 0, 0),
(13, 4, '2017-06-06 18:59:53', NULL, 0, 0),
(13, 4, '2017-06-06 19:46:51', NULL, 0, 0),
(13, 4, '2017-06-06 19:48:30', NULL, 0, 0),
(13, 4, '2017-06-06 19:53:22', NULL, 0, 0),
(13, 4, '2017-06-06 20:30:36', NULL, 0, 0),
(13, 4, '2017-06-07 09:33:47', NULL, 0, 0),
(13, 4, '2017-06-07 09:33:52', NULL, 0, 0),
(13, 4, '2017-06-07 09:33:54', NULL, 0, 0),
(13, 4, '2017-06-07 10:28:53', NULL, 0, 0),
(13, 4, '2017-06-07 10:28:58', NULL, 0, 0),
(13, 4, '2017-06-07 10:29:21', NULL, 0, 0),
(13, 4, '2017-06-09 07:54:22', NULL, 0, 0),
(13, 4, '2017-06-09 07:54:32', NULL, 0, 0),
(13, 4, '2017-06-09 08:53:29', NULL, 0, 0),
(13, 4, '2017-06-09 08:53:33', NULL, 0, 0),
(13, 4, '2017-06-12 12:27:44', NULL, 0, 0),
(13, 4, '2017-06-16 10:36:59', NULL, 0, 0),
(13, 8, '2017-06-04 14:19:19', NULL, 0, 0),
(13, 8, '2017-06-04 14:19:38', NULL, 0, 0),
(13, 8, '2017-06-04 14:26:43', 'Mail', 0, 1),
(13, 8, '2017-06-05 19:13:17', NULL, 0, 0),
(13, 8, '2017-06-05 19:15:10', NULL, 0, 0),
(13, 8, '2017-06-05 19:15:15', NULL, 0, 0),
(13, 8, '2017-06-06 16:35:25', NULL, 0, 0),
(13, 8, '2017-06-06 16:35:29', NULL, 0, 0),
(13, 8, '2017-06-06 18:59:45', NULL, 0, 0),
(13, 8, '2017-06-06 19:50:58', NULL, 0, 0),
(13, 8, '2017-06-06 19:51:54', NULL, 0, 0),
(13, 8, '2017-06-06 19:59:39', NULL, 0, 0),
(13, 8, '2017-06-06 20:05:17', NULL, 0, 0),
(13, 12, '2017-06-04 14:15:00', NULL, 0, 0),
(13, 12, '2017-06-04 14:16:00', NULL, 0, 0),
(13, 12, '2017-06-04 14:18:56', NULL, 0, 0),
(13, 12, '2017-06-04 14:19:15', NULL, 0, 0),
(13, 12, '2017-06-04 14:25:48', 'Mail', 1, 5),
(13, 12, '2017-06-04 14:42:24', NULL, 0, 0),
(13, 12, '2017-06-05 15:14:40', NULL, 0, 0),
(13, 12, '2017-06-07 09:37:19', NULL, 0, 0),
(13, 12, '2017-06-07 09:37:47', 'Call', 0, 5),
(13, 16, '2017-06-01 13:54:01', NULL, 0, 0),
(13, 16, '2017-06-01 13:54:03', 'Call', 4, 5),
(13, 16, '2017-06-01 13:55:13', NULL, 0, 0),
(13, 16, '2017-06-01 13:55:23', NULL, 0, 0),
(13, 18, '2017-06-07 10:15:40', NULL, 0, 0),
(13, 18, '2017-06-07 10:15:41', 'Call', 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `user_destination`
--

CREATE TABLE `user_destination` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `User_id` bigint(20) UNSIGNED NOT NULL,
  `Datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Longitude` double NOT NULL,
  `Latitude` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_destination`
--

INSERT INTO `user_destination` (`id`, `User_id`, `Datetime`, `Longitude`, `Latitude`) VALUES
(151, 13, '2017-06-04 09:01:20', 9.5859559, 45.6425611),
(152, 12, '2017-06-04 09:02:28', 9.598617553710938, 45.65040837112951),
(153, 13, '2017-06-04 09:18:33', 9.5858775, 45.6423993),
(154, 13, '2017-06-04 09:19:02', 9.5859875, 45.6423491),
(155, 13, '2017-06-04 09:22:18', 9.5857646, 45.6421851),
(156, 13, '2017-06-04 14:11:21', 9.5859245, 45.6424246),
(157, 12, '2017-06-04 14:14:55', 9.601364135742188, 45.65028837377915),
(158, 4, '2017-06-04 14:14:55', 9.601364135742188, 45.65028837377915),
(159, 8, '2017-06-04 14:14:55', 9.601364135742188, 45.65028837377915),
(160, 13, '2017-06-04 14:42:00', 9.5858263, 45.6424046),
(161, 13, '2017-06-04 14:42:05', 9.5858263, 45.6424046),
(162, 13, '2017-06-04 14:50:45', 9.5858666, 45.6424772),
(163, 13, '2017-06-05 15:13:09', 9.596214294433594, 45.66660565337351),
(164, 13, '2017-06-05 16:02:36', 9.5859875, 45.6423491),
(165, 13, '2017-06-05 17:12:32', 9.5859814, 45.6425359),
(166, 13, '2017-06-05 17:21:58', 9.5859875, 45.6423491),
(167, 13, '2017-06-05 17:22:14', 9.5860565, 45.6424534),
(168, 13, '2017-06-05 17:22:43', 9.5859875, 45.6423491),
(169, 13, '2017-06-05 17:23:25', 9.5860492, 45.6424519),
(170, 13, '2017-06-05 17:29:52', 9.6049071, 45.6502006),
(171, 13, '2017-06-05 18:30:44', 9.97187577188015, 46.24692020710775),
(172, 13, '2017-06-05 18:30:47', 10.973497778177261, 46.82712381225704),
(173, 13, '2017-06-05 18:32:06', 9.586900994181633, 45.64273224164959),
(174, 13, '2017-06-05 18:32:13', 9.5866384729743, 45.642671297176456),
(175, 13, '2017-06-05 18:32:59', 9.587878659367561, 45.643004615753796),
(176, 13, '2017-06-05 19:06:31', 9.594893641769886, 45.64788087261979),
(177, 13, '2017-06-05 20:19:32', 9.6049071, 45.6502006),
(178, 13, '2017-06-06 16:25:35', 9.597169100000002, 45.586065600000005),
(179, 13, '2017-06-06 16:26:38', 9.597169100000002, 45.586065600000005),
(180, 13, '2017-06-06 16:34:27', 9.587958119809628, 45.64257659870977),
(181, 13, '2017-06-06 16:35:20', 9.596848301589489, 45.648105642732475),
(182, 13, '2017-06-06 16:40:04', 9.517769699999999, 45.6025738),
(183, 13, '2017-06-06 17:07:30', 9.586813822388649, 45.64261550948526),
(184, 13, '2017-06-06 19:24:02', 9.597169100000002, 45.586065600000005),
(185, 13, '2017-06-06 19:53:37', 9.588522389531136, 45.643815635795335),
(186, 13, '2017-06-07 07:56:37', 9.601749703288078, 45.64931197953243),
(187, 13, '2017-06-07 07:58:51', 9.59625821560621, 45.651468180315256),
(188, 13, '2017-06-07 07:58:51', 9.59625821560621, 45.651468180315256),
(189, 13, '2017-06-07 07:59:10', 9.59625821560621, 45.651468180315256),
(190, 13, '2017-06-07 09:33:24', 9.60931722074747, 45.65400489113083),
(191, 13, '2017-06-07 09:36:11', 9.630889892578125, 45.668525020710476),
(192, 12, '2017-06-07 09:37:08', 9.607195928692818, 45.65241313258415),
(193, 12, '2017-06-07 09:37:14', 9.607195928692818, 45.65241313258415),
(194, 13, '2017-06-07 10:09:03', 9.607200622558594, 45.653588207237284),
(195, 18, '2017-06-07 10:15:27', 9.582889080047607, 45.65433814227222),
(196, 18, '2017-06-07 10:15:36', 9.583361148834229, 45.64925338596136),
(197, 18, '2017-06-07 10:17:03', 9.620590209960938, 45.65037837181601),
(198, 18, '2017-06-07 10:17:19', 9.624409675598145, 45.64764836702863),
(199, 13, '2017-06-07 10:26:15', 9.603666812181473, 45.65355024150906),
(200, 13, '2017-06-09 07:49:58', 9.630410112440586, 45.666619008573804),
(201, 4, '2017-06-09 07:50:12', 9.629477038979529, 45.6666796926894),
(202, 13, '2017-06-09 07:53:21', 9.631427340209484, 45.66786477701865),
(203, 13, '2017-06-09 07:53:25', 9.629789851605892, 45.667494587297234),
(204, 4, '2017-06-09 07:53:32', 9.628376327455044, 45.666459683169535),
(205, 13, '2017-06-09 08:53:06', 9.59327057003975, 45.64785954402209),
(206, 13, '2017-06-16 10:30:03', 9.641189575195312, 45.66516608468067),
(207, 13, '2017-06-16 10:30:49', 9.598617553710938, 45.66180694709679),
(208, 13, '2017-06-16 10:31:19', 9.597930908203125, 45.65604795660121);

-- --------------------------------------------------------

--
-- Table structure for table `user_position`
--

CREATE TABLE `user_position` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `User_id` bigint(20) UNSIGNED NOT NULL,
  `Longitude` double NOT NULL,
  `Latitude` double NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_position`
--

INSERT INTO `user_position` (`id`, `User_id`, `Longitude`, `Latitude`, `Date`) VALUES
(1, 4, 9.6306367, 45.6754767, '2016-06-27 12:40:08'),
(4, 5, 9.586026, 45.6424541, '2016-06-27 14:57:55'),
(6, 8, 9.587026, 45.6425541, '2016-06-28 07:38:48'),
(31, 18, 9.5831913, 45.644373699999996, '2017-06-07 10:17:02'),
(34, 12, 9.5789967, 45.644373699999996, '2017-06-16 10:32:41'),
(38, 13, 9.5858805, 45.6423911, '2017-06-20 13:43:46');

-- --------------------------------------------------------

--
-- Table structure for table `user_token`
--

CREATE TABLE `user_token` (
  `id` bigint(20) NOT NULL,
  `User_id` bigint(20) UNSIGNED NOT NULL,
  `Token` varchar(50) NOT NULL,
  `Deadline` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_token`
--

INSERT INTO `user_token` (`id`, `User_id`, `Token`, `Deadline`) VALUES
(6, 16, 'DnkMyIEUZJ', '2017-06-30 22:00:00'),
(7, 16, '9rvIcST14d', '2017-06-30 22:00:00'),
(62, 18, 'VuCsCHshH3', '2017-07-06 22:00:00'),
(72, 12, 'uTwf8YFtjx', '2017-07-15 22:00:00'),
(74, 12, 'Pz5vptwogd', '2017-07-15 22:00:00'),
(75, 13, '7a13R3aNnM', '2017-07-15 22:00:00'),
(77, 13, 'gVx49PQQCN', '2017-07-19 22:00:00'),
(80, 13, 'uLHwSCx7xU', '2017-07-19 22:00:00'),
(81, 13, '5Ogjxm3fF5', '2017-07-19 22:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Descr` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`id`, `Descr`) VALUES
(1, 'Autostoppista'),
(2, 'Autista');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `ix_User` (`Mobile`),
  ADD KEY `Type_id` (`Type_id`);

--
-- Indexes for table `user_contacts`
--
ALTER TABLE `user_contacts`
  ADD PRIMARY KEY (`Caller_id`,`Receiver_id`,`Datetime`),
  ADD KEY `Caller_id` (`Caller_id`),
  ADD KEY `Receiver_id` (`Receiver_id`);

--
-- Indexes for table `user_destination`
--
ALTER TABLE `user_destination`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `User_id` (`User_id`);

--
-- Indexes for table `user_position`
--
ALTER TABLE `user_position`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `User_id` (`User_id`);

--
-- Indexes for table `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Token` (`Token`),
  ADD KEY `User_id` (`User_id`),
  ADD KEY `User_id_2` (`User_id`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `user_destination`
--
ALTER TABLE `user_destination`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;
--
-- AUTO_INCREMENT for table `user_position`
--
ALTER TABLE `user_position`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;
--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_user_type` FOREIGN KEY (`Type_id`) REFERENCES `user_type` (`id`);

--
-- Constraints for table `user_contacts`
--
ALTER TABLE `user_contacts`
  ADD CONSTRAINT `Caller_User` FOREIGN KEY (`Caller_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `Receiver_User` FOREIGN KEY (`Receiver_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user_destination`
--
ALTER TABLE `user_destination`
  ADD CONSTRAINT `user_city_user` FOREIGN KEY (`User_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user_position`
--
ALTER TABLE `user_position`
  ADD CONSTRAINT `user_position_user` FOREIGN KEY (`User_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user_token`
--
ALTER TABLE `user_token`
  ADD CONSTRAINT `user_token_user` FOREIGN KEY (`User_id`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
