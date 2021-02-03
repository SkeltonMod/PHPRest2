-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2021 at 08:36 AM
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
  `informant_id` int(11) NOT NULL,
  `type` enum('Informant','Victim') NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` varchar(255) NOT NULL,
  `location` text NOT NULL,
  `police_station_no` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `remarks` varchar(255) NOT NULL DEFAULT 'To Be Added',
  `suspect` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `incident`
--

INSERT INTO `incident` (`id`, `informant_id`, `type`, `latitude`, `longitude`, `date`, `time`, `location`, `police_station_no`, `image`, `remarks`, `suspect`) VALUES
(1, 77892542, 'Victim', '8.43518690742951', '124.60350036621095', '2021-02-08', '22:21', 'Lumbia', 0, '77892542_Victim_2021-02-08.jpg', 'To Be Added', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `incident_details`
--

CREATE TABLE `incident_details` (
  `id` int(11) NOT NULL,
  `incident_no` int(11) NOT NULL,
  `datetime_acknowledged` datetime NOT NULL,
  `status` varchar(255) NOT NULL,
  `informant_report_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `incident_details`
--

INSERT INTO `incident_details` (`id`, `incident_no`, `datetime_acknowledged`, `status`, `informant_report_id`) VALUES
(1, 41199141, '2021-02-01 02:21:09', 'Pending', '77892542');

-- --------------------------------------------------------

--
-- Table structure for table `informants`
--

CREATE TABLE `informants` (
  `id` int(5) NOT NULL,
  `userid` int(9) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `suffix` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `middlename` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `citizenship` varchar(255) NOT NULL,
  `civilstatus` varchar(255) NOT NULL,
  `dob` varchar(255) NOT NULL,
  `educ` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `mobilenumber` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `pob` varchar(255) NOT NULL,
  `currentaddress` varchar(500) NOT NULL,
  `homeaddress` varchar(500) NOT NULL,
  `occupation` varchar(500) NOT NULL,
  `workaddress` varchar(500) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'None'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `informants`
--

INSERT INTO `informants` (`id`, `userid`, `firstname`, `suffix`, `lastname`, `middlename`, `email`, `password`, `citizenship`, `civilstatus`, `dob`, `educ`, `gender`, `mobilenumber`, `nickname`, `pob`, `currentaddress`, `homeaddress`, `occupation`, `workaddress`, `image`) VALUES
(1, 77892542, 'Elijah', '', 'Abgao', 'Manginsay', 'abgaoe@gmail.com', 'malim890', 'Filipino', 'Single', '2021-02-02', 'College', 'Male', '09953875103', 'Elijah', 'Pagadian', 'Foobar, Foobar, Foobar, 9000', 'Foobar, Foobar, Foobar, 9000', 'Student', 'N/A', '77892542.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `incident`
--
ALTER TABLE `incident`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `incident_details`
--
ALTER TABLE `incident_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `informants`
--
ALTER TABLE `informants`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `incident`
--
ALTER TABLE `incident`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `incident_details`
--
ALTER TABLE `incident_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `informants`
--
ALTER TABLE `informants`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
