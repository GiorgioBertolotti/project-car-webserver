-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2017 at 03:38 PM
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
(4, 'Mattia', 'Pozzi', '', '333333', '189bbbb0c5f1fb7fba9ad9285f193d1', 1, 10, ''),
(5, 'Alessandro', 'Bertolotti', '', '334338848', 'boh', 2, 10, ''),
(6, 'Andrea', 'Quadriglia', '', '3311', 'ppp', 1, 10, ''),
(8, 'andrea', 'ocera', '', '3482467286', 'occy', 1, 10, ''),
(12, 'Paolo', 'Bertolotti', 'pcbertolotti@gmail.com', '3355761144', '189bbbb00c5f1fb7fba9ad9285f193d1', NULL, 41, ''),
(13, 'Giorgio', 'Bertolotti', 'giorgiobertol@gmail.com', '3290358217', '189bbbb00c5f1fb7fba9ad9285f193d1', NULL, 20, 'C:/xampp/htdocs/pcws/propics/4.jpeg'),
(14, 'Ciao', 'Ciao', 'giongi@gio.com', '3408812553', 'e268724caade7065c48790389788a526', NULL, 10, '');

-- --------------------------------------------------------

--
-- Table structure for table `user_destination`
--

CREATE TABLE `user_destination` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `User_id` bigint(20) UNSIGNED NOT NULL,
  `Longitude` double NOT NULL,
  `Latitude` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_destination`
--

INSERT INTO `user_destination` (`id`, `User_id`, `Longitude`, `Latitude`) VALUES
(1, 4, 9.586026, 45.6424541),
(3, 8, 9.6306367, 45.6754767),
(8, 6, 9.5857583, 45.6423917);

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
(6, 8, 9.586026, 45.6424541, '2016-06-28 07:38:48'),
(11, 6, 9.586026, 45.6424541, '2016-06-29 08:00:33');

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
(49, 13, 'WBPS9rvku6', '2017-05-03 22:00:00');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `user_position`
--
ALTER TABLE `user_position`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
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
