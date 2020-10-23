-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2020 at 08:57 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_user`
--

-- --------------------------------------------------------

--
-- Table structure for table `incident`
--

CREATE TABLE `incident` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `type` enum('Informant','Victim') NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` varchar(255) NOT NULL,
  `barangay` varchar(255) NOT NULL,
  `station` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` enum('Close','Pending') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `incident`
--

INSERT INTO `incident` (`id`, `userid`, `type`, `latitude`, `longitude`, `date`, `time`, `barangay`, `station`, `image`, `status`) VALUES
(1, 51323169, 'Victim', '8.46371299543249', '124.67010498046876', '2020-10-15', '00:34', 'Camaman-An', 'Foobar', '51323169_Victim_2020-10-15.jpg', 'Pending'),
(2, 51323169, 'Informant', '8.463882787255464', '124.60830688476564', '2020-10-09', '00:34', 'Pagatpat', 'Foobar', '51323169_Informant_2020-10-09.png', 'Pending'),
(3, 51323169, 'Victim', '8.437903768571765', '124.66873168945314', '2020-10-17', '01:39', 'Indahag', 'Foobar', '51323169_Victim_2020-10-17.png', 'Pending'),
(4, 51323169, 'Victim', '8.451317990218119', '124.61277008056642', '2020-10-14', '', 'Pagatpat', 'Foobar', '51323169_Victim_2020-10-14.jpg', 'Pending'),
(5, 51323169, 'Victim', '8.424033543905642', '124.60144042968751', '2020-10-22', '19:00', 'Lumbia', 'Foobar', '51323169_Victim_2020-10-22.jpg', 'Pending'),
(6, 51323169, 'Informant', '8.418334491064565', '124.59119790903063', '2020-10-22', '19:00', 'Lumbia', 'Foobar', '51323169_Informant_2020-10-22.jpg', 'Pending'),
(7, 51323169, 'Victim', '8.404790722340756', '124.59732055664064', '2020-10-10', '16:34', 'Lumbia', 'Foobar', '51323169_Victim_2020-10-10.png', 'Pending'),
(8, 33731797, 'Informant', '8.49124586231788', '124.624400138855', '2020-10-23', '14:35', 'Patag', 'Foobar', '33731797_Informant_2020-10-23.jpg', 'Pending');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `incident`
--
ALTER TABLE `incident`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `incident`
--
ALTER TABLE `incident`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
