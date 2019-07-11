-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2019 at 10:00 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jqm_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `exams_report`
--

CREATE TABLE `exams_report` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `std_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `para_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `duration` varchar(100) NOT NULL,
  `remarks` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exams_report`
--

INSERT INTO `exams_report` (`id`, `class_id`, `std_id`, `course_id`, `para_id`, `start_date`, `end_date`, `duration`, `remarks`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 25, 3, 1, 1, '2019-07-12', '2019-07-31', '19 دن', 'awainn', '2019-07-11 19:52:04', '2019-07-11 19:52:04', 1, 1),
(2, 25, 2, 2, 2, '2019-07-12', NULL, '', '', '2019-07-11 19:31:41', '0000-00-00 00:00:00', 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `exams_report`
--
ALTER TABLE `exams_report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `std_id` (`std_id`),
  ADD KEY `para_id` (`para_id`),
  ADD KEY `std_class_id` (`course_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `exams_report`
--
ALTER TABLE `exams_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `exams_report`
--
ALTER TABLE `exams_report`
  ADD CONSTRAINT `exams_report_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `std_class_name` (`class_name_id`),
  ADD CONSTRAINT `exams_report_ibfk_2` FOREIGN KEY (`std_id`) REFERENCES `std_personal_info` (`std_id`),
  ADD CONSTRAINT `exams_report_ibfk_3` FOREIGN KEY (`para_id`) REFERENCES `paraay` (`id`),
  ADD CONSTRAINT `exams_report_ibfk_4` FOREIGN KEY (`course_id`) REFERENCES `std_course` (`course_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
