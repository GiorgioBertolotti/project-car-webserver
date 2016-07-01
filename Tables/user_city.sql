-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2016 at 11:57 AM
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

-- --------------------------------------------------------

--
-- Table structure for table `user_city`
--

CREATE TABLE `user_city` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `User_id` bigint(20) UNSIGNED NOT NULL,
  `City_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_city`
--

INSERT INTO `user_city` (`id`, `User_id`, `City_id`) VALUES
(1, 4, 8),
(3, 8, 5),
(5, 6, 14);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user_city`
--
ALTER TABLE `user_city`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `User_id` (`User_id`),
  ADD KEY `City_id` (`City_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user_city`
--
ALTER TABLE `user_city`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_city`
--
ALTER TABLE `user_city`
  ADD CONSTRAINT `user_city_city` FOREIGN KEY (`City_id`) REFERENCES `city` (`id`),
  ADD CONSTRAINT `user_city_user` FOREIGN KEY (`User_id`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
