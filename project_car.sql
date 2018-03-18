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
