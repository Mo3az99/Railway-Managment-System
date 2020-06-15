-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2020 at 09:29 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `railway`
--

-- --------------------------------------------------------

--
-- Table structure for table `clerk`
--

CREATE TABLE `clerk` (
  `Clerk_id` int(11) NOT NULL,
  `Window_Number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `Dep_Id` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Manager_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `Manager_Id` int(11) NOT NULL,
  `Department_Id` int(11) NOT NULL,
  `Authority_Level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `manages`
--

CREATE TABLE `manages` (
  `department_id` int(11) NOT NULL,
  `manager_id` int(11) NOT NULL,
  `startdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `National_Id` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Gender` text NOT NULL,
  `DateOfBirth` date NOT NULL,
  `Mobile` int(11) NOT NULL,
  `E_mail` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `seatsclass`
--

CREATE TABLE `seatsclass` (
  `idoftrain` int(11) NOT NULL,
  `seata` int(11) NOT NULL,
  `seatb` int(11) NOT NULL,
  `seatc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `Staff_Id` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Address` text NOT NULL,
  `Mobile` int(11) NOT NULL,
  `E_mail` text NOT NULL,
  `Salary` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `station`
--

CREATE TABLE `station` (
  `Station_id` int(11) NOT NULL,
  `Name` varchar(11) NOT NULL,
  `NumberOfTrains` int(11) NOT NULL,
  `StaffCapacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `station`
--

INSERT INTO `station` (`Station_id`, `Name`, `NumberOfTrains`, `StaffCapacity`) VALUES
(1, 'cairo', 4, 20),
(2, 'alex', 2, 16),
(3, 'aswan', 5, 20);

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `Ticket_Id` int(11) NOT NULL,
  `Status` varchar(11) NOT NULL,
  `passenger_id` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Train_ID` int(11) NOT NULL,
  `SeatNumber` int(11) NOT NULL,
  `SourceName` varchar(11) NOT NULL,
  `DestinationName` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `train`
--

CREATE TABLE `train` (
  `Train_id` int(11) NOT NULL,
  `Source` int(11) NOT NULL,
  `Destination` int(11) NOT NULL,
  `Arrival_Time` text NOT NULL,
  `Departure_Time` text NOT NULL,
  `Capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `train`
--

INSERT INTO `train` (`Train_id`, `Source`, `Destination`, `Arrival_Time`, `Departure_Time`, `Capacity`) VALUES
(1, 1, 2, '4:00', '6:00', 40);

-- --------------------------------------------------------

--
-- Table structure for table `traindriver`
--

CREATE TABLE `traindriver` (
  `Driver_Id` int(11) NOT NULL,
  `Train_Id` int(11) NOT NULL,
  `Shift_TIme` text NOT NULL,
  `license_Degree` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clerk`
--
ALTER TABLE `clerk`
  ADD PRIMARY KEY (`Clerk_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Dep_Id`),
  ADD KEY `Manager_Id` (`Manager_Id`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`Manager_Id`),
  ADD KEY `Department_Id` (`Department_Id`);

--
-- Indexes for table `manages`
--
ALTER TABLE `manages`
  ADD PRIMARY KEY (`department_id`,`manager_id`),
  ADD KEY `manager_id` (`manager_id`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`National_Id`);

--
-- Indexes for table `seatsclass`
--
ALTER TABLE `seatsclass`
  ADD PRIMARY KEY (`idoftrain`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`Staff_Id`);

--
-- Indexes for table `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`Station_id`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`Ticket_Id`),
  ADD KEY `passenger_id` (`passenger_id`),
  ADD KEY `Train_ID` (`Train_ID`),
  ADD KEY `SourceName` (`SourceName`),
  ADD KEY `DestinationName` (`DestinationName`);

--
-- Indexes for table `train`
--
ALTER TABLE `train`
  ADD PRIMARY KEY (`Train_id`),
  ADD KEY `Source` (`Source`),
  ADD KEY `Destination` (`Destination`);

--
-- Indexes for table `traindriver`
--
ALTER TABLE `traindriver`
  ADD PRIMARY KEY (`Driver_Id`),
  ADD KEY `Train_Id` (`Train_Id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clerk`
--
ALTER TABLE `clerk`
  ADD CONSTRAINT `clerk_ibfk_1` FOREIGN KEY (`Clerk_id`) REFERENCES `staff` (`Staff_Id`);

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`Manager_Id`) REFERENCES `manager` (`Manager_Id`);

--
-- Constraints for table `manager`
--
ALTER TABLE `manager`
  ADD CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`Manager_Id`) REFERENCES `staff` (`Staff_Id`),
  ADD CONSTRAINT `manager_ibfk_2` FOREIGN KEY (`Department_Id`) REFERENCES `department` (`Dep_Id`);

--
-- Constraints for table `manages`
--
ALTER TABLE `manages`
  ADD CONSTRAINT `manages_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`Dep_Id`),
  ADD CONSTRAINT `manages_ibfk_2` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`Manager_Id`);

--
-- Constraints for table `seatsclass`
--
ALTER TABLE `seatsclass`
  ADD CONSTRAINT `seatsclass_ibfk_1` FOREIGN KEY (`idoftrain`) REFERENCES `train` (`Train_id`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`National_Id`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`Train_ID`) REFERENCES `train` (`Train_id`),
  ADD CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`SourceName`) REFERENCES `station` (`Name`),
  ADD CONSTRAINT `ticket_ibfk_4` FOREIGN KEY (`DestinationName`) REFERENCES `station` (`Name`);

--
-- Constraints for table `train`
--
ALTER TABLE `train`
  ADD CONSTRAINT `train_ibfk_1` FOREIGN KEY (`Source`) REFERENCES `station` (`Station_id`),
  ADD CONSTRAINT `train_ibfk_2` FOREIGN KEY (`Destination`) REFERENCES `station` (`Station_id`);

--
-- Constraints for table `traindriver`
--
ALTER TABLE `traindriver`
  ADD CONSTRAINT `traindriver_ibfk_1` FOREIGN KEY (`Driver_Id`) REFERENCES `staff` (`Staff_Id`),
  ADD CONSTRAINT `traindriver_ibfk_2` FOREIGN KEY (`Train_Id`) REFERENCES `train` (`Train_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
