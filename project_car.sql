-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2017 at 05:19 PM
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
(8, 'Andrea', 'Ocera', 'abc@def.bbc', '3482467286', 'occy', 1, 10, ''),
(12, 'Paolo', 'Bertolotti', 'pcbertolotti@gmail.com', '3355761144', '189bbbb00c5f1fb7fba9ad9285f193d1', 1, 100, 'C:/xampp/htdocs/easytravel/pcws/propics/32.jpeg'),
(13, 'Giorgio', 'Bertolotti', 'giorgiobertol@gmail.com', '3290358217', '189bbbb00c5f1fb7fba9ad9285f193d1', NULL, 100, 'C:/xampp/htdocs/easytravel/pcws/propics/60.jpeg'),
(14, 'Ciao', 'Ciao', 'giongi@gio.com', '3408812553', 'e268724caade7065c48790389788a526', NULL, 10, 'C:/xampp/htdocs/easytravel/pcws/propics/42.jpeg'),
(15, 'Aziz', 'Bamba', 'abab@gmail.com', '3335556667', 'ddbb740608217cb374b93178d9d0374c', NULL, 10, 'C:/xampp/htdocs/easytravel/pcws/propics/44.jpeg'),
(16, 'Mattia', 'Pozzi', 'pozzi.mattia98@gmail.com', '3347581938', '18bd309054afe1ef98bff8422b5b9271', 2, 61, 'C:/xampp/htdocs/easytravel/pcws/propics/52.jpeg'),
(17, 'Giorgio', 'Prova', 'abc@gmajl.com', '633386891', 'e32ae4e0d9158c00684ec73ce7803ab1', NULL, 10, NULL);

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
(13, 4, '2017-06-04 14:19:10', NULL, 0, 0),
(13, 4, '2017-06-04 14:34:21', 'Mail', 0, 1),
(13, 4, '2017-06-04 14:42:15', NULL, 0, 0),
(13, 8, '2017-06-04 14:19:19', NULL, 0, 0),
(13, 8, '2017-06-04 14:19:38', NULL, 0, 0),
(13, 8, '2017-06-04 14:26:43', 'Mail', 0, 1),
(13, 12, '2017-06-04 14:15:00', NULL, 0, 0),
(13, 12, '2017-06-04 14:16:00', NULL, 0, 0),
(13, 12, '2017-06-04 14:18:56', NULL, 0, 0),
(13, 12, '2017-06-04 14:19:15', NULL, 0, 0),
(13, 12, '2017-06-04 14:25:48', 'Mail', 1, 5),
(13, 12, '2017-06-04 14:42:24', NULL, 0, 0),
(13, 12, '2017-06-05 15:14:40', NULL, 0, 0),
(13, 16, '2017-06-01 13:54:01', NULL, 0, 0),
(13, 16, '2017-06-01 13:54:03', 'Call', 4, 5),
(13, 16, '2017-06-01 13:55:13', NULL, 0, 0),
(13, 16, '2017-06-01 13:55:23', NULL, 0, 0);

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
(163, 13, '2017-06-05 15:13:09', 9.596214294433594, 45.66660565337351);

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
(14, 12, 9.5858897, 45.6426009, '2017-06-04 15:18:58'),
(20, 13, 9.5859875, 45.6423491, '2017-06-05 15:19:08');

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
(2, 12, 'HVXjnWTgc5', '2017-06-30 22:00:00'),
(6, 16, 'DnkMyIEUZJ', '2017-06-30 22:00:00'),
(7, 16, '9rvIcST14d', '2017-06-30 22:00:00'),
(17, 12, 'ReTFuyOUaW', '2017-07-03 22:00:00'),
(31, 13, 'B6bxabUxgP', '2017-07-04 22:00:00');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `user_destination`
--
ALTER TABLE `user_destination`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;
--
-- AUTO_INCREMENT for table `user_position`
--
ALTER TABLE `user_position`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
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
