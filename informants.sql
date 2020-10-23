-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2020 at 09:13 AM
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
(1, 51323169, 'Bossing', 'Mr', 'Abgao', 'Master', 'abgaoe@gmail.com', '55851813', 'Filipino', 'Single', '2020-10-15', 'College', '', '234567890', 'Bossing', 'Pagadian', 'Balay, Montana Vista, House, Foobar', 'Foobar, Foobar, Foobar, Foobar', 'Kargador', 'Cogon', '51323169.png'),
(2, 83571176, 'Jazz', 'Jr', 'Zabate', 'Baculio', 'spacecat34@gmail.com', '95189640', 'Japanese', 'Single', '2020-10-15', 'College', '', '12345678901', 'Jazz', 'Cagayan', 'Foobar, Foobar, Foobar, Foobar', 'Foobar, Foobar, Foobar, Foobar', 'Kargador', 'Cogon', '44351553.jpg'),
(3, 44351553, 'Aldrin', 'Jr', 'Lagrimas', 'John', 'gvim80@mail.com', '16378051', 'Pinoy', 'Single', '2020-12-21', 'College', '', '091828383', 'Aldrin', 'Pagadian', 'Foobar, Foibar, Foobar, 9000', 'Foobar, Foobard, jsjsjs, 9000', 'Student', 'Balay', '44351553.jpg'),
(4, 33731797, 'Jun', 'Mr', 'Tan', 'Quinto', 'jun@gmail.com', '06777070', 'Filipino', 'Single', '2020-10-22', 'Foobar', '', '45394058493058', 'Jun', 'Cagayan', 'Foobar, Foobar, Foobar, 9000', 'Foobar, Foobar, Foobar, 9000', 'Foobar', 'Foobar', '33731797.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `informants`
--
ALTER TABLE `informants`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `informants`
--
ALTER TABLE `informants`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
