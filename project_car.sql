-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2017 at 08:15 PM
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
(12, 'Paolo', 'Bertolotti', 'pcbertolotti@gmail.com', '3355761144', '189bbbb00c5f1fb7fba9ad9285f193d1', 2, 41, 'C:/xampp/htdocs/pcws/propics/32.jpeg'),
(13, 'Giorgio', 'Bertolotti', 'giorgiobertol@gmail.com', '3290358217', '189bbbb00c5f1fb7fba9ad9285f193d1', NULL, 100, 'C:/xampp/htdocs/pcws/propics/43.jpeg'),
(14, 'Ciao', 'Ciao', 'giongi@gio.com', '3408812553', 'e268724caade7065c48790389788a526', NULL, 10, 'C:/xampp/htdocs/pcws/propics/42.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `user_contacts`
--

CREATE TABLE `user_contacts` (
  `Caller_id` bigint(20) UNSIGNED NOT NULL,
  `Receiver_id` bigint(20) UNSIGNED NOT NULL,
  `Datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Contact_Type` varchar(20) DEFAULT NULL,
  `PassageReceived` tinyint(1) DEFAULT '0',
  `Feedback` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_contacts`
--

INSERT INTO `user_contacts` (`Caller_id`, `Receiver_id`, `Datetime`, `Contact_Type`, `PassageReceived`, `Feedback`) VALUES
(12, 13, '2017-05-14 17:30:36', 'Call', 1, 3),
(12, 13, '2017-05-14 17:31:00', 'E-Mail', 1, 5),
(12, 13, '2017-05-14 18:13:28', 'Call', 1, 1),
(13, 12, '2017-05-14 17:01:09', 'Call', 1, 4),
(13, 12, '2017-05-14 17:01:52', 'Call', 1, 4),
(13, 12, '2017-05-14 17:02:27', 'Call', 1, 4),
(13, 12, '2017-05-14 17:02:37', 'Call', 1, 4),
(13, 12, '2017-05-14 17:06:00', 'Call', 1, 4),
(13, 12, '2017-05-14 17:06:26', 'E-Mail', 1, 3);

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
(1, 4, '2017-05-07 19:19:00', 9.586026, 45.6424541),
(3, 8, '2017-05-07 19:19:00', 9.6306367, 45.6754767),
(4, 8, '2017-05-09 22:00:00', 9.6406367, 45.6954767),
(5, 14, '2017-05-07 19:37:45', 10, 11),
(6, 14, '2017-05-07 19:39:04', 15, 16),
(7, 14, '2017-05-07 19:43:12', 18, 19),
(10, 12, '2017-05-07 20:11:04', 7.541770935058594, 45.05363590935136),
(11, 13, '2017-05-07 20:13:10', 7.532501220703125, 45.075702652276576),
(12, 13, '2017-05-07 20:24:29', 9.604907099999991, 45.6502006),
(13, 13, '2017-05-07 20:41:55', 7.6609039306640625, 45.084430001369526),
(14, 13, '2017-05-08 18:51:21', 7.572669982910156, 45.0766724235624),
(15, 13, '2017-05-09 19:05:16', 7.546234130859375, 45.07497531301177),
(16, 13, '2017-05-09 19:05:20', 7.486152648925781, 45.08588442994683),
(17, 13, '2017-05-09 19:21:43', 7.392849899999987, 45.11731320000001),
(18, 12, '2017-05-09 20:15:39', 9.611320495605469, 45.651248345383415),
(19, 12, '2017-05-09 20:16:32', 9.609260559082031, 45.65508806726474),
(20, 12, '2017-05-09 20:17:15', 7.5373077392578125, 45.06867131826392),
(21, 12, '2017-05-09 20:25:47', 7.584342956542969, 45.05775891491666),
(22, 12, '2017-05-09 20:28:41', 7.5565338134765625, 45.064791591267266),
(23, 12, '2017-05-09 20:30:35', 7.542457580566406, 45.07691486381233),
(24, 12, '2017-05-09 20:37:26', 7.576103210449219, 45.08758121648526),
(25, 12, '2017-05-09 20:38:32', 7.547264099121094, 45.06867131826392),
(26, 12, '2017-05-09 20:39:24', 7.552070617675781, 45.09557967414153),
(27, 12, '2017-05-09 20:40:06', 7.5579071044921875, 45.07036861602176),
(28, 12, '2017-05-09 20:41:21', 7.543487548828125, 45.07279323967242),
(29, 12, '2017-05-09 20:42:05', 7.483062744140625, 45.058243954851285),
(30, 12, '2017-05-09 20:42:35', 7.562713623046875, 45.08370277319465),
(31, 12, '2017-05-09 20:43:58', 7.583656311035156, 45.08055134412809),
(32, 12, '2017-05-09 20:44:41', 7.530784606933594, 45.064791591267266),
(33, 12, '2017-05-09 20:48:03', 7.5222015380859375, 45.08103619068379),
(34, 12, '2017-05-09 20:48:34', 7.557220458984375, 45.07812704963286),
(35, 12, '2017-05-14 16:46:19', 9.894218444824219, 45.48661334374487),
(36, 12, '2017-05-14 16:46:40', 9.902458190917969, 45.49744359115986),
(37, 12, '2017-05-14 16:48:12', 9.880485534667969, 45.5027376208097),
(38, 12, '2017-05-14 17:12:36', 9.879798889160156, 45.481317798141234),
(39, 12, '2017-05-14 17:14:14', 9.644622802734375, 45.642848035965834),
(40, 13, '2017-05-14 17:15:01', 9.930610656738281, 45.5027376208097),
(41, 13, '2017-05-14 17:15:34', 9.900741577148438, 45.489501613357895),
(42, 13, '2017-05-14 17:28:33', 9.881858825683594, 45.50586567708348),
(43, 12, '2017-05-14 18:08:00', 10.0634765625, 45.56502536350451),
(44, 13, '2017-05-14 18:11:06', 9.891471862792969, 45.51452707966949),
(45, 13, '2017-05-14 18:11:46', 9.886665344238281, 45.50153447596235);

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
(39, 12, 9.5859875, 45.6423491, '2017-05-14 18:13:53'),
(40, 13, 0, 0, '2017-05-14 18:14:51');

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
(113, 12, 'iaKKkw7hxg', '2017-06-12 22:00:00');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `user_destination`
--
ALTER TABLE `user_destination`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `user_position`
--
ALTER TABLE `user_position`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;
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
