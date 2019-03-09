-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 09, 2019 at 08:07 AM
-- Server version: 8.0.13-4
-- PHP Version: 7.2.15-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `RFvscEGK0c`
--

-- --------------------------------------------------------

--
-- Table structure for table `block`
--

CREATE TABLE `block` (
  `bname` varchar(50) NOT NULL,
  `bid` varchar(45) NOT NULL,
  `hid` varchar(45) NOT NULL,
  `rooms` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `block`
--

INSERT INTO `block` (`bname`, `bid`, `hid`, `rooms`) VALUES
('b1', 'pmhb1', 'pmh', '1'),
('b2', 'pmhb2', 'pmh', '3'),
('b3', 'pmhb3', 'pmh', '2'),
('b1', 'tmhb1', 'tmh', '5');

-- --------------------------------------------------------

--
-- Table structure for table `hostel`
--

CREATE TABLE `hostel` (
  `hname` varchar(100) NOT NULL,
  `hid` varchar(45) NOT NULL,
  `blocks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hostel`
--

INSERT INTO `hostel` (`hname`, `hid`, `blocks`) VALUES
('Posham Men\'sHostel', 'pmh', 3),
('Tirumala Men\'s Hostel', 'tmh', 1);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `uid` varchar(50) NOT NULL DEFAULT '',
  `pwd` varchar(45) NOT NULL,
  `hid` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`uid`, `pwd`, `hid`) VALUES
('kanthreddy@gmail.com', 'kanthreddy', 'pmh'),
('lokireddy@gmail.com', 'lokireddy', 'tmh');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `name` varchar(20) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `id` varchar(45) NOT NULL,
  `doj` date NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `room` varchar(45) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `bid` varchar(45) NOT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`name`, `mobile`, `id`, `doj`, `address`, `room`, `amount`, `bid`, `email`) VALUES
('lokireddy', '7799885251', '123456789', '2015-02-01', 'hyd', '508', 6000, 'pmhb2', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `rno` varchar(15) NOT NULL,
  `rid` varchar(20) NOT NULL,
  `bid` varchar(45) NOT NULL,
  `cost` int(11) NOT NULL,
  `capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`rno`, `rid`, `bid`, `cost`, `capacity`) VALUES
('507', 'pmhb2_507', 'pmhb2', 5500, 4),
('508', 'pmhb2_508', 'pmhb2', 6000, 3),
('509', 'pmhb2_509', 'pmhb2', 7500, 2),
('508', 'tmhb1_508', 'tmhb1', 6000, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `block`
--
ALTER TABLE `block`
  ADD PRIMARY KEY (`bid`),
  ADD KEY `block_fk_idx` (`hid`);

--
-- Indexes for table `hostel`
--
ALTER TABLE `hostel`
  ADD PRIMARY KEY (`hid`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `hid_idx` (`hid`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`mobile`),
  ADD KEY `bid_idx` (`bid`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`rid`),
  ADD KEY `room_fk_idx` (`bid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `block`
--
ALTER TABLE `block`
  ADD CONSTRAINT `block_fk` FOREIGN KEY (`hid`) REFERENCES `hostel` (`hid`);

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `hostel_hid_fk` FOREIGN KEY (`hid`) REFERENCES `hostel` (`hid`);

--
-- Constraints for table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `person_bid_fk` FOREIGN KEY (`bid`) REFERENCES `block` (`bid`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_bid_fk` FOREIGN KEY (`bid`) REFERENCES `block` (`bid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
