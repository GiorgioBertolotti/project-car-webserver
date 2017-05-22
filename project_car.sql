-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2017 at 12:01 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

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
  `Image` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `Name`, `Surname`, `Mail`, `Mobile`, `Password`, `Type_id`, `Range`, `Image`) VALUES
(4, 'Mattia', 'Pozzi', 'abc@def.it', '333333', '189bbbb0c5f1fb7fba9ad9285f193d1', 1, 10, 'C:/xampp/htdocs/pcws/propics/0.jpeg'),
(5, 'Alessandro', 'Bertolotti', 'abc@def.com', '334338848', 'boh', 2, 10, ''),
(6, 'Andrea', 'Quadriglia', 'abc@def.bbb', '3311', '189bbbb00c5f1fb7fba9ad9285f193d1', NULL, 10, ''),
(8, 'Andrea', 'Ocera', 'abc@def.bbc', '3482467286', 'occy', 1, 10, ''),
(12, 'Paolo', 'Bertolotti', 'pcbertolotti@gmail.com', '3355761144', '189bbbb00c5f1fb7fba9ad9285f193d1', 1, 100, 'C:/xampp/htdocs/pcws/propics/32.jpeg'),
(13, 'Giorgio', 'Bertolotti', 'giorgiobertol@gmail.com', '3290358217', '189bbbb00c5f1fb7fba9ad9285f193d1', NULL, 100, 'C:/xampp/htdocs/pcws/propics/43.jpeg'),
(14, 'Ciao', 'Ciao', 'giongi@gio.com', '3408812553', 'e268724caade7065c48790389788a526', NULL, 10, 'C:/xampp/htdocs/pcws/propics/42.jpeg'),
(15, 'Aziz', 'Bamba', 'abab@gmail.com', '3335556667', 'ddbb740608217cb374b93178d9d0374c', NULL, 10, 'C:/xampp/htdocs/pcws/propics/44.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `user_contacts`
--

CREATE TABLE `user_contacts` (
  `Caller_id` bigint(20) UNSIGNED NOT NULL,
  `Receiver_id` bigint(20) UNSIGNED NOT NULL,
  `Datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Contact_Type` varchar(20) DEFAULT NULL,
  `ContactSeen` tinyint(1) NOT NULL DEFAULT '0',
  `Deleted` tinyint(1) DEFAULT '0',
  `Feedback` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_contacts`
--

INSERT INTO `user_contacts` (`Caller_id`, `Receiver_id`, `Datetime`, `Contact_Type`, `ContactSeen`, `Deleted`, `Feedback`) VALUES
(12, 13, '2017-05-22 07:24:35', 'Call', 1, 0, 5),
(12, 13, '2017-05-22 07:25:38', 'Call', 1, 0, 2),
(12, 13, '2017-05-22 07:28:03', 'Call', 1, 0, 1),
(12, 13, '2017-05-22 07:29:46', 'Call', 1, 0, 0),
(12, 13, '2017-05-22 07:29:54', 'Call', 1, 0, 0),
(12, 13, '2017-05-22 07:30:17', 'Call', 1, 0, 0),
(12, 13, '2017-05-22 07:30:18', 'Call', 1, 0, 0),
(12, 13, '2017-05-22 07:30:52', 'Call', 1, 0, 0),
(12, 13, '2017-05-22 07:30:53', 'Call', 1, 0, 4),
(12, 13, '2017-05-22 07:30:54', 'Mail', 1, 0, 0),
(12, 13, '2017-05-22 07:30:55', 'Call', 1, 0, 1),
(12, 13, '2017-05-22 07:30:56', 'Call', 1, 0, 1),
(12, 13, '2017-05-22 07:30:57', 'Call', 1, 0, 1),
(12, 13, '2017-05-22 07:30:58', 'Call', 1, 0, 1),
(12, 13, '2017-05-22 07:30:59', 'Call', 1, 0, 0),
(12, 13, '2017-05-22 07:31:00', 'Call', 1, 0, 0),
(12, 13, '2017-05-22 07:31:01', 'Call', 1, 0, 0),
(12, 13, '2017-05-22 07:31:02', 'Call', 1, 0, 0),
(12, 13, '2017-05-22 07:31:03', 'Call', 1, 0, 0),
(12, 13, '2017-05-22 07:31:04', 'Call', 1, 0, 0),
(12, 13, '2017-05-22 07:31:05', 'Call', 1, 0, 0),
(12, 13, '2017-05-22 07:31:06', 'Call', 1, 0, 0),
(12, 13, '2017-05-22 07:31:07', 'Call', 1, 0, 0),
(12, 13, '2017-05-22 07:31:08', 'Mail', 1, 0, 0),
(12, 13, '2017-05-22 07:31:09', 'Call', 1, 0, 0),
(12, 13, '2017-05-22 07:35:50', 'Call', 1, 0, 0),
(12, 13, '2017-05-22 08:07:46', 'Call', 1, 0, 0),
(13, 12, '2017-05-22 08:27:06', 'Call', 1, 1, 0),
(13, 12, '2017-05-22 08:29:17', 'Call', 1, 1, 0),
(13, 12, '2017-05-22 08:47:24', 'Call', 1, 1, 0),
(13, 12, '2017-05-22 08:47:25', 'Call', 1, 1, 0),
(13, 12, '2017-05-22 08:48:38', 'Call', 1, 1, 0),
(13, 12, '2017-05-22 08:48:51', 'Call', 1, 1, 0),
(13, 12, '2017-05-22 08:50:46', 'Call', 1, 1, 0),
(13, 12, '2017-05-22 08:52:24', 'Call', 1, 0, 1),
(13, 12, '2017-05-22 08:52:45', 'Call', 1, 1, 0),
(13, 12, '2017-05-22 08:52:46', 'Call', 1, 0, 0),
(13, 12, '2017-05-22 08:52:57', 'Call', 1, 0, 1),
(13, 12, '2017-05-22 08:54:57', 'Call', 1, 0, 3),
(13, 12, '2017-05-22 09:25:21', 'Call', 1, 1, 0),
(13, 12, '2017-05-22 09:28:49', 'Call', 1, 1, 0),
(13, 12, '2017-05-22 09:29:08', 'Call', 1, 0, 3),
(13, 12, '2017-05-22 09:29:16', 'Call', 1, 0, 5),
(13, 12, '2017-05-22 09:49:11', 'Call', 1, 0, 0);

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
(75, 13, '2017-05-22 07:24:28', 9.624710083007812, 45.645728283964466),
(76, 13, '2017-05-22 07:37:12', 9.601879119873047, 45.65334822590512),
(77, 13, '2017-05-22 07:47:48', 9.589862823486328, 45.64812837751116),
(78, 13, '2017-05-22 08:00:49', 9.60479736328125, 45.65508806726474),
(79, 13, '2017-05-22 08:05:44', 9.597930908203125, 45.64884838552229),
(80, 13, '2017-05-22 08:07:36', 9.613380432128906, 45.653888182456356),
(81, 12, '2017-05-22 08:27:02', 9.5526123046875, 45.61884021048937),
(82, 12, '2017-05-22 08:29:52', 9.603080749511719, 45.6716438522655),
(83, 12, '2017-05-22 08:54:53', 9.632606506347656, 45.63732714672184),
(84, 13, '2017-05-22 09:19:22', 9.666252136230469, 45.63732714672184),
(85, 12, '2017-05-22 09:25:18', 9.621963500976562, 45.638287340450574);

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
(87, 12, 9.6147593, 45.6190176, '2017-05-22 09:28:16'),
(89, 13, 0, 0, '2017-05-22 10:00:39');

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
(4, 13, 'Q1HVgFl5un', '2017-04-28 22:00:00'),
(5, 13, 'uCykRoYifv', '2017-05-03 22:00:00'),
(6, 13, 'EavVcDY7FV', '2017-05-03 22:00:00'),
(7, 13, 'u4GMoeknxA', '2017-05-03 22:00:00'),
(8, 13, 'cthBogreut', '2017-05-03 22:00:00'),
(9, 13, 'nWAjVJiwr2', '2017-05-03 22:00:00'),
(10, 13, 'HjKQnndCrY', '2017-05-03 22:00:00'),
(11, 13, 'EkuNrrB4oW', '2017-05-03 22:00:00'),
(12, 13, 'lCfGyhfBCg', '2017-05-03 22:00:00'),
(13, 13, '58T2Svdxcp', '2017-05-03 22:00:00'),
(14, 13, 'Wha4UblesL', '2017-05-03 22:00:00'),
(15, 13, 'Q4qWflbeFg', '2017-05-03 22:00:00'),
(16, 13, 'zHwRrpnZOp', '2017-05-03 22:00:00'),
(17, 12, 'vg9Mawq837', '2017-05-03 22:00:00'),
(18, 13, '6yoT9DTb3t', '2017-05-03 22:00:00'),
(19, 13, 'NQKFNdJj78', '2017-05-03 22:00:00'),
(20, 13, 'YYuXUM8vxi', '2017-05-03 22:00:00'),
(21, 13, 'K9kEzIfpjy', '2017-05-03 22:00:00'),
(22, 13, '7rdb7pOZdo', '2017-05-03 22:00:00'),
(23, 13, '1qnYBO3fLZ', '2017-05-03 22:00:00'),
(24, 13, 'fOdkoKbEtF', '2017-05-03 22:00:00'),
(25, 13, 'njYE29PiQv', '2017-05-03 22:00:00'),
(26, 13, 'xH3d3snEQE', '2017-05-03 22:00:00'),
(27, 13, '4bwqxKTBRu', '2017-05-03 22:00:00'),
(28, 13, 'VNxuRRwlo9', '2017-05-03 22:00:00'),
(29, 13, 'h7KtNsEcwp', '2017-05-03 22:00:00'),
(30, 13, 'KFcwO1VVTA', '2017-05-03 22:00:00'),
(31, 13, 'KEZVm1x9YS', '2017-05-03 22:00:00'),
(32, 13, 'xQkyq6DVcx', '2017-05-03 22:00:00'),
(33, 13, 'CjjdtzJKW1', '2017-05-03 22:00:00'),
(34, 13, 'WefxTf5s3T', '2017-05-03 22:00:00'),
(35, 13, 'pLMlpWzv23', '2017-05-03 22:00:00'),
(36, 13, 'MrL9DZxRQv', '2017-05-03 22:00:00'),
(37, 13, 'QgCOEWHgq0', '2017-05-03 22:00:00'),
(38, 13, 'gLGGfDIUqz', '2017-05-03 22:00:00'),
(39, 13, '47oi3Nf3xV', '2017-05-03 22:00:00'),
(40, 13, 'zwQWsXQPw3', '2017-05-03 22:00:00'),
(41, 13, 'R4P3JCYDOW', '2017-05-03 22:00:00'),
(42, 13, '54X1I2ujZL', '2017-05-03 22:00:00'),
(43, 13, 'hMuYDUiTqF', '2017-05-03 22:00:00'),
(44, 13, '1eYwKc9q5x', '2017-05-03 22:00:00'),
(45, 13, 'R6reNqDjG7', '2017-05-03 22:00:00'),
(46, 13, 'mnwMjNLvHn', '2017-05-03 22:00:00'),
(47, 13, 'nUhuP4eX6z', '2017-05-03 22:00:00'),
(48, 13, 'i8EvGSru7v', '2017-05-03 22:00:00'),
(49, 13, 'WBPS9rvku6', '2017-05-03 22:00:00'),
(50, 13, 'LjHCiNGLcf', '2017-05-03 22:00:00'),
(51, 13, 'aBFuaIqT8e', '2017-05-03 22:00:00'),
(52, 13, 'Hh2Hd0kfbT', '2017-05-03 22:00:00'),
(53, 13, 'NQ8LgtxIgO', '2017-05-05 22:00:00'),
(54, 13, 'qD6um7u2XD', '2017-05-06 22:00:00'),
(55, 13, 'eRs0hvyB67', '2017-05-06 22:00:00'),
(56, 13, 'XCkdgnZw3y', '2017-05-08 22:00:00'),
(57, 13, '7yGDPyZAGd', '2017-05-08 22:00:00'),
(58, 13, 'jTOLvuMVTT', '2017-05-08 22:00:00'),
(59, 6, 'GHLz83psww', '2017-05-09 22:00:00'),
(60, 13, 'ugaA3cWdJ0', '2017-05-09 22:00:00'),
(61, 13, 'aSBSHwfxSD', '2017-05-09 22:00:00'),
(62, 6, 'NeycNE3En1', '2017-05-09 22:00:00'),
(63, 13, 'eZ73qF7YuE', '2017-05-09 22:00:00'),
(64, 13, 'XvLpKS6V4M', '2017-05-09 22:00:00'),
(65, 6, 'OE2rMzdBk8', '2017-05-09 22:00:00'),
(66, 13, 'Isjk8J3ByD', '2017-05-09 22:00:00'),
(67, 13, 'qWzUKPhKRc', '2017-05-09 22:00:00'),
(68, 13, 'RVx63JdGz6', '2017-05-09 22:00:00'),
(69, 13, '3pQdiYzhDH', '2017-05-09 22:00:00'),
(70, 13, 'HMZkXre6nU', '2017-05-09 22:00:00'),
(71, 13, 'GNUM2L2ayQ', '2017-05-09 22:00:00'),
(72, 6, 'IEUnrlld9O', '2017-05-09 22:00:00'),
(73, 13, 'AIk9PGXYOv', '2017-05-09 22:00:00'),
(74, 13, 'FuaIqT8eHh', '2017-05-10 22:00:00'),
(75, 13, 'YSxQkyq6DV', '2017-05-20 22:00:00'),
(76, 13, 'cxCjjdtzJK', '2017-05-20 22:00:00'),
(77, 13, '33shUkwOkh', '2017-05-20 22:00:00'),
(78, 13, 'S92cfLiAMm', '2017-05-22 22:00:00'),
(79, 13, 'VuhSwD8Ocd', '2017-05-22 22:00:00'),
(80, 13, '7N0Piy9zzs', '2017-05-24 22:00:00'),
(81, 13, '7wLvvoe8oo', '2017-05-24 22:00:00'),
(82, 13, 'OjnfQxycbK', '2017-05-24 22:00:00'),
(83, 13, 'Vgg21LyVRF', '2017-05-29 22:00:00'),
(84, 13, '8k3u5bIOoj', '2017-06-02 22:00:00'),
(85, 13, 'po5sKWqfiY', '2017-06-02 22:00:00'),
(86, 13, 'Fmu4Yw39qM', '2017-06-02 22:00:00'),
(87, 13, 'bkIwlH5xuQ', '2017-06-02 22:00:00'),
(88, 13, '9WWNeWihUQ', '2017-06-02 22:00:00'),
(89, 12, '4wHLtoxhfd', '2017-06-02 22:00:00'),
(90, 13, 'ipFDJNtsuU', '2017-06-03 22:00:00'),
(91, 13, 'IwlioMZx9b', '2017-06-04 22:00:00'),
(92, 13, 'tZRIlmOQJR', '2017-06-04 22:00:00'),
(93, 13, 'UvNqe0CoyA', '2017-06-05 22:00:00'),
(94, 13, 'yS2THO0dNJ', '2017-06-05 22:00:00'),
(95, 12, '2Yew5XHatU', '2017-06-05 22:00:00'),
(96, 13, 'PRx9hPNdqm', '2017-06-05 22:00:00'),
(97, 13, 'RLRb4iGwgK', '2017-06-05 22:00:00'),
(98, 13, 't5NCk7vRRj', '2017-06-05 22:00:00'),
(99, 13, 'yF8ur37uER', '2017-06-05 22:00:00'),
(100, 13, '1ZmzCiT2zy', '2017-06-06 22:00:00'),
(101, 13, 'b6BwCVO2qg', '2017-06-06 22:00:00'),
(102, 13, '1veQym5RgB', '2017-06-06 22:00:00'),
(103, 14, 'oyuemHnGRx', '2017-06-06 22:00:00'),
(104, 13, 'KOYNBPb5IS', '2017-06-07 22:00:00'),
(105, 13, 'qhw3Wd2Xre', '2017-06-07 22:00:00'),
(106, 13, 'HF8buNKoRr', '2017-06-07 22:00:00'),
(107, 13, 'vJNa7wL6NC', '2017-06-07 22:00:00'),
(108, 12, 'JPhlaqMA1u', '2017-06-07 22:00:00'),
(109, 12, 'hJmfRJ9Ec8', '2017-06-07 22:00:00'),
(110, 13, 'jQTDbk1tB3', '2017-06-07 22:00:00'),
(111, 12, 'QYS9KRiDHu', '2017-06-12 22:00:00'),
(112, 13, '3lPsDnDJO4', '2017-06-12 22:00:00'),
(113, 12, 'iaKKkw7hxg', '2017-06-12 22:00:00'),
(114, 13, 'MSMLdXItPR', '2017-06-13 22:00:00'),
(115, 12, 'Lxqwyi9R68', '2017-06-13 22:00:00'),
(116, 13, 'Q6xbT0R051', '2017-06-13 22:00:00'),
(117, 12, 'oOjnfQxycb', '2017-06-13 22:00:00'),
(118, 13, 'SPh3d9pue4', '2017-06-13 22:00:00'),
(119, 12, 'lpxgrjeZv9', '2017-06-13 22:00:00'),
(120, 15, 'lm1rbSik8V', '2017-06-18 22:00:00'),
(121, 15, 'E3y1cSh7yt', '2017-06-18 22:00:00'),
(122, 15, 'DFL6uFtsby', '2017-06-18 22:00:00'),
(123, 15, 'JLykaJWrQB', '2017-06-18 22:00:00'),
(124, 15, 'cRn4E3Rna0', '2017-06-18 22:00:00'),
(125, 15, 'Sd5bwOewoU', '2017-06-18 22:00:00'),
(126, 13, 'YxzH8aFU4S', '2017-06-18 22:00:00'),
(127, 15, 'MLCFuX7YSK', '2017-06-18 22:00:00'),
(128, 13, '2RBzmy7XM6', '2017-06-18 22:00:00'),
(129, 15, 'rMzPTyDplg', '2017-06-18 22:00:00'),
(130, 13, 'ci57GrquPL', '2017-06-18 22:00:00'),
(131, 13, 'hHJtvIZhr0', '2017-06-18 22:00:00'),
(132, 13, 'GqVypBiOh3', '2017-06-18 22:00:00'),
(133, 13, 'qKRuCQh7K4', '2017-06-18 22:00:00'),
(134, 13, '8nMv5SyXzc', '2017-06-18 22:00:00'),
(135, 13, '5MqlXJYLhZ', '2017-06-18 22:00:00'),
(136, 13, '6FyZTDtGZB', '2017-06-18 22:00:00'),
(137, 12, '2NEXURT1Fv', '2017-06-18 22:00:00'),
(138, 13, 'oKh0i16jtB', '2017-06-18 22:00:00'),
(139, 12, '3A2H0NA1hp', '2017-06-18 22:00:00'),
(140, 13, 'cNKpsJJeu4', '2017-06-18 22:00:00'),
(141, 13, 'ZZ5rfBjjPM', '2017-06-18 22:00:00'),
(142, 13, 'QZilES4cxU', '2017-06-18 22:00:00'),
(143, 12, 'Fhm4FgsPbo', '2017-06-18 22:00:00'),
(144, 12, 'SSv8NGhJXy', '2017-06-18 22:00:00'),
(145, 12, '5fQxaupfdO', '2017-06-18 22:00:00'),
(146, 12, '8Mt4ZJEBqb', '2017-06-18 22:00:00'),
(147, 12, 'YfqJ9lstoL', '2017-06-18 22:00:00'),
(148, 12, 'uZrOYpvlUi', '2017-06-18 22:00:00'),
(149, 12, 'iJKK2MrmsR', '2017-06-18 22:00:00'),
(150, 13, 'RXFWZCo9SO', '2017-06-18 22:00:00'),
(151, 12, 'GKZEIAhIf0', '2017-06-18 22:00:00'),
(152, 12, 'tRMn7urFpI', '2017-06-18 22:00:00'),
(153, 12, 'ay3Vp9gV91', '2017-06-18 22:00:00'),
(154, 13, 'Ocwv4FzNMj', '2017-06-18 22:00:00'),
(155, 13, 'ZLFugtW1lx', '2017-06-18 22:00:00'),
(156, 13, 'jgH314iALK', '2017-06-18 22:00:00'),
(157, 13, 'HuQXhQwlBJ', '2017-06-18 22:00:00'),
(158, 13, 'J88gIaR0bM', '2017-06-18 22:00:00'),
(159, 13, 'asH63rgpc0', '2017-06-20 22:00:00'),
(160, 12, 'lRt7v9chSx', '2017-06-20 22:00:00'),
(161, 13, 'WmUYKa98ys', '2017-06-20 22:00:00'),
(162, 13, 'aomo7te4XI', '2017-06-20 22:00:00'),
(163, 12, 'LL8dclCye7', '2017-06-20 22:00:00'),
(164, 13, 'yKFNO2xDPR', '2017-06-20 22:00:00'),
(165, 13, 't0Kmx06QeU', '2017-06-20 22:00:00'),
(166, 12, 'S50PiXRl3L', '2017-06-20 22:00:00'),
(167, 13, 'eypo632aWW', '2017-06-20 22:00:00'),
(168, 12, 'HLz83pswwu', '2017-06-20 22:00:00'),
(169, 13, 'rsOFRWLiOY', '2017-06-20 22:00:00'),
(170, 12, '69oLHcc2ST', '2017-06-20 22:00:00'),
(171, 12, 'aOM6bIc55L', '2017-06-20 22:00:00'),
(172, 13, 'j6k4iZReT4', '2017-06-20 22:00:00'),
(173, 13, 'ckjdgYhKyf', '2017-06-20 22:00:00'),
(174, 12, '1w2JeSay9F', '2017-06-20 22:00:00'),
(175, 13, 'j1tcmqQCos', '2017-06-20 22:00:00'),
(176, 12, 'P52QM5nOwz', '2017-06-20 22:00:00'),
(177, 13, 'r99KsZyYGr', '2017-06-20 22:00:00'),
(178, 12, 'ZmgF1xVM7i', '2017-06-20 22:00:00');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `user_destination`
--
ALTER TABLE `user_destination`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;
--
-- AUTO_INCREMENT for table `user_position`
--
ALTER TABLE `user_position`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;
--
-- AUTO_INCREMENT for table `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;
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
