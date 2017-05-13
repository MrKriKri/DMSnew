-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2017 at 05:58 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dms_login`
--

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `ID` int(11) NOT NULL,
  `E-mail` varchar(30) NOT NULL,
  `Password` varchar(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`ID`, `E-mail`, `Password`) VALUES
(17, 'mizxcx', '123'),
(18, 'max@gmail.com', '123'),
(20, 'hello@mail.com', '444');

-- --------------------------------------------------------

--
-- Table structure for table `patient_doctor`
--

CREATE TABLE `patient_doctor` (
  `DoctorID` int(11) NOT NULL,
  `DocName` varchar(30) NOT NULL,
  `LineID` varchar(30) NOT NULL,
  `Tel` varchar(13) NOT NULL,
  `UserIDLine` varchar(35) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_doctor`
--

INSERT INTO `patient_doctor` (`DoctorID`, `DocName`, `LineID`, `Tel`, `UserIDLine`) VALUES
(11145, 'max', 'eiei', '0123123', 'U15c9dca3b2a9c602e02889a98c928128'),
(11158, 'sand', 'sss', '1111', 'ffg'),
(11157, 'best', 'krikri', '123123123', '0'),
(11159, 'mark', 'ggaa', '123121', '1321231');

-- --------------------------------------------------------

--
-- Table structure for table `patient_info`
--

CREATE TABLE `patient_info` (
  `ID` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Surname` varchar(30) NOT NULL,
  `IDcard` varchar(13) NOT NULL,
  `DOB` date NOT NULL,
  `Tel.` varchar(10) NOT NULL,
  `DoctorID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_info`
--

INSERT INTO `patient_info` (`ID`, `Name`, `Surname`, `IDcard`, `DOB`, `Tel.`, `DoctorID`) VALUES
(17, 'teeta', 'chit', '12312', '1995-05-02', '01111231', 11145),
(20, 'world', 'war', '15748712', '2017-03-11', '115454', 11157),
(19, 'mazz', 'maxx', '12321232', '2017-03-11', '0215487', 11145);

-- --------------------------------------------------------

--
-- Table structure for table `patient_meal`
--

CREATE TABLE `patient_meal` (
  `MealID` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `Meal` varchar(15) NOT NULL,
  `Meal_date` date NOT NULL,
  `Meal_time` time NOT NULL,
  `Food` varchar(50) NOT NULL,
  `Amount` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_meal`
--

INSERT INTO `patient_meal` (`MealID`, `ID`, `Meal`, `Meal_date`, `Meal_time`, `Food`, `Amount`) VALUES
(1, 17, 'luanch', '2017-05-08', '06:07:09', 'fry rice', 'three plates of rice'),
(4, 17, 'lunch', '2017-05-10', '02:15:47', 'fried-rice', '2bowl');

-- --------------------------------------------------------

--
-- Table structure for table `recorder`
--

CREATE TABLE `recorder` (
  `EventID` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `SugarBloodRate` int(11) NOT NULL,
  `DateRec` date NOT NULL,
  `TimeRec` time NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recorder`
--

INSERT INTO `recorder` (`EventID`, `ID`, `SugarBloodRate`, `DateRec`, `TimeRec`) VALUES
(1, 17, 150, '2017-03-18', '02:21:33'),
(2, 17, 200, '2017-03-18', '02:24:48'),
(3, 17, 180, '2017-03-18', '02:25:02'),
(4, 17, 100, '2017-03-20', '23:53:14'),
(5, 17, 120, '2017-03-20', '23:53:17'),
(6, 17, 130, '2017-03-20', '23:53:22'),
(7, 17, 80, '2017-03-20', '23:53:24'),
(8, 17, 200, '2017-04-20', '05:17:10'),
(9, 17, 200, '2017-04-20', '05:17:10'),
(10, 17, 200, '2017-04-20', '16:51:37'),
(11, 17, 250, '2017-04-20', '16:53:26'),
(12, 17, 200, '2017-04-20', '17:17:39'),
(13, 17, 200, '2017-04-21', '20:59:15'),
(14, 17, 200, '2017-04-21', '21:00:58'),
(15, 17, 200, '2017-04-21', '21:03:53'),
(16, 17, 200, '2017-04-21', '21:05:24'),
(17, 17, 250, '2017-04-21', '21:07:13'),
(18, 17, 200, '2017-04-21', '21:11:42'),
(19, 17, 200, '2017-04-21', '21:12:15'),
(20, 17, 200, '2017-04-21', '21:20:30'),
(21, 17, 200, '2017-04-21', '21:20:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`E-mail`),
  ADD KEY `ID` (`ID`);

--
-- Indexes for table `patient_doctor`
--
ALTER TABLE `patient_doctor`
  ADD PRIMARY KEY (`DoctorID`);

--
-- Indexes for table `patient_info`
--
ALTER TABLE `patient_info`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `DoctorID` (`DoctorID`);

--
-- Indexes for table `patient_meal`
--
ALTER TABLE `patient_meal`
  ADD PRIMARY KEY (`MealID`),
  ADD KEY `ID` (`ID`);

--
-- Indexes for table `recorder`
--
ALTER TABLE `recorder`
  ADD PRIMARY KEY (`EventID`),
  ADD KEY `ID` (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `patient_doctor`
--
ALTER TABLE `patient_doctor`
  MODIFY `DoctorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11160;
--
-- AUTO_INCREMENT for table `patient_info`
--
ALTER TABLE `patient_info`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `patient_meal`
--
ALTER TABLE `patient_meal`
  MODIFY `MealID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `recorder`
--
ALTER TABLE `recorder`
  MODIFY `EventID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
