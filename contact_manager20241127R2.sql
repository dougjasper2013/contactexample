-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 27, 2024 at 06:54 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `contact_manager`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `contactID` int(11) NOT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `emailAddress` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `imageName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`contactID`, `firstName`, `lastName`, `emailAddress`, `phone`, `status`, `dob`, `imageName`) VALUES
(80, 'Daffy', 'Duck', 'dduck@ltunes.com', '555-555-1112', 'member', '1981-06-24', 'Daffy_Duck.svg'),
(81, 'Bugs', 'Bunny', 'bbunny@ltunes.com', '555-555-1111', 'member', '1987-06-30', 'Bugs_Bunny.png'),
(87, 'Wiley', 'Coyote', 'wcoyote@ltunes.com', '555-555-1115', 'member', '1989-08-28', 'Coyote.webp'),
(88, 'The', 'Roadrunner', 'troadrunner@ltunes.com', '555-555-1114', 'member', '1990-10-22', 'Road-runner.webp'),
(91, 'Elmer', 'Fudd', 'efudd@ltunes.com', '555-555-1117', 'member', '1993-02-22', 'Fudd.webp');

-- --------------------------------------------------------

--
-- Table structure for table `registrations`
--

CREATE TABLE `registrations` (
  `registrationID` int(11) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registrations`
--

INSERT INTO `registrations` (`registrationID`, `userName`, `password`) VALUES
(7, 'bbunny2024', '$2y$10$aNxoFKiuZH8uODAwQ69ICOZoWHYHpS2e4emXFdz25S.FedubD6oZC'),
(8, 'dduck2024', '$2y$10$ZrmSy8OWCA8Pqr6ILgv73Ov4jMfJ8l2azGISvRkZdwukF32UqNkQm'),
(9, 'tbird2024', '$2y$10$U.HGjMYiWZhMnpllLAokperpkYs9mFwPL6dXTI6MM43g53QwIcRJC'),
(10, 'ysam2024', '$2y$10$nFyxXly8v9JcZnGD0PzB5O38nu8bddYta.TZdWQY2Y3R5Jy4F1Og2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`contactID`),
  ADD KEY `ixEmail` (`emailAddress`),
  ADD KEY `ixName` (`firstName`,`lastName`),
  ADD KEY `ix_Name` (`firstName`,`lastName`),
  ADD KEY `ix_Phone` (`phone`);

--
-- Indexes for table `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`registrationID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `contactID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `registrations`
--
ALTER TABLE `registrations`
  MODIFY `registrationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
