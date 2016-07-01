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
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Province` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `Name`, `Province`) VALUES
(4, 'Roma', 'RM'),
(5, 'Milano', 'MI'),
(6, 'Napoli', 'NA'),
(7, 'Torino', 'TO'),
(8, 'Palermo', 'PA'),
(9, 'Genova', 'GE'),
(10, 'Bologna', 'BO'),
(11, 'Firenze', 'FI'),
(12, 'Bari', 'BA'),
(13, 'Catania', 'CT'),
(14, 'Venezia', 'VE'),
(15, 'Verona', 'VR'),
(16, 'Messina', 'ME'),
(17, 'Padova', 'PD'),
(18, 'Trieste', 'TS'),
(19, 'Taranto', 'TA'),
(20, 'Brescia', 'BS'),
(21, 'Prato', 'PO'),
(22, 'Parma', 'PR'),
(23, 'Modena', 'MO');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
