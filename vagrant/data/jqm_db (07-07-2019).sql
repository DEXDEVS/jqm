-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2019 at 03:50 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

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
-- Table structure for table `account_nature`
--

CREATE TABLE `account_nature` (
  `account_nature_id` int(11) NOT NULL,
  `account_nature_name` varchar(64) NOT NULL,
  `account_nature_status` enum('+ve','-ve') NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account_nature`
--

INSERT INTO `account_nature` (`account_nature_id`, `account_nature_name`, `account_nature_status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Expense', '-ve', '2016-03-12 00:00:00', '2016-03-12 00:00:00', 1, 1),
(2, 'Income', '+ve', '2016-03-12 00:00:00', '2016-03-12 00:00:00', 1, 1),
(3, 'Capital', '+ve', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(4, 'Liability', '-ve', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(5, 'Assets', '+ve', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `account_register`
--

CREATE TABLE `account_register` (
  `account_register_id` int(11) NOT NULL,
  `account_nature_id` int(11) NOT NULL,
  `account_name` varchar(64) NOT NULL,
  `account_description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account_register`
--

INSERT INTO `account_register` (`account_register_id`, `account_nature_id`, `account_name`, `account_description`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(2, 1, 'Utility Bill', 'dfghjjhbgvvgh', '2018-10-02 14:06:50', '0000-00-00 00:00:00', 2, 0),
(3, 1, 'Refreshment', 'dfghjkjhgfdfgh', '2018-10-02 14:09:42', '0000-00-00 00:00:00', 2, 0),
(4, 1, 'Internet Bill', 'dfghjkjhcvb', '2018-10-02 14:14:21', '0000-00-00 00:00:00', 2, 0),
(5, 2, 'Student Fee', 'Student Tuition Fee ', '2019-03-07 17:02:36', '0000-00-00 00:00:00', 3, 0),
(6, 1, 'Furniture', 'Purchase Chair', '2019-04-06 14:15:39', '2019-04-26 20:49:14', 1, 4),
(7, 3, 'Building', 'Institute own building.', '2019-04-15 12:06:06', '0000-00-00 00:00:00', 3, 0),
(8, 2, 'Fun Fair', 'Student fun fair annual party', '2019-04-26 21:12:16', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `trans_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `account_nature` varchar(11) NOT NULL,
  `account_register_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `description` varchar(200) NOT NULL,
  `total_amount` double NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_transactions`
--

INSERT INTO `account_transactions` (`trans_id`, `branch_id`, `account_nature`, `account_register_id`, `date`, `description`, `total_amount`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 6, 'Expense', 2, '2019-04-26 01:47:44', 'Utility Bill', 123, '2019-04-26 13:48:00', '0000-00-00 00:00:00', 4, 0),
(3, 6, 'Income', 5, '2019-04-26 14:16:17', 'Amount P By Voucher #: 1008', 1000, '2019-04-26 14:16:17', '0000-00-00 00:00:00', 4, 0),
(4, 6, 'Income', 5, '2019-04-26 14:17:41', 'Amount Partially Paid By Voucher #: 1008', 1000, '2019-04-26 14:17:41', '0000-00-00 00:00:00', 4, 0),
(5, 6, 'Income', 5, '2019-04-26 14:21:13', 'Amount Partially Paid By Voucher #: 1008', 10000, '2019-04-26 14:21:13', '0000-00-00 00:00:00', 4, 0),
(6, 6, 'Expense', 6, '2019-05-12 08:45:30', 'Purchase 10 student chairs', 2000, '2019-04-26 20:50:20', '0000-00-00 00:00:00', 4, 0),
(7, 5, 'Expense', 2, '2019-04-26 08:54:08', 'Utility Bill', 10000, '2019-04-26 20:54:27', '0000-00-00 00:00:00', 1, 0),
(8, 5, 'Income', 8, '2019-04-26 09:12:36', 'Fun fair amount of main campus', 5000, '2019-04-26 21:13:13', '0000-00-00 00:00:00', 1, 0),
(9, 5, 'Expense', 4, '2019-05-07 09:10:27', 'Internet Bill', 1000, '2019-04-26 21:14:18', '0000-00-00 00:00:00', 1, 0),
(10, 5, 'Income', 5, '2019-04-26 22:02:34', 'Amount Paid By Voucher #: 1014', 3000, '2019-04-26 22:02:34', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('Accountant', '6', NULL),
('admin', '97', NULL),
('dexdevs', '1', NULL),
('dexdevs2', '4', NULL),
('Inquiry Head', '48', NULL),
('Principal', '7', NULL),
('Superadmin', '3', NULL),
('Vice Principal', '5', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('Accountant', 1, 'can login', NULL, NULL, NULL, NULL),
('add-institute', 1, 'create institute Name', NULL, NULL, NULL, NULL),
('admin', 1, 'admin of the application', NULL, NULL, NULL, NULL),
('dexdevs', 1, 'Admin of the application', NULL, NULL, NULL, NULL),
('dexdevs2', 1, NULL, NULL, NULL, NULL, NULL),
('Inquiry Head', 1, 'Inquiry Head can manage activities of student inquiries only.', NULL, NULL, NULL, NULL),
('inquiry-nav', 1, 'can access this nav', NULL, NULL, NULL, NULL),
('login', 1, 'The user can login in the admin panel.', NULL, NULL, NULL, NULL),
('navigation ', 1, 'Navigation can be access authorized users only.', NULL, NULL, NULL, NULL),
('Principal', 1, 'Principal can manage whole activities in the application except account department', NULL, NULL, NULL, NULL),
('Superadmin', 1, 'Superadmin can manage whole activities in the application.', NULL, NULL, NULL, NULL),
('update-institute-name', 1, 'can update the institute name.', NULL, NULL, NULL, NULL),
('Vice Principal', 1, 'Can view whole reports.', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('Accountant', 'login'),
('admin', 'login'),
('admin', 'navigation '),
('dexdevs', 'login'),
('dexdevs', 'navigation '),
('dexdevs2', 'login'),
('dexdevs2', 'navigation '),
('Inquiry Head', 'add-institute'),
('Inquiry Head', 'inquiry-nav'),
('Inquiry Head', 'login'),
('Principal', 'login'),
('Principal', 'navigation '),
('Superadmin', 'login'),
('Superadmin', 'navigation '),
('Vice Principal', 'login'),
('Vice Principal', 'navigation ');

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `branch_id` int(11) NOT NULL,
  `institute_id` int(11) NOT NULL,
  `branch_code` varchar(32) NOT NULL,
  `branch_name` varchar(32) NOT NULL,
  `branch_type` enum('Franchise','Group') NOT NULL,
  `branch_location` varchar(50) NOT NULL,
  `branch_contact_no` varchar(32) NOT NULL,
  `branch_email` varchar(100) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `branch_head_name` varchar(50) NOT NULL,
  `branch_head_contact_no` varchar(15) NOT NULL,
  `branch_head_email` varchar(120) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`branch_id`, `institute_id`, `branch_code`, `branch_name`, `branch_type`, `branch_location`, `branch_contact_no`, `branch_email`, `status`, `branch_head_name`, `branch_head_contact_no`, `branch_head_email`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(5, 2, 'RYK01', 'Main Branch', 'Group', 'Jammia Qadria Road', '068-58-75860', 'jammiaqadria@gmail.com', 'Active', 'Qari Nauman Sahab', '+92-333-7668866', 'qarinauman@gmail.com', '2019-06-14 20:01:48', '2019-06-14 20:01:48', 1, 97, 1),
(6, 2, 'RYK02', 'Sub Campus', 'Group', 'Business Man Colony', '068-58-87526', 'subcampus@gmail.com', 'Active', 'Ma\'am Nadia Gull', '+92-345-3456787', 'nadiagull@gmail.com', '2019-03-16 07:03:19', '0000-00-00 00:00:00', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `concession`
--

CREATE TABLE `concession` (
  `concession_id` int(11) NOT NULL,
  `concession_name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `concession`
--

INSERT INTO `concession` (`concession_id`, `concession_name`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, '100% Concession ', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 1, 1),
(2, '90% Concession ', '2019-01-10 08:16:15', '0000-00-00 00:00:00', 1, 1, 1),
(3, '80% Concession', '2019-01-10 08:16:39', '2019-01-10 08:16:39', 1, 1, 1),
(4, '70% Concession', '2019-01-10 08:16:54', '2019-01-10 08:16:54', 1, 1, 1),
(5, '60% Concession', '2019-01-10 08:17:28', '0000-00-00 00:00:00', 1, 0, 1),
(6, '50% Concession', '2019-01-10 08:17:47', '0000-00-00 00:00:00', 1, 0, 1),
(7, '40% Concession ', '2019-01-10 08:18:40', '2019-01-10 08:18:40', 1, 1, 1),
(8, '30% Concession', '2019-01-10 08:18:08', '0000-00-00 00:00:00', 1, 0, 1),
(9, '25% Concession', '2019-01-10 08:18:19', '0000-00-00 00:00:00', 1, 0, 1),
(10, 'Kinship', '2019-01-10 08:18:27', '0000-00-00 00:00:00', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `custom_sms`
--

CREATE TABLE `custom_sms` (
  `id` int(11) NOT NULL,
  `send_to` text NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custom_sms`
--

INSERT INTO `custom_sms` (`id`, `send_to`, `message`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, '923063772105', '<p>Hello,</p><p>This is testing <b><i>SMS.</i></b></p>', '2019-03-08 15:24:28', '0000-00-00 00:00:00', 8, 0),
(2, '923063772106', '<p>\r\n\r\nTesting <b><i>SMS.</i></b>\r\n\r\n<br></p>', '2019-03-08 16:02:54', '0000-00-00 00:00:00', 8, 0),
(3, '923317375027', '<p>Testing SMS from web application.</p>', '2019-03-08 16:08:41', '0000-00-00 00:00:00', 8, 0),
(4, '923063772106', 'This is testing SMS from Brookfield.', '2019-03-08 16:14:43', '0000-00-00 00:00:00', 8, 0),
(5, '923063772105', 'Testing SMS.', '2019-03-08 16:23:59', '0000-00-00 00:00:00', 8, 0),
(6, '923063772106', 'Testing SMS.', '2019-03-08 16:26:31', '0000-00-00 00:00:00', 8, 0),
(8, '923063772106', 'Testing SMS.', '2019-03-08 16:36:02', '0000-00-00 00:00:00', 8, 0),
(9, '923041422508', 'This is testing SMS by DEXDEVS from Brookfield web application.', '2019-03-08 16:37:40', '0000-00-00 00:00:00', 8, 0),
(10, '923063772105', 'This is testing SMS by DEXDEVS from Brookfield web application.', '2019-03-08 16:39:10', '0000-00-00 00:00:00', 8, 0),
(11, '923356383287', 'This is testing SMS by DEXDEVS from Brookfield web application.', '2019-03-08 16:40:13', '0000-00-00 00:00:00', 8, 0),
(12, '923006773327', 'This is testing SMS by DEXDEVS from Brookfield web application.', '2019-03-08 16:41:07', '0000-00-00 00:00:00', 8, 0),
(13, '923006999824', 'This is testing SMS by DEXDEVS from Brookfield web application.\r\n\r\nTask completed by Nauman & Anas.', '2019-03-08 16:42:14', '0000-00-00 00:00:00', 8, 0);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(100) NOT NULL,
  `department_description` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `department_name`, `department_description`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Computer Science Department', 'Computer Science Department', '2019-02-19 05:42:48', '0000-00-00 00:00:00', 3, 0),
(2, 'Biology Department', 'Biology Department', '2019-02-19 05:43:07', '0000-00-00 00:00:00', 3, 0),
(3, 'Chemistry Department', 'Chemistry Department', '2019-02-19 05:43:25', '0000-00-00 00:00:00', 3, 0),
(4, 'Physics Department', 'Physics Department', '2019-02-19 05:43:44', '0000-00-00 00:00:00', 3, 0),
(5, 'Mathematics Department', 'Mathematics Department', '2019-02-19 05:44:16', '0000-00-00 00:00:00', 3, 0),
(6, 'Urdu Department', 'Urdu Department', '2019-02-19 05:44:42', '0000-00-00 00:00:00', 3, 0),
(7, 'English Department', 'English Department', '2019-02-19 05:45:05', '0000-00-00 00:00:00', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `emial_id` int(11) NOT NULL,
  `receiver_name` varchar(60) NOT NULL,
  `receiver_email` varchar(120) NOT NULL,
  `email_subject` varchar(255) NOT NULL,
  `email_content` text NOT NULL,
  `email_attachment` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emails`
--

INSERT INTO `emails` (`emial_id`, `receiver_name`, `receiver_email`, `email_subject`, `email_content`, `email_attachment`, `created_at`, `created_by`, `updated_at`, `updated_by`, `delete_status`) VALUES
(1, 'Anas', 'anasshafqat01@gmail.com', 'Welcome', 'This is testing email from yii2...!', 'attachments/1545482896.png', '2018-12-22 12:48:24', 0, '0000-00-00 00:00:00', 0, 1),
(3, 'Anas Shafqat', 'anasshafqat01@gmail.com', 'Wellcome to DEXDEVS', 'This is testing email from Yii2...!', 'attachments/1545483278.png', '2018-12-22 12:54:44', 1, '0000-00-00 00:00:00', 0, 1),
(4, 'Saif ur Rehman', 'saifarshad.6987@gmail.com', 'Wellcome To DEXDEVS', 'This is testing email from Yii2...!', 'attachments/1545483348.png', '2018-12-22 12:55:52', 1, '0000-00-00 00:00:00', 0, 1),
(5, 'Nauman Shahid', 'hwhasmhi1625@gmail.com', 'Wellcome To DEXDEVS', 'This is testing email from Yii2...!', 'attachments/1545483409.png', '2018-12-22 12:56:55', 1, '0000-00-00 00:00:00', 0, 1),
(6, 'Nauman Shahid', 'hwhashmi1625@gmail.com', 'Wellcome To DEXDEVS', 'This is testing email with file attachment from Yii2...!', 'attachments/1545483610.png', '2018-12-22 13:00:16', 1, '0000-00-00 00:00:00', 0, 1),
(7, 'Nadia Gull', 'nadiagull285@gmail.com', 'Wellcome To DEXDEVS', 'This is testing email with file attachment from Yii2...!', 'attachments/1545483685.png', '2018-12-22 13:01:39', 1, '0000-00-00 00:00:00', 0, 1),
(8, 'Kinza Fatima', 'kinza.fatima522@gmail.com', 'Wellcome To DEXDEVS', 'This is testing email with file attachment from Yii2...!', 'attachments/1545483773.png', '2018-12-22 13:02:59', 1, '0000-00-00 00:00:00', 0, 1),
(9, 'Rana Faraz', 'ranafarazahmed@gmail.com', 'Wellcome To DEXDEVS', 'This is testing email with file attachment from Yii2...!	', 'attachments/1545484174.png', '2018-12-22 13:09:38', 1, '0000-00-00 00:00:00', 0, 1),
(10, 'Anas Shafqat', 'anasshafqat01@gmail.com', 'Wellcome To DEXDEVS', 'This is testing email with file attachment from Yii2...!', 'attachments/1545484846.jpg', '2018-12-31 10:46:04', 1, '2018-12-31 10:46:04', 1, 0),
(11, 'anas', 'anasshafqat01@gmail.com', 'helli', 'mlklkk', 'attachments/1545761723.jpg', '2018-12-31 10:44:52', 1, '2018-12-31 10:44:52', 1, 0),
(12, 'Anas', 'anasshafqat01@gmail.com', 'Hello', 'heloo heloo heloo heloo', 'attachments/1545764108.jpg', '2018-12-31 11:11:53', 1, '2018-12-31 11:11:53', 1, 0),
(13, 'Anas', 'anasshafqat01@gmail.com', 'Hello', 'Testing Email....', 'attachments/1545804180.jpg', '2018-12-26 06:03:14', 1, '0000-00-00 00:00:00', 0, 1),
(14, 'khh', 'anasshafqat01@gmail.com', 'hello', 'jkhjkh', 'attachments/1545816221.sql', '2018-12-26 09:23:48', 1, '0000-00-00 00:00:00', 0, 1),
(15, 'Mehtab', 'chmehtab4@gmail.com', 'Hello', 'This is testing Email with file attachment from Yii2....', 'attachments/1546064434.png', '2018-12-29 06:21:12', 1, '0000-00-00 00:00:00', 0, 1),
(16, 'Anas Shafqat', 'anasshafqat01@gmail.com', 'Wellcome', 'Testing Email...', 'attachments/1546066690.png', '2018-12-29 06:58:16', 1, '0000-00-00 00:00:00', 0, 1),
(17, 'Anas Shafqat', 'anasshafqat01@gmail.com', 'Hello', '<h2>Hello Sir,</h2><p><b><i>This is testing email from yii2...</i></b><br></p><p><b><i><br></i></b></p><p><b></b>Regards<b></b></p><p><b><i>Anas Shafqat</i></b></p>', 'attachments/1546068232.mp4', '2018-12-29 07:26:27', 1, '0000-00-00 00:00:00', 0, 1),
(18, 'Rana Faraz', 'ranafarazahmed@gmail.com', 'Testing Email', '<h2><b>Hello Sir,</b></h2><p><b><i></i><i>This is testing Email from Yii2 with text formatting.</i><i></i></b><b></b></p><p><b><i><br></i></b></p><p><b>Note:</b></p><p><ol><li><i>jkhjhj</i></li><li><i>erwrwe</i></li><li><i>werwe</i></li><li><i>were</i></li><li><i>werwerwr</i></li></ol><p>Regards,<br></p><p><b><i>Anas Shafqat</i></b></p></p>', 'attachments/1546069705.jpg', '2018-12-29 07:48:30', 1, '0000-00-00 00:00:00', 0, 1),
(19, 'ans', 'anasshafqat01@gmail.com', 'hello', '<p><b><i>anasshafqat01@gmail.com</i></b><br></p>', 'attachments/1548138607.jpg', '2019-01-22 06:30:23', 9, '0000-00-00 00:00:00', 0, 1),
(20, 'Kinza Mustafah', 'kinza@gmail.com', 'Wellcome', 'Hello....', '', '2019-03-04 09:49:21', 0, '0000-00-00 00:00:00', 0, 1),
(21, 'Kinza Mustafah', 'kinza@gmail.com', 'Wellcome', 'Hello....', '', '2019-03-04 09:49:40', 0, '0000-00-00 00:00:00', 0, 1),
(22, 'Rana Faraz', 'ranafarazahmed@gmail.com', 'Testing', '<p>lkjhgfdsdfghjk</p>', 'attachments/1551947170.jpg', '2019-03-07 08:26:26', 3, '0000-00-00 00:00:00', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `emp_attendance`
--

CREATE TABLE `emp_attendance` (
  `att_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `att_date` date NOT NULL,
  `check_in` time DEFAULT NULL,
  `check_out` time DEFAULT NULL,
  `attendance` varchar(2) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_attendance`
--

INSERT INTO `emp_attendance` (`att_id`, `branch_id`, `emp_id`, `att_date`, `check_in`, `check_out`, `attendance`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 5, 2, '2019-04-01', '10:34:36', '10:38:53', 'P', 1, 1, '2019-04-26 08:34:36', '2019-04-26 08:38:53'),
(4, 5, 1, '2019-04-01', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-26 08:46:43', '0000-00-00 00:00:00'),
(5, 5, 3, '2019-04-01', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-26 08:46:43', '0000-00-00 00:00:00'),
(6, 5, 4, '2019-04-01', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-26 08:46:43', '0000-00-00 00:00:00'),
(7, 5, 5, '2019-04-01', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-26 08:46:43', '0000-00-00 00:00:00'),
(8, 5, 6, '2019-04-01', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-26 08:46:43', '0000-00-00 00:00:00'),
(9, 5, 7, '2019-04-01', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-26 08:46:43', '0000-00-00 00:00:00'),
(10, 5, 8, '2019-04-01', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-26 08:46:43', '0000-00-00 00:00:00'),
(11, 5, 9, '2019-04-01', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-26 08:46:43', '0000-00-00 00:00:00'),
(12, 5, 11, '2019-04-01', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-26 08:46:43', '0000-00-00 00:00:00'),
(13, 5, 1, '2019-04-26', '00:00:00', '00:00:00', 'L', 1, 0, '2019-04-26 15:34:22', '0000-00-00 00:00:00'),
(14, 5, 1, '2019-04-27', '00:00:00', '00:00:00', 'L', 1, 0, '2019-04-26 15:34:22', '0000-00-00 00:00:00'),
(15, 5, 1, '2019-04-28', '00:00:00', '00:00:00', 'L', 1, 0, '2019-04-26 15:34:22', '0000-00-00 00:00:00'),
(16, 5, 3, '2019-04-26', '21:24:55', NULL, 'P', 1, 0, '2019-04-26 19:24:55', '0000-00-00 00:00:00'),
(17, 5, 2, '2019-04-26', '00:00:00', '00:00:00', 'A', 1, 1, '2019-04-26 19:34:06', '2019-04-26 19:36:26'),
(18, 5, 4, '2019-04-26', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-26 19:34:06', '0000-00-00 00:00:00'),
(19, 5, 5, '2019-04-26', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-26 19:34:06', '0000-00-00 00:00:00'),
(20, 5, 6, '2019-04-26', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-26 19:34:06', '0000-00-00 00:00:00'),
(21, 5, 7, '2019-04-26', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-26 19:34:06', '0000-00-00 00:00:00'),
(22, 5, 8, '2019-04-26', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-26 19:34:06', '0000-00-00 00:00:00'),
(23, 5, 9, '2019-04-26', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-26 19:34:06', '0000-00-00 00:00:00'),
(24, 5, 11, '2019-04-26', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-26 19:34:06', '0000-00-00 00:00:00'),
(25, 5, 2, '2019-04-27', '10:49:23', NULL, 'P', 1, 0, '2019-04-27 08:49:23', '0000-00-00 00:00:00'),
(26, 5, 3, '2019-04-27', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-27 08:51:34', '0000-00-00 00:00:00'),
(27, 5, 4, '2019-04-27', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-27 08:51:34', '0000-00-00 00:00:00'),
(28, 5, 5, '2019-04-27', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-27 08:51:34', '0000-00-00 00:00:00'),
(29, 5, 6, '2019-04-27', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-27 08:51:34', '0000-00-00 00:00:00'),
(30, 5, 7, '2019-04-27', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-27 08:51:34', '0000-00-00 00:00:00'),
(31, 5, 8, '2019-04-27', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-27 08:51:34', '0000-00-00 00:00:00'),
(32, 5, 9, '2019-04-27', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-27 08:51:34', '0000-00-00 00:00:00'),
(33, 5, 11, '2019-04-27', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-27 08:51:34', '0000-00-00 00:00:00'),
(34, 5, 2, '2019-05-13', '11:23:08', '11:24:29', 'P', 1, 1, '2019-05-13 06:23:08', '2019-05-13 06:24:29'),
(35, 5, 1, '2019-05-13', '23:26:36', '19:40:30', 'P', 1, 1, '2019-05-13 18:26:36', '2019-05-13 14:40:30'),
(36, 5, 3, '2019-05-04', '11:33:40', NULL, 'P', 1, 0, '2019-05-04 06:33:40', '0000-00-00 00:00:00'),
(37, 5, 2, '2019-05-18', '11:51:03', NULL, 'P', 1, 0, '2019-05-18 06:51:03', '0000-00-00 00:00:00'),
(38, 5, 2, '2019-05-20', '12:11:36', NULL, 'P', 1, 0, '2019-05-20 07:11:36', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `emp_departments`
--

CREATE TABLE `emp_departments` (
  `emp_department_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_departments`
--

INSERT INTO `emp_departments` (`emp_department_id`, `emp_id`, `dept_id`) VALUES
(1, 4, 1),
(2, 1, 5),
(3, 5, 1),
(4, 8, 5),
(5, 9, 4);

-- --------------------------------------------------------

--
-- Table structure for table `emp_designation`
--

CREATE TABLE `emp_designation` (
  `emp_designation_id` int(11) NOT NULL,
  `emp_designation` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_designation`
--

INSERT INTO `emp_designation` (`emp_designation_id`, `emp_designation`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 'Principal', '2018-10-31 08:17:08', '2018-10-31 08:17:08', 1, 1, 1),
(2, 'Vise Principal', '2018-10-31 08:17:30', '2018-10-31 08:17:30', 1, 1, 1),
(3, 'Coordinator', '2018-10-31 08:23:02', '0000-00-00 00:00:00', 1, 0, 1),
(4, 'Teacher', '2018-10-31 08:23:21', '0000-00-00 00:00:00', 1, 0, 1),
(5, 'Security Gaurd', '2018-10-31 09:55:43', '2018-10-31 09:55:43', 1, 1, 1),
(6, 'Accountant', '2018-12-07 06:29:32', '0000-00-00 00:00:00', 1, 0, 1),
(7, 'Librarian', '2019-01-14 17:59:26', '0000-00-00 00:00:00', 0, 0, 1),
(8, 'Office Boy', '2019-02-20 13:33:12', '0000-00-00 00:00:00', 9, 0, 1),
(9, 'HOD', '2019-02-22 07:33:33', '2019-02-22 07:33:33', 9, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `emp_documents`
--

CREATE TABLE `emp_documents` (
  `emp_document_id` int(11) NOT NULL,
  `emp_info_id` int(11) NOT NULL,
  `emp_document_name` varchar(30) NOT NULL,
  `emp_document` varchar(120) NOT NULL,
  `delete_status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_documents`
--

INSERT INTO `emp_documents` (`emp_document_id`, `emp_info_id`, `emp_document_name`, `emp_document`, `delete_status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(10, 2, '', 'uploads/2_DFD 0 level.PNG', 1, '2019-02-20 08:34:38', '0000-00-00 00:00:00', 9, 0),
(11, 2, '', 'uploads/2_DFD 1 level.PNG', 1, '2019-02-20 08:51:38', '0000-00-00 00:00:00', 9, 0),
(12, 2, '', 'uploads/2_CODING.jpg', 1, '2019-02-21 05:07:07', '0000-00-00 00:00:00', 9, 0),
(13, 1, '', 'uploads/1_ER Diagram of Hospital_DB.PNG', 1, '2019-02-21 05:27:58', '0000-00-00 00:00:00', 9, 0),
(14, 1, '', 'uploads/1_DFD 1 level.PNG', 1, '2019-02-21 05:30:06', '0000-00-00 00:00:00', 9, 0),
(15, 1, '', 'uploads/1_Cnic Backk.jpg', 1, '2019-02-21 05:33:21', '0000-00-00 00:00:00', 9, 0),
(16, 1, '', 'uploads/1_ER Diagram of Hospital_DB.PNG', 1, '2019-02-21 05:36:19', '0000-00-00 00:00:00', 9, 0),
(17, 1, '', 'uploads/1_DFD 1 level.PNG', 1, '2019-02-21 05:37:11', '0000-00-00 00:00:00', 9, 0),
(18, 3, 'BSCS Degree', 'uploads/3_Capture.PNG', 0, '2019-04-06 05:55:48', '2019-04-06 05:55:48', 9, 1),
(19, 3, 'Web Development Certificate', 'uploads/3Web Development Certificate_Anas Shafqat 10293858.jpg', 0, '2019-04-06 05:55:54', '2019-04-06 05:55:54', 9, 1),
(20, 3, 'Certificate Logo', 'uploads/3_Certified partner Banner.jpg', 0, '2019-04-06 05:56:00', '2019-04-06 05:56:00', 9, 1),
(21, 3, 'BForm', 'uploads/3_browser-market-shares-in (1).png', 0, '2019-04-06 05:56:06', '2019-04-06 05:56:06', 9, 1),
(22, 1, 'BSCS Degree', 'uploads/1_course_Page-1.jpg', 1, '2019-02-24 06:39:59', '0000-00-00 00:00:00', 9, 0),
(23, 2, 'Web Development Certificate', 'uploads/2_Anas Shafqat 10293858.jpg', 1, '2019-02-24 06:46:28', '0000-00-00 00:00:00', 9, 0),
(24, 5, 'BSCS Degree', 'uploads/5_My Updated Cv.pdf', 1, '2019-02-24 06:50:37', '0000-00-00 00:00:00', 9, 0),
(25, 7, 'MSC Degree', 'uploads/7_1.jpeg', 1, '2019-02-24 07:05:19', '0000-00-00 00:00:00', 9, 0),
(26, 7, 'Certificate Logo', 'uploads/7_WhatsApp Image 2018-08-08 at 1.14.06 PM.jpeg', 1, '2019-02-24 07:36:27', '0000-00-00 00:00:00', 9, 0),
(27, 7, 'BForm', 'uploads/7_Certified partner Banner.jpg', 1, '2019-02-24 07:37:38', '0000-00-00 00:00:00', 9, 0),
(28, 3, 'BSCS Degree', 'uploads/3_BSCS Degree.docx', 1, '2019-04-06 05:58:53', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `emp_info`
--

CREATE TABLE `emp_info` (
  `emp_id` int(11) NOT NULL,
  `emp_reg_no` varchar(50) NOT NULL,
  `emp_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `emp_father_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `emp_cnic` varchar(15) NOT NULL,
  `emp_contact_no` varchar(15) NOT NULL,
  `emp_perm_address` varchar(200) CHARACTER SET utf8 NOT NULL,
  `emp_temp_address` varchar(200) CHARACTER SET utf8 NOT NULL,
  `emp_marital_status` enum('Single','Married') NOT NULL,
  `emp_fb_ID` varchar(30) CHARACTER SET utf8 NOT NULL,
  `emp_gender` enum('Male','Female') NOT NULL,
  `emp_photo` varchar(200) CHARACTER SET utf8 NOT NULL,
  `barcode` longblob NOT NULL,
  `emp_designation_id` int(11) NOT NULL,
  `emp_type_id` int(11) NOT NULL,
  `emp_salary_type` enum('Salaried','Per Lecture') NOT NULL,
  `group_by` enum('Faculty','Management','Clerical Staff','Office Boys','Security Guard') NOT NULL,
  `emp_branch_id` int(11) NOT NULL,
  `emp_email` varchar(84) NOT NULL,
  `emp_qualification` varchar(50) CHARACTER SET utf8 NOT NULL,
  `emp_passing_year` int(11) NOT NULL,
  `emp_institute_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `degree_scan_copy` varchar(200) CHARACTER SET utf8 NOT NULL,
  `emp_cv` varchar(200) CHARACTER SET utf8 NOT NULL,
  `emp_salary` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_info`
--

INSERT INTO `emp_info` (`emp_id`, `emp_reg_no`, `emp_name`, `emp_father_name`, `emp_cnic`, `emp_contact_no`, `emp_perm_address`, `emp_temp_address`, `emp_marital_status`, `emp_fb_ID`, `emp_gender`, `emp_photo`, `barcode`, `emp_designation_id`, `emp_type_id`, `emp_salary_type`, `group_by`, `emp_branch_id`, `emp_email`, `emp_qualification`, `emp_passing_year`, `emp_institute_name`, `degree_scan_copy`, `emp_cv`, `emp_salary`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 'EMP-Y19-1', 'Kinza Mustafa', 'G Mustafa', '45102-0511722-2', '+92-345-6789098', 'RYK', 'RYK', 'Single', 'Kinza@gmail.com', 'Female', 'uploads/Kinza Mustafa_emp_photo.jpg', '', 1, 4, 'Salaried', 'Faculty', 5, 'kinza.fatima.522@gmail.com', 'BSCS', 2017, 'IUB', 'uploads/Kinza Mustafa_degree_scan_copy.jpg', '', 10000, '2019-04-18 07:06:58', '2019-04-06 06:01:51', 3, 1, 1),
(2, 'EMP-Y19-2', 'Nadia', 'Gull', '88888-8888888-8', '+92-345-6789999', 'ryk', 'ryk', 'Single', 'fghj@gmail.com', 'Female', 'uploads/nadia_emp_photo.jpg', '', 4, 5, 'Per Lecture', 'Faculty', 6, 'fghj@gmail.com', 'BSCS', 2019, 'fghjk', 'uploads/Nadia_degree_scan_copy.png', '', 1300, '2019-05-31 04:54:51', '2019-04-06 05:40:28', 3, 4, 1),
(3, 'EMP-Y19-3', 'Nauman', 'shahid', '31303-0511722-2', '+92-331-5698895', 'RYK', 'RYK', 'Married', 'nauman@gmail.com', 'Male', 'uploads/Nauman_emp_photo.jpg', '', 4, 5, 'Per Lecture', 'Faculty', 5, 'nauman@gmail.com', 'BSCS', 2108, 'Superior', 'uploads/Nauman_degree_scan_copy.jpg', '', 1000, '2019-04-18 07:07:22', '2019-04-06 06:05:48', 8, 1, 1),
(4, 'EMP-Y19-4', 'Ayesha', 'Ali', '46545-4654654-6', '+92-345-6787654', 'RYK', 'RYK', 'Single', 'ayesha@gmail.com', 'Female', 'uploads/Ayesha_emp_photo.png', '', 9, 4, 'Salaried', 'Faculty', 6, 'ayesha@gmail.com', 'BSCS', 2018, 'Superior', 'uploads/Ayesha_degree_scan_copy.xps', '', 40000, '2019-05-31 04:55:35', '2019-04-20 08:15:20', 8, 3, 1),
(5, 'EMP-Y19-5', 'Qasim Khan', 'M. Ali Khan', '12345-6789098-7', '34', 'RYK', 'RYK', 'Married', 'qasim@gmail.com', 'Male', '0', '', 4, 4, 'Salaried', 'Faculty', 5, 'ali@gmail.com', 'BSCS', 2018, 'Superior College', '0', '', 25000, '2019-02-24 06:39:07', '0000-00-00 00:00:00', 9, 0, 1),
(6, 'EMP-Y19-6', 'Shahzaib Akram', 'Akram Ali', '12345-6543234-5', '92', 'Gulshan Iqbal', 'Gulshan Iqbal', 'Single', 'shahzaib@gmail.com', 'Male', '0', '', 4, 4, 'Salaried', 'Faculty', 5, 'shahzaib@gmail.com', 'MSC Maths', 2018, 'IUB', '0', '', 25000, '2019-02-24 07:02:07', '2019-02-24 07:02:07', 9, 9, 1),
(7, 'EMP-Y19-7', 'Adnan Akram', 'Akram Ali', '12345-6787654-3', '92', 'RYK', 'RYK', 'Single', 'adnan@gmail.com', 'Male', '0', '', 4, 4, 'Salaried', 'Faculty', 5, 'adnan@gmail.com', 'MSC Maths', 2018, 'IUB', '0', '', 25000, '2019-02-24 07:04:41', '2019-02-24 07:04:41', 9, 9, 1),
(8, 'EMP-Y19-8', 'Sajid Umar', 'Umar Khan', '12345-6787654-7', '92', 'Gulshan Iqbal', 'Gulshan Iqbal', 'Single', 'sajid@gmail.com', 'Male', 'uploads/Sajid Umar_emp_photo.jpeg', '', 4, 4, 'Salaried', 'Faculty', 5, 'sajid@gmail.com', 'MSC Maths', 2018, 'IUB', '0', '', 25000, '2019-02-24 07:01:02', '0000-00-00 00:00:00', 9, 0, 1),
(9, 'EMP-Y19-9', 'Zia ur Rehman', 'A. Rehman', '31303-2345678-8', '92', 'Gulshan Iqbal', 'Gulshan Iqbal', 'Single', 'zia@gmail.com', 'Male', 'uploads/Zia ur Rehman_emp_photo.jpg', '', 4, 4, 'Salaried', 'Faculty', 5, 'zia@gmail.com', 'MSC Physics', 2018, 'IUB', '0', '', 30000, '2019-02-25 04:39:20', '0000-00-00 00:00:00', 9, 0, 1),
(11, 'EMP-Y19-10', 'Sana Asad', 'Asad Ali', '31303-3456789-8', '+92-315-8410500', 'RYK', 'RYK', 'Single', '', 'Female', 'uploads/Sana Asad_emp_photo.jpg', '', 4, 2, 'Salaried', 'Faculty', 5, 'sana@gmail.com', 'M.Phil', 2017, 'QAU', 'uploads/Sana Asad_degree_scan_copy.jpg', '', 15000, '2019-04-04 07:52:55', '0000-00-00 00:00:00', 1, 0, 1),
(12, 'EMP-Y19-12', 'Hira Tahir', 'M Tahir', '31303-9879879-8', '+92-374-6783___', 'RYK', 'RYK', 'Single', '', 'Female', 'uploads/Hira Tahir_emp_photo.jpg', '', 1, 4, 'Salaried', 'Faculty', 6, 'hira07@gmail.com', 'BSCS', 2017, 'IUB', 'uploads/Hira Tahir_degree_scan_copy.jpg', 'uploads/Hira Tahir_emp_cv.jpg', 50000, '2019-05-20 06:56:58', '0000-00-00 00:00:00', 1, 0, 1),
(13, 'EMP-Y19-13', 'Laraib Mariyam', 'M Matloob', '31303-1231231-2', '+92-987-6543234', 'RYK', 'RYK', 'Single', '', 'Female', 'uploads/Laraib Mariyam_emp_photo.jpg', '', 4, 4, 'Salaried', 'Faculty', 5, 'hira07@gmail.com', 'BSCS', 2017, 'IUB', 'uploads/Laraib Mariyam_degree_scan_copy.jpg', 'uploads/Laraib Mariyam_emp_cv.jpg', 50000, '2019-05-20 07:48:03', '0000-00-00 00:00:00', 1, 0, 1),
(15, 'EMP-Y19-14', 'Nawal Shareef', 'M Shareef', '87556-8765676-5', '+76-543-4567___', 'RYK', 'RYK', 'Single', '', 'Female', 'uploads/Nawal Shareef_emp_photo.jpg', '', 4, 4, 'Salaried', 'Faculty', 5, 'nawal@gmail.com', 'BSCS', 2017, 'iub', 'uploads/Nawal Shareef_degree_scan_copy.jpg', 'uploads/Nawal Shareef_emp_cv.jpg', 60000, '2019-05-21 06:26:13', '0000-00-00 00:00:00', 1, 0, 1),
(16, 'EMP-Y19-16', 'Musaab Shareef', 'M Shareef', '23456-7898765-4', '+98-765-4323456', 'RYK', 'RYK', 'Single', '', 'Male', 'uploads/Musaab Shareef_emp_photo.jpg', '', 4, 1, 'Salaried', 'Faculty', 5, 'nawal@gmail.com', 'BSCS', 2017, 'iub', 'uploads/Musaab Shareef_degree_scan_copy.jpg', 'uploads/Musaab Shareef_emp_cv.jpg', 60000, '2019-05-22 05:48:29', '2019-05-22 05:48:29', 1, 1, 1),
(17, 'EMP-Y19-17', 'Nawal Shareef', 'M Shareef', '34567-8987654-3', '+98-765-4323456', 'RYK', 'RYK', 'Single', '', 'Female', 'uploads/Nawal Shareef_emp_photo.jpg', '', 4, 4, 'Salaried', 'Faculty', 5, 'nawal@gmail.com', 'BSCS', 2017, 'iub', 'uploads/Nawal Shareef_degree_scan_copy.jpg', 'uploads/Nawal Shareef_emp_cv.jpg', 40000, '2019-05-22 05:48:03', '0000-00-00 00:00:00', 1, 0, 1),
(19, 'EMP-Y19-18', 'ertyui', 'rtyui', '87654-3456788-7', '+98-765-4345678', 'RYK', 'RYK', 'Single', '', 'Male', 'uploads/ertyui_emp_photo.jpg', '', 5, 1, 'Salaried', 'Faculty', 5, 'musaab03@gmail.com', 'BSCS', 2017, 'iub', 'uploads/ertyui_degree_scan_copy.jpg', 'uploads/ertyui_emp_cv.jpg', 60000, '2019-05-22 06:06:10', '0000-00-00 00:00:00', 1, 0, 1),
(21, 'EMP-Y19-20', 'Adeela Atif', 'M Irshad', '67548-6547864-3', '+92-876-5433456', 'RYK', 'RYK', 'Married', '', 'Female', 'uploads/Adeela Atif_emp_photo.jpg', '', 3, 4, 'Salaried', 'Faculty', 5, 'adeela@gmail.com', 'BSCS', 2017, 'IUB RYK', '0', 'uploads/Adeela Atif_emp_cv.jpg', 7000, '2019-05-22 08:16:55', '0000-00-00 00:00:00', 1, 0, 1),
(22, 'EMP-Y19-22', 'Hira Farhan', 'M Irshad', '77788-6669966-6', '+92-987-6543456', 'RYK', 'RYK', 'Married', '', 'Female', 'uploads/Hira Farhan_emp_photo.jpg', '', 4, 4, 'Salaried', 'Faculty', 5, 'hira@gmail.com', 'MCS', 2000, 'KFUITE', 'uploads/Hira Farhan_degree_scan_copy.jpg', 'uploads/Hira Farhan_emp_cv.jpg', 30000, '2019-05-22 08:27:12', '0000-00-00 00:00:00', 1, 0, 1),
(23, 'EMP-Y19-23', 'Ali Irshad', 'M Irshad', '89646-7892536-8', '+98-765-43456__', 'RYK', 'RYK', 'Married', '', 'Male', 'uploads/Ali Irshad_emp_photo.jpg', '', 4, 4, 'Salaried', 'Faculty', 5, 'ali09@gmail.com', 'BSCS', 2017, 'KFUITE', 'uploads/Ali Irshad_degree_scan_copy.jpg', 'uploads/Ali Irshad_emp_cv.jpg', 30000, '2019-05-22 08:39:35', '0000-00-00 00:00:00', 1, 0, 1),
(24, 'EMP-Y19-24', 'Saad Shareef', 'M Shareef', '46897-6456775-4', '+92-876-5434567', 'RYK', 'RYK', 'Married', '', 'Male', 'uploads/Saad Shareef_emp_photo.jpg', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414850556c455156523458753264506378745178534733314d536e55496e6f6946525342514b4a4552444e424b466e2f68705249686f4a4472684374464a4e4349524a51714e52434d6f75416b536859614b526b524e532f6e4a2b733473333977354d3376576e44756e6d6d636e4e2f664c506e76507a3776584f2b396161362b39393037533566525062434141416b6368634f394f3068767033314574634249496749417551535373414153754867474964505559306749496f456a5941416a4d514142466d6f45696253795041455261336751415941594345476b47697253785041495161586b544149415a4345436b47536a5378764949514b546c545141415a6941416b5761675342764c497743526c6a6342414a69424145536167534a744c4938415246726542414267426749516151614b744c45384168427065524d4167426b49514b515a4b4e4c4738676841704f564e4141426d494143525a7142494738736a4543665332646e5a575153753357346e4f39542b74383150382f32324c7a2b6d50486272754e467a7666396a2b32754e5a617664664c367434364c7a79444563485575746a32692f355848526564534f69353772646844424c344a4c314161444e723033357659476b586f454c786543326b5573696571474f47704545554d38317368723834677559744635524d592f6776654d686243336d454f6b69764b5646326e4768594249463535466138466f45584a7230576d704934715571493172742f65416a7a47697949714f496c305a4e765155446b577178464b6a506a364b6442477634747064784f61354865486134646f4e7139376f5172546c736b5664336d683852624b686f445375486135647a515a3638525645676b674836587869704d4e6249424170455958375348336a6947594e6f7935573548374a694f7355376666596845596b57644a4c4470433149327633767a4b6853503146682f52334a3831426a45534d5249793051524a63752f3471693275334c776d4453424470774243696164365272464d30566946474f69526d744b794a577274306636686d62464544374d556f45514f7445614e33587756465170487359324f6247363464726c30766855335762762f56506f695556557567535032464935496d48306e5052785639784b50772f764f786c6e2f3362482f6e486259503544474b6b667361754862627458736f456f7030767461557273766f773354524654556136305657337045565039707652476d69535a695238555878692b4243736f466b773262362b46676a702f716236752b44696f4865765171796468633368626469765767714f616f7175486134647268323259335559315550496b456b694153526d6a6b35736e62704c5561314a454b3565704a7375436a74515a477535425245676b68586c4479527464756e37376d504e50684f76466151504a492b6a615a35716257727632306f6d71675977572f6b2b6e46446c706566564e2f4a634b7a62526671623944667037776d4a414967456b534153524f6f2b3539534c2f3871344b4b2b696f4e6175654d66344b55704d694a46343079705a4f374a325a4f303648334c6f715646534d6c3669583559545263746965497943787969635a436753696f51696f5569486a7a5830416b706970485a31416c6b37736e5a6b37636a616b6257726c575163572f75474968302b486a46534f54434b582b2b4a344d6a4e345a48786e634b6a6f4c4b4279675971477962457542414a496b456b694d54486d4775466c623058725551656a4975345536334541713464316438483565396272385631673648366d792f323464726832754861346472683275486131542b6133484e762b5435537171666773793538316f57765557785538504875373337745766512b5344546f6a7a774a4f6e4b664a74727673516d4e534c494552584c4e375a544c6f6b676f456f714549764639704f4c6c49434f78486f7245652b334f6c7844652f5831346e7755696e6473467a795078504e4a3252666a4d4f4178465170465170416b563568414a496b456b694e544d454f44615462677a7a73745065506e4a56434a3173743738444149724978442f394f584b4b444633454f6767414a457745524359674142456d67416954594141524d49475147414341684270416f6730415149514352734167516b49514b514a494e49454345436b696731634c2b6b3937617339666b752f7679627054556c6653587053306a2b5333705830764b51504a4c30733656394a643076365070317a6a3652664a583069365947736e36665376724c72577952394b756c325365557831762f76365477625839366d39664f4470504c384c787439573738665a3533376e42374d3975647a717448452b6a4a3858704c304e7a7753524b6f5977634f536e7042304b52484a69474f624761397652706962306a372f33517a3352556e76534c7057307475535873304d3752704a7230683676324a38526f3779654f2f4c6a4e61492b6c31477045636b665a694e5a2b74384f367a56647a34506d376352337865504c583759654778632b66785735684e454b71362b47636444616438586b76365539494b6b4f7955396e716e50485157522f704430567a72586c4d6f324d7a5a72777733546a4e59325534397973392f755436706e76376e4b4f41462b6b58526449704b50306675783431766e353851762b3761326e35623055564c5463727774596c686674306d366f62456f7245676f694a526439587a5666696152774d695275336e6d596e32547947424b5a43375336354c655369763073306e4a544a48793837625579495a676264316361636555783068716d79746737734c6c626c6e7466484d334932706b37627637616e2b3333453954506c4e645531582f4839644f75486235366d6e4762455a726975477273796c53376f36354b325247367a474c7134475279636e31733651664d3966486a503957535a2b6e447374594b69654b472f37586b75354b73566a756775566a3976303262696461535a7979627a2f2f4f556d6656647a4d2f4879506d32772b6a7958466461567575616b6f306f6f4970446d5841627a7464754e354e464d685679527a3964787471376c61356235652f474848753572646d5034324e544731793764534b54772b2b366c7976735634316b61746235747647576435503631344b3164435039595663585656777256724c423535764a43547a4e3234664a38547a74544c4d336d35676658634f683943726d61322b75644266363549755a726c326258612b5647337a6f377a73656378576d74746a6335706c62555a49713179705a6e6e53524741534365466c385a585151416972584b6c6d65644a455942494a345758786c6442344a784933307136764d714d6d5363496e4143422b2f34446c735875364c527a68774141414141415355564f524b35435949493d, 4, 3, 'Salaried', 'Faculty', 5, 'saad@gmail.com', 'MCS', 2017, 'KFUITE', 'uploads/Saad Shareef_degree_scan_copy.jpg', 'uploads/Saad Shareef_emp_cv.jpg', 55000, '2019-05-22 08:42:23', '0000-00-00 00:00:00', 1, 0, 1),
(25, 'EMP-Y19-25', '???? ???? ???????', '???? ???? ???????', '34567-8909876-5', '+45-678-9654345', '???? ???? ???????', '', 'Single', '', 'Male', 'uploads/???? ???? ???????_emp_photo.jpg', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414855456c4551565234587532647661736c525244467a77303131566a455244502f414158465244415254417a38534551554d52484d5a4e31564552504252415152457a384345384645314d4464514d464142444d585155526a5577304d6e70533379317533582f64557a33305479505a76594e6e3333765430644a396270367671644d33636e615272355a383451414145546b4c677670326b4b2b58665354317745516941674335444a4b77414243364f414553364f49623041414a344a477741424c5a4141492b30425972304d54304345476c36457743414c5243415346756753422f5449774352706a6342414e674341596930425972304d54304345476c36457743414c5243415346756753422f5449774352706a6342414e674341596930425972304d54304345476c36457743414c5243415346756753422f5449774352706a6342414e674341596930425972304d54304345476c36457743414c5243415346756753422f54497a424f704c4f7a73374d52754861376e6179702f572b48582b5a2f7437396c62654a35373676754d2b757637714f2b627a327531706a5733714e75372f50766a615633506d4c5847304f4e532f7a6435787237722b2f56776d4e302f477478366433724648797961337232457364512f357a5a3963342f6b483544694e516962575a3053775349424d302b6449693058326a584c44515a70684370386c5339466664554938636a48527374486d6b664f593063654b5377326b456b694e514b53534653796356364f52633530694648585a747a74584b73705243736c37396d2b5630577072584f5a396351326848614e5557597a426848633477734a4d3745436f6930364c735147784162316958374c634c686b5661386a6776352b377973333550707339416f4f373832464274527666424968323058354f2b774e3758465873626f2f735a6f486a613644774f526a76635a5278614369336f393970477166595a735a5632546a454b6b6735636c522b726e514d6a66794e2f6e716b7847784973526a396d7144466d7a694c58433178475066756f393845683470484e6c566b736c564c334b6973795434354877534975793864494b54476848614d65474c427579353272556c6b496a50424b713361714e796a55784e42344a6a345248776950686b5249784b516f61694132494459674e6a576663526d6f70495649416a6766374475582b6d5670486a6e512b5650565148342b455238496a345a4634314879304f6e7574352b5652383250766b776c48654351384568344a6a34524877695074482b63656556794645714567786b6641736b537670366f734a64585a78694c37534166446a56686b7546456952496b514a554b5679746b714f6f564956445a5132564465646f5038666677656971576e6465766e6c784162454273514778416245427351477841626a72497633746e414f78757973707731516738503969586c73716832626456737253713252687759656566426d7635615967577634316f30664637484e624b2f55652b44394662656b5832516b5865443878616876634c5777766c5572346659674e694132494459674e694132494459674e6977387546425172766c72326e4a436e4e4838434f305334797956342b5667542b6176375436483630424737334869434751492b587135354c59415a4567306e385647694f7132427156446455754478385247784162454273514778416245427479627a486955586e336431567732637333794a474f76313646304935394a4c375676447a496c6958475378753745416b6951535349645052743561507136496a716d53314f6650556c5833323536726b72586e374379302b61426b4f4f5249364552776f314546522f552f326450573478717342527446723266687949336d59594c7a39706c3952512f5533316478713249582f6e48677369515353494650624e4d6f554a2b587535794a58516a7443752b324161526173557265356a6b755241624d68444e3470573977726c4b52343775345a394a506152324565716e68416774434f304f336e4637556e446f2f7473664b7435657a2f75662f4d5952526253635234454a6b5a672f4331434534504531454567517741695a51687848675147454942494179445242415179424342536868446e515741414159673041424a4e5143424441434a6c434845654241595167456744494e45454244494549464a413645354a6e30693657394b376b6c3651394663342f35696b4f7953394a756b575352394c657243637631665374354a756b7653577047644b483962322f64444f6d6a39657271302f6e457553587058307053533731782b53377048307a634939597476573958464f666c2f722b364e77632b2f6a7a32727339667a746b7436384d304f3730633944704d346e624d623261794748473944726b713458597a4f44656b5453653958315a737866682b76696153505a69354c654b53534a35387a674879703947336b654b4f32656b2f536d704a736c326631666b6e5358704e734c47573263647468592f57392b765a485979504335704e386b76564a4962585077773972366455746a392f613965642f6f524d6e6d42354536434c6b427574485a373738556a3251654a78702b4e44497a66444e4f38315176462b38566a645a2b4e733956487a57527a4c692f442b5379396a346d4935795277385a6d686d33332f4633537a3656762f357352384e6c41704a72455275776e4a483159694c6f30646839766139365a6b63317748694931504971465678367132576c6674614e687835444a51364e624a563252394c776b43354f6942316a795270466f46735a3557486d62704b636b585336472f6e62707630656b763475587376456151597834646e696f47656355353255687173326e4e2f6261633372344738504b476369794e4565493145484877687a7a51462b5546643957647a4e7344372f695a553630324e5a79717867656d71466153505a5a7562444f666377446566356c625a3141466a356150764f6a704f394b6150646b77794d5a7964346f75646c585a64776653484c796d6665715137656e4a58316177737a6f78654c596256782b2f30654c463279466852437072455332476e45634548427932463969596d362f3179476235796c6d6c4f364636707a6b59556b2f565959593859366b71343361327357517975396e6e69546d4f4e366639325833387879724a6e616436356a48374932395a786478484c50624468347057454430456933567273356a5845324c62567371325568594639552b47354b4659542b457343794755625579614347636555735075534c5265334e714562413139706f674755617a45676f697a66724a4d2b394e455942496d384a4a5a374d69414a466d2f65535a39365949514b524e3461537a575248346c3068584a5632624651486d445149624948442f5077682b392b6947726147334141414141456c46546b5375516d4343, 4, 3, 'Salaried', 'Faculty', 5, 'nawal@gmail.com', '???? ???? ???????', 2017, '???? ???? ???????', '0', '0', 60000, '2019-07-06 04:46:34', '0000-00-00 00:00:00', 1, 0, 1),
(26, 'EMP-Y19-26', 'قاضی محمد اسماعیل', 'قاضی محمد اسماعیل', '12345-6789876-5', '+12-345-6789098', 'قاضی محمد اسماعیل', 'قاضی محمد اسماعیل', 'Married', '', 'Male', '0', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414731456c4551565234587532645059676c525253467a7773564d3431465441774649304842785551774555774d314568454552504254485a6446545042524151524533384345304e52413131597a55545153424d52597a6656634f5475712b76637156642f2f56346c626e304e77387830563164586e37366e37726d33717174336b71366c48374742414167636863416a4f306c58303839524e58415343494341586f6449574145496e49344152446f6451326f41415477534e6741434d784441493831416b547157527741694c57384341444144415967304130587157423442694c533843514441444151673067775571574e35424344533869594141444d516745677a554b534f35524741534d75624141444d514141697a5543524f705a4841434974627749414d414d42694451445265705948674749744c774a414d414d424344534442537059336b45494e4c794a6741414d78434153444e517049376c4552676e30746e5a32646b49584c7664546c62556674766d702f6c2b3278664c654e6e574f586e357641362f547532614939657274532f57486476617567382f7476586376487a72506b747471563076346a4c79484872746e34565644352f5338643435492f59556352323036623078317a6549644b72783567387564687a485076526a445255696e5866696f35303552437034506a7a53586747555048437677396a7134584b6c55664a3650652f5836326a775345693743394b324a30337a33684f50744a662f45416b6951615467475776784a4236704953784a4e75787a4d6a4f6b44736d4751366e6149782f4a686f595836306d6a434b372f58657346613041664b3664494e68786d6158765071795a6c3832654174455061345a4751646d5864786a6a5378645271792b4d683763617736736b305042496543592b455238496a6c52496d6f37716641646e4463537979646f4654534c737875514b5249464a7a74675245676b67397239794c65586f5a55374a3267594b4d497a474f31434d6336652b424758345143534a4270415a526b485a49757835426b4862377a3138534936565872736a61746163347a5a6f4630694d653430694d497a474f78446753343068344a4478535a4d484f5a7944584e527476794f62795965754d617961744d6d6c563276414e575a494e4a4274494e6c52644568344a6a3153666956424c427042734f43415552494a49454b6d5873535a474367756b484c736f53433946533478456a45534d56466867673252446632594730673570643742634664494f6159653079775a2b5764654f646531592f495446543235326a4b316c6b5876785769764c3171756242534c72666f6c6b41386d4767335859653675666a727959534978456a45534d6c447158504b6d435238496a585a42454c6d466168744b61533066576a71786454696d6b4864494f616466357446417659356336566a3772556875496e62567750514f79444d6779494d75416250457a4d4335766d577533393164494f36516430673570562f39455a697368514c4b42443431745759434847496b76397633335a6234524b63614137486e484844746969415352494e4b4764534679387352423552365a694a47496b596952694a47496b62594f446a50586a712b61482f536349314e59536d4e424a4274494e704273434f4d36454f6c387173347061325750446a777a313436356473793136337a3875665268364a474f6967465a426d5239524c6f3463732b6b31554e7668306643492b475238456a566a724d554d7a4f4f56486d584a6b6f516b67306b473067326b477a6756665077525a42536a46614c32326f7848783470795a58576177716b762f666a4a6b77527173643845416b6948656a2b586d2f4d6743774473677a49546e673343694c3944346a556d396a48635242594749487852665158426f6c62423445654168437068784448515741414159673041424a46514b43484145547149635278454268414143494e67455152454f6768414a46364348456342415951674567444946454542486f49514b51435167394a756b66535a2b6d592f6639392b76755a74442f7575794c707261796579354a2b4c35543957744c546b6d3455726e7566704d386c33532f4a72764e6a2b4e2b4c50797a704a306e76536e704230676553587048306a79533735707553346a58794f75326537507166687574372b6238723963616d33706e75366247303039727a51382f4b466a674f6b634a44766930596b685047446a3868365a7455376c564a373264454d45502b55744a767159775a722b3237486f686b68316f475a776236747154584b69537a3479394a656b66534134486f526772622f676a376a4f53504a6e4a37322f36553949616b6a30493737627a59615267527678316f35354f53506c7941484674754553494e65435176596b544c695a5476382f392f6b5852484970495a75786c36693068752f4f5a52624d74376569507a72346b453066693962764f67666f314975686354795931497062592f4b2b6b545362636e6f6c7264356d314b587462615a5a334534366e4432574a6f7433705a694c5342534a4551377230656c505255364f57396a465872386a424b715a714257706c376b7863785933334f466d5a506b693053777953636256366e312b6565796153626b634549597437494e7065424f546b6a49653261567957394c4d6b6b58736c374f5a466366725a6b3671314f6e507a2b494e49416b5a77304c7458694b58374d6576572f516d2b6478316c2b6a6b757475304c635a515965695a64374f61764c4e76646f6566786c4d73346b6e7850475a4f68586b6a365739463469694d6e4f584c6f394c2b6d4c4a43567a736b5a505a2f48557a316d485965327033654e714a4c4c3768556744524d706a6f5077554e7a6f7a614a646d58696247576b6151566b2f7658756a757a434e46673764365933744b5573766259314c513479727a5a4e476a476e466972425062566f756e537664742b7a777073794b422f4a3468556f6449655a624b697073484d646e6d6d612b53584d7544654364594a46624a4d5050657679547259707663553168644c726c6965324a324d5762345374366b6c4f484c3231697262325553345a4657662f72632f7a514538456a546f4b53696c5247415343732f666535394767495161527155564c5179416a654a394a326b6179756a774c324477496b4958506f5875686e72364876666d733841414141415355564f524b35435949493d, 4, 4, 'Salaried', 'Faculty', 5, 'nawal@gmail.com', 'قاضی محمد اسماعیل', 2019, 'قاضی محمد اسماعیل', '0', '0', 30000, '2019-07-06 04:53:40', '0000-00-00 00:00:00', 1, 0, 1),
(27, 'EMP-Y19-27', 'قاضی محمد', 'قاضی محمد', '23456-7898765-4', '+76-543-3456789', 'قاضی محمد', 'قاضی محمد', 'Single', '', 'Male', '', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a3341414148546b6c45515652345875326450617874517854482f3665553642525549686f53685559304a4552444e42494e69592b434342474e524350433878485253445169456146423852714a526c447743684b46676f354f314c5355563959394d2f65737538374d6e6a6c6e7a30766b7a6d386e4c79393337356e5a4d2f2b7a2f724d2b5a7333736a615172365a2b34514141456a6b4c676e6f326b31394f2f6f31716745676941674335424a4b5141424e596a414a48575930674c4949424751675a4159415143614b51524b4e4c4739416841704f6c4641414247494143525271424947394d6a414a476d467745414749454152427142496d314d6a7742456d6c34454147414541684270424971304d54304345476c3645514341455168417042456f307362304345436b3655554141455967414a46476f45676230794d416b6159584151415967514245476f45696255795041455361586751415941514345476b456972517850514c3952446f354f546e706757757a3263694b32763932355772357674337a5a584c5a574d3758723756566179665762625739314964533354692b32493838786a7a2b32764f313766534d737a533257723971763148764f45726a4f625375783375706e2f465a546135614d74677030317468726c38517153586b45476b3349665a67565a7341652b7443704d52574e4e4a57635a65307862457a2f6f695a7556644131327076694e5451585a68324f354e3172556b577a5a43572b514f523274686a3269562f716a55546c6d7864664b5239733676484238564832766e702b45694f67435643745a7a526c685a6f42534236544c66656437544b6f5a485153455474436f5448744e76356b583743696a376b69416d45714a304c6e78502b3369346a484b4e35435838764c384667326d486146534f442b456a6e4a7877304568717047555a6e51585a4847714a32524f314f43584f31665158576b6335483672772f316a4c764e6e6e4749724e6833376c7443533952752f31557239377342492f74495467546248424d4a624f427a416149744b446a7947786f723258307a71694576776c2f74387a4a637948615673536b5a5371555a72616c7146524a4778366233345a7068326d586852306671544f5130534a4e4b794c454e6f7079794c6b6e2b2b4e7142316c616b336c544d3277546b4e6c4767556261447845765a517930636835626b77375a33773171346950684937564d6354623262542f49764868424a4967456b616f55595964736a334467497930764745632f682f413334652b7a744a7844665946446b6b4d4a6678502b626c6d41684c2f5447544748524b7861712f394c7759483462476c354944386a324d444776714c474f475a3751557434305569734937474f46444c4831345a30385a48776b52716d474d45476767333747775950396545494e6767695153534931484c387957776752656a63506965434456752f7a327663466f6c5357564b455342456952616845486a62324c5a7764547662332b76575a7459455a63753149456470542b7a5674786b6d722b795a53625249375a4a6d68647a2f5849576456355064486377364e684559714c6e7133534d2b5a445a7a5a5550314554476b6874715974316f52305755646948596c31705053394a6f6a55506b74695247414748776b6643523970774b51446b53415352494a4952526177494d75434c4175796a632b767369444c32642b632f62307755636167452b4876685138374537586a51324f7473442f7253427969663559547873612b396e6b5a7253554b4e424961365a525166422b70666e5a654b61304a307935466a6d7068314e724d7337516e5a6d332b5747753234344249446f67304939754f34754934726b726f7432653267306751435349354456676a4452714a46434653684159734d6b496b69415352494e4a5a746a67375a4e6b6865786135497468775850534b625252736f324162426548767666422f58424a6f6d642b734937474f7844705343416978517a6163344e4936437376504f71565544314b455342456952616951644c71302b513469375a382f64386a4d6a492f30502f475265744c4e4b514d436b794c5166394c71704141786242446f5151416939614245475241597469414c6c434141416c5545304567494277674d51414169445143524a6b4141496945444944414141596730414553614141474935475467476b6e7653587057306a655348705030743652584a62325a7974307436556458353561304b664b46564e6271664a616566796a7052556e2f756a5a3875313738664432376e3876644b756d48384737667a365633574c58504a64337658765234756d663976697a70646b6e35587133764a5a72456363394f4a596755534746432b6f756b757954646c49517546376c4f30764f53336b336b7350744746424f7156784b5248704c306d3654665862736d6f466d6f65775175762f734c5353394a2b694256656a75393577464a6679524335375a2f6c7652676d6769732f6e325333677154524b6b746d796a7956657037726239783344336a7573686c49464c6c317930527951695468645771575a6e624a463266684e3245306754734b30636b492b5a7a6b753655394b676b7230464b7237627954306a364e4433307770394a624f336c642b512b32642b6553484553734c37615a646f304579317132646a336d754358786e32525364497a4e6f685551436c716e6d77472f65524d74567a477449554a755030667a55417a6d623657394834792f30784c6d5a6e345854415066526369676530395a703764494f6d5252464466686d6d6b6d3550327362706d426b6179476a6b7a49613250766f364e37576c4a6c314b5a544b3573376b5634617550754562614c5841596968562f58684e45454e6674482f7248334335354d57754850494b533566426265547951393559695769574b6d57665239724f347a6b73796b4d344833372f744830687553507062306c2f4e39766b3174582b734935636c682f706e39626237576c366c7a6e7179525a466245337a4d7a306e792b58784f525465755a3971754e2b794b545a576c73454d6d6845303233434677574d424e656d2f584e5563395844434c597a4a313947744e5957517374615353723837436b6a314b6a7354386c30797666753850355456476a52742f48452b31477035474d64486235766e73667967636f61754f47534c4d69344d5964493264476c70636c765a4d6965565930527533383747316149306639664e6c736e6c6e30374c555142466779362b795a37314f756d3030346535354e4d422f4a382b387561527a6662745930706d464b66612b4a52613364576355496a5454724c382b34687949416b59624353574f7a496743525a76336c47666451424344535544687062465945546f6e307661517273794c417545466741414c332f67634163504c6f54483974386741414141424a52553545726b4a6767673d3d, 3, 1, 'Salaried', 'Faculty', 5, 'nawal@gmail.com', 'قاضی محمد', 2017, 'قاضی محمد', 'uploads/???? ????_degree_scan_copy.jpg', 'uploads/???? ????_emp_cv.jpg', 4567534, '2019-07-06 05:03:42', '0000-00-00 00:00:00', 1, 0, 1),
(28, 'EMP-Y19-28', 'محمد', 'قاضی محمد', '34567-8987654-3', '+45-678-9987654', 'قاضی محمد', 'قاضی محمد', 'Single', '', 'Male', 'uploads/محمد_emp_photo.jpg', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414739306c4551565234587532644d59676c525243472f7863715a68714c6d47686d4a6f4b4359694b594343594b6169536969496c674a6e716e59696159694342697041596d676f6c6f6f676371474969676b535969357159617274532b7274766133753770666a5039344e622b4270613766644e64302b2b662b72762b7175365a33556d366c6e3745415149677341714242336553727161665652626f424149676f4373514353384167653049514b547447474942424968492b4141496a454341694451435257784d6a7742456d7434464147414541684270424972596d4234426944533943774441434151673067675573544539416842706568634167424549514b51524b474a6a65675167307651754141416a454942494931444578765149514b547058514141526941416b5561676949337045594249303773414149784141434b4e5142456230794d416b615a334151415967514245476f45694e715a486f4a39494a79636e4a7a317737585937575650373177377635702f625a36303238627a62796d3232374f55323875766d3479714e36644272354f33392b396647556a73667361754e49654c693332334a58756e377473613368503257766b765978334f6c6135523871736466347633502f392f79363533666b4870446946533643666b4e724a472f64674e626a743036443548326b79314549694a5648614531342f5a4758694c5365575754523839655664534b526d6e5332374f61694c525870543179727963613945716f6c7678423270326c4162305441394975355534316d565279394a477943794a646e45786152436448326f63676371516b4d57764a625932383545686c3252527832554a436967306467724a566b534d696e55554770423353726b6f70694e516d436c573763733761733378416a6b534f644c3359415a4567556c5063455a47495347754b524654744d6d70424a4967456b526269445675454c6d3539596d6644666974594b5a6f637572574c69455245716a70547130524d315936714856573773455a31364b5a55696730554779673256445a54396b6f54397472746f3944535470616c695962794e2b567679742b4e6e536173493455345264574f716831564f3670327863636661747561714e7052745575553463472b4e62506e557257744a7765693245434f524c4742596b5058513475734931576f776f497343374938526c474e49306737704e3236504b65313245784549694b644972433037595563716678696b6931765a75706468324d646958556b31704659527a71646f586d7658665a324a4d7266363251684f7875614e62763279783972617a4a4c57305a47764c79785a4c393254615164373279497273374c54336a3579617063723265436f6468774c71705174614e71743036655153534964434870503752555339574f716c3257355243526945684570466271543435456a6b534f3150694c4b43305370587952643338762f566d556e7154366b442b4830764d3854632b6d317037336a2f6375594b355a574f37426852794a48496b63716245654270484f78796d6b4864494f615965307535674539306965517952487a38794c74437676656a3845353537373169745632577648586a7632327248586a72313253397555654233586d587059472b574a53466e396b4a656638504b544e57747a45416b693861625644736e573267674d6b53415352494a496242466149305059613864654f2f6261445a673949524a45676b675136666f69375a61316f43313965554b325934636656547571646d766b4d7355476967305547775a45655967456b534153524b4a7174306147554779673245437859634473435a4567456b53435346547464506136735937366d556c336e70446c43646e36687449744a65777466616375662f63776c7a59674d436b432f6357475351486961344e41447749517151636c326f4241417747496849754177414145494e4941454445424168414a487743424151684170414567596749454942492b4141494445494249416353374a48306d3652354a4830683657644b2f346678546b753655394a616b577956394b756d526450344253543949756b6e5375354b65547a6173375565686e54562f4f76584e373939726b743655394c556b753962666b7536583948336a476a624f787956394567784747376e6466384959532b4f78396e395578686a4838337243596f4166586e6f54454b6c79433832522f307a6b73435a476e4c636c2f5a366330483433352f30773632394f2b45336f4630386279563652394834695354786e4a48343032545a6e66546931653148534f354a755474642f56644c646b7535496a6d376a744d4e4937596631587a7076343368473073665a52474839625278477a4f38715249706a746e5a664a6b777550524d32666747495641457764784c3733575a706930675763614c6a75776b6a6c7a6d2b4f624a46716e7a4774732f74734d6956487a6d526a41672f42584a5a65782f5462526c524975456a53617a5043354c756c66526b694c4a475369646f6a4c684f3946386c3364496730744b6b734e456e4c325633694653494b436176584b725a615a2f686f324e484765677979687a38717153584a4a6c386569504a4f6f74695059376e73736c6c356532536e7056304a55576b39354a3973326552794b5263696177656a597a597359394879392b434c50314630684d70716e675574752f734e6e4b7664756c36582b68334b54312f384b4168556756517a784f2b43724f334f62624c72396a4e69526262326b7766356145527a79545a46366c6a6e7675593433722b5a573264514a37376d4d502f4b4d6d6b6e5555547a324663426c6f755a73647a6b6a3550306a456e62355238506e3650684362526f72534d3074414947776c6e665a31514a67394c455861776e393777356942533552613530396e706d4d546237336b5538447a46484e696a3046395a5248704d6b6b55436979616c49354c4f4a614c6c526936396f76534c736a4e2b587372625973355779742b636944596d69385478714256467645326552393777336e374541554b6b4147364d45715771585a374865445574746f32537a783278523962466170384e7961546c7a36473646717477735749594930557034735332506747555a4b6c564350306f32596e6b38596d467174305a5a684470694c4d557075644241434c4e63362f35706b6445414349644556784d7a344d41524a726e58764e4e6a346a414b5a472b6c585474694266424e416a383378463436442b59754f726f357262636f5141414141424a52553545726b4a6767673d3d, 6, 1, 'Salaried', 'Faculty', 5, 'nawal@gmail.com', 'قاضی محمد', 2018, 'قاضی محمد', '0', '0', 578987, '2019-07-06 05:06:45', '0000-00-00 00:00:00', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `emp_leave`
--

CREATE TABLE `emp_leave` (
  `app_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `leave_type` enum('Casual Leave','Medical Leave','','') NOT NULL,
  `starting_date` date NOT NULL,
  `ending_date` date NOT NULL,
  `applying_date` date NOT NULL,
  `no_of_days` int(5) NOT NULL,
  `leave_purpose` varchar(100) NOT NULL,
  `status` enum('Accepted','Rejected','Pending') NOT NULL,
  `remarks` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_leave`
--

INSERT INTO `emp_leave` (`app_id`, `branch_id`, `emp_id`, `leave_type`, `starting_date`, `ending_date`, `applying_date`, `no_of_days`, `leave_purpose`, `status`, `remarks`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 5, 1, 'Casual Leave', '2019-04-26', '2019-04-28', '2019-04-26', 3, 'Personal Reason', 'Accepted', 'Best of Luck...!!!', '2019-04-26 15:36:59', '2019-04-26 15:36:59', 68, 1),
(2, 5, 1, 'Medical Leave', '2019-04-29', '2019-04-26', '2019-04-26', 2, 'Medical Leave', 'Rejected', 'Rejected', '2019-04-26 14:55:01', '2019-04-26 14:55:01', 68, 1),
(3, 5, 3, 'Casual Leave', '2019-04-26', '2019-04-30', '2019-04-26', 5, 'awain', 'Accepted', '', '2019-06-13 06:19:33', '2019-06-13 06:19:33', 69, 1),
(4, 5, 3, 'Medical Leave', '2019-05-25', '2019-05-28', '2019-05-25', 3, 'I am sick', 'Accepted', 'Best of luck', '2019-05-25 06:04:13', '2019-05-25 06:04:13', 69, 1);

-- --------------------------------------------------------

--
-- Table structure for table `emp_reference`
--

CREATE TABLE `emp_reference` (
  `emp_ref_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `ref_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `ref_contact_no` varchar(15) CHARACTER SET utf8 NOT NULL,
  `ref_cnic` varchar(15) CHARACTER SET utf8 NOT NULL,
  `ref_designation` varchar(100) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_reference`
--

INSERT INTO `emp_reference` (`emp_ref_id`, `emp_id`, `ref_name`, `ref_contact_no`, `ref_cnic`, `ref_designation`) VALUES
(1, 2, 'Sir Faraz', '35', '54687-4687465-4', 'CEO'),
(2, 4, 'Sir Ahmad', '32', '68798-7513465-4', 'KIPS Principal'),
(3, 8, 'Anas', '92', '31303-5678987-6', 'Teacher'),
(4, 9, 'Anas', '92', '31303-3456788-7', 'Teacher'),
(6, 11, 'Rana Faraz Ahmed', '92', '31303-0987654-5', 'CEO'),
(7, 16, 'Anas', '+87-654-3234567', '23456-7898765-4', 'Teacher'),
(8, 17, 'Anas', '+98-765-4323456', '98765-4323456-7', 'uhhu'),
(10, 19, '', '', '', ''),
(12, 21, '', '', '', ''),
(13, 22, '', '', '', ''),
(14, 23, '', '', '', ''),
(15, 24, '', '', '', ''),
(16, 25, '???? ???? ???????', '+96-234-5678976', '87654-3456789-8', '???? ???? ???????'),
(17, 26, 'قاضی محمد اسماعیل', '+12-345-6789876', '12345-6789876-5', 'قاضی محمد اسماعیل'),
(18, 27, 'قاضی محمد', '+92-345-6789876', '76543-2123456-7', 'قاضی محمد'),
(19, 28, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `emp_type`
--

CREATE TABLE `emp_type` (
  `emp_type_id` int(11) NOT NULL,
  `emp_type` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_type`
--

INSERT INTO `emp_type` (`emp_type_id`, `emp_type`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 'Daily Wages', '2019-03-16 06:47:32', '0000-00-00 00:00:00', 1, 0, 1),
(2, 'Weekly Wages', '2019-03-16 06:47:44', '2019-03-16 06:47:44', 1, 1, 1),
(3, 'Contract Basis', '2019-01-14 18:24:23', '0000-00-00 00:00:00', 1, 0, 1),
(4, 'Permanent ', '2018-12-14 07:52:24', '0000-00-00 00:00:00', 1, 0, 1),
(5, 'Visiting', '2019-02-26 05:02:48', '2019-02-26 05:02:48', 0, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `title`, `description`, `created_at`) VALUES
(1, 'Hello', 'Something in the description', '2019-01-27 17:14:06'),
(2, 'Another Event', 'Another Event Description', '2019-01-27 19:10:28'),
(3, 'Another Event 2', 'Another Event 2 Description', '2019-01-27 19:12:23');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `event_title` varchar(80) NOT NULL,
  `event_detail` text NOT NULL,
  `event_venue` varchar(100) NOT NULL,
  `event_start_datetime` datetime NOT NULL,
  `event_end_datetime` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_id`, `event_title`, `event_detail`, `event_venue`, `event_start_datetime`, `event_end_datetime`, `created_at`, `created_by`, `updated_at`, `updated_by`, `is_status`) VALUES
(1, 'Last Day', 'Last Day of Janvi', '', '2015-05-30 00:00:00', '2015-05-30 00:00:00', '2015-05-27 15:34:53', 1, '2015-05-27 15:40:30', 1, 'Inactive'),
(2, 'Janvi BDay', 'Happy Birthday Janvi ', '', '2015-07-05 00:00:00', '2015-07-05 00:00:00', '2015-05-27 15:35:38', 1, '2015-05-27 15:40:48', 1, 'Inactive'),
(3, 'Happy Bday', 'Happy Birthday KarmrajSir', '', '2015-07-25 00:00:00', '2015-07-25 00:00:00', '2019-04-20 13:14:50', 3, '0000-00-00 00:00:00', 0, 'Inactive'),
(4, 'Launching New Application', 'Launch of Edusec Yii2', '', '2015-06-02 09:30:00', '2015-06-02 10:00:00', '2015-05-27 15:37:00', 1, '2015-05-27 15:39:37', 1, ''),
(5, 'Meeting for staff ', 'All Staff Members-Meeting', '', '2015-06-09 00:00:00', '2015-06-09 00:00:00', '2015-05-27 15:37:42', 1, NULL, NULL, ''),
(7, 'Celebration Time', 'Celebration Time', '', '2015-06-25 00:00:00', '2015-06-25 00:00:00', '2015-05-27 15:39:12', 1, NULL, NULL, ''),
(8, 'Sports Week', 'Annual sports week of Brookfield Group of Colleges.', 'Shiekh Zaid Sports Complex', '2019-01-31 08:00:05', '2019-02-04 05:00:05', '2019-01-30 16:57:53', 9, '2019-01-30 17:00:43', 9, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `exams_category`
--

CREATE TABLE `exams_category` (
  `exam_category_id` int(11) NOT NULL,
  `category_name` varchar(30) NOT NULL,
  `description` varchar(300) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exams_category`
--

INSERT INTO `exams_category` (`exam_category_id`, `category_name`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Daily Test', 'Daily Class Tests', '2019-03-11 09:34:22', '0000-00-00 00:00:00', 0, 0),
(2, 'Weekly Tests', 'Weekly Class Tests', '2019-03-11 09:34:40', '0000-00-00 00:00:00', 0, 0),
(3, 'First Term', 'First Term Exams', '2019-03-11 09:35:27', '0000-00-00 00:00:00', 0, 0),
(4, 'Mid Term', 'Mid Term Exams', '2019-03-11 09:35:49', '0000-00-00 00:00:00', 0, 0),
(5, 'Final Term Examination', 'Final Term Exams', '2019-05-22 19:11:12', '0000-00-00 00:00:00', 0, 0),
(6, 'December Test', 'December Test / Exams', '2019-03-11 09:36:44', '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `exams_criteria`
--

CREATE TABLE `exams_criteria` (
  `exam_criteria_id` int(11) NOT NULL,
  `exam_category_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `exam_start_date` date NOT NULL,
  `exam_end_date` date NOT NULL,
  `exam_room` varchar(15) NOT NULL,
  `exam_status` varchar(50) NOT NULL,
  `exam_type` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exams_criteria`
--

INSERT INTO `exams_criteria` (`exam_criteria_id`, `exam_category_id`, `class_id`, `exam_start_date`, `exam_end_date`, `exam_room`, `exam_status`, `exam_type`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 5, 1, '2019-05-30', '2019-06-08', '', 'Inactive', 'Regular', '2019-05-31 05:04:21', '2019-05-31 05:04:21', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `exams_report`
--

CREATE TABLE `exams_report` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `std_id` int(11) NOT NULL,
  `para_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
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

INSERT INTO `exams_report` (`id`, `class_id`, `std_id`, `para_id`, `start_date`, `end_date`, `duration`, `remarks`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 18, 1, 1, '2019-07-07', '2019-07-07', '10', 'Excellent...', '2019-07-07 13:36:53', '2019-07-07 13:36:53', 0, 1),
(2, 25, 3, 2, '2019-07-07', '2000-01-28', '20 days', 'Welldone......', '2019-07-07 13:46:47', '2019-07-07 13:46:47', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fee_month_detail`
--

CREATE TABLE `fee_month_detail` (
  `month_detail_id` int(11) NOT NULL,
  `voucher_no` int(11) NOT NULL,
  `month` varchar(10) NOT NULL,
  `monthly_amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fee_month_detail`
--

INSERT INTO `fee_month_detail` (`month_detail_id`, `voucher_no`, `month`, `monthly_amount`) VALUES
(1, 1001, '2019-01', 4910),
(2, 1002, '2019-01', 5000),
(3, 1003, '2019-01', 5000),
(4, 1004, '2019-03', 6865),
(5, 1005, '2019-03', 7000),
(6, 1006, '2019-03', 7000),
(7, 1007, '2019-04', 8820),
(8, 1007, '2019-05', 1955),
(9, 1008, '2019-04', 9000),
(10, 1008, '2019-05', 2000),
(11, 1009, '2019-04', 9000),
(12, 1009, '2019-05', 2000),
(13, 1010, '2019-01', 6500),
(14, 1011, '2019-01', 7000),
(15, 1012, '2019-01', 7000),
(16, 1013, '2019-06', 12730),
(17, 1014, '2019-06', 3000),
(18, 1015, '2019-06', 13000);

-- --------------------------------------------------------

--
-- Table structure for table `fee_transaction_detail`
--

CREATE TABLE `fee_transaction_detail` (
  `fee_trans_detail_id` int(11) NOT NULL,
  `fee_trans_detail_head_id` int(11) NOT NULL,
  `fee_type_id` int(11) NOT NULL,
  `fee_amount` double DEFAULT NULL,
  `collected_fee_amount` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fee_transaction_head`
--

CREATE TABLE `fee_transaction_head` (
  `fee_trans_id` int(11) NOT NULL,
  `voucher_no` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `class_name_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `std_id` int(11) NOT NULL,
  `std_name` varchar(75) NOT NULL,
  `month` varchar(20) NOT NULL,
  `transaction_date` datetime NOT NULL,
  `total_amount` double NOT NULL,
  `paid_amount` double NOT NULL,
  `remaining` double NOT NULL,
  `collection_date` datetime NOT NULL,
  `status` enum('Paid','Unpaid','Partially Paid','Added to next month') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fee_type`
--

CREATE TABLE `fee_type` (
  `fee_type_id` int(11) NOT NULL,
  `fee_type_name` varchar(64) NOT NULL,
  `fee_type_description` varchar(120) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fee_type`
--

INSERT INTO `fee_type` (`fee_type_id`, `fee_type_name`, `fee_type_description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 'Admission Fee', 'Student have to pay admission fee only one time', '2018-11-03 06:36:22', '0000-00-00 00:00:00', 1, 0, 1),
(2, 'Tuition Fee', 'Paid on monthly bases', '2018-11-03 06:48:34', '0000-00-00 00:00:00', 1, 0, 1),
(3, 'Absent Fine', 'Absent Fine', '2019-04-09 07:33:52', '2019-04-09 07:33:52', 1, 1, 1),
(4, 'Activity Dues', 'Activity Dues', '2019-04-09 07:33:09', '2019-04-09 07:33:09', 1, 1, 1),
(5, 'Stationary Dues', 'Stationary Dues', '2019-04-09 07:32:21', '2019-04-09 07:32:21', 1, 1, 1),
(6, 'Board/University Fee', 'Board/University Fee', '2019-04-09 07:31:49', '2019-04-09 07:31:49', 1, 1, 1),
(7, 'Exams Fee', 'Examination Fee', '2019-02-28 05:03:40', '0000-00-00 00:00:00', 3, 0, 1),
(8, 'Arrears', 'Previous Pending Dues', '2019-04-09 07:29:28', '2019-04-09 07:29:28', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `grade_id` int(11) NOT NULL,
  `grade_name` varchar(5) NOT NULL,
  `grade_from` int(5) NOT NULL,
  `grade_to` int(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`grade_id`, `grade_name`, `grade_from`, `grade_to`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'A+', 80, 100, '2019-04-20 07:28:36', '0000-00-00 00:00:00', 1, 3),
(2, 'A', 70, 79, '2019-04-20 07:28:36', '2019-04-20 07:20:57', 1, 3),
(3, 'B', 60, 69, '2019-04-20 07:28:36', '0000-00-00 00:00:00', 1, 3),
(4, 'C', 50, 59, '2019-04-20 07:28:36', '0000-00-00 00:00:00', 1, 3),
(5, 'D', 40, 49, '2019-04-20 07:28:36', '0000-00-00 00:00:00', 1, 3),
(6, 'F', 33, 39, '2019-04-20 07:28:36', '0000-00-00 00:00:00', 1, 3),
(7, 'Fail', 1, 32, '2019-04-20 07:28:37', '2019-04-20 07:20:34', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `installment`
--

CREATE TABLE `installment` (
  `installment_id` int(11) NOT NULL,
  `installment_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `installment`
--

INSERT INTO `installment` (`installment_id`, `installment_name`) VALUES
(1, '1st Installment'),
(2, '2nd Installment'),
(3, '3rd Installment'),
(4, '4th Installment'),
(5, '5th Installment'),
(6, '6th Installment');

-- --------------------------------------------------------

--
-- Table structure for table `institute`
--

CREATE TABLE `institute` (
  `institute_id` int(11) NOT NULL,
  `institute_name` varchar(65) NOT NULL,
  `institute_logo` varchar(200) NOT NULL,
  `institute_account_no` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `institute`
--

INSERT INTO `institute` (`institute_id`, `institute_name`, `institute_logo`, `institute_account_no`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(2, 'Madrasa Jammia Qadria', 'uploads/Madrasa Jammia Qadria_photo.jpg', 'xyz, RYK', '2019-06-14 19:59:15', '2019-06-14 19:59:15', 1, 97, 1);

-- --------------------------------------------------------

--
-- Table structure for table `institute_name`
--

CREATE TABLE `institute_name` (
  `Institute_name_id` int(11) NOT NULL,
  `Institute_name` varchar(100) NOT NULL,
  `Institutte_address` varchar(120) NOT NULL,
  `Institute_contact_no` varchar(12) NOT NULL,
  `head_name` varchar(20) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `institute_name`
--

INSERT INTO `institute_name` (`Institute_name_id`, `Institute_name`, `Institutte_address`, `Institute_contact_no`, `head_name`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'NIMS School System', 'RYK', '923345678988', 'Sir Nadeem', 0, 0, '2019-03-12 06:07:06', '0000-00-00 00:00:00'),
(2, 'National Garission School System', 'RYK', '923456789023', 'fghjklkj', 0, 0, '2019-03-12 06:10:12', '0000-00-00 00:00:00'),
(3, 'Lahore School System', 'RYK', '923456348256', 'fghjklghj', 0, 0, '2019-03-12 06:11:07', '0000-00-00 00:00:00'),
(4, 'The New Horizons School', 'RYK', '923569872345', 'fghjhgfghj', 0, 0, '2019-03-12 06:11:59', '0000-00-00 00:00:00'),
(5, 'Rehnuma Public School', 'RYK', '923564337866', 'fghjkjnhgfvg', 0, 0, '2019-03-12 06:12:30', '0000-00-00 00:00:00'),
(6, 'ABC Learning School', 'RYK', '923786547856', 'dfghjkhg', 0, 0, '2019-03-12 06:13:19', '0000-00-00 00:00:00'),
(7, 'ESNA Public School', 'RYK', '923456789876', 'dfghjkljmhn', 0, 0, '2019-03-12 06:13:57', '0000-00-00 00:00:00'),
(8, 'Govt. Girls Model Girls High School', 'RYK', '923456789765', 'fdghjgfghj', 0, 0, '2019-03-12 06:15:20', '0000-00-00 00:00:00'),
(9, 'Allied School', 'RYK', '923345678987', 'fghjkgbhj', 0, 0, '2019-03-12 06:15:48', '0000-00-00 00:00:00'),
(10, 'The Spirit School', 'RYK', '923456789876', 'ghjkfghjk', 0, 0, '2019-03-12 06:16:12', '0000-00-00 00:00:00'),
(11, 'TCI School System', 'RYK', '923567898765', 'fghjkljhg', 0, 0, '2019-03-12 06:16:35', '0000-00-00 00:00:00'),
(12, 'Colony High School', 'RYK', '923456789098', 'fghjkj', 0, 0, '2019-03-12 06:17:11', '0000-00-00 00:00:00'),
(13, 'Pilot High School', 'RYK', '923456789098', 'frghjkjnhb', 0, 0, '2019-03-12 06:17:29', '0000-00-00 00:00:00'),
(14, 'Comprehensive School', 'RYK', '923678998765', 'dcfghjklkjh', 0, 0, '2019-03-12 06:18:02', '0000-00-00 00:00:00'),
(15, 'Govt Girls High School', 'RYK', '234567887656', 'abc', 0, 0, '2019-03-12 18:21:40', '0000-00-00 00:00:00'),
(16, 'National Garrison School', 'Satelite Town', '922345676767', 'Sir Zahid', 0, 0, '2019-03-12 18:37:52', '0000-00-00 00:00:00'),
(17, 'Docters Public School', 'Ryk', '123456789098', 'Sir', 0, 0, '2019-03-12 19:38:43', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `marks_details`
--

CREATE TABLE `marks_details` (
  `marks_detail_id` int(11) NOT NULL,
  `marks_head_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `obtained_marks` varchar(20) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marks_head`
--

CREATE TABLE `marks_head` (
  `marks_head_id` int(11) NOT NULL,
  `exam_criteria_id` int(11) NOT NULL,
  `class_head_id` int(10) NOT NULL,
  `std_id` int(11) NOT NULL,
  `grand_total` double NOT NULL,
  `percentage` varchar(10) NOT NULL,
  `grade` varchar(3) NOT NULL,
  `exam_status` varchar(6) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marks_weightage_details`
--

CREATE TABLE `marks_weightage_details` (
  `weightage_detail_id` int(11) NOT NULL,
  `weightage_head_id` int(11) NOT NULL,
  `weightage_type_id` int(11) NOT NULL,
  `marks` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marks_weightage_details`
--

INSERT INTO `marks_weightage_details` (`weightage_detail_id`, `weightage_head_id`, `weightage_type_id`, `marks`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, 1, 5, '2019-05-19 14:34:23', '0000-00-00 00:00:00', 1, 0),
(2, 1, 2, 5, '2019-05-19 14:34:23', '0000-00-00 00:00:00', 1, 0),
(3, 1, 3, 5, '2019-05-19 14:34:23', '0000-00-00 00:00:00', 1, 0),
(4, 1, 4, 5, '2019-05-19 14:34:23', '0000-00-00 00:00:00', 1, 0),
(5, 1, 5, 10, '2019-05-19 14:34:23', '0000-00-00 00:00:00', 1, 0),
(6, 1, 6, 70, '2019-05-19 14:34:23', '0000-00-00 00:00:00', 1, 0),
(7, 2, 1, 5, '2019-05-19 14:37:47', '0000-00-00 00:00:00', 1, 0),
(8, 2, 2, 5, '2019-05-19 14:37:47', '0000-00-00 00:00:00', 1, 0),
(9, 2, 5, 10, '2019-05-19 14:37:47', '0000-00-00 00:00:00', 1, 0),
(10, 2, 6, 80, '2019-05-19 14:37:47', '0000-00-00 00:00:00', 1, 0),
(11, 3, 1, 5, '2019-05-19 14:38:55', '0000-00-00 00:00:00', 1, 0),
(12, 3, 2, 5, '2019-05-19 14:38:55', '0000-00-00 00:00:00', 1, 0),
(13, 3, 6, 90, '2019-05-19 14:38:55', '0000-00-00 00:00:00', 1, 0),
(14, 4, 1, 5, '2019-05-19 14:40:51', '0000-00-00 00:00:00', 1, 0),
(15, 4, 2, 5, '2019-05-19 14:40:51', '0000-00-00 00:00:00', 1, 0),
(16, 4, 7, 20, '2019-05-19 14:40:51', '0000-00-00 00:00:00', 1, 0),
(17, 4, 6, 70, '2019-05-19 14:40:51', '0000-00-00 00:00:00', 1, 0),
(18, 5, 1, 5, '2019-05-19 14:42:02', '0000-00-00 00:00:00', 1, 0),
(19, 5, 2, 5, '2019-05-19 14:42:02', '0000-00-00 00:00:00', 1, 0),
(20, 5, 6, 40, '2019-05-19 14:42:02', '0000-00-00 00:00:00', 1, 0),
(21, 6, 1, 5, '2019-05-19 14:42:59', '0000-00-00 00:00:00', 1, 0),
(22, 6, 2, 5, '2019-05-19 14:42:59', '0000-00-00 00:00:00', 1, 0),
(23, 6, 6, 40, '2019-05-19 14:42:59', '0000-00-00 00:00:00', 1, 0),
(24, 7, 1, 5, '2019-05-22 19:06:46', '0000-00-00 00:00:00', 1, 0),
(25, 7, 4, 5, '2019-05-22 19:06:46', '0000-00-00 00:00:00', 1, 0),
(26, 7, 3, 5, '2019-05-22 19:06:46', '0000-00-00 00:00:00', 1, 0),
(27, 7, 2, 5, '2019-05-22 19:06:46', '0000-00-00 00:00:00', 1, 0),
(28, 7, 6, 80, '2019-05-22 19:06:46', '0000-00-00 00:00:00', 1, 0),
(29, 8, 1, 5, '2019-05-22 19:09:03', '0000-00-00 00:00:00', 1, 0),
(30, 8, 5, 5, '2019-05-22 19:09:03', '0000-00-00 00:00:00', 1, 0),
(31, 8, 3, 5, '2019-05-22 19:09:03', '0000-00-00 00:00:00', 1, 0),
(32, 8, 4, 5, '2019-05-22 19:09:03', '0000-00-00 00:00:00', 1, 0),
(33, 8, 6, 80, '2019-05-22 19:09:03', '0000-00-00 00:00:00', 1, 0),
(34, 9, 1, 5, '2019-05-22 19:09:54', '0000-00-00 00:00:00', 1, 0),
(35, 9, 2, 5, '2019-05-22 19:09:54', '0000-00-00 00:00:00', 1, 0),
(36, 9, 4, 5, '2019-05-22 19:09:54', '0000-00-00 00:00:00', 1, 0),
(37, 9, 5, 5, '2019-05-22 19:09:54', '0000-00-00 00:00:00', 1, 0),
(38, 9, 6, 80, '2019-05-22 19:09:54', '0000-00-00 00:00:00', 1, 0),
(39, 10, 6, 40, '2019-05-22 19:10:37', '0000-00-00 00:00:00', 1, 0),
(40, 10, 7, 20, '2019-05-22 19:10:37', '0000-00-00 00:00:00', 1, 0),
(41, 11, 1, 5, '2019-05-22 19:16:50', '0000-00-00 00:00:00', 1, 0),
(42, 11, 2, 5, '2019-05-22 19:16:50', '0000-00-00 00:00:00', 1, 0),
(43, 11, 6, 90, '2019-05-22 19:16:50', '0000-00-00 00:00:00', 1, 0),
(44, 12, 1, 5, '2019-05-22 19:18:38', '0000-00-00 00:00:00', 1, 0),
(45, 12, 2, 5, '2019-05-22 19:18:38', '0000-00-00 00:00:00', 1, 0),
(46, 12, 3, 5, '2019-05-22 19:18:38', '0000-00-00 00:00:00', 1, 0),
(47, 12, 5, 5, '2019-05-22 19:18:38', '0000-00-00 00:00:00', 1, 0),
(48, 12, 6, 80, '2019-05-22 19:18:38', '0000-00-00 00:00:00', 1, 0),
(49, 13, 1, 5, '2019-05-22 19:19:14', '0000-00-00 00:00:00', 1, 0),
(50, 13, 2, 5, '2019-05-22 19:19:14', '0000-00-00 00:00:00', 1, 0),
(51, 13, 6, 90, '2019-05-22 19:19:14', '0000-00-00 00:00:00', 1, 0),
(52, 14, 5, 5, '2019-05-22 19:19:50', '0000-00-00 00:00:00', 1, 0),
(53, 14, 3, 5, '2019-05-22 19:19:50', '0000-00-00 00:00:00', 1, 0),
(54, 14, 6, 40, '2019-05-22 19:19:50', '0000-00-00 00:00:00', 1, 0),
(55, 15, 7, 10, '2019-05-22 19:20:37', '0000-00-00 00:00:00', 1, 0),
(56, 15, 6, 40, '2019-05-22 19:20:37', '0000-00-00 00:00:00', 1, 0),
(57, 16, 1, 5, '2019-05-22 19:21:09', '0000-00-00 00:00:00', 1, 0),
(58, 16, 2, 5, '2019-05-22 19:21:09', '0000-00-00 00:00:00', 1, 0),
(59, 16, 3, 5, '2019-05-22 19:21:09', '0000-00-00 00:00:00', 1, 0),
(60, 16, 4, 5, '2019-05-22 19:21:09', '0000-00-00 00:00:00', 1, 0),
(61, 16, 6, 80, '2019-05-22 19:21:09', '0000-00-00 00:00:00', 1, 0),
(62, 17, 1, 5, '2019-05-22 19:21:31', '0000-00-00 00:00:00', 1, 0),
(63, 17, 2, 5, '2019-05-22 19:21:31', '0000-00-00 00:00:00', 1, 0),
(64, 17, 6, 90, '2019-05-22 19:21:31', '0000-00-00 00:00:00', 1, 0),
(65, 18, 5, 5, '2019-05-22 19:21:49', '0000-00-00 00:00:00', 1, 0),
(66, 18, 6, 45, '2019-05-22 19:21:49', '0000-00-00 00:00:00', 1, 0),
(67, 19, 1, 5, '2019-05-22 19:22:14', '0000-00-00 00:00:00', 1, 0),
(68, 19, 2, 5, '2019-05-22 19:22:14', '0000-00-00 00:00:00', 1, 0),
(69, 19, 6, 90, '2019-05-22 19:22:14', '0000-00-00 00:00:00', 1, 0),
(70, 20, 6, 75, '2019-05-22 19:22:34', '0000-00-00 00:00:00', 1, 0),
(71, 21, 5, 10, '2019-05-22 19:22:51', '0000-00-00 00:00:00', 1, 0),
(72, 21, 6, 40, '2019-05-22 19:22:51', '0000-00-00 00:00:00', 1, 0),
(73, 22, 1, 5, '2019-05-22 19:23:52', '0000-00-00 00:00:00', 1, 0),
(74, 22, 2, 5, '2019-05-22 19:23:52', '0000-00-00 00:00:00', 1, 0),
(75, 22, 3, 5, '2019-05-22 19:23:52', '0000-00-00 00:00:00', 1, 0),
(76, 22, 6, 85, '2019-05-22 19:23:52', '0000-00-00 00:00:00', 1, 0),
(77, 23, 1, 5, '2019-05-22 19:24:31', '0000-00-00 00:00:00', 1, 0),
(78, 23, 2, 5, '2019-05-22 19:24:31', '0000-00-00 00:00:00', 1, 0),
(79, 23, 6, 65, '2019-05-22 19:24:31', '0000-00-00 00:00:00', 1, 0),
(80, 24, 6, 50, '2019-05-22 19:24:43', '0000-00-00 00:00:00', 1, 0),
(81, 25, 7, 20, '2019-05-22 19:25:05', '0000-00-00 00:00:00', 1, 0),
(82, 25, 6, 80, '2019-05-22 19:25:05', '0000-00-00 00:00:00', 1, 0),
(83, 26, 1, 5, '2019-05-22 19:25:37', '0000-00-00 00:00:00', 1, 0),
(84, 26, 2, 5, '2019-05-22 19:25:37', '0000-00-00 00:00:00', 1, 0),
(85, 26, 3, 5, '2019-05-22 19:25:37', '0000-00-00 00:00:00', 1, 0),
(86, 26, 6, 85, '2019-05-22 19:25:37', '0000-00-00 00:00:00', 1, 0),
(87, 27, 7, 10, '2019-05-22 19:25:57', '0000-00-00 00:00:00', 1, 0),
(88, 27, 6, 40, '2019-05-22 19:25:57', '0000-00-00 00:00:00', 1, 0),
(89, 28, 2, 20, '2019-05-22 19:26:24', '0000-00-00 00:00:00', 1, 0),
(90, 28, 6, 80, '2019-05-22 19:26:24', '0000-00-00 00:00:00', 1, 0),
(91, 29, 7, 30, '2019-05-22 19:27:14', '0000-00-00 00:00:00', 1, 0),
(92, 29, 6, 70, '2019-05-22 19:27:14', '0000-00-00 00:00:00', 1, 0),
(93, 30, 6, 50, '2019-05-22 19:27:27', '0000-00-00 00:00:00', 1, 0),
(94, 31, 3, 10, '2019-05-22 19:27:58', '0000-00-00 00:00:00', 1, 0),
(95, 31, 2, 10, '2019-05-22 19:27:58', '0000-00-00 00:00:00', 1, 0),
(96, 31, 6, 80, '2019-05-22 19:27:58', '0000-00-00 00:00:00', 1, 0),
(97, 32, 6, 80, '2019-05-22 19:28:18', '0000-00-00 00:00:00', 1, 0),
(98, 33, 6, 50, '2019-05-22 19:28:31', '0000-00-00 00:00:00', 1, 0),
(99, 34, 2, 10, '2019-05-22 19:29:09', '0000-00-00 00:00:00', 1, 0),
(100, 34, 3, 10, '2019-05-22 19:29:09', '0000-00-00 00:00:00', 1, 0),
(101, 34, 6, 80, '2019-05-22 19:29:09', '0000-00-00 00:00:00', 1, 0),
(102, 35, 6, 50, '2019-05-22 19:29:24', '0000-00-00 00:00:00', 1, 0),
(103, 36, 3, 20, '2019-05-22 19:29:53', '0000-00-00 00:00:00', 1, 0),
(104, 36, 6, 80, '2019-05-22 19:29:53', '0000-00-00 00:00:00', 1, 0),
(105, 37, 6, 50, '2019-05-22 19:30:06', '0000-00-00 00:00:00', 1, 0),
(106, 38, 6, 50, '2019-05-22 19:30:29', '0000-00-00 00:00:00', 1, 0),
(107, 39, 2, 5, '2019-05-22 19:30:57', '0000-00-00 00:00:00', 1, 0),
(108, 39, 6, 70, '2019-05-22 19:30:57', '0000-00-00 00:00:00', 1, 0),
(109, 40, 6, 50, '2019-05-22 19:31:08', '0000-00-00 00:00:00', 1, 0),
(110, 41, 6, 75, '2019-05-22 19:32:05', '0000-00-00 00:00:00', 1, 0),
(111, 42, 6, 75, '2019-05-22 19:32:18', '0000-00-00 00:00:00', 1, 0),
(112, 43, 7, 25, '2019-05-22 19:33:11', '0000-00-00 00:00:00', 1, 0),
(113, 43, 6, 75, '2019-05-22 19:33:11', '0000-00-00 00:00:00', 1, 0),
(114, 44, 6, 80, '2019-05-22 19:33:25', '0000-00-00 00:00:00', 1, 0),
(115, 45, 6, 50, '2019-05-22 19:33:40', '0000-00-00 00:00:00', 1, 0),
(116, 46, 6, 100, '2019-05-22 19:33:57', '0000-00-00 00:00:00', 1, 0),
(117, 47, 6, 50, '2019-05-22 19:34:09', '0000-00-00 00:00:00', 1, 0),
(118, 48, 6, 50, '2019-05-22 19:34:21', '0000-00-00 00:00:00', 1, 0),
(119, 49, 7, 25, '2019-05-22 19:35:16', '0000-00-00 00:00:00', 1, 0),
(120, 49, 6, 75, '2019-05-22 19:35:16', '0000-00-00 00:00:00', 1, 0),
(121, 50, 7, 25, '2019-05-22 19:35:35', '0000-00-00 00:00:00', 1, 0),
(122, 50, 6, 75, '2019-05-22 19:35:35', '0000-00-00 00:00:00', 1, 0),
(123, 51, 7, 25, '2019-05-22 19:35:51', '0000-00-00 00:00:00', 1, 0),
(124, 51, 6, 75, '2019-05-22 19:35:51', '0000-00-00 00:00:00', 1, 0),
(125, 52, 6, 80, '2019-05-22 19:36:06', '0000-00-00 00:00:00', 1, 0),
(126, 53, 6, 50, '2019-05-22 19:36:21', '0000-00-00 00:00:00', 1, 0),
(127, 54, 6, 100, '2019-05-22 19:36:36', '0000-00-00 00:00:00', 1, 0),
(128, 55, 6, 50, '2019-05-22 19:36:57', '0000-00-00 00:00:00', 1, 0),
(129, 56, 6, 50, '2019-05-22 19:37:10', '0000-00-00 00:00:00', 1, 0),
(130, 57, 6, 80, '2019-05-22 20:04:08', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `marks_weightage_head`
--

CREATE TABLE `marks_weightage_head` (
  `marks_weightage_id` int(11) NOT NULL,
  `exam_category_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subjects_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marks_weightage_head`
--

INSERT INTO `marks_weightage_head` (`marks_weightage_id`, `exam_category_id`, `class_id`, `subjects_id`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 5, 1, 1, '2019-05-19 14:34:23', '0000-00-00 00:00:00', 1, 0),
(2, 5, 1, 2, '2019-05-19 14:37:47', '0000-00-00 00:00:00', 1, 0),
(3, 5, 1, 4, '2019-05-19 14:38:55', '0000-00-00 00:00:00', 1, 0),
(4, 5, 1, 8, '2019-05-19 14:40:51', '0000-00-00 00:00:00', 1, 0),
(5, 5, 1, 7, '2019-05-19 14:42:02', '0000-00-00 00:00:00', 1, 0),
(6, 5, 1, 10, '2019-05-19 14:42:59', '0000-00-00 00:00:00', 1, 0),
(7, 3, 2, 1, '2019-05-22 19:06:46', '0000-00-00 00:00:00', 1, 0),
(8, 5, 2, 2, '2019-05-22 19:09:03', '0000-00-00 00:00:00', 1, 0),
(9, 5, 2, 4, '2019-05-22 19:09:54', '0000-00-00 00:00:00', 1, 0),
(10, 5, 2, 10, '2019-05-22 19:10:37', '0000-00-00 00:00:00', 1, 0),
(11, 5, 3, 1, '2019-05-22 19:16:50', '0000-00-00 00:00:00', 1, 0),
(12, 5, 3, 2, '2019-05-22 19:18:38', '0000-00-00 00:00:00', 1, 0),
(13, 5, 3, 4, '2019-05-22 19:19:14', '0000-00-00 00:00:00', 1, 0),
(14, 5, 3, 9, '2019-05-22 19:19:50', '0000-00-00 00:00:00', 1, 0),
(15, 5, 3, 8, '2019-05-22 19:20:37', '0000-00-00 00:00:00', 1, 0),
(16, 5, 4, 1, '2019-05-22 19:21:09', '0000-00-00 00:00:00', 1, 0),
(17, 5, 4, 2, '2019-05-22 19:21:31', '0000-00-00 00:00:00', 1, 0),
(18, 5, 4, 9, '2019-05-22 19:21:49', '0000-00-00 00:00:00', 1, 0),
(19, 5, 5, 1, '2019-05-22 19:22:14', '0000-00-00 00:00:00', 1, 0),
(20, 5, 5, 4, '2019-05-22 19:22:34', '0000-00-00 00:00:00', 1, 0),
(21, 5, 5, 9, '2019-05-22 19:22:51', '0000-00-00 00:00:00', 1, 0),
(22, 5, 6, 2, '2019-05-22 19:23:52', '0000-00-00 00:00:00', 1, 0),
(23, 5, 6, 4, '2019-05-22 19:24:31', '0000-00-00 00:00:00', 1, 0),
(24, 5, 6, 9, '2019-05-22 19:24:43', '0000-00-00 00:00:00', 1, 0),
(25, 5, 7, 1, '2019-05-22 19:25:05', '0000-00-00 00:00:00', 1, 0),
(26, 5, 7, 2, '2019-05-22 19:25:37', '0000-00-00 00:00:00', 1, 0),
(27, 5, 7, 8, '2019-05-22 19:25:57', '0000-00-00 00:00:00', 1, 0),
(28, 5, 8, 1, '2019-05-22 19:26:24', '0000-00-00 00:00:00', 1, 0),
(29, 5, 8, 6, '2019-05-22 19:27:14', '0000-00-00 00:00:00', 1, 0),
(30, 5, 8, 9, '2019-05-22 19:27:27', '0000-00-00 00:00:00', 1, 0),
(31, 5, 9, 1, '2019-05-22 19:27:58', '0000-00-00 00:00:00', 1, 0),
(32, 5, 9, 2, '2019-05-22 19:28:18', '0000-00-00 00:00:00', 1, 0),
(33, 5, 9, 3, '2019-05-22 19:28:31', '0000-00-00 00:00:00', 1, 0),
(34, 5, 11, 1, '2019-05-22 19:29:09', '0000-00-00 00:00:00', 1, 0),
(35, 5, 11, 5, '2019-05-22 19:29:24', '0000-00-00 00:00:00', 1, 0),
(36, 5, 11, 4, '2019-05-22 19:29:53', '0000-00-00 00:00:00', 1, 0),
(37, 5, 11, 9, '2019-05-22 19:30:06', '0000-00-00 00:00:00', 1, 0),
(38, 5, 12, 7, '2019-05-22 19:30:29', '0000-00-00 00:00:00', 1, 0),
(39, 5, 12, 4, '2019-05-22 19:30:57', '0000-00-00 00:00:00', 1, 0),
(40, 5, 12, 9, '2019-05-22 19:31:08', '0000-00-00 00:00:00', 1, 0),
(41, 5, 13, 11, '2019-05-22 19:32:05', '0000-00-00 00:00:00', 1, 0),
(42, 5, 13, 13, '2019-05-22 19:32:18', '0000-00-00 00:00:00', 1, 0),
(43, 5, 13, 12, '2019-05-22 19:33:11', '0000-00-00 00:00:00', 1, 0),
(44, 5, 13, 2, '2019-05-22 19:33:25', '0000-00-00 00:00:00', 1, 0),
(45, 5, 13, 3, '2019-05-22 19:33:40', '0000-00-00 00:00:00', 1, 0),
(46, 5, 13, 4, '2019-05-22 19:33:57', '0000-00-00 00:00:00', 1, 0),
(47, 5, 13, 5, '2019-05-22 19:34:09', '0000-00-00 00:00:00', 1, 0),
(48, 5, 13, 9, '2019-05-22 19:34:21', '0000-00-00 00:00:00', 1, 0),
(49, 5, 14, 11, '2019-05-22 19:35:16', '0000-00-00 00:00:00', 1, 0),
(50, 5, 14, 13, '2019-05-22 19:35:35', '0000-00-00 00:00:00', 1, 0),
(51, 5, 14, 12, '2019-05-22 19:35:51', '0000-00-00 00:00:00', 1, 0),
(52, 5, 14, 2, '2019-05-22 19:36:06', '0000-00-00 00:00:00', 1, 0),
(53, 5, 14, 3, '2019-05-22 19:36:21', '0000-00-00 00:00:00', 1, 0),
(54, 5, 14, 4, '2019-05-22 19:36:36', '0000-00-00 00:00:00', 1, 0),
(55, 5, 14, 5, '2019-05-22 19:36:57', '0000-00-00 00:00:00', 1, 0),
(56, 5, 14, 7, '2019-05-22 19:37:10', '0000-00-00 00:00:00', 1, 0),
(57, 5, 2, 1, '2019-05-22 20:04:08', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `marks_weightage_type`
--

CREATE TABLE `marks_weightage_type` (
  `weightage_type_id` int(11) NOT NULL,
  `weightage_type_name` varchar(30) NOT NULL,
  `weightage_type_description` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marks_weightage_type`
--

INSERT INTO `marks_weightage_type` (`weightage_type_id`, `weightage_type_name`, `weightage_type_description`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Attendance', '', '2019-04-22 06:55:40', '0000-00-00 00:00:00', 3, 0),
(2, 'Assignment', '', '2019-04-22 06:55:55', '0000-00-00 00:00:00', 3, 0),
(3, 'Presentation', '', '2019-04-22 06:56:08', '0000-00-00 00:00:00', 3, 0),
(4, 'Dressing', '', '2019-04-22 06:56:16', '0000-00-00 00:00:00', 3, 0),
(5, 'Behaviour', '', '2019-04-22 06:56:27', '0000-00-00 00:00:00', 3, 0),
(6, 'Theory', '', '2019-04-22 06:56:37', '0000-00-00 00:00:00', 3, 0),
(7, 'Practical', '', '2019-04-22 06:57:06', '0000-00-00 00:00:00', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1538846625),
('m130524_201442_init', 1538846629);

-- --------------------------------------------------------

--
-- Table structure for table `msg_of_day`
--

CREATE TABLE `msg_of_day` (
  `msg_of_day_id` int(11) NOT NULL,
  `msg_details` varchar(100) NOT NULL,
  `msg_user_type` enum('Students','Parents','Employees','Others') NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_status` enum('Active','Inactive') NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `msg_of_day`
--

INSERT INTO `msg_of_day` (`msg_of_day_id`, `msg_details`, `msg_user_type`, `created_at`, `created_by`, `updated_at`, `updated_by`, `is_status`, `delete_status`) VALUES
(1, 'Each Day is a GIFT don\'t send it BACK unopened.  Have a nice Day !', 'Students', '2015-05-27 15:21:01', 1, NULL, NULL, 'Active', 1),
(2, 'Every day may not be GOOD but there is something GOOD in every day.', 'Parents', '2015-05-27 15:21:22', 1, NULL, NULL, 'Active', 1),
(3, 'Every ONE wants happiness, No ONE needs pain, But its not possible to get a rainbow.', 'Employees', '2015-05-27 15:21:41', 1, NULL, NULL, 'Active', 1),
(4, 'Smile is the Electricity and Life is a Battery whenever you Smile the Battery gets Charges.', 'Students', '2015-05-27 15:21:59', 1, '2018-12-26 18:11:26', 1, 'Active', 1),
(5, 'The Best for the Group comes when everyone in the group does what’s best for himself AND the group.', 'Students', '2015-05-27 15:22:20', 1, NULL, NULL, 'Active', 1),
(6, 'In life, as in football, you won\'t go far unless you know where the goalposts are.-- Arnold Glasow', 'Students', '2015-05-27 15:24:54', 1, '2018-12-26 18:11:18', 1, 'Active', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `notice_id` int(11) NOT NULL,
  `notice_title` varchar(25) NOT NULL,
  `notice_description` text,
  `notice_start` datetime NOT NULL,
  `notice_end` datetime NOT NULL,
  `notice_user_type` enum('Students','Parents','Employees','Others') NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notice`
--

INSERT INTO `notice` (`notice_id`, `notice_title`, `notice_description`, `notice_start`, `notice_end`, `notice_user_type`, `created_at`, `created_by`, `updated_at`, `updated_by`, `is_status`) VALUES
(1, 'Final Term Exams ', 'Final Term Exams will be conducted on coming monday. All The Best !', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Students', '2015-05-27 15:26:29', 1, '2019-01-26 11:59:21', 9, 'Active'),
(2, 'Monthly Report', 'All Employee have to submit their report on month end.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Employees', '2015-05-27 15:27:23', 1, '2018-12-26 18:43:37', 1, 'Inactive'),
(3, 'Summer Vacation', 'Summer Vacation starts from June to  2nd week of July.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Students', '2015-05-27 15:28:37', 1, '2018-12-26 18:44:16', 1, 'Inactive'),
(4, 'Attendance Report', 'All Employees collect their class wise  attendance report', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Employees', '2015-05-27 15:30:35', 1, '2018-12-26 18:44:19', 1, 'Inactive'),
(5, 'Exam From Fill', 'All Students come and fill their exam forms', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Students', '2015-05-27 15:33:07', 1, '2018-12-26 18:44:03', 1, 'Active'),
(6, 'Roll No Slip', 'Collect your roll no slips from the exams department.', '2019-01-30 04:10:44', '1900-12-02 03:00:00', 'Students', '2019-01-30 15:04:08', 9, '2019-01-30 16:12:50', 9, 'Active'),
(7, 'Meeting', 'Meeting at 5:00 Pm for final exams conduction.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Employees', '2019-01-30 15:11:30', 9, '0000-00-00 00:00:00', 0, 'Inactive'),
(9, 'PTM', 'Parent teacher meeting on 01-Feb-2019 at 5:00 Pm.<br><b>Venue: Brookfield Group of Colleges</b>.', '2019-01-30 04:01:59', '2019-02-01 05:00:53', 'Parents', '2019-01-30 16:02:23', 9, '2019-01-30 16:36:13', 9, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `paraay`
--

CREATE TABLE `paraay` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paraay`
--

INSERT INTO `paraay` (`id`, `name`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'الم ۱', '2019-07-07 13:03:04', '2019-07-07 13:03:04', 1, 1),
(2, '۲ سَيَقُولُ', '2019-07-07 13:03:23', '0000-00-00 00:00:00', 1, 0),
(3, '۳ تِلْكَ الرُّسُلُ', '2019-07-07 13:03:56', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `phone_book`
--

CREATE TABLE `phone_book` (
  `id` int(11) NOT NULL,
  `contact_person` varchar(32) NOT NULL,
  `phone_no` varchar(15) NOT NULL,
  `address` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phone_book`
--

INSERT INTO `phone_book` (`id`, `contact_person`, `phone_no`, `address`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'انس شفقت', '+92-306-3772105', 'Gulshan-e-Iqbal RYK', '2019-06-19 11:07:55', '2019-06-19 11:07:55', 1, 1),
(2, 'Nauman Shahid', '+92-331-7375027', 'Satellite Town, RYK', '2019-06-19 12:14:56', '2019-06-19 12:14:56', 1, 1),
(3, 'Rana Faraz Ahmed', '+92-300-6999824', 'Gulshan-e-Nasir, RYK', '2019-06-19 11:16:34', '0000-00-00 00:00:00', 1, 0),
(4, 'Jawad-Ur-Rehman', '+92-332-9009438', 'Jamia Qadria Mudrassa, RYK', '2019-07-07 07:35:39', '0000-00-00 00:00:00', 1, 0),
(5, 'Zia-Ur-Rehman', '+92-332-7318576', 'Jamia Qadria Mudrassa, RYK', '2019-07-07 07:36:32', '0000-00-00 00:00:00', 1, 0),
(6, 'Kinza', '+92-300-7976242', 'Gulshan Iqbal', '2019-07-07 10:57:16', '2019-07-07 10:57:16', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL,
  `room_name` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_id`, `room_name`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Room-1', '2019-05-25 19:47:51', '0000-00-00 00:00:00', 0, 0),
(2, 'Room-2', '2019-05-25 19:49:27', '0000-00-00 00:00:00', 0, 0),
(3, 'Room-3', '2019-05-25 19:49:56', '0000-00-00 00:00:00', 1, 0),
(4, 'Room-4', '2019-05-25 19:50:04', '0000-00-00 00:00:00', 1, 0),
(5, 'Room-5', '2019-05-25 19:50:20', '0000-00-00 00:00:00', 0, 0),
(6, 'Room-6', '2019-05-25 19:50:34', '0000-00-00 00:00:00', 1, 0),
(7, 'Room-7', '2019-05-25 19:50:41', '0000-00-00 00:00:00', 1, 0),
(8, 'Room-8', '2019-05-25 19:50:48', '0000-00-00 00:00:00', 1, 0),
(9, 'Room-9', '2019-05-25 19:50:56', '0000-00-00 00:00:00', 1, 0),
(10, 'Room-10', '2019-05-25 19:51:00', '0000-00-00 00:00:00', 1, 0),
(11, 'Room-11', '2019-05-25 19:51:05', '0000-00-00 00:00:00', 1, 0),
(12, 'Room-12', '2019-05-25 19:51:10', '0000-00-00 00:00:00', 1, 0),
(13, 'Room-13', '2019-05-25 19:51:13', '0000-00-00 00:00:00', 1, 0),
(14, 'Room-14', '2019-05-25 19:51:19', '0000-00-00 00:00:00', 1, 0),
(15, 'Room-15', '2019-05-25 19:51:22', '0000-00-00 00:00:00', 1, 0),
(16, 'Room-16', '2019-05-25 19:51:26', '0000-00-00 00:00:00', 1, 0),
(17, 'Room-17', '2019-05-25 19:51:32', '0000-00-00 00:00:00', 1, 0),
(18, 'Room-18', '2019-05-25 19:51:38', '0000-00-00 00:00:00', 1, 0),
(19, 'Room-19', '2019-05-25 19:51:55', '0000-00-00 00:00:00', 1, 0),
(20, 'Room-20', '2019-05-25 19:51:59', '0000-00-00 00:00:00', 1, 0),
(21, 'Computer Lab-1', '2019-05-25 19:52:17', '0000-00-00 00:00:00', 1, 0),
(22, 'Computer Lab-2', '2019-05-25 19:52:25', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sms`
--

CREATE TABLE `sms` (
  `sms_id` int(11) NOT NULL,
  `sms_name` varchar(120) NOT NULL,
  `sms_template` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms`
--

INSERT INTO `sms` (`sms_id`, `sms_name`, `sms_template`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 'Absent Message', 'Absent Message', '2019-03-07 08:20:16', '0000-00-00 00:00:00', 3, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `std_academic_info`
--

CREATE TABLE `std_academic_info` (
  `academic_id` int(11) NOT NULL,
  `std_id` int(11) NOT NULL,
  `class_name_id` int(11) NOT NULL,
  `subject_combination` int(11) DEFAULT NULL,
  `previous_class` varchar(50) NOT NULL,
  `passing_year` int(32) DEFAULT NULL,
  `previous_class_rollno` int(11) DEFAULT NULL,
  `total_marks` int(11) DEFAULT NULL,
  `obtained_marks` int(11) DEFAULT NULL,
  `grades` varchar(10) NOT NULL,
  `percentage` varchar(5) DEFAULT NULL,
  `Institute` varchar(50) NOT NULL,
  `std_enroll_status` varchar(6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_academic_info`
--

INSERT INTO `std_academic_info` (`academic_id`, `std_id`, `class_name_id`, `subject_combination`, `previous_class`, `passing_year`, `previous_class_rollno`, `total_marks`, `obtained_marks`, `grades`, `percentage`, `Institute`, `std_enroll_status`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 1, 23, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-15 07:43:17', '0000-00-00 00:00:00', 1, 0, 1),
(2, 2, 30, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-16 04:32:16', '0000-00-00 00:00:00', 1, 0, 1),
(3, 3, 28, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-16 04:34:01', '0000-00-00 00:00:00', 1, 0, 1),
(4, 4, 30, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-16 06:12:14', '0000-00-00 00:00:00', 1, 0, 1),
(5, 5, 28, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-16 10:34:27', '0000-00-00 00:00:00', 1, 0, 1),
(6, 6, 29, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-17 03:42:51', '0000-00-00 00:00:00', 1, 0, 1),
(7, 7, 26, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-17 03:55:51', '0000-00-00 00:00:00', 1, 0, 1),
(8, 8, 27, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-17 04:03:14', '0000-00-00 00:00:00', 1, 0, 1),
(9, 9, 27, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-17 04:33:45', '0000-00-00 00:00:00', 1, 0, 1),
(10, 10, 30, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-17 04:53:01', '0000-00-00 00:00:00', 1, 0, 1),
(11, 11, 28, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-17 05:34:49', '0000-00-00 00:00:00', 1, 0, 1),
(12, 12, 20, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-17 07:32:38', '0000-00-00 00:00:00', 1, 0, 1),
(13, 13, 26, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-17 10:32:40', '0000-00-00 00:00:00', 1, 0, 1),
(14, 14, 26, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-17 10:36:26', '0000-00-00 00:00:00', 1, 0, 1),
(15, 15, 26, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-17 10:39:09', '0000-00-00 00:00:00', 1, 0, 1),
(16, 16, 27, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-17 10:41:49', '0000-00-00 00:00:00', 1, 0, 1),
(17, 17, 27, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-17 10:45:04', '0000-00-00 00:00:00', 1, 0, 1),
(18, 18, 26, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-17 10:49:25', '0000-00-00 00:00:00', 1, 0, 1),
(19, 19, 26, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-17 10:54:24', '0000-00-00 00:00:00', 1, 0, 1),
(20, 20, 27, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-17 10:57:37', '0000-00-00 00:00:00', 1, 0, 1),
(21, 21, 27, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-17 11:05:01', '0000-00-00 00:00:00', 1, 0, 1),
(22, 22, 26, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-17 11:12:19', '0000-00-00 00:00:00', 1, 0, 1),
(23, 23, 24, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-17 11:19:03', '0000-00-00 00:00:00', 1, 0, 1),
(24, 24, 24, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-17 11:25:05', '0000-00-00 00:00:00', 1, 0, 1),
(25, 25, 24, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-17 11:27:32', '0000-00-00 00:00:00', 1, 0, 1),
(26, 26, 22, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-17 11:30:13', '0000-00-00 00:00:00', 1, 0, 1),
(27, 27, 25, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-17 11:38:48', '0000-00-00 00:00:00', 1, 0, 1),
(28, 28, 25, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-17 11:51:56', '0000-00-00 00:00:00', 1, 0, 1),
(29, 29, 25, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-17 12:25:02', '0000-00-00 00:00:00', 1, 0, 1),
(30, 30, 26, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-18 03:32:15', '0000-00-00 00:00:00', 1, 0, 1),
(31, 31, 30, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-18 03:49:40', '0000-00-00 00:00:00', 1, 0, 1),
(32, 32, 29, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-18 04:07:40', '0000-00-00 00:00:00', 1, 0, 1),
(33, 33, 26, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-18 04:16:05', '0000-00-00 00:00:00', 1, 0, 1),
(34, 34, 30, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-18 05:14:21', '0000-00-00 00:00:00', 1, 0, 1),
(35, 35, 26, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-18 05:20:01', '0000-00-00 00:00:00', 1, 0, 1),
(36, 36, 22, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-18 10:20:07', '0000-00-00 00:00:00', 1, 0, 1),
(37, 37, 33, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-18 15:20:12', '0000-00-00 00:00:00', 1, 0, 1),
(38, 38, 26, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-19 03:29:18', '0000-00-00 00:00:00', 1, 0, 1),
(39, 39, 28, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-19 06:34:59', '0000-00-00 00:00:00', 1, 0, 1),
(40, 40, 28, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-19 06:37:22', '0000-00-00 00:00:00', 1, 0, 1),
(41, 41, 28, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-19 06:38:49', '0000-00-00 00:00:00', 1, 0, 1),
(42, 42, 25, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-06-19 11:38:20', '0000-00-00 00:00:00', 1, 0, 1),
(43, 43, 25, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-07-07 10:38:52', '0000-00-00 00:00:00', 1, 0, 1),
(44, 44, 25, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-07-07 10:47:10', '0000-00-00 00:00:00', 1, 0, 1),
(45, 45, 25, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-07-07 11:06:33', '0000-00-00 00:00:00', 1, 0, 1),
(46, 46, 25, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-07-07 11:12:15', '0000-00-00 00:00:00', 1, 0, 1),
(47, 47, 25, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-07-07 11:15:24', '0000-00-00 00:00:00', 1, 0, 1),
(48, 48, 25, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-07-07 11:32:37', '0000-00-00 00:00:00', 1, 0, 1),
(49, 49, 20, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-07-07 11:39:41', '0000-00-00 00:00:00', 1, 0, 1),
(50, 50, 25, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-07-07 11:46:02', '0000-00-00 00:00:00', 1, 0, 1),
(51, 51, 31, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-07-07 12:00:51', '0000-00-00 00:00:00', 1, 0, 1),
(52, 52, 25, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '', 'unsign', '2019-07-07 12:04:18', '0000-00-00 00:00:00', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `std_attendance`
--

CREATE TABLE `std_attendance` (
  `std_attend_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `class_name_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `std_id` int(11) NOT NULL,
  `attendance` varchar(2) CHARACTER SET utf8 NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_attendance`
--

INSERT INTO `std_attendance` (`std_attend_id`, `user_id`, `class_name_id`, `date`, `std_id`, `attendance`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 25, '2019-07-06', 27, 'P', 1, 0, '2019-07-06 19:31:49', '0000-00-00 00:00:00'),
(2, 1, 25, '2019-07-06', 28, 'A', 1, 0, '2019-07-06 19:31:49', '0000-00-00 00:00:00'),
(3, 1, 25, '2019-07-06', 29, 'P', 1, 0, '2019-07-06 19:31:49', '0000-00-00 00:00:00'),
(4, 1, 25, '2019-07-06', 42, 'L', 1, 0, '2019-07-06 19:31:49', '0000-00-00 00:00:00'),
(5, 1, 25, '2019-07-07', 27, 'P', 1, 0, '2019-07-07 07:10:31', '0000-00-00 00:00:00'),
(6, 1, 25, '2019-07-07', 28, 'P', 1, 0, '2019-07-07 07:10:31', '0000-00-00 00:00:00'),
(7, 1, 25, '2019-07-07', 29, 'A', 1, 0, '2019-07-07 07:10:31', '0000-00-00 00:00:00'),
(8, 1, 25, '2019-07-07', 42, 'L', 1, 0, '2019-07-07 07:10:31', '0000-00-00 00:00:00'),
(9, 1, 25, '2019-07-07', 27, 'P', 1, 0, '2019-07-07 07:15:14', '0000-00-00 00:00:00'),
(10, 1, 25, '2019-07-07', 28, 'P', 1, 0, '2019-07-07 07:15:14', '0000-00-00 00:00:00'),
(11, 1, 25, '2019-07-07', 29, 'L', 1, 0, '2019-07-07 07:15:14', '0000-00-00 00:00:00'),
(12, 1, 25, '2019-07-07', 42, 'A', 1, 0, '2019-07-07 07:15:14', '0000-00-00 00:00:00'),
(13, 1, 26, '2019-07-07', 7, 'P', 1, 0, '2019-07-07 07:17:12', '0000-00-00 00:00:00'),
(14, 1, 26, '2019-07-07', 13, 'P', 1, 0, '2019-07-07 07:17:12', '0000-00-00 00:00:00'),
(15, 1, 26, '2019-07-07', 14, 'P', 1, 0, '2019-07-07 07:17:12', '0000-00-00 00:00:00'),
(16, 1, 26, '2019-07-07', 15, 'P', 1, 0, '2019-07-07 07:17:12', '0000-00-00 00:00:00'),
(17, 1, 26, '2019-07-07', 18, 'P', 1, 0, '2019-07-07 07:17:12', '0000-00-00 00:00:00'),
(18, 1, 26, '2019-07-07', 19, 'P', 1, 0, '2019-07-07 07:17:12', '0000-00-00 00:00:00'),
(19, 1, 26, '2019-07-07', 22, 'P', 1, 0, '2019-07-07 07:17:12', '0000-00-00 00:00:00'),
(20, 1, 26, '2019-07-07', 30, 'P', 1, 0, '2019-07-07 07:17:12', '0000-00-00 00:00:00'),
(21, 1, 26, '2019-07-07', 33, 'A', 1, 0, '2019-07-07 07:17:12', '0000-00-00 00:00:00'),
(22, 1, 26, '2019-07-07', 35, 'P', 1, 0, '2019-07-07 07:17:12', '0000-00-00 00:00:00'),
(23, 1, 26, '2019-07-07', 38, 'L', 1, 0, '2019-07-07 07:17:12', '0000-00-00 00:00:00'),
(24, 1, 29, '2019-07-07', 6, 'P', 1, 0, '2019-07-07 10:05:22', '0000-00-00 00:00:00'),
(25, 1, 29, '2019-07-07', 32, 'A', 1, 0, '2019-07-07 10:05:23', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `std_class_name`
--

CREATE TABLE `std_class_name` (
  `class_name_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `class_name` varchar(120) CHARACTER SET utf8 NOT NULL,
  `class_name_description` varchar(255) CHARACTER SET utf8 NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_class_name`
--

INSERT INTO `std_class_name` (`class_name_id`, `branch_id`, `class_name`, `class_name_description`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(18, 5, 'دورہ حدیث شریف', 'درجہ کتب', 'Active', '2019-06-15 02:25:53', '2019-06-15 02:25:53', 1, 1, 1),
(19, 5, 'موقوف علیہ', 'درجہ کتب', 'Active', '2019-06-15 02:26:25', '0000-00-00 00:00:00', 1, 0, 1),
(20, 5, 'درجہ عالیہ', 'درجہ کتب', 'Active', '2019-06-15 02:30:55', '0000-00-00 00:00:00', 1, 0, 1),
(21, 5, 'درجہ خامسہ', 'درجہ کتب', 'Active', '2019-06-15 02:31:20', '0000-00-00 00:00:00', 1, 0, 1),
(22, 5, 'درجہ رابعہ', 'درجہ کتب', 'Active', '2019-06-15 02:31:41', '0000-00-00 00:00:00', 1, 0, 1),
(23, 5, 'درجہ ثالثہ', 'درجہ کتب', 'Active', '2019-06-15 02:32:06', '0000-00-00 00:00:00', 1, 0, 1),
(24, 5, 'درجہ ثانیہ', 'درجہ کتب', 'Active', '2019-06-15 02:32:43', '0000-00-00 00:00:00', 1, 0, 1),
(25, 5, 'درجہ اولیٰ', 'درجہ کتب', 'Active', '2019-06-15 02:33:09', '0000-00-00 00:00:00', 1, 0, 1),
(26, 5, 'درجہ متوسطہ', 'درجہ کتب', 'Active', '2019-06-15 02:35:31', '0000-00-00 00:00:00', 1, 0, 1),
(27, 5, 'درجہ اعدادیہ', 'درجہ کتب', 'Active', '2019-06-15 02:36:57', '0000-00-00 00:00:00', 1, 0, 1),
(28, 5, 'قاری عبد الرزاق ', 'شعبہ حفظ و گردان', 'Active', '2019-06-15 02:38:01', '0000-00-00 00:00:00', 1, 0, 1),
(29, 5, 'قاری راشد محمد چیمہ', 'شعبہ حفظ و گردان', 'Active', '2019-06-15 02:38:26', '0000-00-00 00:00:00', 1, 0, 1),
(30, 5, 'قاری نیاز الرحمن', 'درجہ حفظ', 'Active', '2019-06-15 02:38:50', '0000-00-00 00:00:00', 1, 0, 1),
(31, 5, 'قاری تمیم اختر ', 'شعبہ حفظ', 'Active', '2019-06-15 02:39:16', '0000-00-00 00:00:00', 1, 0, 1),
(32, 5, 'قاری شفیق الرحمن', 'شعبہ حفظ', 'Active', '2019-06-15 02:39:41', '0000-00-00 00:00:00', 1, 0, 1),
(33, 5, 'قاری کاشف', 'شعبہ حفظ', 'Active', '2019-06-15 02:40:02', '0000-00-00 00:00:00', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `std_enrollment_detail`
--

CREATE TABLE `std_enrollment_detail` (
  `std_enroll_detail_id` int(11) NOT NULL,
  `std_enroll_detail_head_id` int(11) NOT NULL,
  `std_reg_no` varchar(15) NOT NULL,
  `std_roll_no` varchar(32) NOT NULL,
  `std_enroll_detail_std_id` int(11) NOT NULL,
  `std_enroll_detail_std_name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `std_enrollment_head`
--

CREATE TABLE `std_enrollment_head` (
  `std_enroll_head_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `class_name_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `std_enroll_head_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_enrollment_head`
--

INSERT INTO `std_enrollment_head` (`std_enroll_head_id`, `branch_id`, `class_name_id`, `session_id`, `section_id`, `std_enroll_head_name`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 5, 3, 4, 3, 'Prep-2019 - 2020 -Green', '2019-05-08 05:19:21', '0000-00-00 00:00:00', 1, 0, 1),
(2, 5, 1, 4, 1, 'KG-1-2019 - 2020 -Red', '2019-05-23 04:08:33', '0000-00-00 00:00:00', 1, 0, 1),
(3, 5, 1, 4, 2, 'KG-1-2019 - 2020 -Blue', '2019-05-23 04:09:41', '0000-00-00 00:00:00', 1, 0, 1),
(4, 5, 1, 4, 3, 'KG-1-2019 - 2020 -Green', '2019-05-23 04:11:15', '0000-00-00 00:00:00', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `std_fee_details`
--

CREATE TABLE `std_fee_details` (
  `fee_id` int(11) NOT NULL,
  `std_id` int(11) NOT NULL,
  `admission_fee` double NOT NULL,
  `addmission_fee_discount` int(11) NOT NULL,
  `net_addmission_fee` double NOT NULL,
  `concession_id` int(11) NOT NULL,
  `tuition_fee` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `std_fee_installments`
--

CREATE TABLE `std_fee_installments` (
  `fee_installment_id` int(11) NOT NULL,
  `std_fee_id` int(11) NOT NULL,
  `installment_no` int(11) NOT NULL,
  `installment_amount` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `std_fee_pkg`
--

CREATE TABLE `std_fee_pkg` (
  `std_fee_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `admission_fee` double NOT NULL,
  `tutuion_fee` double DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_fee_pkg`
--

INSERT INTO `std_fee_pkg` (`std_fee_id`, `session_id`, `class_id`, `admission_fee`, `tutuion_fee`, `created_at`, `created_by`, `updated_at`, `updated_by`, `delete_status`) VALUES
(1, 4, 1, 3000, 2000, '2019-03-20 05:36:41', 1, '0000-00-00 00:00:00', 0, 1),
(2, 4, 16, 3000, 2000, '2019-04-20 08:05:04', 1, '2019-04-20 08:05:04', 3, 1),
(3, 4, 2, 3000, 2000, '2019-03-20 05:37:44', 1, '0000-00-00 00:00:00', 0, 1),
(4, 4, 3, 3000, 2000, '2019-03-20 05:38:02', 1, '0000-00-00 00:00:00', 0, 1),
(5, 4, 4, 4000, 3000, '2019-03-20 05:38:18', 1, '0000-00-00 00:00:00', 0, 1),
(6, 4, 5, 4000, 3000, '2019-03-20 05:38:52', 1, '0000-00-00 00:00:00', 0, 1),
(7, 4, 6, 4000, 3000, '2019-03-20 05:39:19', 1, '0000-00-00 00:00:00', 0, 1),
(8, 4, 7, 4000, 3000, '2019-03-20 05:40:57', 1, '2019-03-20 05:40:57', 1, 1),
(9, 4, 8, 4000, 3000, '2019-03-20 05:40:37', 1, '0000-00-00 00:00:00', 0, 1),
(10, 6, 9, 5000, 3000, '2019-03-20 05:42:20', 4, '0000-00-00 00:00:00', 0, 1),
(11, 6, 11, 5000, 3000, '2019-03-20 05:42:37', 4, '0000-00-00 00:00:00', 0, 1),
(12, 6, 12, 5000, 3000, '2019-03-20 05:42:54', 4, '0000-00-00 00:00:00', 0, 1),
(13, 6, 13, 5000, 4000, '2019-03-20 05:43:14', 4, '0000-00-00 00:00:00', 0, 1),
(14, 6, 14, 5000, 4000, '2019-03-20 05:43:32', 4, '0000-00-00 00:00:00', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `std_guardian_info`
--

CREATE TABLE `std_guardian_info` (
  `std_guardian_info_id` int(11) NOT NULL,
  `std_id` int(11) NOT NULL,
  `guardian_name` varchar(50) NOT NULL,
  `guardian_relation` varchar(50) NOT NULL,
  `guardian_cnic` varchar(15) NOT NULL,
  `guardian_email` varchar(84) NOT NULL,
  `guardian_contact_no_1` varchar(15) NOT NULL,
  `guardian_contact_no_2` varchar(15) NOT NULL,
  `guardian_monthly_income` int(11) DEFAULT NULL,
  `guardian_occupation` varchar(50) NOT NULL,
  `guardian_designation` varchar(100) NOT NULL,
  `guardian_password` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `std_ice_info`
--

CREATE TABLE `std_ice_info` (
  `std_ice_id` int(11) NOT NULL,
  `std_id` int(11) NOT NULL,
  `std_ice_name` varchar(64) NOT NULL,
  `std_ice_relation` varchar(64) NOT NULL,
  `std_ice_contact_no` varchar(15) NOT NULL,
  `std_ice_address` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `std_inquiry`
--

CREATE TABLE `std_inquiry` (
  `std_inquiry_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `std_inquiry_no` varchar(15) NOT NULL,
  `inquiry_session` varchar(20) NOT NULL,
  `std_name` varchar(32) NOT NULL,
  `std_father_name` varchar(32) NOT NULL,
  `gender` enum('Female','Male') NOT NULL,
  `std_contact_no` varchar(15) NOT NULL,
  `std_father_contact_no` varchar(15) NOT NULL,
  `std_inquiry_date` date NOT NULL,
  `std_intrested_class` varchar(50) NOT NULL,
  `std_previous_class` varchar(32) NOT NULL,
  `previous_institute` varchar(120) NOT NULL,
  `std_roll_no` varchar(10) NOT NULL,
  `std_obtained_marks` int(4) NOT NULL,
  `std_total_marks` int(4) NOT NULL,
  `std_percentage` varchar(6) NOT NULL,
  `refrence_name` varchar(32) NOT NULL,
  `refrence_contact_no` varchar(15) NOT NULL,
  `refrence_designation` varchar(30) NOT NULL,
  `std_address` varchar(200) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `inquiry_status` enum('Inquiry','Registered') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_inquiry`
--

INSERT INTO `std_inquiry` (`std_inquiry_id`, `branch_id`, `std_inquiry_no`, `inquiry_session`, `std_name`, `std_father_name`, `gender`, `std_contact_no`, `std_father_contact_no`, `std_inquiry_date`, `std_intrested_class`, `std_previous_class`, `previous_institute`, `std_roll_no`, `std_obtained_marks`, `std_total_marks`, `std_percentage`, `refrence_name`, `refrence_contact_no`, `refrence_designation`, `std_address`, `comment`, `inquiry_status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 5, 'STD-Y19-01', '2019 - 2021', 'nauman', 'shahid', 'Male', '+92-333-7486345', '+92-300-6738133', '2019-02-13', 'Nursery', 'Nursery', 'ESNA Public School', '025', 900, 1100, '82%', 'Anas', '+90-331-7375765', 'MD DEXDEVS', 'RYK', '', 'Inquiry', '2019-04-20 05:04:32', '2019-04-20 05:04:32', 9, 3),
(2, 5, 'STD-Y19-02', '2019 - 2021', 'Farhan', 'Shahid', 'Male', '+92-331-5993454', '+92-331-5848948', '2019-03-06', 'ICS (Part - I)', 'Matric', 'ESNA Public School', '12345', 850, 1100, '77%', 'Nauman', '+92-333-7486765', 'MD', 'Satelite Town, Rahim Yar Khan', '', 'Inquiry', '2019-03-12 12:45:51', '2019-03-12 12:44:27', 3, 3),
(3, 5, 'STD-Y19-03', '2019 - 2021', 'Kinza', 'Mustafa', 'Female', '+92-345-6789234', '+92-456-7890987', '2019-03-07', 'FSC Pre-Medical (Part - I)', 'metric', 'The New Horizons School', '12365', 800, 1100, '73%', 'Nadia', '+92-987-6543765', 'hgh', 'lkjhgfdfghj', '', 'Inquiry', '2019-03-12 12:45:57', '2019-03-12 12:37:11', 3, 3),
(4, 5, 'STD-Y19-04', '2019 - 2021', 'Saif-ur-Rehman', 'M. Khalil', 'Male', '+92-308-3152045', '+92-302-3836145', '2019-03-12', 'ICS (Part - I)', 'Matric', 'Lahore School System', '265641', 743, 1050, '71%', 'Anas Shafqat', '+92-331-7375027', 'MD DEXDEVS', 'Chak # 145/p, Adaam Sahaba', '', 'Inquiry', '2019-03-12 12:46:05', '2019-03-12 12:38:57', 3, 3),
(5, 6, 'STD-Y19-05', '2019 - 2021', 'Nadia gull', 'Iftikhar ali', 'Female', '+92-315-8410500', '+92-303-8635458', '2019-03-12', 'FSC Pre-Engineering (Part - II)', 'Matric', 'Lahore School System', '1278', 780, 1050, '74%', 'Asmat Ara ', '+92-987-6545678', 'Ammi', 'kjhgfd', '', 'Inquiry', '2019-03-12 12:46:50', '2019-03-12 12:46:50', 3, 3),
(6, 6, 'STD-Y19-06', '2019 - 2021', 'Shahzad ', 'Saeed', 'Male', '+92-300-1234567', '+92-310-1234567', '2019-03-12', 'ICS (Part - I)', 'Metric', 'The New Horizons School', '263214', 743, 1050, '71%', 'Saif Ur Rehman', '+92-308-3152045', 'student', 'Chack No 51 p ', '', 'Inquiry', '2019-03-12 12:46:22', '2019-03-12 12:37:38', 3, 3),
(7, 6, 'STD-Y19-07', '2019 - 2021', 'Sadia ', 'Iftikhar ali', 'Female', '+92-987-6545678', '+92-234-5678987', '2019-03-13', 'FSC Pre-Medical (Part - I)', '10th', 'Lahore School System', '8765498765', 897, 1050, '85%', 'Aniqa', '+87-654-3456787', ',jnhbgvfd', 'lkjhgfd', 'lkjhgfdsdfghjklkjhbgv', 'Inquiry', '2019-03-13 05:32:47', '0000-00-00 00:00:00', 21, 0),
(8, 6, 'STD-Y19-08', '2019 - 2020', 'tfgyhuj', 'ihuhuihiu', 'Female', '+92-654-9848949', '+92-216-5189181', '2019-03-18', '8th ', '7th', 'Lahore School System', '123', 450, 500, '90%', 'iuytrfd', '+92-315-6894986', 'jnjn', 'bubj', 'omoimoim', 'Inquiry', '2019-03-18 09:17:53', '2019-03-18 09:11:18', 4, 4),
(9, 6, 'STD-Y19-09', '2019 - 2020', 'tygbbuhbHU', 'UHIUJIU', 'Male', '+92-316-5165197', '+92-333-3333333', '2019-03-18', 'Four', 'Three', 'Lahore School System', '123', 450, 500, '90%', 'HUK', '+92-361-6198619', 'DRTYFUGH IU', 'NJNOL', 'EDTRFYGUYH', 'Inquiry', '2019-03-18 09:20:32', '0000-00-00 00:00:00', 4, 0),
(10, 6, 'STD-Y19-010', '2019 - 2020', 'Aniqa', 'Gull', 'Female', '+92-654-3456789', '+92-876-5434567', '2019-03-18', 'Four', 'Three', 'Rehnuma Public School', '678', 450, 500, '90%', 'Ali', '+92-345-6789876', 'kjhgfds', 'nhbgfdsa', 'jhgfdsdvbnytrrftgyujikl\r\njhgfdsxcvbhjkoiuytrer6', 'Inquiry', '2019-03-18 12:44:25', '0000-00-00 00:00:00', 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `std_personal_info`
--

CREATE TABLE `std_personal_info` (
  `std_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `std_reg_no` varchar(50) CHARACTER SET latin1 NOT NULL,
  `std_name` varchar(50) NOT NULL,
  `std_father_name` varchar(100) NOT NULL,
  `std_father_contact_no` varchar(15) NOT NULL,
  `std_father_cnic` varchar(15) NOT NULL,
  `std_contact_no` varchar(15) CHARACTER SET latin1 NOT NULL,
  `std_DOB` date NOT NULL,
  `std_gender` enum('مرد','عورت') NOT NULL,
  `std_residency` enum('اقا متی','غیراقامتی') NOT NULL,
  `std_permanent_address` varchar(255) NOT NULL,
  `std_temporary_address` varchar(255) NOT NULL,
  `std_email` varchar(84) CHARACTER SET latin1 NOT NULL,
  `std_photo` varchar(200) NOT NULL,
  `std_b_form` varchar(255) CHARACTER SET latin1 NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `std_district` varchar(50) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `std_religion` varchar(100) NOT NULL,
  `std_nationality` varchar(100) NOT NULL,
  `std_tehseel` varchar(50) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `std_password` varchar(20) CHARACTER SET latin1 NOT NULL,
  `status` enum('Active','Inactive') CHARACTER SET latin1 NOT NULL,
  `std_admit_date` date DEFAULT NULL,
  `std_leave_date` date DEFAULT NULL,
  `academic_status` enum('Active','Promote','Left','Struck off') CHARACTER SET latin1 NOT NULL,
  `barcode` longblob NOT NULL,
  `std_other_info` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `std_personal_info`
--

INSERT INTO `std_personal_info` (`std_id`, `branch_id`, `std_reg_no`, `std_name`, `std_father_name`, `std_father_contact_no`, `std_father_cnic`, `std_contact_no`, `std_DOB`, `std_gender`, `std_residency`, `std_permanent_address`, `std_temporary_address`, `std_email`, `std_photo`, `std_b_form`, `class_id`, `std_district`, `std_religion`, `std_nationality`, `std_tehseel`, `std_password`, `status`, `std_admit_date`, `std_leave_date`, `academic_status`, `barcode`, `std_other_info`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 5, 'STD-REG-Y19-01', 'قاضی محمد اسماعیل', 'خلیل الرحمن قاضی', '+92-306-3772105', '12312-3123123-1', '+92-331-7375027', '2000-06-15', 'مرد', 'اقا متی', 'جامعہ انوار القرآن اسلم ٹائون رحیم یا رخان', '', '', 'uploads/std_default.jpg', '', 23, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-15', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-07-07 07:29:07', '2019-07-07 07:29:07', 1, 1, 1),
(2, 5, 'STD-REG-Y19-02', 'عبدالقادر', 'رزاق خان', '+92-300-8773062', '00000-0000000-0', '+00-000-0000000', '2005-11-15', 'مرد', 'اقا متی', 'غوثیہ کالونی', '', '', 'uploads/std_default.jpg', '', 30, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-16', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 18:39:36', '2019-06-19 18:39:36', 1, 1, 1),
(3, 5, 'STD-REG-Y19-03', 'عمر فاروق', 'محمد اختر', '+00-000-0000000', '00000-0000000-0', '+00-000-0000000', '2004-11-08', 'مرد', 'اقا متی', 'مڈ سائینداد،ڈاکخانہ مرغائی،تحصیل و ضلع راجن پور', '', '', 'uploads/std_default.jpg', '', 28, 'راجن پور', 'مسلمان', 'پاکستانی', 'راجن پور', '', 'Active', '2019-06-16', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 18:40:46', '2019-06-19 18:40:46', 1, 1, 1),
(4, 5, 'STD-REG-Y19-04', 'امیر حمزہ', 'حافظ نذیر احمد(چاچا)ا', '+92-303-8080190', '00000-0000000-0', '+00-000-0000000', '2005-12-26', 'مرد', 'اقا متی', 'شاہپور', '', '', 'uploads/std_default.jpg', '', 30, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-16', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 18:41:29', '2019-06-19 18:41:29', 1, 1, 1),
(5, 5, 'STD-REG-Y19-05', 'محمد عرفان', 'فضل دین', '+92-309-9625630', '32403-9345495-1', '+00-000-0000000', '2003-12-30', 'مرد', 'اقا متی', 'پوسٹ آفس رکن پور ،کچی زمان،تحصیل و ڈسٹرکٹ رحیم یار خان', '', '', 'uploads/std_default.jpg', '', 28, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-16', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 18:42:18', '2019-06-19 18:42:18', 1, 1, 1),
(6, 5, 'STD-REG-Y19-06', 'امیر عمر', 'ضیاء الحق ضیاء', '+92-302-5740849', '31303-9340461-3', '+92-000-0000000', '2004-01-02', 'مرد', 'اقا متی', 'شہباز نگر،عبدالرحمن،ڈاکخانہ تاج گھڑھ،تحصیل رحیم یار خان', '', '', 'uploads/std_default.jpg', '', 29, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-17', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 18:42:52', '2019-06-19 18:42:52', 1, 1, 1),
(7, 5, 'STD-REG-Y19-07', 'نصیب الرحمن', 'انیس الرحمن', '+92-301-6558330', '31303-2435824-3', '+00-000-0000000', '2005-01-01', 'مرد', 'اقا متی', 'عبدالرحمن،ڈاکخانہ بستی مولویاں،ضلع رحیم یار خان', '', '', 'uploads/std_default.jpg', '', 26, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-17', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 18:44:08', '2019-06-19 18:44:08', 1, 1, 1),
(8, 5, 'STD-REG-Y19-08', 'محمد خبیب', 'عبدالکریم', '+92-300-2413897', '31303-1435356-1', '+00-000-0000000', '2001-01-01', 'مرد', 'اقا متی', 'بستی عبدالسلام ،موضع جندوڈہ ڈاہر،ڈاکخانہ کوٹ کرم خان', ' جامعہ اسلامیہ حقانیہ،رفیق آبادگلی نمبر 2', '', 'uploads/std_default.jpg', '', 27, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-17', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 18:44:59', '2019-06-19 18:44:59', 1, 1, 1),
(9, 5, 'STD-REG-Y19-09', 'محمد یاسر', 'عبدالرشید', '+92-305-8419812', '31303-8389895-3', '+00-000-0000000', '2004-01-01', 'مرد', 'اقا متی', 'بستی درمحمد،چک نمبر 116پی،رحیم یارخان', '', '', 'uploads/std_default.jpg', '', 27, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-17', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 18:45:37', '2019-06-19 18:45:37', 1, 1, 1),
(10, 5, 'STD-REG-Y19-010', 'محمد ادریس', 'محمد کلیم اللہ', '+92-399-5931942', '31303-4290916-9', '+00-000-0000000', '2005-01-05', 'مرد', 'اقا متی', 'شاہ پور،ڈاکخانہ احسان پور،رحیم یار خان', '', '', 'uploads/std_default.jpg', '', 30, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-17', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 18:46:25', '2019-06-19 18:46:25', 1, 1, 1),
(11, 5, 'STD-REG-Y19-011', 'رحمت اللہ', 'محمد اسلم', '+92-304-0303941', '31303-7878153-9', '+00-000-0000000', '2009-06-06', 'مرد', 'اقا متی', 'ڈاک خانہ میانوالی قریشیاں،شاہ پور', '', '', 'uploads/std_default.jpg', '31303-0467839-7', 28, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-17', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a3341414147366b6c45515652345875326473597330525244463334614b6d6634425a706f4a52714b435969516d676f6d42476f6b4959694a6f4a48716669706c67496f4b496b52715943436143427672427032416b614b534a694c476d477037555864646454562f33644d31655a2f4e624f4f35325a36616e3532323972717258315830485354664c6a336942414167636863416a42306b33797339524c58415243494341546941535667414331306341496c306651316f41415477534e6741434d784441493831416b545a326a7742453272304a414d414d4243445344425270592f6349514b54646d7741417a454141497331416b545a326a7742453272304a414d414d4243445344425270592f6349514b54646d7741417a454141497331416b545a326a7742453272304a414d414d4243445344425270592f6349514b54646d7741417a454141497331416b545a326a7742453272304a414d414d4243445344425270592f634935496c30656e70366d6f487263446a495472586639764c4c2f4850376248524f504f357431623962626666756d576b7639745062507259396638625954753835657665744d657a68562b5062776e614566593150707638392f4876663031722f7439362f5a304f7437336c6b67306d62506a666d2f67736978532b2b5a55425a67786d314135484f4239696142433163526b5347534130676a7a48554e5539786248743470504d6f5975516831364b4e4e592b41527972756a4e4275475a4965363247326a734231654e67613058756a2f4f6a615875673538676862517435524837626930664a71617945306f56334a733869527a764e4d6371512b426843704930686b784946654345646f6431587351577859356d625267794d324e4254424c5346484e7151346870695a30436772546d524349304b377064636571634951615343745136544c3843646967556643497933796739464941354567556d612b45592b455232724f777844614564716447555a326f673650314a37516845675143534b46536571576a497659734178586d5565715a7332337a70426e596c39794a484b6b6a4a32514935456a6b534f746c4a6c52744a6f735a695248496b636974434f305779776659554c32617536544c5a71747852564b68436752476c5a62497a59674e6a51567564356f30704e774b56716c614c5733384b2b332b48475541694132494459674e694132744664494d6946374b5341776a3552625745694f7841725a5a753367577255344f524935456a6c534b58386172612b43534a647271444a4c33664649654351385572574c56485a64324e6f715965527635472f6b3738615741714f466b58676b5042496543592f454270476a584363374d37396c5130544542735147784162456867736259462b374d796a4f5a74665a736a684d434c4f76585735425a73616a62764851464b31537445725261724c4b483745687355452b745862396d4a2f4b42696f62536741342f6b385445416b696a5551625042496561546776744855434d704e6a3943726e523966324a6a4a486872786c53662b6f443176784945636952794a48496b64437465754e2b73654d71467455717379496a6b64694f36376d584e4d6f6875622f4937574c50487337364c426c4d567357733256784e616e62386a35344a447753486f6b4e49712f6b6a694f7867364a56696c59705771566f6c524b68544f3657575a6947324c444d386262676766794e2f4933386a66794e2f493338336435586649524c5272374849313055426c332b735756507353307a354a6e4e30612f545869386b63304d5947557832353953743830345a513053315137564474554f31513756724f4b51464b4b33526e4b4a56696c5a486f6733794e305772464b31576d356c6b516c4e794a484b6b7a664e4335456a4c70545a623855442b527635472f6b622b527635477455502b626d6b4335624f54673651623557666c504967456b534153524c7247376a2f4d4937582f733134574638534756662f455152414167594241507251444e6841416753344345416e6a4149454a4345436b43534453424168414a47774142435967414a456d6745675449414352734145516d494141524a6f41496b32414145514b4e6e43507043386b3353667049306d7653507176484c394e30717553507054306a3653484a5031516a723070365a3379642f7a3857556d66533370443074766c2b4d4f5366757a596e5a2f336936536e4a6630657a724e6a66355432374f4e344832767a626b6d6668664f2f6b66534d704c76434d336c2f6573395a74396e715a3377577531324e30313470425a45363337775a345a2f46364e33413344694e5350466c68507461306c2b426248623858556d76462b4c5a2b7a736c76535470765542516238654d2b776c4a3778655350426249616366734872634b6b657a3938354a4f477530347959785952754c597437636b66564952314a2f7a7439433332787439623845554d646f726766793549564c48417477413353765548736b7669352f62364f396b734f4f316f555779314c654e353859322f79336b2f465853485955635478617976536170396c353237584f535069306b613545384467522b33506f542b31342f66393166477853656b76547833686c556e683869565962676f557364677456457376666d505234495956684e46436648337957382b716b4b462b4f7465305236764868474f39653954417a7a7a467447373258762f547937787676356f7154345450567a5269396e48756d445573676377387465662b4753424a4657387057596b3678354a434f556551416a7a4d676a5761583979354c7544546d57357a6765537671397670583059416a336e434352644857342b494b6b4c3073346163636949597738333155355769536c745774356c6e6b354937324670555a6b2f387a7a7474727251535349314c57423173676578596257364778356875644648704b354f4f48656f64644739437a753253795563354843373265436752484f765643387267363361704b31637072364f65302b6179476f48376542344373596449454148696b5951315374527171646a39353265552b314d302f7a632f456f466c725a4b3650617455534e327541394e49766e746b6a5265716237677a66303537532b6d57653166765a454659634b6b65487143414b52474656425941494345476b43694451424168414a477743424351684170416b67306751496e42487065306b3377514945514f426f4242373948315062392b6a307942534a4141414141456c46546b5375516d4343, '', '2019-06-19 18:47:20', '2019-06-19 18:47:20', 1, 1, 1),
(12, 5, 'STD-REG-Y19-012', 'ابراھیم خلیل', 'شیر باز(بھائی)ا', '+92-333-7366771', '43504-0361848-9', '+00-000-0000000', '2000-02-01', 'مرد', 'اقا متی', 'محلہ بخت علی،گڈو ٹائون کمیٹی،تحصیل کشمور', '', '', 'uploads/std_default.jpg', '', 20, 'کشمور', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-17', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 18:48:00', '2019-06-19 18:48:00', 1, 1, 1),
(13, 5, 'STD-REG-Y19-013', 'محمد عباس', 'محمد ظریف', '+92-308-7171807', '00000-0000000-0', '+00-000-0000000', '2004-01-01', 'مرد', 'اقا متی', 'کچہ رنگ پور تحصیل و ضلع روجھان', '', '', 'uploads/std_default.jpg', '', 26, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'روجھان', '', 'Active', '2019-06-17', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 18:48:43', '2019-06-19 18:48:43', 1, 1, 1),
(14, 5, 'STD-REG-Y19-014', 'محمد بلال', 'واحد بخش', '+92-307-7946080', '00000-0000000-0', '+00-000-0000000', '2005-01-01', 'مرد', 'اقا متی', 'رنگ پور، ضلع روجھان', '', '', 'uploads/std_default.jpg', '', 26, 'راجن پور', 'مسلمان', 'پاکستانی', 'روجھان', '', 'Active', '2019-06-17', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 18:49:24', '2019-06-19 18:49:24', 1, 1, 1),
(15, 5, 'STD-REG-Y19-015', 'محمد مطیع اللہ', 'عصمت اللہ آفتاب', '+92-300-6768666', '00000-0000000-0', '+00-000-0000000', '2003-01-01', 'مرد', 'اقا متی', 'فتح پور پنجابیاں، بستی مولویاں', '', '', 'uploads/std_default.jpg', '', 26, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-17', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 18:50:15', '2019-06-19 18:50:15', 1, 1, 1),
(16, 5, 'STD-REG-Y19-016', 'محمد عبد اللہ', 'شکیل احمد', '+92-305-2395479', '31303-6394808-5', '+00-000-0000000', '2007-06-04', 'مرد', 'اقا متی', 'ڈوڈی سانگھی،ڈاکخانہ رکن پور', '', '', 'uploads/std_default.jpg', '', 27, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-17', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 18:51:33', '2019-06-19 18:51:33', 1, 1, 1),
(17, 5, 'STD-REG-Y19-017', 'عبدالماجد', 'مختیاراحمد', '+92-316-8315589', '31303-8611320-7', '+00-000-0000000', '2006-01-01', 'مرد', 'اقا متی', 'بستی برڑہ،رحیم یار خان', '', '', 'uploads/std_default.jpg', '', 27, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-17', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 18:52:17', '2019-06-19 18:52:17', 1, 1, 1),
(18, 5, 'STD-REG-Y19-018', 'ولی اللہ', 'عبدالرزاق', '+92-333-3961653', '00000-0000000-0', '+00-000-0000000', '2004-01-01', 'مرد', 'اقا متی', 'ٹب چوہان ڈاکخانہ، اقبال آباد،رحیم یار خان', '', '', 'uploads/std_default.jpg', '', 26, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-17', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 18:52:50', '2019-06-19 18:52:50', 1, 1, 1),
(19, 5, 'STD-REG-Y19-019', 'سمیع اللہ', 'نزیر احمد', '+92-308-7274301', '00000-0000000-0', '+00-000-0000000', '2003-01-01', 'مرد', 'اقا متی', 'ٹب چوہان ڈاکخانہ، اقبال آباد،رحیم یار خان', '', '', 'uploads/std_default.jpg', '', 26, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-17', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 18:53:39', '2019-06-19 18:53:39', 1, 1, 1),
(20, 5, 'STD-REG-Y19-020', 'محمد حذیفہ', 'عبدالرزاق', '+92-301-3944479', '00000-0000000-0', '+00-000-0000000', '2005-06-20', 'مرد', 'اقا متی', 'مدرسہ جامعہ قادریہ', '', '', 'uploads/std_default.jpg', '', 27, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-17', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 18:54:19', '2019-06-19 18:54:19', 1, 1, 1);
INSERT INTO `std_personal_info` (`std_id`, `branch_id`, `std_reg_no`, `std_name`, `std_father_name`, `std_father_contact_no`, `std_father_cnic`, `std_contact_no`, `std_DOB`, `std_gender`, `std_residency`, `std_permanent_address`, `std_temporary_address`, `std_email`, `std_photo`, `std_b_form`, `class_id`, `std_district`, `std_religion`, `std_nationality`, `std_tehseel`, `std_password`, `status`, `std_admit_date`, `std_leave_date`, `academic_status`, `barcode`, `std_other_info`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(21, 5, 'STD-REG-Y19-021', 'محبوب احمد', 'خلیل احمد', '+92-302-7625598', '00000-0000000-0', '+00-000-0000000', '2000-10-20', 'مرد', 'اقا متی', 'بستی رحیم بخش برڑہ', '', '', 'uploads/std_default.jpg', '', 27, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-17', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 18:55:25', '2019-06-19 18:55:25', 1, 1, 1),
(22, 5, 'STD-REG-Y19-022', 'محمد نعمان', 'قاری امیرزا علی خان', '+92-302-2157065', '00000-0000000-0', '+00-000-0000000', '2001-01-01', 'مرد', 'اقا متی', 'منظور آباد،', '', '', 'uploads/std_default.jpg', '', 26, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-17', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 18:56:14', '2019-06-19 18:56:14', 1, 1, 1),
(23, 5, 'STD-REG-Y19-023', 'عبید الرحمن علی', 'غلام اصغر', '+92-306-8696910', '00000-0000000-0', '+00-000-0000000', '2000-01-01', 'مرد', 'اقا متی', 'بستی بیلہ،بوباری،ڈاکخانہ ٹھل وزیر خان،ضلع رحیم یار خان', '', '', 'uploads/std_default.jpg', '', 24, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-17', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 18:57:00', '2019-06-19 18:57:00', 1, 1, 1),
(24, 5, 'STD-REG-Y19-024', 'امیر حمزہ', 'منیر احمد', '+92-300-6740671', '00000-0000000-0', '+00-000-0000000', '2002-05-14', 'مرد', 'اقا متی', 'ٹب چوہان ڈاکخانہ، اقبال آباد،رحیم یار خان', '', '', 'uploads/std_default.jpg', '', 24, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-17', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 18:58:32', '2019-06-19 18:58:32', 1, 1, 1),
(25, 5, 'STD-REG-Y19-025', 'محمد عمر', 'غلام شبیر', '+92-305-7065219', '31303-2438934-9', '+00-000-0000000', '2004-08-20', 'مرد', 'اقا متی', 'پل گری', '', '', 'uploads/std_default.jpg', '', 24, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-17', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 18:59:26', '2019-06-19 18:59:26', 1, 1, 1),
(26, 5, 'STD-REG-Y19-026', 'کرم الٰہی', 'دریا خان', '+92-306-5225901', '00000-0000000-0', '+00-000-0000000', '2000-05-01', 'مرد', 'اقا متی', 'ڈاکخانہ روجھان،جونگو ٹھڈی،روجھان،', '', '', 'uploads/std_default.jpg', '', 22, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-17', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 19:00:23', '2019-06-19 19:00:23', 1, 1, 1),
(27, 5, 'STD-REG-Y19-027', 'سیف الرحمن', 'مولوی ظفر اللہ', '+92-308-3192472', '00000-0000000-0', '+00-000-0000000', '2001-01-01', 'مرد', 'اقا متی', 'یار النڈ ،بستی امام بخش لنڈ، ', '', '', 'uploads/std_default.jpg', '', 25, 'گھوٹکی', 'مسلمان', 'پاکستانی', 'میر پور متھیلو', '', 'Active', '2019-06-17', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '10 کلاس پاس', '2019-06-19 19:01:11', '2019-06-19 19:01:11', 1, 1, 1),
(28, 5, 'STD-REG-Y19-028', 'عبدالماجد', 'مولوی ظفر اللہ', '+92-308-3192472', '00000-0000000-0', '+00-000-0000000', '2003-03-01', 'مرد', 'اقا متی', 'یار النڈ ،بستی امام بخش لنڈ، ', '', '', 'uploads/std_default.jpg', '', 25, 'گھوٹکی', 'مسلمان', 'پاکستانی', 'میر پور متھیلو', '', 'Active', '2019-06-17', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 19:01:47', '2019-06-19 19:01:47', 1, 1, 1),
(29, 5, 'STD-REG-Y19-029', 'محمد جنید', 'غلام یسین', '+92-302-3827868', '00000-0000000-0', '+00-000-0000000', '2004-06-20', 'مرد', 'اقا متی', 'شاہ پور،ڈاکخانہ احسان پور،رحیم یار خان', '', '', 'uploads/std_default.jpg', '', 25, 'شاہ پور', 'مسلمان', 'پاکستانی', 'احسان پور', '', 'Active', '2019-06-17', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 19:02:24', '2019-06-19 19:02:24', 1, 1, 1),
(30, 5, 'STD-REG-Y19-030', 'محمد عمیر', 'شیر افضل خان', '+92-345-8146641', '31302-7243626-5', '+00-000-0000000', '2005-06-30', 'مرد', 'اقا متی', 'بستی منظور آباد،ڈاکخانہ رشید آباد،بندور', '', '', 'uploads/std_default.jpg', '', 26, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-18', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 19:03:06', '2019-06-19 19:03:06', 1, 1, 1),
(31, 5, 'STD-REG-Y19-031', 'ابراھیم طارق', 'طارق محمود', '+91-344-7240117', '31303-2972536-5', '+00-000-0000000', '2004-05-05', 'مرد', 'اقا متی', 'راجو والہ سٹریٹ،محلہ بستی امانت علی', '', '', 'uploads/std_default.jpg', '31303-7627842-3', 30, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-18', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414731456c455156523458753264762b736b525244463334616136683967356d5561436970653549474a59434c696a307745455137684d7445374654504252415152497a557745557745453731417755693454424d52592b39434456664b37664a6232397339335450626964656668532f66335a6d656e7034332f616171586c66333743546454482f694177496773416d424a3361536271532f5454567745416941674b35444a486f42434a79504145513648304e7141414573456e3041424559676745556167534a3154493841524a712b43774441434151673067675571574e36424344533946304141455967414a46476f45676430794d416b61627641674177416747494e414a4636706765415967306652634167424549514b51524b464c4839416841704f6d374141434d514141696a5543524f715a4841434a4e337755415941514345476b45697451785051495161666f754141416a454942494931436b6a756b523643665366722f6639384331322b316b5265322f6666777733323762576d5869667138722f312b717533624f6e7670694f373375726658354e635a3659767472474f54747a4d766c754c624b352b6466653935612b30763372335a2f7a376e7530766c723933314e50346b3464506270513265756679425336555a44704d5044446949646d4c4e7a4d434453685a577350626d77534163766f6f5a4436346d505265706352516a583774676c58557649633179636d6c754c6139642b514c624343317937517679314e615a5a65684b7639636c376e75687259785749744278334c38584145436b4a4669325859705234675775486131657a547352495155466363735777534d6375556b7431524c55376f527971486172646853564362436a624a43775346756d2f4d6231385047394a3373596948524d4b496b456b694e5249436b4331513755377968447073546872315549475a426d51395248706f7964794b31576f354e496766352f475549674e6941324c78494a495a446155584431694a47496b59695269704436586767485a30344855577059344d644b7878653263304544536169736d717557716b66314e396e643038584474634f317737584474634f31795634794a6665584a6f695374566d62523972686b4e566c366931784e72683235646b734473376832754861346472683275486134646f63315038355a34345035534d7848716d5a6e31464a3357764a32617a2f5a3332522f4c36356331424e7a4d6247506958314d3747737341516152546763696d555a7867556b724178797841624542735147784162454273514778675a565746785a595842763073346f51717769785a4846426659524978307461392b51384c693244545759446d51324c5377506a3275486134647268327132654374387a6a7255324259774257515a6b475a424e6968755a44627a57705469316e52694a474b6b316474584d69786f316f355873372f72436a7379513758394856374e44383171582f7264484d4932436152524d6f786a30426b4279376369314939654f584c7554386270534c743361324b79575a63363664696555597846394674466e456631576e4554534b6b6d724a4b3253744572534b706b4e5a4461513255426d41356b4e4a5a2b526c7a4833792b6c7553625a4f43572b39495878727659674e724c546176516a47326c777378416245427353472f66346b487730696e59377131797863793749686678386f686d7148616f647168327148616f647168327148616f647168327148616e66784a4e775363364861485366426a6f7a523174365055766c6f36567443417a46536c7379614c7942532b6c3069774e6f625630742b4c616d446139387573625a384c68596766794e2f49333858456e4e726934597748346e35534e31764961395a6969305768506c497a45646163764747797438397669526c514742534250716e5555774b454a634e416a3049514b51656c4367444167304549424a644241514749414352426f4249465341416b656744494441414159673041455371414147495242384167514549514b5141346f4f53767054306b4b53504a62307536652b302f78354a317952394a4f6d327045636c2f5a44327653587033665139626e394230686553337054305474722f6d4b5166437a667565556d66682b336653724a7466306e36514e49726f553333706e7176684733505649362f503179547438645063352b6b447958646b5052724f702b336f64624f326e55503649762f36796f67557558325753662b50585636377a7a657559314938574f452b30625348344673747638395357386b34746c7636376976536e6f2f454c5230656a7666413447453332586b657a676437353366322b6c3178654e6a3239365739476b696a5a563957744a7a6b71366e746a387036657356376653367252327a667942537051666b6e53533353483559334735502f366553426248396b597a323279786533463836746458336f7154504a4a6e6c4d65495a4d637a36524d766e782b626e694d65624e5332523342344533686172787834436b517739684b2f684d53756849464a323539304e79313262764f505962334f3548704830624f71494f5647386b2f2b5a334b75664d6e65785a593273506e4f37586b7375586d35525373534d31736a7139336161612b6a58464b2f6c70514b526c69784e3662706e4a552b38626f685536515647714e2b53652b55644d735a493053495a6f6379434747466146736d4a63536e45574a47304c3076364b726d44755757493173652b503134675a6e35386a4948736d73784e4e4c665233634649476a75667858515737336b6335374862726644416941533136793746664c4f5243794a56376e6a7079563469556e546866676c786b596b4565666d574f3251643255534454314b62724c78624959752f2f4c75356b4235447865626e7835654965456653316551712b72464745724e4d466a4f356d4e4a44684e797437446e6d626930446b634b646a5970555337574c4b6c744e74544e4c38334e51336578554e54584d3975586b39626a4b6c635353436d686c2f50796c3435657579593531693254662f547a32506264414d535a7a5a6138557339327452476c64463052714963522b454f684141434a316745515245476768414a4661434c456642446f51674567644946454542466f492f45756b37795864624a566b5077694151425742792f3841412f6e7936444a77706f4541414141415355564f524b35435949493d, 'عید تک چیک کرنا ہے۔', '2019-06-19 19:03:49', '2019-06-19 19:03:49', 1, 1, 1),
(32, 5, 'STD-REG-Y19-032', 'احمد علی', 'عبدالسلام', '+92-305-2673951', '31304-8047255-3', '+00-000-0000000', '2006-07-31', 'مرد', 'اقا متی', 'مکان نمبر125،کلی نمبر4،محلہ شفیع ٹائون', '', '', 'uploads/std_default.jpg', '31303-1779801-7', 29, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-18', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a3341414147766b6c4551565234587532647661736c525244467a77754e39513877303878555546434d784551774d564244556352454d42506456544554544551514d66456a4d42464d524131304177576a42544e4e524977313166424a376533655637646639315431336345484d37384c6a395537505433645a2b704d6e6171756e6e736d36556235457838514149475445486a6b544e4c31386e645344357745416943676178414a4b7743424f3063414974303568765141416e676b62414145316b41416a37514769765378657751673075354e414144575141416972594569666577654159693065784d4167445551674568726f4567667530634149753365424142674451516730686f6f3073667545594249757a63424146674441596930426f723073587345494e4c7554514141316b414149713242496e337348674749744873544149413145494249613642494837744841434c743367514159413045494e49614b4e4c4837684849452b6e382f5077384139665a325a6d73716631726e3370612f64362b69397234343757763974396533364e725a76727a343678396e3970666e6150765a3359654c57352b4c4f313852706a3263423764427a2b2b6d6648506e6a6536627a50395a4f61627463476b54522b4d65667942534e454e7a4e7a346b5746447049754836704a687a2b49486b59705477794d74652b3349652b4f522b71716d707a77695659524836736a47553656596137684975344f685a6a7871354e477a6b6e796d487a775348756c322f4a69524f6c6d4479625272536447654d3250496f35677a4531746c70484c555432612b7845676c5554454b7a694d447a4e796f47554d3470622f49454c4c534e6d73776d5859513655494f65727951646b693732396c506948544944684d6a6453516648756d77327243557770354a5375435238456a704a77334a687550314f3961523472564d70423353446d6e584c50776a375a42326c3251636c51336a39487457386d6171612f4249654351384568347074374b2f56434d33536b75666b71356d516661346c47636d66542b372f7053355039483138556773794c49674f3141534d3453455342414a496b456b746c48637958614d6d5158446d66576862464b43645354576b566848436f4c716a4e53425342414a496b476b49306d636558425174457252366c526147326d33764e326a6c79576b61445859786b364a454356436d66315045416b69646175634d314b4847496b596952694a47496b59696263493966664a52427355733746507468306543592b455238496a345a48775348696b374e6236705a724858676c523639585a5273453243725a5275475550696c5954623145645a5a6a6137396c717a6c627a4e7136624c5a316950354a4c63382f577147584b39486d4c304757537a6c52667a2b43585764666854617564375957524873596a4863644d5338545072412b5274614f79596669692f5579564e5276374c67695a49527a7062394c66704c394a6635502b4a76314e2b6a75532b3852497845694c74572b6a7246505773444b536a52694a47496b596166426a624c4e7033677a68694a47496b596952694a47496b596952694a47795570595349526372526143786a73513655692b756d316b517a6b685a7470717a315a7974357158556a424968667455382f644f5256445a636c72345572564b306569736f6a6777686b72396b375a5a2f77785a707835745765644d716231726c5461755a476b4138307677434b5a554e56445a513254437849532f3775725249476950746b485a494f36516430673570642f773753724f534449393065496f63306c48424a3870497353444c6769774c7368474c53482b542f6e6146754e6d332b7378364e6d496b596952694a47496b70423078456a4853514a52647336542f39664b334b4e79496b5337327330534569744b335552784a5a634f474b7873533452464e51474376434f5139306c3452597434676b454141496956416f676b4952416841704167686a6f4e41416747496c41434a4a69415149514352496f51344467494a4243425341695361674543454145534b454f4934434351516745674f7050736b6653487041556b66536e704630722f6c2b463253587058306761532f4a54306b366364793741314a6235662f3974382f4b2b6c7a5361394c6571736366316a53547773337873362f74357a6e78314e5073664d66632f335a393357734e6a36377a7265536e696e6a39483355386467356455792f53487061306d2f6c416e644c656b6e53753237756672682b4c763761466165457a573279435551613346597a78442b4b305664796541503170786e687670623070794f6248583948306d76466f4f332f6c347a55695071657042636b65594f7631786d645738647037536f42626278474e694f33483975626b6a34754854355272756662576c2b6664523469493876334747325348524f54676b6744734b6f42316964313635487161663737657952564137586a7261475a642f44486535663248736b6666314c537238357a5647492b4a656d6a356c716564433932535036346530693038346f386b69643276666145765732324b555271626d32564c71304561773275657041486e54527169564b4a394665526a443833636a464c704d67626d56533061396e48704b535238626c794c66757565726f364a302f7755346d454e7a712b657842703849773051763165444e4f614c486b6b4d3952504a526c68496f396b426349765337726678566965744432505a4e2f5a783864574e68346a6931335834684d7644622b543949326b54795339587771537a6250616e4c34764572444b316f684956653735574b7139396d62647a4d5445494e4941724e6167523054794573366b5634324c2f6d6d534530746b3945506f45656c3553562b36574d76616d2f637a4d6e375647582f31466a59656e7a6a773856534e6f566f766d70463253396565734c314e4e595649376e62366a46755574617450616a74396c4c557a54335054535374724f354f31713346514c34765769373971786e4530486a2b6e4b6d486242457147534d693679383841694c537035794b5475536f45494e4a56496339314e345541524e72553757517956345541524c6f71354c6e7570684334526151664a4e3359314c535944416a38767767382b682f32332b2f6f49737774735141414141424a52553545726b4a6767673d3d, '', '2019-06-19 19:05:34', '2019-06-19 19:05:34', 1, 1, 1),
(33, 5, 'STD-REG-Y19-033', 'محسن فاروق', 'عمر فاروق', '+92-307-7946985', '31303-8129757-5', '+00-000-0000000', '2002-07-05', 'مرد', 'اقا متی', 'تھلی روڈالکلیتہ الاسلامیہ،محلہ شاہ فیصل کالونی،رحیم یار خان', '', '', 'uploads/std_default.jpg', '31303-4530937-3', 26, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-18', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a3341414147716b6c45515652345875326450346773525244477677324e4e52597a7a51516a515545785555774d5252517a456352454d424e395438564d4d424842774568465441774649312b67594353592b52495259303031504b6d33586539712b37716e612b666151507133634e7a647a6d7a2f2b62612b2f7171716132594f6b6d3656482f4543415244596863415442306b3379382b754676675143494341626b416b72414145726f3841524c6f2b68725141416967534e6741434d7842416b5761675342764c497743526c6a6342414a69424145536167534a744c4938415246726542414267426749516151614b744c45384168427065524d4167426b49514b515a4b4e4c4738676841704f564e4141426d494143525a7142494738736a414a47574e7745416d494541524a7142496d30736a774245577434454147414741684270426f71307354774345476c35457743414751684170426b6f30736279434f534a64484678635a47423633413479453631332f62796a2f6e373974376f6e486a633236702f74397275395a6c704c343754323937626e73387874744d622f7769586575797a3842764e747a657572652b3268334e767a4b507a572f6a317676647a3743534f4a326e5452325075767942532f414a6142446a33692b735a4b45533675734243704131716a74526d316f714b49765656663459436f306958526e357731775246756c774e65793741794e57704634427a323047525543535064596952517677486b61374776794e587259367652756354493546734f456d327441796d4e704a735144374c4e5234704d4b346472743256544f474d6d414858376869546b625672426b706b37636a61585735547848512f696f51696f556a58694f56474c69654b68434b64754361745a414837534b667156472b6d3439703138392b34647268327548616a366762326b5a49755468305052506547796f62546b6935634f317737584c747159646c795a556b326b477767325a4255596f6955716a4777425a69693161304b6846356c4e613764355a3552622f2f73484a633375396d3835574c7663536b7a5679434d34714d79646f67456b5534335572504a46567737584474634f317937394456784b464c6a6f734739462b4b52745473576f464c5a304b59564d564a795a595a4945476c4c6d534153524c71724e4f64576368416a45534d5249795558454e4c66704c2f3959734d37762f6657674a482b506d4c585376656a53436753696f51696b62584c377676304e675450325368456b56416b30742b6b763776334470787852544375486134647268327548613464726c31375937536e45502b564b3473696f55676f456f7145497146494b464a726634767137334c762f646d7543566b37626c6d635361713037435475505a4b314932744831693768776b4b6b556f31387a754d367150374f33654d385536524c736f466b41386d477845724e4c5975506930376d52665633307141794b3354766b757473565456506f2b4270464637556d4b4c76714942305670457079516153445351626474364d6655525359695269704a377931356d363649574d334474634f3177374c757762504d6434524b4a43514f34696c4e33674851586678456738316d5744644e7a374f3374374b6f67456b534253307356726c6162734b5172644b6e484a3371306e58725861497676656b706e737773452b4576744937434e4e57446767456b53435342434a36753973636f42394a5061523245646948386b3375652f6541616d335564323772775178557675355465776a5662665647696b54696f51696f55676f456f7130556433506858324a6d7a565361356537575433703736735068743554417362315346795031437a766d6255516a536f3553482b542f696239546671623950636f7954444b56753270524f42364a423772736c57384f7258364f314d6c797a6b67734367432b614c565251466932694351515141695a56446948424159494143524d4245516d494141524a6f41496b324141455443426b42674167495161514b494e41454345416b624149454a4345436b414f4b446b723657394c436b5479573949656d66637677655357394b2b6b5453583549656b2f52444f66614f7050664c332f48396c7952394b656c7453652b563434394c2b6e486a6937745830736553626b71364c656c4653562b553833314d6a335436396e352b6b6652382b5879636b342b6e4e632f3777397839654b3278397559397752622f31303141704d37585a776238657a46364e353776696d45626b654c4c435065747044384332657a3442354c654b73537a2f34306b72306e364d4243303776343553533949756c474959502f2f5776357544645837746d50505376716f6b507970306f2b542f32394a3730723672476f727a7450627a347a547a76572b6a6643727679425378774a7149366b567954385733373876474c4d64723433556c4d434e766457744837646a526b777a3043316a6a58302f45346a7637333956534f6e45625a476d316636497644612b4868367245676f6956642b387530653157314d626a763176712f2b6a6c52735669654b472b3264786d333671334d585964577a2f3555436b36426136613962714f35496b45736b5579565452464d6e472b336c523264343852327255366e7456387352355136534f465a69682f565a696e4b30563241334c444e514930794b537830536d4f426237764337706f52446e47476b6643497253556f6d574173532b342b666a756245666937474d544e4556712b647062717939664d77656f385734792f474978467964544243705977466d554761636c69775975544b754268624c6546786b43684354453174746d41705950302b4873645347612b66554d566430482b317669347373366446794958744b55382f7a46556e66684c68756979417456334656516b476b384d33486a4e516f6178657a616232736e536e4e7a305546586933396a4c4a32646c704d5874697158332b3231376537617a45703073726b3965593563757563754a35466a504e656c55412b62346930756755772f796b49514b51704d4e4c4936676841704e557467506c505151416954594752526c5a4834413652767064306133556b6d44384958414f424a2f384665536631364e53576f697741414141415355564f524b35435949493d, '', '2019-06-19 19:06:27', '2019-06-19 19:06:27', 1, 1, 1),
(34, 5, 'STD-REG-Y19-034', 'محمد حسنین رضا عباسی', 'محمد انیس', '+92-301-2477970', '31303-7230076-1', '+00-000-0000000', '2006-08-26', 'مرد', 'اقا متی', 'نزد صابری مسجد،محلہ شوہدری نیک محمد رحیم یار خان', '', '', 'uploads/std_default.jpg', '31303-4235023-9', 30, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-18', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a33414141477a456c45515652345875326476637364525254476e317461367838674e71617a7352415546497345306768705250786f426245523745515444585a436d6843777350476a734c5152744e4155436c61696e54596931746f6d3553766e766a4f383538366432544e334d6c586d742f43536d39335a32646c6e7a37506e6d544e6e5a6e65533771592f73594541434177683850784f306f33304e3151444a344541434f6736524d494b514f444245594249443434684e59414148676b624149455a434f43525a7142494863736a414a47574e7745416d494541524a7142496e55736a774245577434454147414741684270426f72557354774345476c35457743414751684170426b6f557366794345436b3555304141475967414a466d6f45676479794d416b5a593341514359675142456d6f45696453795041455261336751415941594345476b47697453785041495161586b544149415a4345436b47536853782f494939425070374f7a73724165753357346e4b32722f32705a50792f747458315447483839316c662f57366d35647336632b33383563393268392b5235395061333274334478355675596e644b2b566c764b756d7434522f637a6f3332312b3632317564775874542b7977553662506a666d396761526f676659496d794c3443314351715444462b676f6668417065536f383071473378694f64347847393045715630344e626a7972434931566b34796c5370316643344a484f46623348746d58344e574f666a523865435939553752763276466c6e3945486f493131495334386e48676d5031417a6f3149497245416b6948576e6f4c516b334969564b722b434e6271532b534172565a4e4a5739416d506442774a3776486b394a474b7a75665747335a5738494c773933476e662b73464d7a733854374368454a6e52474e45737732393569684550676b63366a4a7164456b557278776c4c627a7679504c59384f73454767673045477a7155526a514f42354567456b53435350745548314b454a686a43794d4169775161434465546170627844556f524945647148452f4249637777426a39534f44765a4543656b6a305565696a7a5242476b4d6b6941535249424c536269767a344e5278467a496278736574384568344a44775348676d50684565366d50484d4e49716a6e48466d7945593558724e5458496a614562566a514861434e49464945416b69516153444b654852676a616a4d355a4a5775315949596a7362395a7369465a31676b67513653416c716a55726c66413334653977696a767a6b654c465169415352494a496a5354554b50704830757163584555475a426d515a55423251724147496b456b69415352794777677334484d686f312b445a6b4e55642b477a49593465444a6a426d2f3048455947736c6d4f71304d43734970512b3473664c42445a2f3057554d4870325071544431796932766e72514d2f30426a345248676b67646e6932534642414a496b456b694854303062646f436b5476567a70596166564146424a73774350464136566275572b73744c6f6e4645534353424170436a6767375a4232534c76674f385952695a49334a6d7048314b342b6261503373796a52577478494f3652643137644c69646f527455506149653251646b693737626e395a446151325643546c6133704b6a364e71667764395a50775348676b504249654359383063334752317254336e717832787048497461757565744e61664b4e6d4d41516243445967375a42325344756b4864494f6162656655446f3873356a3553423265684b676455547569646f346f4933325172525538522b74726a654350314264317a6c6d4f692b57346f704237315132335976696a533970437041764a303074306f6e595879626d4d49335634736c3744367031334d31496648756c306f6b645a2b412f4e6d6732684b364941434b794c51503938704855783473354249455141496f55515551414559675167556f77524a554167524141696852425241415269424342536a42456c5143424541434b46454645414247494549464b4d4553564149455141496a6d496e7054307461536e4a4830713652314a39395078527953394b2b6d4f7050386b505376707033547341306b3330322b2f2f7a564a58306c3658394a483666687a6b6e37656543795053726f743659616b507957394b756e4c34747a6174613139747953396d63726d612f7437797533305a62394c31376a6e7a763964307376702b6d56542f626b6c527147315063514649464c6a345a6f422f35324d506874754e6a6f6a6b742b4d634e394b2b7365527a59352f4c4f6d3952447a377635486b4c556d664f494b576c33394a306975323447437137374b6b627a624f3964642b586449585264332b2b496553506e4d7668742f53432b487852506a634669506631555373736e3065462f74746d3730735674386755734d43736747615637437439456a354e4c2f2f736349417664465a2b533044396366747478457a58377446516e39744b314f53744353757652424b30765475792f667263596e755a795679516154696157635a566b71776b6b685a346a7a6a5a464270574a6c492f79624a2b457368462f326c6666317656496a6b4462683262534f4e655959726b724930732b74366370576b7152484e354b71587169555a444a38666b7165322b33764379647156694650654b3052715048307a6d4c2b63624e6e79534e59334d556c6c6875736c5563306a57642f6e62556d5858422f4c53477565496b744a5435704d454f75446c58327254436937746a2b57436633354270474d5648615031735a5371746f786b346e576a6d75706a2b624a6d516e3766656f7a6d76526366594e494451736f3339347449746e706d54422f754836526464353963474a4c486e70766b70746a686d75657966704d4f6342526132704a5669746a62583878396356797638686b5969616f6c576e3167566f79736e62745576367554436149354a362b6a345a46555473665457744637637a542f46704530364b6f6e5458484733794f4974722b3742576564704738664730666e664e424562382f522f4a38323631657531667a65426149384e4c5139394579544c576f354d6f457976634f6b624143454a69414145536141434a566741424577675a415941494345476b4369465142416e73692f536a704c6c69414141674d492f44432f395536382b68492b4a37324141414141456c46546b5375516d4343, '', '2019-06-19 19:07:23', '2019-06-19 19:07:23', 1, 1, 1),
(35, 5, 'STD-REG-Y19-035', 'محمد نصراللہ', 'محمد اسلم', '+92-304-0303942', '31303-7878153-9', '+00-000-0000000', '2005-01-01', 'مرد', 'اقا متی', 'شاہ پور،ڈاکخانہ احسان پور،رحیم یار خان', '', '', 'uploads/std_default.jpg', '', 26, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-18', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 19:08:06', '2019-06-19 19:08:06', 1, 1, 1);
INSERT INTO `std_personal_info` (`std_id`, `branch_id`, `std_reg_no`, `std_name`, `std_father_name`, `std_father_contact_no`, `std_father_cnic`, `std_contact_no`, `std_DOB`, `std_gender`, `std_residency`, `std_permanent_address`, `std_temporary_address`, `std_email`, `std_photo`, `std_b_form`, `class_id`, `std_district`, `std_religion`, `std_nationality`, `std_tehseel`, `std_password`, `status`, `std_admit_date`, `std_leave_date`, `academic_status`, `barcode`, `std_other_info`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(36, 5, 'STD-REG-Y19-036', 'محمد فارورق', 'کریم بخش', '+92-305-7093733', '31303-7013193-1', '+00-000-0000000', '1999-06-10', 'مرد', 'اقا متی', 'خانپور روڈ ،بستی رب نوازخان، ڈاک خانہ رحیم یار خان،صادق پور', '', '', 'uploads/std_default.jpg', '31303-6764772-9', 33, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-18', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414731306c455156523458753264503667645652444776317461783172454a6e61436c614151535246464338464778442b4e4245467342464f4a535644734242735278464974624151625151744e6b5943464348614b494546623038627968626e336e50666d6e6e762b3764375468504e62654c7a333775374f376e35337670325a37387965335569364558374541674967734171424378744a313850504b677673424149676f4773514353384167654d5267456a48593467464543416934514d674d41494249744949464c45785051495161586f58414941524345436b4553686959336f45494e4c304c6741414978434153434e51784d62304345436b3656304141455967414a46476f49694e36524741534e4f374141434d514141696a55415247394d6a414a476d647745414749454152427142496a616d52774169546538434144414341596730416b567354493841524a726542514267424149516151534b324a6765675834696e5a79636e50544174646c735a4a7661623176696276467a2b3679316a5638666261572f63375a4c782b79783538387a326c35724c31366a742b5050503855677861754656586f3976666238395a534f6b583566755832576e742f5337577634705a695772723358427a74396575664d355155693552776349755676646930436c323463454d6b786b4969303731796c53466d4b6245536b58554b5479305a4b424d30526b346755556a355375304f48497255374b7764614e794b49424a464f373861394e6333534f3369706a71784667647935724430757164317562727671516d7048616b654e564b514959674e69772b454e676f69305435684e6c43355237665a7a384a49636e704e64593772536b6c6c626845527351477a59387044556a74534f31493755376e5351654b6c7354555136473169485342414a496958644a6e5132374e4c396e6f55617962557231534a52366c52304e6977624f43324e6736324e594c6c6174586573726165567a4e653745436e54783765324e77346935516445577754705666646f45584a305257784162466762595341535249714b356662334d56336b794e2f4933386a666f536946534f74535143495345596d49354a3472493756442f6b622b5276374f4e67326a327148614c65346d35776e5a7337456a6e323632794d513445754e49423548596a35486c4869766e55664e44576b456b6941535247764f47744b4a525547755a7336476e6f3445423258567148414f79707a546b656154573477383072644b30536d7048616b6471523271336d7875506565304f35776c736a65665565755151472f59374c4b69526b4c2b52767a7336546e4b704f6433666a566c63366637656a2b4a70394745636958476b59713566556f36574e4a6d693271486131564938784162454273514778416245687435786d6c4c304a6256727638674273514778416245427361482b367065653533354b41365672426c43706b616952714a454776572b4a39794f6470644a72553870634b6c6c374d72693066547a2b327451304e3964354b6e6e542f56313569526e794e2f4933737767746d424f685268685375336f6e424a304e64445a3076544954496b456b55727346347a364944655761686c36372f7663594933386a66794e2f4933386a662b636b2f6c6239306c4b356547506634644d434e4b3047645937484b48694d496c667a31463443514931456a625458473764325049636169527170612f3435354f39364a774a45676b675179615730524b54746d794b7a7778366b646f4e616570432f6b62394c382f4a524931456a55534d35535a746575306f2f334b676e576f6c4952435169557366634336324a4853455352494a4945436b3731526744737675546b3544616b64707469584a734a774b71486172646e694f5648716f3635766b68556a7453752f7379746576706b6d5562454a67556766354a39436346694d73476752344549464950536d77444167304549424975416749444549424941304445424168414a48774142415967414a45476749674a454942492b41414944454141496a6b517a30763652744a6a6b6a36583949366b2f385036427953394b2b6b7a5358636b50536e705a6c683356644b4834572f2f2b61755376706230767151507776716e4a4e30716648482b2b4c6276722b35383469357866333863622f4f637045386c585a6630587a6a2b4d2b35345a7465577239786e5030683652644b7a3776505365526f4f6e3068364d34505241482b3862303141704d4a585a3435314f7a6839644e726f6345596b76786a68767066306a794f6272663949306e75426550612f4f666c626b6a3532424931326246323676542b47332f6368535739497570617838344b6b6c384f36503532423945595156396d3150537a7057306d584a4833584f452b50692f3174693930735a6c386755734544496a6d694d35596330582f2b6f4b546e776833627a48716e732f387434766a312f74446d304263726b637349386f636b4f782f373237612f49756c3353532b467a364e3973327645396b5379375733783064444f2f54564a587961457242486534314b376e746d49425a4753627a796d59576c716b784970706a68505a427a5a556839504a4575784c4758384a556b582f61474e64492b45464e456331456563314c48744850384f6b534153304b4a635444316654346a55696b5a7052456c76497634383764672f42554c366335364e4f4f6e31517153434233686e7455317145636d495933643149307772496c6e743872616b5231324e5a61533178564973632b70635065616a695939306b57542f53766f724f48684b42434f6d48632f534e72396344696c645446584e6c6833663672305975657859566b2f46794f6672726839447a5a6a616e5a4655454b6e777263666149643674533054796b63645372316a6e3345334569526f5a59396f586f3142614136554f48364f514f627a392f62796b787956355563476e664434746a4a647270486c5230686668673972316c5968526931797a6b516b6975572f634b32457431533765715733336b6d706e6b65593370334c5a746a58564c72333757343154716c646943706f54514c794439365a31586a4730382f5245394b5449715a4b7a6b535a337652414a4c7743424151684170414567596749454942492b414149444549424941304445424168736966537a704274674151496773427142702b38424749727936474f6d35634141414141415355564f524b35435949493d, '', '2019-06-19 19:08:52', '2019-06-19 19:08:52', 1, 1, 1),
(37, 5, 'STD-REG-Y19-037', 'محمد شہروز', 'نیاز احمد', '+92-306-0276184', '31303-5654179-3', '', '2007-01-01', 'مرد', 'اقا متی', 'بستی کہور خان،علی اکبر سانگی،ڈاکخانہ خاص،رحیم یار خان', '', '', 'uploads/std_default.jpg', '', 33, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-18', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 19:10:21', '2019-06-19 19:10:21', 1, 1, 1),
(38, 5, 'STD-REG-Y19-038', 'محمد صادق', 'عبدالرشید', '+92-303-8602372', '00000-0000000-0', '', '2002-05-01', 'مرد', 'اقا متی', 'موضع چک نمبر 51این پی ۔ بستی بھٹیاں ڈاکخانہ پلو شاہ', '', '', 'uploads/std_default.jpg', '', 26, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-19', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 19:11:05', '2019-06-19 19:11:05', 1, 1, 1),
(39, 5, 'STD-REG-Y19-039', 'محمد شعیب', 'محمد ابوبکر(بھائی)ا', '+92-305-3281463', '31303-2116009-1', '', '2005-01-01', 'مرد', 'اقا متی', 'بستی جام رسول،ڈاکخانہ رکن پور،ڈوڈی سانگی', '', '', 'uploads/std_default.jpg', '', 28, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-19', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 19:12:33', '2019-06-19 19:12:33', 1, 1, 1),
(40, 5, 'STD-REG-Y19-040', 'محمد عاصم', 'محمد ابوبکر(بھائی)ا', '+92-305-3281463', '31303-2116009-1', '', '2004-01-01', 'مرد', 'اقا متی', 'بستی جام رسول،ڈاکخانہ رکن پور،ڈوڈی سانگی', '', '', 'uploads/std_default.jpg', '', 28, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-19', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 19:13:11', '2019-06-19 19:13:11', 1, 1, 1),
(41, 5, 'STD-REG-Y19-041', 'محمد ناصر', 'محمد ابوبکر(بھائی)ا', '+92-305-3281463', '31303-2116009-1', '', '2006-01-01', 'مرد', 'اقا متی', 'بستی جام رسول،ڈاکخانہ رکن پور،ڈوڈی سانگی', '', '', 'uploads/std_default.jpg', '', 28, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-19', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 19:14:35', '2019-06-19 19:14:35', 1, 1, 1),
(42, 5, 'STD-REG-Y19-042', 'محمد مدنی', 'حافظ نور محمد', '+92-342-0715768', '00000-0000000-0', '', '2003-01-04', 'مرد', 'اقا متی', 'چک 35پی، باغ و بہار خان پور', '', '', 'uploads/std_default.jpg', '', 25, 'رحیم یار خان', 'مسلمان', 'پاکستانی', 'رحیم یار خان', '', 'Active', '2019-06-19', '0000-00-00', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414367456c455156523458753356775533454142414577623349494450496a41734e43563045522f2b6d4c506e70655a53323563666450562f7665516751654576673433463333362f33725155664553427758304a794251542b4c79436b2f787461494f43503541594946414c2b534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454a41534957696a586b424963326641494243514569466f6f31354153484e6e774341516b424968614b4e655145687a5a384167454c674c36536675337357617a59496a4170382f674b505a6f65426c6f7762566741414141424a52553545726b4a6767673d3d, '', '2019-06-19 19:15:12', '2019-06-19 19:15:12', 1, 1, 1),
(43, 5, 'STD-REG-Y19-043', 'Hussain', 'محمد علی', '+92-234-5678987', '23456-7654323-4', '+92-345-6789098', '2019-07-07', 'مرد', 'اقا متی', 'Gulshan Iqbal', '', '', 'uploads/std_default.jpg', '12345-6789654-3', 25, 'RYK', 'Jutt', 'Pakistani', 'RYK', '', 'Active', '2019-07-07', NULL, 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414738456c45515652345875326476597373525254467a34534b6d6359694a6f61436751674b696f6c6759716967676941696d416c6d6f7674557a4151544551324d314d4445554e52414836695a43427070497634426d6d7134636e66717672316257313839553845302f527459647161377572723639443139503674364a2b6c6d2b684d6645414342677842346443667052766f377141634f4167455130426c455167704134486745494e4c78474e4944434b43526b4145516d494541476d6b47697653786551516730755a464141426d494143525a7142494835744841434a74586751415941594345476b47697653786551516730755a464141426d494143525a7142494835744841434a74586751415941594345476b47697653786551516730755a464141426d494143525a7142494835744841434a74586751415941594345476b47697653786551516730755a464141426d494143525a71424948357448594a7849352b666e35794e7737585937575650376278382f7a4c666274746a473237614f7964766e66666835617563634f563974664c48764f4e62576466692b7063666d375676585752704c375877526c354837554c753245733639653550663179586e4c31315053615a47376d2b387076783754363533446d433949555136566e6a7a423046386345436b36773956694952477571567063793162657970444a49683054596c68326c304b425553364e4e73783753366f676d6d48616266335a3066385033796b71704d456b53415352434c596b455548696472746f36536c4b4662766759464771744f4a7146316d7368776959457344426b547479756d4e5134684d2b4a7338307055383269452b53436d6730534d3165615372767435494c724e6e31715763307a3636516837704f73436a69634b65384a4a485768366f4f436271535549326d566b787139777974567274386e326c61464c7650424370586d46537734366f48564737673531774e46493571626f554633796b52454953736d4d6d444d45476767314e62776f695153524d4f307737544c745569622b6b614c52576d562b714a752f3169326d486156636b345567775a4c59663065755038446668372b5963706c346568716a6433692b425342414a496857493041727a4d3747765055463064484a704f382b363330754a454356433178355150562b6d6c53776c324543776757414477595a627862785230364f52436d74445550314e396666494769415171564a6d524c434259454e762b6b684f6e6d6a69397251535068492b456a35535a795772486f6b494e6e53572f614a6f6c614c5677665638694e7131316a75445342414a496d58614268384a48776b664b56746a77456b78556f4a5430696f6a7830644e316173423635586c4d4c4676724a6933682f4e6f67766e512b3075776f6243595279766a66796a514c466c387557684b37534647517061454c416c5a4572496b5a436c61766670536771564c4a4c4f492f76373944795772672f41336c513358424b506d7a30456b694451304634696f485645376f6e5a453759617244336f5252445153383547596a385238704346543964436f4c44345334652b71787371645a7a515347676d4e68455a434938555159716c716f4b5a5757576e313670736a65746c2f664b547965346c35683278686d734f494455786c51376b7342394d4f3077375444744d4f3077375462706d47474b6c6c3437557535655846526979574a6534466c5131554e6777397755666e58664847766a716c6d47724f565050685a433945676b6758434c51574242794a366a434e676d6b554e5371686b6442496143515750786c665577434e524e4571526173557251357244524b794a47534c6b36716f624b437959656d614634532f65526c7a393246436964412b482b643574704947686b6751435349464d3736576c495a494b5861344a4b754d61596470747a6e5462715355676a5967734645457a69774d63695039625251444c6873456a6b59414968304e49523241674153526b4149516d494141524a6f41496c324141455243426b42674167495161514b496441454345416b5a4149454a4345436b416f675053377048307564706e2f332b4d58312f4c6d325032393655394537577a7875532f6979302f55625373354c2b4b5a7a33506b6c66534c70666b70336e352f44626d7a38693652644a3730743657644c486b6c3656394a386b4f2b66626b764a7a354e762f446364627633354e666f3434396e795976657565494a4f723741496968647432577843774b46785053666f327458744e306f635a4555795176354c305232706a684c4274507751693261366647694a79703652334a623165495a6e746630585365354965434551335574726e7237444e685033785247376637773846613276582b62796b54784d42343744797362656b4f722f7556544a6730714168306f42473869596d67446d52386d332b2b7a644a647951696d5443626f4c6549354d4a764773552b706e6c696579507a37346d7355574e3633365a422f52784f7567386b7653447051556e50424f31316579436c61624c382b754c5961334a57776d4b53544b36794734693067456952454b363948704c30644e42473373613664665051746e32577a6c4d794132325874626b33615248544369394b4f6b736149326f6a46337a76302f754c6d7365495a6872487a4533545946613559747253544c62764569464e517a3068366463772f744c59633368713137314b365a38346149673051435158486a66563469472b7a38796b767955396d637a44334d2f79593977637569763458615a3949764879703733315a522f58554c6e2f5a576163456362394a6a4e447635623055615a4253324d79307471597a5451746a64304a47776c6e59346e5833644b3045325831704c754353414e4536766b432f695133675862547a4c754e7670594a3331755350676b617a4e74464c585233707046656b76526c384a3369654a774952694c2f524d33705773694550583733746d355332752f573245745350474b796e72543054787763524f6f51796377714e344f3871576b514d397461356c70382b6e76557a49375049325478394b576e66386d7369324e7954574839654d51766d6f2b7872572b5030634653464c476d546530634932627152506c635456635161545733696f47654d674951365a5476446d4e624451495161545733696f47654d674951365a5476446d4e62445149585250706530733356444a6d4267734470496644592f304b7835656a42616b34444141414141456c46546b5375516d4343, 'محمد علی', '2019-07-07 10:45:49', '2019-07-07 10:45:49', 1, 1, 1),
(44, 5, 'STD-REG-Y19-044', 'محمد علی', 'M Ahmed', '+92-234-5678987', '12345-6789098-7', '+92-345-6787654', '2019-07-07', 'مرد', 'اقا متی', 'Gulshan Iqbal', '', '', 'uploads/std_default.jpg', '23456-7898765-4', 25, 'RYK', 'Jutt', 'Pakistani', 'RYK', '', 'Active', '2019-07-07', NULL, 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a3341414148546b6c45515652345875326450617874517854482f3665553642525549686f53685559304a4552444e42494e69592b434342474e524350433878485253445169456146423852714a526c447743684b46676f354f314c5355563959394d2f65737538374d6e6a6c6e7a30766b7a6d386e4c79393337356e5a4d2f2b7a2f724d2b5a7333736a615172365a2b34514141456a6b4c676e6f326b31394f2f6f31716745676941674335424a4b5141424e596a414a48575930674c4949424751675a4159415143614b51524b4e4c4739416841704f6c4641414247494143525271424947394d6a414a476d467745414749454152427142496d314d6a7742456d6c34454147414541684270424971304d54304345476c3645514341455168417042456f307362304345436b3655554141455967414a46476f45676230794d416b6159584151415967514245476f45696255795041455361586751415941514345476b456972517850514c3952446f354f546e706757757a3263694b32763932355772357674337a5a584c5a574d3758723756566179665762625739314964533354692b32493838786a7a2b32764f313766534d737a533257723971763148764f45726a4f625375783375706e2f465a546135614d74677030317468726c38517153586b45476b3349665a67565a7341652b7443704d52574e4e4a57635a65307862457a2f6f695a7556644131327076694e5451585a68324f354e3172556b577a5a43572b514f523274686a3269562f716a55546c6d7864664b5239733676484238564832766e702b45694f67435643745a7a526c685a6f42534236544c66656437544b6f5a485153455474436f5448744e76356b583743696a376b69416d45714a304c6e78502b3369346a484b4e35435838764c384667326d486146534f442b456a6e4a7877304568717047555a6e51585a4847714a32524f314f43584f31665158576b6335483672772f316a4c764e6e6e4749724e6833376c7443533952752f31557239377342492f74495467546248424d4a624f427a416149744b446a7947786f723258307a71694576776c2f74387a4a637948615673536b5a5371555a72616c7146524a4778366233345a7068326d586852306671544f5130534a4e4b794c454e6f7079794c6b6e2b2b4e7142316c616b336c544d3277546b4e6c4767556261447845765a517930636835626b77375a33773171346950684937564d6354623262542f49764868424a4967456b616f55595964736a334467497930764745632f682f413334652b7a744a7844665946446b6b4d4a6678502b626c6d41684c2f5447544748524b7861712f394c7759483462476c354944386a324d444776714c474f475a3751557434305569734937474f46444c4831345a30385a48776b52716d474d45476767333747775950396545494e6767695153534931484c387957776752656a63506965434456752f7a327663466f6c5357564b455342456952616845486a62324c5a7764547662332b76575a7459455a63753149456470542b7a5674786b6d722b795a53625249375a4a6d68647a2f5849576456355064486377364e684559714c6e7133534d2b5a445a7a5a5550314554476b6874715974316f52305755646948596c31705053394a6f6a55506b74695247414748776b6643523970774b51446b53415352494a4952526177494d75434c4175796a632b767369444c32642b632f62307755636167452b4876685138374537586a51324f7473442f7253427969663559547873612b396e6b5a7253554b4e424961365a525166422b70666e5a654b61304a307935466a6d7068314e724d7337516e5a6d332b5747753234344249446f67304939754f34754934726b726f7432653267306751435349354456676a4452714a46434653684159734d6b496b69415352494e4a5a746a67375a4e6b6865786135497468775850534b625252736f324162426548767666422f58424a6f6d642b734937474f7844705343416978517a6163344e4936437376504f71565544314b455342456952616951644c71302b513469375a382f64386a4d6a492f30502f475265744c4e4b514d436b794c5166394c71704141786242446f5151416939614245475241597469414c6c434141416c5545304567494277674d51414169445143524a6b4141496945444944414141596730414553614141474935475467476b6e7653587057306a655348705030743652584a62325a7974307436556458353561304b664b46564e6271664a616566796a7052556e2f756a5a3875313738664432376e3876644b756d48384737667a365633574c58504a64337658765234756d663976697a70646b6e35587133764a5a72456363394f4a596755534746432b6f756b757954646c49517546376c4f30764f53336b336b7350744746424f7156784b5248704c306d3654665862736d6f466d6f65775175762f734c5353394a2b694256656a75393577464a6679524335375a2f6c7652676d6769732f6e325333677154524b6b746d796a7956657037726239783344336a7573686c49464c6c317930527951695468645771575a6e624a463266684e3245306754734b30636b492b5a7a6b753655394b676b7230464b7237627954306a364e4433307770394a624f336c642b512b32642b6553484553734c37615a646f304579317132646a336d754358786e32525364497a4e6f685551436c716e6d77472f65524d74567a477449554a755030667a55417a6d623657394834792f30784c6d5a6e345854415066526369676530395a703764494f6d5252464466686d6d6b6d3550327362706d426b6179476a6b7a49613250766f364e37576c4a6c314b5a544b3573376b5634617550754562614c5841596968562f58684e45454e6674482f7248334335354d57754850494b533566426265547951393559695769574b6d57665239724f347a6b73796b4d344833372f744830687553507062306c2f4e39766b3174582b734935636c682f706e39626237576c366c7a6e7179525a466245337a4d7a306e792b58784f525465755a3971754e2b794b545a576c73454d6d6845303233434677574d424e656d2f584e5563395844434c597a4a313947744e5957517374615353723837436b6a314b6a7354386c30797666753850355456476a52742f48452b31477035474d64486235766e73667967636f61754f47534c4d69344d5964493264476c70636c765a4d6965565930527533383747316149306639664e6c736e6c6e30374c555142466779362b795a37314f756d3030346535354e4d422f4a382b387561527a6662745930706d464b66612b4a52613364576355496a5454724c382b34687949416b59624353574f7a496743525a76336c47666451424344535544687062465945546f6e307661517273794c417545466741414c332f67634163504c6f54483974386741414141424a52553545726b4a6767673d3d, '', '2019-07-07 10:47:10', '0000-00-00 00:00:00', 1, 0, 1),
(45, 5, 'STD-REG-Y19-045', 'محمد علی', 'Asad Shafqat', '+23-456-7898765', '12345-6787654-3', '+23-456-7898765', '2019-07-07', 'مرد', 'اقا متی', 'Gulshan Iqbal', '', '', 'uploads/محمد علی_photo.jpg', '12345-6789098-7', 25, 'RYK', 'Jutt', 'Pakistani', 'RYK', '', 'Active', '2019-07-07', NULL, 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414856556c4551565234587532645036676b52524447767730564d77324d52457730453852415546424d424250427845424e464248455244415476564d7845307845454e48415034474a59434b6e695164714a6f4a476d6f6759613672686b33707669713370375a367532653341752f6b74504f3765544539317a2f6671362f7254316230375356656e482f454241524134436f454864354975547a3948536541684541414258594a49614145496e49344152446f64517953414142594a48514342455168676b55616769497a4e497743524e7138434144414341596730416b566b62423442694c523546514341455168417042456f496d507a4345436b7a6173414149784141434b4e5142455a6d306341496d316542514267424149516151534b794e67384168427038796f4141434d516745676a5545544735684741534a74584151415967514245476f45694d6a61504145546176416f4177416745494e4949464a47786551547952446f374f7a764c774c58623757524e37562f372b474e2b336137464e743532365a6d7966536e442b326e316d656d764e62346f4f343531365433383374706e792f5a4c37316b625336752f694576323739435433787472372f6e793737366d665261586a41346d646670436d647366694e5254694c566b69425048326d645048517445326b2f6932636b63496c55734878627077674f6f576541655364646169445879656861363558466b4a364c4d42424b7457506e2f48706c32726c6859704d4f5a71707978634f33714247785a574967305978577558553868737250694b54372b4b464a6e5a6d5a6970497451502b4b4152537153477268327548615a354256456d754b697061794e7a38706c6d324e6a42797a5366676150575051732b526f4c5459785573596d6b762b754b6c306d643935537a523270634f374a32693274507243504e312b58577a7543734978334752635249303770777a6649524978456a45534d7456454e676b624249533635787871566c48616d79774569795952344c5a425938652f455843374c744a44674c7371483667617a64334f334c5a6a565a6b44316663364c57626d6d6d7a5154687655785a545837505172535575476331656d504a75446773794c49674f31754e4a746d774c2b6e704554637a59654461346471644937426d4730614c684f57576a356f435a6d62306e6d4a6a6b6471316a3864557a3263734d636b476b6730486b77547253504d39625243706b677a496c50695174534e72742b5256724b6d75615474302b7a736b47386a614e61305a5762754c79536a7a6755675143534a316a6a7541534f7951506368695a6d4b46544c496b4534503155765655667a636f7975456e3962694564615339693154623470374a776d574953346c51555754613838314a4e68797544375632304a6257425976454e6f70563630426b37636a616b62586a584c747a35376e6d42765869446b7145366d356b78684b7a494d75434c41757952665a3179534e6850784c376b57616c547365554b32566d5a724a32464b3153744270714374656d6c337475493057723752556c466d525a6b4756426c67585a396d48375a4f334932704731493274483171376a4b6668453263745339746258576f66686c426d3858706b517268327548613464726832755854624e323576423253484c7558625672796b6852694a47496b596952694a47496b6271685758314c634374386f796c4d706d6c346c59734568594a6934524677694a686b6242496d524b62587642503053716e4348575a744f6267435679372b64644e3973703465757371314e717848346e39534e4f70754d6673424f315a514e4c66704c394a667a664f7071426f645739394d7061592f556a735232492f457675524c6f34534a7632644f7a694647476d2b4137595845314a727435442b6450425952357050514a6c7a79444d75546962726d446e56703066367461376e6d76625a30696d4b5669746662356b4e776a4e453542443951354b7973612b646b4b62366d2b707671722b702f7162364f2b76436b50377566776b3157547579646d5474794e71527456733630726831644651724964444c597046736f4c4b427967597147394a664370423165662b58576274756b52304e5147433743467979727a322f50503173467762654841524f517741696e595966543450414f5149514355554167514549514b514249434943424341534f6741434178434153414e41524151495143523041415147494143524b6944654c2b6c32535a394e392b7a333736662f507a56646a3964656b2f526d4965645653623958326e347436556c4a663166367656505335354c756c6d54392f42682b392b59505350704a306a75536e706630767153584a5030727966703851314c734938714d343679316a65396b2f66785147614d2f353764692f775030385a6f56415a48436e2b36476f4b424f474c76396d4b5276706e59765333717649494970386c6553667076616d504c61746538436b657857545447392b35736c765358706c51624a3750344c6b7436576445386775704853506e2b4561306149687964792b396a2b6c5053367041386c33564a7061334c3933557a65306c68387a4e613339627630587463734d31594f4843496c4c4a49334d614b56524371762b652b2f534c7070496c4a4734567a357a614c597037514952755a664a374a47692b6d797a594b36556a767050704c307a45512b73316a2b6e425050434f427433355830346a524a3248306e725431582b39687a6a307636594b584358612f4e4964494b496b564375505736543949547752703547785072377146642b335471702b5947326931726338646b526379695057754c664a504c467132524b37624c64486c756d6377644e63493850636c7145636e366a47334e6374303458627531654b6561386d636d682b75564e4c5833676b674a496a6c703346574c6a2f6939547954394a656e52795430733479782f786c307463363838376a4c7245346c58576a6d545a5239336f6372347939773463383038626a49333949716b6a77764c346d50366f744c5758464d7246544f7239453977412b2b644a6f476641376c7366455a55652b655778646f536965786449564b435347554d5644376973374d70744c746d336962475771614148716434504f58746f685736726242497a306b7935666345525279505065666b64566b2b486b744b78503571372b467434795267637062653266713853394b585732504c77767443704136527a4b3079462b6952304d3473694c6c74532b3561744567783078574a56534f6b7959797a66383274693250797469624c4d3337526653777a6766597572557865786756314e35516b772f797642354759565546674141495161514349694141426949514f674d4141424344534142415241514c6e52507057306c5777414145514f427142682f3444564a6a7336494a4170547741414141415355564f524b35435949493d, '', '2019-07-07 11:06:33', '0000-00-00 00:00:00', 1, 0, 1),
(46, 5, 'STD-REG-Y19-046', 'nauman', 'shahid', '+12-345-6789876', '12345-6789876-5', '+92-234-5678987', '2019-07-07', 'مرد', 'اقا متی', 'RYK', '', '', 'uploads/nauman_photo.jpg', '12345-6789876-5', 25, 'RYK', 'Jutt', 'Pakistani', 'RYK', '', 'Active', '2019-07-07', NULL, 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414731456c4551565234587532645059676c525253467a7773564d3431465441774649304842785551774555774d314568454552504254485a6446545042524151524533384345304e52413131597a55545153424d52597a6656634f5475712b76637156642f2f56346c626e304e77387830563164586e37366e37726d33717174336b71366c48374742414167636863416a4f306c58303839524e58415343494341586f6449574145496e49344152446f6451326f41415477534e6741434d784441493831416b547157527741694c57384341444144415967304130587157423442694c533843514441444151673067775571574e35424344533869594141444d516745677a554b534f35524741534d75624141444d514141697a5543524f705a4841434974627749414d414d42694451445265705948674749744c774a414d414d424344534442537059336b45494e4c794a6741414d78434153444e517049376c4552676e30746e5a32646b49584c7664546c62556674766d702f6c2b3278664c654e6e574f586e357641362f547532614939657274532f57486476617567382f7476586376487a72506b747471563076346a4c79484872746e34565644352f5338643435492f59556352323036623078317a6549644b72783567387564687a485076526a445255696e5866696f35303552437034506a7a53586747555048437677396a7134584b6c55664a3650652f5836326a775345693743394b324a30337a33684f50744a662f45416b6951615467475776784a4236704953784a4e75787a4d6a4f6b44736d4751366e6149782f4a686f595836306d6a434b372f58657346613041664b3664494e68786d6158765071795a6c3832654174455061345a4751646d5864786a6a5378645271792b4d683763617736736b305042496543592b455238496a6c52496d6f37716641646e4463537979646f4654534c737875514b5249464a7a74675245676b67397239794c65586f5a55374a3267594b4d497a474f31434d6336652b424758345143534a4270415a526b485a49757835426b4862377a3138534936565872736a61746163347a5a6f4630694d653430694d497a474f78446753343068344a4478535a4d484f5a7944584e527476794f62795965754d617961744d6d6c563276414e575a494e4a4274494e6c52644568344a6a3153666956424c427042734f43415552494a49454b6d5873535a474367756b484c736f53433946533478456a45534d56466867673252446632594730673570643742634664494f6159653079775a2b5764654f646531592f495446543235326a4b316c6b5876785769764c3171756242534c72666f6c6b41386d4767335859653675666a727959534978456a45534d6c447158504b6d435238496a585a42454c6d466168744b61533066576a71786454696d6b4864494f616466357446417659356336566a3772556875496e62567750514f79444d6779494d75416250457a4d4335766d577533393164494f36516430673570562f39455a697368514c4b42443431745759434847496b76397633335a6234524b63614137486e484844746969415352494e4b4764534679387352423552365a694a47496b596952694a47496b62594f446a50586a712b61482f536349314e59536d4e424a4274494e704273434f4d36454f6c387173347061325750446a777a313436356473793136337a3875665268364a474f6967465a426d5239524c6f3463732b6b31554e7668306643492b475238456a566a724d554d7a4f4f56486d584a6b6f516b67306b473067326b477a6756665077525a42536a46614c32326f7848783470795a58576177716b762f666a4a6b77527173643845416b6948656a2b586d2f4d6743774473677a49546e673343694c3944346a556d396a48635242594749487852665158426f6c62423445654168437068784448515741414159673041424a46514b43484145547149635278454268414143494e67455152454f6768414a46364348456342415951674567444946454542486f49514b51435167394a756b66535a2b6d592f6639392b76755a74442f7575794c707261796579354a2b4c35543957744c546b6d3455726e7566704d386c33532f4a72764e6a2b4e2b4c50797a704a306e76536e704230676553587048306a79533735707553346a58794f75326537507166687574372b6238723963616d33706e75366247303039727a51382f4b466a674f6b634a44766930596b685047446a3868365a7455376c564a373264454d45502b55744a767159775a722b3237486f686b68316f475a776236747154584b69537a3479394a656b66534134486f526772622f676a376a4f53504a6e4a37322f36553949616b6a30493737627a59615267527678316f35354f53506c7941484674754553494e65435176596b544c695a5476382f392f6b5852484970495a75786c36693068752f4f5a52624d74376569507a72346b453066693962764f67666f314975686354795931497062592f4b2b6b545362636e6f6c7264356d314b587462615a5a334534366e4432574a6f7433705a694c5342534a4551377230656c505255364f57396a465872386a424b715a714257706c376b7863785933334f466d5a506b693053777953636256366e312b6565796153626b634549597437494e7065424f546b6a49653261567957394c4d6b6b58736c374f5a466366725a6b3671314f6e507a2b494e49416b5a77304c7458694b58374d6576572f516d2b6478316c2b6a6b757475304c635a515965695a64374f61764c4e76646f6566786c4d73346b6e7850475a4f68586b6a365739463469694d6e4f584c6f394c2b6d4c4a43567a736b5a505a2f48557a316d485965327033654e714a4c4c3768556744524d706a6f5077554e7a6f7a614a646d58696247576b6151566b2f7658756a757a434e46673764365933744b5573766259314c513479727a5a4e476a476e466972425062566f756e537664742b7a777073794b422f4a3468556f6449655a624b697073484d646e6d6d612b53584d7544654364594a46624a4d5050657679547259707663553168644c726c6965324a324d5762345374366b6c4f484c3231697262325553345a4657662f72632f7a514538456a546f4b53696c5247415343732f666535394767495161527155564c5179416a654a394a326b6179756a774c324477496b4958506f5875686e72364876666d733841414141415355564f524b35435949493d, '', '2019-07-07 11:12:14', '0000-00-00 00:00:00', 1, 0, 1),
(47, 5, 'STD-REG-Y19-047', 'محمد علی', 'Asad Shafqat', '+12-345-6789098', '23456-7898765-4', '+12-345-6788765', '2019-07-07', 'مرد', 'اقا متی', 'RYK', '', '', 'uploads/_photo.jpg', '12345-6789876-5', 25, 'RYK', 'Jutt', 'Pakistani', 'RYK', '', 'Active', '2019-07-07', NULL, 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414731456c4551565234587532645059676c525253467a7773564d3431465441774649304842785551774555774d314568454552504254485a6446545042524151524533384345304e52413131597a55545153424d52597a6656634f5475712b76637156642f2f56346c626e304e77387830563164586e37366e37726d33717174336b71366c48374742414167636863416a4f306c58303839524e58415343494341586f6449574145496e49344152446f6451326f41415477534e6741434d784441493831416b547157527741694c57384341444144415967304130587157423442694c533843514441444151673067775571574e35424344533869594141444d516745677a554b534f35524741534d75624141444d514141697a5543524f705a4841434974627749414d414d42694451445265705948674749744c774a414d414d424344534442537059336b45494e4c794a6741414d78434153444e517049376c4552676e30746e5a32646b49584c7664546c62556674766d702f6c2b3278664c654e6e574f586e357641362f547532614939657274532f57486476617567382f7476586376487a72506b747471563076346a4c79484872746e34565644352f5338643435492f59556352323036623078317a6549644b72783567387564687a485076526a445255696e5866696f35303552437034506a7a53586747555048437677396a7134584b6c55664a3650652f5836326a775345693743394b324a30337a33684f50744a662f45416b6951615467475776784a4236704953784a4e75787a4d6a4f6b44736d4751366e6149782f4a686f595836306d6a434b372f58657346613041664b3664494e68786d6158765071795a6c3832654174455061345a4751646d5864786a6a5378645271792b4d683763617736736b305042496543592b455238496a6c52496d6f37716641646e4463537979646f4654534c737875514b5249464a7a74675245676b67397239794c65586f5a55374a3267594b4d497a474f31434d6336652b424758345143534a4270415a526b485a49757835426b4862377a3138534936565872736a61746163347a5a6f4630694d653430694d497a474f78446753343068344a4478535a4d484f5a7944584e527476794f62795965754d617961744d6d6c563276414e575a494e4a4274494e6c52644568344a6a3153666956424c427042734f43415552494a49454b6d5873535a474367756b484c736f53433946533478456a45534d56466867673252446632594730673570643742634664494f6159653079775a2b5764654f646531592f495446543235326a4b316c6b5876785769764c3171756242534c72666f6c6b41386d4767335859653675666a727959534978456a45534d6c447158504b6d435238496a585a42454c6d466168744b61533066576a71786454696d6b4864494f616466357446417659356336566a3772556875496e62567750514f79444d6779494d75416250457a4d4335766d577533393164494f36516430673570562f39455a697368514c4b42443431745759434847496b76397633335a6234524b63614137486e484844746969415352494e4b4764534679387352423552365a694a47496b596952694a47496b62594f446a50586a712b61482f536349314e59536d4e424a4274494e704273434f4d36454f6c387173347061325750446a777a313436356473793136337a3875665268364a474f6967465a426d5239524c6f3463732b6b31554e7668306643492b475238456a566a724d554d7a4f4f56486d584a6b6f516b67306b473067326b477a6756665077525a42536a46614c32326f7848783470795a58576177716b762f666a4a6b77527173643845416b6948656a2b586d2f4d6743774473677a49546e673343694c3944346a556d396a48635242594749487852665158426f6c62423445654168437068784448515741414159673041424a46514b43484145547149635278454268414143494e67455152454f6768414a46364348456342415951674567444946454542486f49514b51435167394a756b66535a2b6d592f6639392b76755a74442f7575794c707261796579354a2b4c35543957744c546b6d3455726e7566704d386c33532f4a72764e6a2b4e2b4c50797a704a306e76536e704230676553587048306a79533735707553346a58794f75326537507166687574372b6238723963616d33706e75366247303039727a51382f4b466a674f6b634a44766930596b685047446a3868365a7455376c564a373264454d45502b55744a767159775a722b3237486f686b68316f475a776236747154584b69537a3479394a656b66534134486f526772622f676a376a4f53504a6e4a37322f36553949616b6a30493737627a59615267527678316f35354f53506c7941484674754553494e65435176596b544c695a5476382f392f6b5852484970495a75786c36693068752f4f5a52624d74376569507a72346b453066693962764f67666f314975686354795931497062592f4b2b6b545362636e6f6c7264356d314b587462615a5a334534366e4432574a6f7433705a694c5342534a4551377230656c505255364f57396a465872386a424b715a714257706c376b7863785933334f466d5a506b693053777953636256366e312b6565796153626b634549597437494e7065424f546b6a49653261567957394c4d6b6b58736c374f5a466366725a6b3671314f6e507a2b494e49416b5a77304c7458694b58374d6576572f516d2b6478316c2b6a6b757475304c635a515965695a64374f61764c4e76646f6566786c4d73346b6e7850475a4f68586b6a365739463469694d6e4f584c6f394c2b6d4c4a43567a736b5a505a2f48557a316d485965327033654e714a4c4c3768556744524d706a6f5077554e7a6f7a614a646d58696247576b6151566b2f7658756a757a434e46673764365933744b5573766259314c513479727a5a4e476a476e466972425062566f756e537664742b7a777073794b422f4a3468556f6449655a624b697073484d646e6d6d612b53584d7544654364594a46624a4d5050657679547259707663553168644c726c6965324a324d5762345374366b6c4f484c3231697262325553345a4657662f72632f7a514538456a546f4b53696c5247415343732f666535394767495161527155564c5179416a654a394a326b6179756a774c324477496b4958506f5875686e72364876666d733841414141415355564f524b35435949493d, '', '2019-07-07 11:15:24', '0000-00-00 00:00:00', 1, 0, 1);
INSERT INTO `std_personal_info` (`std_id`, `branch_id`, `std_reg_no`, `std_name`, `std_father_name`, `std_father_contact_no`, `std_father_cnic`, `std_contact_no`, `std_DOB`, `std_gender`, `std_residency`, `std_permanent_address`, `std_temporary_address`, `std_email`, `std_photo`, `std_b_form`, `class_id`, `std_district`, `std_religion`, `std_nationality`, `std_tehseel`, `std_password`, `status`, `std_admit_date`, `std_leave_date`, `academic_status`, `barcode`, `std_other_info`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(48, 5, 'STD-REG-Y19-048', 'محمد علی', 'محمد علی', '+12-345-6789098', '12345-6789876-5', '+12-345-6787654', '2019-07-07', 'مرد', 'اقا متی', 'Gulshan Iqbal', '', '', 'uploads/Rehan.jpg_photo.jpg', '12345-6787654-3', 25, 'RYK', 'Jutt', 'Pakistani', 'RYK', '', 'Active', '2019-07-07', NULL, 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a3341414147796b6c455156523458753264763673734e52544876317371646c714c3246674b46694938516245526241516242625553556577454f394833564f774547784645724e5443786c4c5151682b6f6e547a5153687678443942577979746e4e2b666463374f5a4a444f62596f66354c467a75376b78794a764f64383833356b5579796b33517a2f596b50434944414967516532306d366b6634575361415343494341726b4d6b74414145546b63414970324f49524a4141497545446f44414341537753434e51524d626d455942496d3163424142694241455161675349794e6f3841524e71384367444143415167306767556b62463542434453356c554141455967414a46476f49694d7a534d416b54617641674177416747494e414a465a477765415969306552554167424549514b51524b434a6a38776841704d32724141434d514141696a554152475a744841434a74586755415941514345476b4569736a5950414c39524c7134754c6a6f6757753332386d4b326e2f376544552f627364694753396271354f587a3258346461617532584f3971665a463262477474667677633350723575567239316c7179395431527431624365665773386d6661343865315041723656545038343159357439626572317a785a6f75434a464f566436384934676442305136376c5168456862707471584e7265785572777952494e4b5245634f317531514b694854707475506137616d43613464726434686e652b492f5971544a49416b6951535349524c4968797736537454746b5361657957484f7a67464d5a31596a7a456d7432696d744d316936354436532f44364d494a57552f315471532f7237716f76594d77625373555870576836435139506378774c336a47334d7a6236532f6c33555376654e6957435173306d307268455761747371746a67676951535349464f4b336d6f767635307265414553435342414a4975327a51637931473641497459775679595a444c49744679724a524a544e4d316f367348656e766a6c776873372f7250536f57366172566d5476706c78694a47496b5961594272444a4567456b5343534351626571664374494a6c584474634f374a32413370556941535249424a454f6c70476f4e645374314c375442484b4d6e6c6b37636a614c5a6d51433545673075534c63584d6e764c5a36375a59385a6e387a2b377536386c444c6659674b744451394f6d716c485a494e7a5036754472637952616a7664577949424a456755706a6e4e66572b30716e4c535a473149327448316f367348566d3773726c68385a4e54412f7935633857775346676b4c4249574359754552537176726f4e46596a6d75316b734e725032644c5879345a4b43774e586144613965587a57783157417a494d69444c6747794879777552456c4559522b727265526c485968794a635354476b5937327379724e6e57536c31534f716b50357575527a45534f57745765626930734b5a47496b596952694a47416d4c314f6f70352f613878456a45534d524978456a45534155574d4937454f464a314137473531726230756b7272465a66657a5171496b596952694a47496b596952694a4759497351554958627361363656586473624674657561783632655278734e4662624372493073476a4b4e5455495756504b58682b66317968346a614b4c76717769784370435379594839335a455339666b6942316b2f6833584474634f313636792b54523779426247633370392f6155394671734958535964637665326c4d492b4a623569573565574457522f7043344c30614f6f4a5756724b652f552b564764424f4e496b7751672f5533366d2f5233797a365174574e6d417a4d62744e394a5a632b566b6d56756b536a56492f314e2b6e7336396d6d35696a6c3275486134646c643635746f3445654e49665876636e6b4c4354536362656b77675a5542676f776a304a78733243684333445149394345436b4870516f4177494e424341534b6749434178434153414e4152415149514352304141514749414352426f434943424341534f67414341784141434956514c776d3654354a58365a7a3976756e39503246644477656531765365356d637479543957536a377261546e4a663154754f34446b723653394b416b7538347634626358663154534c556b66536e704630696553587066306a4b5176677378344857764c75354c38324c2b68766c5878652f4c71736531354d3176335055416e56796b43496f5848646b6451734b6863543076364c70563751394c484752464d6b622b523945637159345377597a384749746d706e7973716372656b397957394f5545794f2f2b617041386b50525349627153306a3550657673654f6f48546537764e46535a394c2b693972553937326d6c626e3937314b426778714e45547173456865784251774a314a2b7a482f2f4a756d75704f436d7a4838316947544b2f30537948485939737a79526545626d33784e5a63364a45325a456b4a7564565351394c65693559727a73444b534f52536d326630724d53466f4e3063705669494e494d496b564375505636524e4b7a7752703547525072377145646337657235415a615753747a663349527a5371384a4f6c3673686a5247726e69753878635869535a31667449306f3355506e505a766b2b454e417632704b5266512f744c62632f686d6272765657722f77455a447041346975664b34717861722b446c7a6b2f365739465279442f4d34792b75344f335250694c764d2b6b54693562323979624b50573667382f6a4a4c356a486179354b2b547535685355364d2f55796d6b646261624b35707165314f3245673471786676752b617944745456737859466b54714931496f467643655072706d4c6a6247574b6438376b6a344c46737a4c5253743062326152496a6d736647795045384753443261424c4f6e776162676e74304b6d3750473746334758306e356251694a2b38695245446c575079337257326a2b776352437051535254546e6544764b685a454f765a612b3561744569654e6250364e6555733966346c747936324b56714b6b68574d5a64304e6a4e6e4255685a78797070612b337663314948367552705245476b316a3471476e6a4d43454f6d636e7735745777304345476b316a3471476e6a4d43454f6d636e7735745777304365794c39494f6e6d6170704d513048672f4242342f48394146392f6f6c786741464141414141424a52553545726b4a6767673d3d, '', '2019-07-07 11:32:37', '0000-00-00 00:00:00', 1, 0, 1),
(49, 5, 'STD-REG-Y19-049', 'محمد ', 'محمد علی', '+76-543-4567898', '56788-7654345-6', '+75-678-9876656', '2019-07-07', 'مرد', 'اقا متی', 'Gulshan Iqbal', 'Gulshan Iqbal', '', 'uploads/anas.jpg', '76543-5678998-7', 20, 'RYK', 'Jutt', 'Pakistani', 'RYK', '', 'Active', '2019-07-07', NULL, 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a33414141472b456c4551565234587532645065676b525244463334614b6d515a474969616143584b594b43676d6771474a6768714a6e49694a59435a367032496d6d49676759754a4859434b596947656742796f596d47686d496d4b7371595a2f716475753239726537756d6532633736743344633355782f7a4c797031362b717571646e4a2b6c362b694e2b494141436d7842345a4366706176717a7151557167514149364170457767704134487745494e4c35474e4943434b4249324141496a45414152527142496d314d6a7742456d7434454147414541684270424971304d54304345476c3645774341455168417042456f307362304345436b3655304141455967414a46476f45676230794d416b6159334151415967514245476f45696255795041455361336751415941514345476b45697251785051495161586f54414941524345436b45536a5378765149514b547054514141526941416b55616753427654493942507049754c69347365754861376e61796f2f57302f722b6248375667736b352b503956726c386e374f726274304c6158727a7138767630652f2f78496d50666457367a4e764e793958366a6665572b313843622b74312b4450707266664e65563737376648426a7474656d2f4d39523945366a564b694c51664845754456326b41576b4f4d327144534768427131374a6d4d4964496c59666143333676515a525574615a454b4e4b4261424370516c466375314f58464e66756f464a4c6975336e6c6c7a4b4e635444745574685669732b4f4564567a716c4c6a48534961356469326a577846444653706b776f456f70456a46534e714567326b477a596c6b526f346262475653505a5543446f6d6f784a7a583034787a3037707936754861356453584e32377375532f743550675a5753413632526c617a644e7478514a4c4a3278666b53357047327559416b473067325646646e4d492f5537774a434a4967456b5372544661532f54397732736e6245534e746374685a7578456a45534d52496164487830686f3669485245464253705a52426b37636a616b6634654d4c4a434a4967456b5344537a64636565724e6e4c595875585456506a45534d52497730594143435342414a496b476b49786267326730774347496b59695349424a47496b527237687454586f52374f51435349424a45673076474d652b2f6b494b39526e4b364436396c4c596d3032726a653731357374584a4f6379426351313534357577696c55615431536a726263653033472b6b314c432f5859336938616f3572642b544f6e4773514a4274494e68416a45534d524978456a4553505658695a73785365744f424858377143795a4f335949504c6d78444578306e3572374b577442434a472b6239625a4d4b317737584474634f317737584474537372546138436b2f346d2f56314d612f664f3952416a39583852706558574a644c794e5172533336663763354e73494e6e51334a75754e52726e51576c7642717a6d5a705743334b574a7a7a5858683275486138654878734b4831766a51324634426c7053514a554b5a6b386d577859636c4f795844515a484b61577149424a47716e2f4b45534d64724156476b6652614e62386947536544614247427274544f4b68434a424a496a454e32544c2b584c3274534e727830367272626b6b6c6769785249676c51697752596f6b5138306a4d497a475078447a5379657030736e5a6b3757363430613376497658736a5544576a71776457547579646d5474794e707432337641465152463270626461383272725632727547617a4631366a3444554b58714e59574a76482b30695654796e3241744f5478566f54672f5238776846463271626b6139624f31625a643633325753306d4d30764f4c647453615130706c65522b4a3935463448796c33427946534a584d575236546555577a7432366245534d5249432b7246456947574347306a53417333584c736570354579494141434559462b52514933454143424b67495143654d4167514549514b5142494e49454345416b62414145426941416b51614153424d67414a47774152415967414245476741695459414152416f323849796b7a384c2f72306d79592f3949656c335357354c386d425837584e4c6a71667a446b6e344b6461333848366d4d3137585465546d76636f756b39795264546765655458586a3851386c76534c7031585174586a632f48712f37586b6c66534c70666b72647039664c3773587438534e4b506c66767876754b39324448762b372f4a755153524b675a67526e56334d6d596a6b7850486939387536556c4a487858716d2f476177662b51367363364c306c3656314a7565456159357952396d70307a772f307549326e733071377454306c2f53336f696b6447752f6248556a35487541306e2f536e70543073655337676a33566970723762386a36625530694e5134346e334841575257506b476b77704f50526d326e583554306f4b536e77776838567a4463324954564e65503954644a74475a474d59473773656264477a4a786b6673794d335a547644556c76683471527a4c46744877532b79647030773763427773686e4250412b3370663063694b646456456a664d39414d694f5a49464c68715563314d6b4d7a493773713666666b45706c436d414b34797852644b546457613959567a6432726e354e536c647767363864647856386c505a5775792f6f3141342b4b59746468763177523344567a642b76576f43785733317848557a79374c6c645971324e4b6141707135653061376b7a39657a386c597142477836684170494b5676434470792b5457754d4b59652b527868425045717a727866736e63713779634563714a63643943504f4c71386b6c465555784a636c665144507565704668572f336c4a5679513945506f7867686d5a2f677278324c6553544c6d2b44746357535873707859314f62694e587a51326455596e386e6946533976524c73552b4d55306f78693864515a7369576b49692f474f446e704b775a586f7862504b3478342f642f6d7a45625759794d5878585561636c4e7a4f4f7a556f786c545a704347626c4b7170543350544f4249464c6c365565334c735944376e5a356e42497a584b584d6c62646a7968617a636257735863797539575464637463717a2f70355035356c69346f532b347078563878613576465968417533377452345543534755784159674142454767416954594141524d49475147414141684270414967304151493369505339704f74674151496773426d42522f384874346277364f494b44354d41414141415355564f524b35435949493d, '', '2019-07-07 11:39:41', '0000-00-00 00:00:00', 1, 0, 1),
(50, 5, 'STD-REG-Y19-050', 'محمد علی', 'Asad Shafqat', '+23-456-7890987', '23456-7890987-6', '+12-345-6789876', '2019-07-07', 'مرد', 'اقا متی', 'Gulshan Iqbal', '', '', 'uploads/12abfcd7857676-Shahroz.jpg', '12345-6788765-4', 25, 'RYK', 'Jutt', 'Pakistani', 'RYK', '', 'Active', '2019-07-07', NULL, 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414732456c4551565234587532644d59686b525243472f776b464d77557a45524d464138486f77415046524445784e4e424d524a424c424450525052557a775577774d46494445384645304d51444e54754575306754455550522b4d4b56636c3764317652327636365a36635639766d3967326431352f6272372f612f2b2f717571363831734a4e32596673514c4245446749415365326b69365076306331414d6e67514149364151695951556763447743454f6c34444f6b424246416b6241414552694341496f31416b5435576a7742455772304a414d41494243445343425470592f5549514b54566d7741416a454141496f31416b5435576a7742455772304a414d41494243445343425470592f5549514b54566d7741416a454141496f31416b5435576a7742455772304a414d41494243445343425470592f5549514b54566d7741416a454141496f31416b5435576a7742455772304a414d41494243445343425470592f554935496c30656e70366d6f467273396e496d747076652f6c702f7236394639743432376c7a79765a6c487a354f61387a4d654b33357862376a584f657577342f746532375a6675343661334e706a56646557375a646555393639364857666c384d6f72334d7a624f48566459476b7a61394e65623243794c316273684647454b4c684d664f4a557551624475497447584f786c646f6948536d6b693046524a4732586b5470515553565235476154454b526a6c57426b70675a31775246326b594a4c5a653735787258794e33444e4234762f2b363564796853694e647142702b35496268325a374575696f516933553241344e7131695946725679634b696f516937537767475a654a474f6b386d53415352494a496e533259586e78453171367a5839564b375a5a424b7a45534d524b4b68434b6853436853507a303674354d2b6c31367456562b4d4372524a662b38713245556f65696262536d56445a5158707056336a7a664b2f49644c5a4269736c517276375675776a4a58626549644a35416b456b694654642f356c4c4345416b694c52503454525a753071564f64586632327237593070763245646948366e3536416150556577576f375953414b4d534c7257597452666e37767459534b39476b6d5144795961447137437a424d6d32347a474b725471786a38512b4576744937434f786a3752766c55565761624c7455435155795356354e766a4f624f786478495a6961342b72352f66333570496c534c596452494a49454b6d5376584d435136517a623466304e2b6e7663306d4a4c4547793756416b46416c46517046536e325346497146494b464a594c4870785a7a78652f74306a452b6c7630742b6b76306c2f6b2f346d2f6430756565706c4f4b6c736f4c4b42796f6270366561357041684534694f4c6d346d516e6e47776a33542b34374237483458746d42456a7a57536665454c3273474a5530742f734933552f55726532416c483966526a683245646948346c394a506152324565715056773239355571305656426b5869776a79646b47392b703148736f44434a7466663573374a4e746832754861346472683275486134647264396a33464757564a74734f52554b5255435155435556436b56436b58737a583237796d52496753495571454b4248614c5454746c5766554e6b6f7a366575355973374d2b587a32642b377a37346952694a47496b596952694a47496b596952694a4571543636324b6d39783758617245486f424e4e586656483833412b6a576c794f586352416c517631767a7376754432586245534d524978456a45534d524978456a45534d524978456a33565844586b7a54636d73502f566149724d7557625964726832754861346472683275486134647268327548613464724e3556357a5a45686b3557646330463757775855326c4672523633642f376e576268743238514942454b676763474b37664e656e487841434152413444414749644268756e4155434f7768414a41774342415967414a45476745675849414352734145514749414152426f41496c324141455443426b42674141495171514c696b3549656b765446644d7a2b2f3348362b2b58702f666a654f354c654c2f703557394a766c626266536e704a30742b5663522b52394b576b7879585a4f4466442f393738717153664a58306b3654564a6e306836513949645354626d65354a38444476487275485a4d4a625076787a4c32746d3850702f61786e3572646d626e3237624a74636131444c444e525855426b634c74756963597142756348583542306e6454757a636c665677596a786e794e354a2b6e6471596b646c3750775169326147665a6b7a6a506b6b6653487172595a68322f48564a48307036496844646a4e39655272726e702f6b62795a387079473358356e4f33397257783744702f436463785a386c326658616472666b75696755444a677552456f726b5461497875714b55372f6e2f747958644f78484a6a503333447048632b4531523747584b45346b586a547771707666395630476b714b6a576e35336a5a47364e565334494c66757938782b543945426c55526c676b34767341694c7451615249434665764b354a65444b753474374675335a696a7931527a4136327474586c345568466236562b5264444b356246474e7a49587a397561477866376333537a6473704c737262464d735a7a49555a456a524434585532565479464b6446386d43415a4f4753416b694f576e635659756e2b4c48504a5056557763377a56662f2b4548655a2b6b54696c595966316354616c664758755845576a375749614d5238564e4c58307a685230586f712b3977554e3932614667787a4838324e2f534f3469725634623442744c716f4c694a516755732f6c63525579672f59563362754e4b37735a376275535071334549564746486977553656564a583458594b6337487a6a506a2f6a4f346a3657436c624850334667323731613846684d55666e317a795a4e464d65484979554b6b4470484d714d724d6c796d4975573265346171356133485639327961446456796d614b373571752f4a533971626c32636b3763316866424d6e76586c4d565a4e6357706a7463357632566572337950746362476e51365446336a6f6d66706b5167456958365734776c385569414a4557652b75592b47564341434a64707276425842614c774c39452b6c37536a63566541684d48676638656761662f41563232364f6738493635724141414141456c46546b5375516d4343, '', '2019-07-07 11:46:02', '0000-00-00 00:00:00', 1, 0, 1),
(51, 5, 'STD-REG-Y19-051', 'محمد علی', 'محمد علی', '+76-543-4567898', '76577-6545654-5', '+87-654-5678987', '2019-07-07', 'مرد', 'اقا متی', 'Gulshan Iqbal', 'Gulshan Iqbal', '', 'uploads/PAJ3xNUD6c.jpg', '76543-4567876-5', 31, 'RYK', 'Jutt', 'Pakistani', 'RYK', '', 'Active', '2019-07-07', NULL, 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414766456c4551565234587532645036676b52524348667873715a68714c6d47686d5a714b676d43676d676f6d4b66354a44504d524530456a306e59715a59434b43694a45616d42674b4a6e707743676158614b534a794d566e7175475463727534327436656d5a375a537037394c547a753357355054383976362b75717271365a74354e3074667949467771677743594648746c4a756c4a2b4e76584151536941416a6f444a4b774142553558414a424f31354165554143506841326751495943654b514d46656c6a65415541615867545149414d425141705130583647463442514272654242416751774641796c4352506f5a58414a43474e774545794641416b444a5570492f684651436b3455304141544955414b514d46656c6a65415541615867545149414d425141705130583647463442514272654242416751774641796c4352506f5a58414a43474e774545794641416b444a5570492f684665674836667a382f4c7848727431754a3274712f39724c442f5033376233597076343848726655726a37507163664f6a615531376e70383954583639626661315a2f562f55386432364e66533563744f732b4e6630742f507136703866586f7430615848687673744f6d394d552b2f414b6e586f414670507a6c47474536427632665361304544534f564c364a6c5274347256382b55737a59705478674649674952484b6c48704b5345574941455349414853305671317833757a5274716a73334f78574350743879523470454d4e6c6b4a6f51414b6b78595878327377576f523268486145646f52326858596849347152492b7275785839555439354f314f39376e6d30707245396f52326848616851337871633177316b68644e51596b472b593244316b6a33616f387753504e4233686b3755717055717563425a41417162507144592b45523972584f684c614857352f6b477a6f324174616976744a4e70427341435241616d34736e37725a7a42714a4e644c423752716b767738335457767650465751433069414245674a6d3832414245694142456a4e716f33656d307570624b437959544962747a61316a306643492b475238456834704b333747334d70624e4c66302b6c746b6731376255682f6b2f346d2f563065714c50302f416a575349316979376b6e454e5570627a775348696c4335765a516536466f5530734a42327274714c576a52476a686b58424c4542554165527a58476d2f47632b304f317844636a385439534e7950785031495851387078534f786a38512b306f72516e5458534372476f74615057626d7072424a414161545a686b4848544970554e56445a513255426c4135554e56445a7376337331382b35665042496543592b455238496a345a487753485679494b37355776745957797458534461516243445a4d4c4856735361384253524141695241346b3966746b4b58316e3758326c736331737a4757304e6f536f516f45614a4569424968536f53324c696970624b437967637147684467596b41414a6b414470494278643435587239525550507a6d2b755a477348566b37736e594a6b7977674152496741524c7062394c662f5838497530375455396c51764d6a5367796532376d2f774f4b3562617742756f7a682b7842595050366b41585076494a624a325a4f3349326958457759414553494145534b532f69773134686f3031456d756b6f2f756b7476366c774a37776c6e326b3559514736572f533336532f453649565141496b51506f2f6764547a494433616f4d436743707a5a4d3432766c4a39424e6543795565426b425144705a416e704141556b514d494b554342424155424b454a45755541435173414555534641416b424a457041735541435273414155534641436b494f4c7a6b72344d2f2f394f6b7233336c3653334a62306e79642b7a5a6c394a6572793066316a53542b4659612f39486165504832736431752f6f3776465053783255373476647966682f5470354a656c2f53507049636b2f526a4f66632f45324f2b53394c576b42795339554d597a645a312f532f70493069755334726e694747313863396564594a4d58736774416d766a617a46444e4f4d316f7a5041634847397542765730704d386178393958445035614f5434653836716b4477734d72564d2f4a656b3553576553444354372f322f6c643239762f563871625179712b685848627542394b2b6d477048636c6656373146647361384e39584530494c394b6e72767041454a4130616b4270433369627052556c666c4d38755333705130724e687072356230704e6c426f3964324c4676535070563068305653415a4136356749694831754c7a4e2b41386c42734e2f395a58415a4147394b2b6b58534d77474f4f4861444c494a6b342f716b65466a724b376139585a4a42627632616c333148307673546b3854634e53545a35595872427041575a76513631504a5a2b3259496d574949614e37727a394b6e657a5144794d4b726e304e6f56702f574154524466796d41464d4e4344383169324769472f3167772b75686848425950312b71774d7261314d567146793275534c4d527265532f727a362f46517356343352664f38704d484445674e51562b573945325a75614f42323171704e6c5137334e2b37486a784f713130303176736261787744304e5a5a4c533855782f464567645861477567785849786a6e356f4566433158743433392b49546761362f61383858727476423339426367565262515776764574554e72486546727148744c51694a323656374576554d6458746e3739514c653371734e31397038494f6b74535161686536486f6b6571783135413548413567584f7359714f364670745a544e53797474654f6f514146533963323350456b3064463837784b785a4b38506c2f5a686e3839444b5472575574624d326356307a64577964525a7a7a6c70376471374e2b486e71364244467369784e416c476a70756746705641573462685249554143506c43416958614141494745444b4a43674143416c694567584b50416653443949756f6f574b4941436d78563439462b716c65726f51337475685141414141424a52553545726b4a6767673d3d, '', '2019-07-07 12:00:50', '0000-00-00 00:00:00', 1, 0, 1),
(52, 5, 'STD-REG-Y19-052', 'محمد علی', 'محمد علی', '+76-556-7876567', '76565-4554565-4', '+45-665-4576544', '2019-07-07', 'مرد', 'اقا متی', 'Gulshan Iqbal', 'Gulshan Iqbal', '', 'uploads/wBX6ZWOP952sNWl.jpg', '87654-5676545-6', 25, 'محمد علی', 'Jutt', 'Pakistani', 'RYK', '', 'Active', '2019-07-07', '2019-08-09', 'Active', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a334141414731306c4551565234587532645061676b525253467a345447476f755961475a69707542696f7067494a694c2b4a4161436d4379346b656a754b6d6143695967694a7634674267596d676f6c756f4a6b675a6d7369596d367134567675544e336c767072717271715a6d676d3676346248766c6456585631312b70362b35393675367431497570562b7841454349484151416b39734a4e31495077663177456b6741414b364470477741684134486747496444794739414143654352734141524749494248476f4569666177654159693065684d4167424549514b51524b4e4c4836684741534b73334151415967514245476f4569666177654159693065684d4167424549514b51524b4e4c4836684741534b73334151415967514245476f4569666177654159693065684d4167424549514b51524b4e4c4836684741534b73334151415967514245476f4569666177654159693065684d4167424549514b51524b4e4c483668466f4a394c4678635646433179627a5562573150363177302f7a6369754c62574b3974382f7270383664616c2b36526878502f7275504e7839726153357a38386a72537550724758504c5045706a37726e47715848704855754c50625469306d4b446a5461394d2b627041794a4e6b54715371305338715a745a4d34516577326f316d4c78647a7a55675570314b4777634a496c33326b48696b48523635636a67464c72326b726a3249656c514448696e6335446e5a315875545976746a7a7032376d545644364c6b75486d6b584768797147694153524e714c4c5876697452367949753251646c7345446e316948584d7548716b734330636b506d6f6548576d587645784a726e6a5a6c484754745a754f6155595937796b6c622b38444379496c44306e36652f655759437077377a457359715444465566724b356936734e766553394c663538704f6c5a49694a644a41704a3073505054314164494f615466707061614d41342b4552324a6c51316a5a4d5a647861316e7830667479754d66726b625772697a756b5866594f347052424e644b754c4e6c365355327967575444335265484a42756d302b5048726c556b52694a47496b594b436f466b513056536b76346d2f58316f544e69796568365068456643492b4752746d6c4939694d4e4d495365344a76304e2b6c7630742b6b763773394d4e497578453345534d52497845677a6951536b3357575a63576a5743576e48456946694a474b6b765730722b594d686638443050446951646b69375377624743316c657945364b4f365164306937663874337955526738556b597069415352494e4b6b6e2b467a5849642b57494e6b772f36586d556273316d58524b6f745757625261324c43487445506154583737375a67646e6a324778636f47566a6177736f4756446178734b4956554a4274494e704273494e6d77393354736b56677461563532794c4a44396f596b2b356b39384568344a44775348676d504e504d4a724f696452337671337635496635502b4a76314e2b687470562f736f523231784a6a45534d52497855734f71626f69302f7a3874746952686b4861386b4f574637494148444553435342414a496d315a774a64572b644a71635a2f5533436551657a314954664c32396b66576a71776457547579646d5474794e715674305563697773656952694a47496b59695269707470796c39306c5a697756346a3852374a4e346a44586a7951695349424a456730743373336d68503364736657547579646d5474794e7152745473324f34573051396f68375a4232534c755a335869736247426c41797362744e75516d5a623646482b76625771465342414a496b476b335a763255757a685a62305a6f56507542435647496b5a7169704671376f393645466778417532664c4634785345776442476f49514b51615174534451414d43454b6b424a4a7141514130426946524469486f5161454141496a574152424d51714345416b576f49555138434451684170416151614149434e515167556f625132354c656c66536a70426454336465536e67727458704a6b5a59394a2b695756507937703133544f56366e7355306c584a6632662f72622b48705430587547753343507051306d767054712f52697a332f74354d592f52757650782b5364394b656b52536159772b70332f546966644b2b696839392f335079746a6a6b45767a72686e613075736855726a4444306c364a686d30476375546d644762555a735266797a70506b6d7653726f6569474a64505376707469517a7a48695930623666796f30772b57463976797a707936772f492f5a506961516c597a52792f7032756166322f4a636d4a59753174486e595979665044787670436d6f4f4e6432727338547a447144547670524f6c4e6a2b494e454f6b42354c6e385362524b4d336f374f39726b7636513948776969586d674877704573764b2f6b6b637145636d493972716b44774b52764d7975597837786e597a5956762b63704d2f5357497a34356b337469423753694a595479523861317462484f7a5832614552543836345a32744c7249564a3268313232354c497365694e373470756e4d474b347848507635644c51756f3379796b6a35572f42347557455a4b5678434f6a47746a533366656b505366354a7553766f386b4e53396b55744b6c34335261786a5258476f3645654e6358676c454b6f3039482b6655764a644f6c4e723849464a414b4d59777559537876782b57394831714834323435453363574c394a38736b386a6355775554726d385a55507862334646356d586974664d70614139414e7944357154336674336a504a726b6f424777354958692b55386e496a713534376d6c6564634d62716e3145436b6a6b73756733456a792b434847554b5634796d4f69337956396b6c6c504c744679342f4c2b6a487a756866374a50464a4f374568384932776578786735724b2f763072387865524b6c715933467835374857315a586d2f645369564b624630514b434f575a4d34387a70703777655962503546664d76506e357561637078556847424d2b34786578614c48657061503146372b543957356e4a7545694d6d6c787a6a3252456e5274374e4b5238336a473555544f3470645a44704b586557655a3156675167306c6e68356d4a4c525141694c66584f4d712b7a496743527a676f3346317371416c73692f537a70316c4a6e794c784134417749584c6b444f386a7a36505769526a7341414141415355564f524b35435949493d, '', '2019-07-07 12:11:45', '2019-07-07 12:11:45', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `std_sections`
--

CREATE TABLE `std_sections` (
  `section_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `section_name` varchar(50) NOT NULL,
  `section_description` varchar(100) NOT NULL,
  `section_intake` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_sections`
--

INSERT INTO `std_sections` (`section_id`, `branch_id`, `session_id`, `section_name`, `section_description`, `section_intake`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 5, 4, 'Red', 'Red', 25, '2019-04-26 17:22:05', '2019-03-16 07:10:30', 3, 1, 1),
(2, 5, 4, 'Blue', 'Blue', 25, '2019-04-26 17:22:11', '2019-03-16 07:10:47', 3, 1, 1),
(3, 5, 4, 'Green', 'Green', 20, '2019-04-26 19:10:10', '2019-04-26 19:10:10', 3, 1, 1),
(4, 5, 4, 'Pink', 'Pink', 30, '2019-04-26 19:09:34', '2019-04-26 19:09:34', 3, 1, 1),
(5, 6, 6, 'Green', 'Green ', 30, '2019-04-26 18:57:35', '2019-04-26 18:57:35', 3, 4, 1),
(11, 6, 6, 'Red', 'Red', 25, '2019-04-26 19:04:22', '0000-00-00 00:00:00', 4, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `std_sessions`
--

CREATE TABLE `std_sessions` (
  `session_id` int(11) NOT NULL,
  `session_branch_id` int(11) NOT NULL,
  `session_name` varchar(32) NOT NULL,
  `session_start_date` date NOT NULL,
  `session_end_date` date NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `installment_cycle` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_sessions`
--

INSERT INTO `std_sessions` (`session_id`, `session_branch_id`, `session_name`, `session_start_date`, `session_end_date`, `status`, `installment_cycle`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(4, 5, '2019 - 2020 ', '2019-03-01', '2020-03-31', 'Active', 4, '2019-05-25 18:29:22', '2019-03-16 07:04:49', 1, 1, 1),
(6, 6, '2019 - 2020', '2019-03-01', '2020-03-31', 'Active', 0, '2019-03-16 07:05:16', '0000-00-00 00:00:00', 1, 0, 1),
(7, 5, '2020 - 2021', '2019-03-19', '2019-03-19', 'Inactive', 0, '2019-04-26 17:15:40', '2019-04-26 17:15:40', 4, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `std_subjects`
--

CREATE TABLE `std_subjects` (
  `std_subject_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `std_subject_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_subjects`
--

INSERT INTO `std_subjects` (`std_subject_id`, `class_id`, `std_subject_name`) VALUES
(1, 13, 'Biology,Chemistry,Physics,English A,English B,Urdu A,Urdu B,Islamiat'),
(2, 14, 'Biology,Chemistry,Physics,English A,English B,Urdu A,Urdu B,Pak-Studies'),
(3, 13, 'Computer,Chemistry,Physics,English A,English B,Urdu A,Urdu B,Islamiat'),
(4, 14, 'Computer,Chemistry,Physics,English A,English B,Urdu A,Urdu B,Pak-Studies'),
(5, 1, 'Math,English A,Urdu A,Computer,Pak-Studies,Drawing'),
(6, 2, 'Math,English A,Urdu A,Drawing'),
(7, 3, 'Math,English A,Urdu A,Islamiat,Computer'),
(8, 4, 'Math,English A,Islamiat'),
(9, 5, 'Math,Urdu A,Islamiat'),
(10, 6, 'English A,Urdu A,Islamiat'),
(11, 7, 'Math,English A,Computer'),
(12, 8, 'Math,Science,Islamiat'),
(13, 9, 'Math,English A,English B'),
(14, 11, 'Math,Urdu B,Urdu A,Islamiat'),
(15, 12, 'Pak-Studies,Urdu A,Islamiat');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `subject_name` varchar(32) NOT NULL,
  `subject_alias` varchar(10) NOT NULL,
  `subject_description` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `subject_name`, `subject_alias`, `subject_description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 'Math', 'M', 'Math', '2019-04-20 07:54:14', '0000-00-00 00:00:00', 1, 0, 1),
(2, 'English A', 'Ea', 'English A', '2019-04-20 07:54:14', '0000-00-00 00:00:00', 1, 0, 1),
(3, 'English B', 'Eb', 'English B', '2019-04-20 07:54:14', '0000-00-00 00:00:00', 1, 0, 1),
(4, 'Urdu A', 'Ua', 'Urdu A', '2019-04-20 07:54:14', '0000-00-00 00:00:00', 1, 0, 1),
(5, 'Urdu B', 'Ub', 'Urdu B', '2019-04-20 07:54:14', '0000-00-00 00:00:00', 1, 0, 1),
(6, 'Science', 'S', 'Science', '2019-04-20 07:54:14', '0000-00-00 00:00:00', 1, 0, 1),
(7, 'Pak-Studies', 'Ps', 'History / Pak-Studies', '2019-04-20 07:54:14', '0000-00-00 00:00:00', 1, 0, 1),
(8, 'Computer', 'Cm', 'Computer', '2019-04-20 07:54:14', '0000-00-00 00:00:00', 1, 0, 1),
(9, 'Islamiat', 'I', 'Islamiat', '2019-04-20 07:54:14', '2018-12-31 11:57:46', 1, 1, 0),
(10, 'Drawing', 'D', 'Drawing', '2019-04-18 06:57:07', '0000-00-00 00:00:00', 9, 0, 1),
(11, 'Biology', 'B', 'Biology', '2019-04-20 07:54:15', '0000-00-00 00:00:00', 1, 0, 1),
(12, 'Physics', 'P', 'Physics', '2019-04-20 07:54:15', '0000-00-00 00:00:00', 1, 0, 1),
(13, 'Chemistry', 'Ch', 'Chemistry', '2019-04-20 07:54:15', '0000-00-00 00:00:00', 1, 0, 1),
(14, 'Islamiat (Elective)', 'I(ele)', 'Islamiat (Elective)', '2019-04-20 07:54:15', '0000-00-00 00:00:00', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_subject_assign_detail`
--

CREATE TABLE `teacher_subject_assign_detail` (
  `teacher_subject_assign_detail_id` int(11) NOT NULL,
  `teacher_subject_assign_detail_head_id` int(11) NOT NULL,
  `incharge` tinyint(4) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `no_of_lecture` enum('1 Lecture','2 Lectures','3 Lectures','4 Lectures','5 Lectures','6 Lectures','Full Week') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher_subject_assign_detail`
--

INSERT INTO `teacher_subject_assign_detail` (`teacher_subject_assign_detail_id`, `teacher_subject_assign_detail_head_id`, `incharge`, `class_id`, `subject_id`, `no_of_lecture`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 1, 0, 2, 1, '1 Lecture', '2019-05-23 04:13:13', '0000-00-00 00:00:00', 1, 0, 1),
(2, 1, 0, 3, 1, '1 Lecture', '2019-05-23 04:13:13', '0000-00-00 00:00:00', 1, 0, 1),
(3, 1, 0, 4, 1, '1 Lecture', '2019-05-23 04:13:13', '0000-00-00 00:00:00', 1, 0, 1),
(4, 1, 0, 2, 8, '1 Lecture', '2019-05-23 04:13:13', '0000-00-00 00:00:00', 1, 0, 1),
(5, 1, 0, 3, 8, '1 Lecture', '2019-05-23 04:13:13', '0000-00-00 00:00:00', 1, 0, 1),
(6, 1, 0, 4, 8, '1 Lecture', '2019-05-23 04:13:13', '0000-00-00 00:00:00', 1, 0, 1),
(7, 1, 0, 2, 10, '1 Lecture', '2019-05-23 04:13:13', '0000-00-00 00:00:00', 1, 0, 1),
(8, 1, 0, 3, 10, '1 Lecture', '2019-05-23 04:13:13', '0000-00-00 00:00:00', 1, 0, 1),
(9, 1, 0, 4, 10, '1 Lecture', '2019-05-23 04:13:13', '0000-00-00 00:00:00', 1, 0, 1),
(10, 2, 0, 2, 2, '1 Lecture', '2019-05-23 04:13:41', '0000-00-00 00:00:00', 1, 0, 1),
(11, 2, 0, 3, 2, '1 Lecture', '2019-05-23 04:13:41', '0000-00-00 00:00:00', 1, 0, 1),
(12, 2, 0, 4, 2, '1 Lecture', '2019-05-23 04:13:41', '0000-00-00 00:00:00', 1, 0, 1),
(13, 2, 0, 2, 4, '1 Lecture', '2019-05-23 04:13:41', '0000-00-00 00:00:00', 1, 0, 1),
(14, 2, 0, 3, 4, '1 Lecture', '2019-05-23 04:13:41', '0000-00-00 00:00:00', 1, 0, 1),
(15, 2, 0, 4, 4, '1 Lecture', '2019-05-23 04:13:41', '0000-00-00 00:00:00', 1, 0, 1),
(16, 2, 0, 2, 7, '1 Lecture', '2019-05-23 04:13:41', '0000-00-00 00:00:00', 1, 0, 1),
(17, 2, 0, 3, 7, '1 Lecture', '2019-05-23 04:13:41', '0000-00-00 00:00:00', 1, 0, 1),
(18, 2, 0, 4, 7, '1 Lecture', '2019-05-23 04:13:41', '0000-00-00 00:00:00', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_subject_assign_head`
--

CREATE TABLE `teacher_subject_assign_head` (
  `teacher_subject_assign_head_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `teacher_subject_assign_head_name` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher_subject_assign_head`
--

INSERT INTO `teacher_subject_assign_head` (`teacher_subject_assign_head_id`, `teacher_id`, `teacher_subject_assign_head_name`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 1, 'Kinza Mustafa', '2019-05-23 04:13:13', '0000-00-00 00:00:00', 1, 0, 1),
(2, 3, 'Nauman', '2019-05-23 04:13:41', '0000-00-00 00:00:00', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `time_table_detail`
--

CREATE TABLE `time_table_detail` (
  `time_table_d_id` int(11) NOT NULL,
  `time_table_h_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `room` varchar(10) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `time_table_detail`
--

INSERT INTO `time_table_detail` (`time_table_d_id`, `time_table_h_id`, `subject_id`, `start_time`, `end_time`, `room`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(2, 5, 8, '08:00:00', '08:40:00', 'Room-1', 1, 0, '2019-05-10 06:31:30', '0000-00-00 00:00:00'),
(3, 5, 9, '08:40:00', '09:20:00', 'Room-1', 1, 0, '2019-05-10 06:31:30', '0000-00-00 00:00:00'),
(4, 5, 2, '09:20:00', '10:00:00', 'Room-1', 1, 0, '2019-05-10 06:31:30', '0000-00-00 00:00:00'),
(5, 5, 4, '10:20:00', '11:00:00', 'Room-1', 1, 0, '2019-05-10 06:31:30', '0000-00-00 00:00:00'),
(6, 5, 1, '11:00:00', '11:40:00', 'Room-1', 1, 0, '2019-05-10 06:31:30', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `time_table_head`
--

CREATE TABLE `time_table_head` (
  `time_table_h_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `days` varchar(200) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Active',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `time_table_head`
--

INSERT INTO `time_table_head` (`time_table_h_id`, `class_id`, `days`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(5, 1, 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday', 'Active', 1, 0, '2019-05-10 06:31:30', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `first_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'example@gmail.com',
  `user_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_photo` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `is_block` tinyint(4) NOT NULL DEFAULT '1',
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `branch_id`, `first_name`, `last_name`, `username`, `email`, `user_type`, `auth_key`, `password_hash`, `password_reset_token`, `user_photo`, `is_block`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, 'Dexterous', 'Developers', 'dexdevs', 'anas@dexdevs.com', 'dexdevs', 'pQEdYTAVV_wLtqIALoSZ-vELIA0mdsOx', '$2y$13$ClHehtUhZZQqsocCsPnEwer2wfQd4gTcpwSOJTkWnvoMD/oFzfCpG', NULL, 'userphotos/dexdevs_photo.png', 1, 10, 1552727256, 1552727256),
(3, 5, 'Super', 'Admin', 'Superadmin', 'superadmin@gmail.com', 'Superadmin', 'xqZuT3vxOiZ-rsN56V6wjZhi7VXMpKnD', '$2y$13$9TnNqeWAHECax0kmKSBzK.tGW/ePQm6IkutslR9ITYIXocjs4nnX.', NULL, 'userphotos/Superadmin_photo.png', 1, 10, 1552883449, 1552883449),
(4, 6, 'Dexterous', 'Developers', 'dexdevsdeveloper', 'admin@dexdevs.com', 'dexdevs2', 'm4vI7EWTZ61_eTBrJf_tliCWdgRfCKzM', '$2y$13$k6pJmBNM4hrkgZh0SYhcC.dZLxMLOjsJtVo55TV4QiVIJ4F6t7lIW', NULL, 'userphotos/dexdevs2_photo.png', 1, 10, 1552894313, 1552894313),
(68, 5, 'Kinza', 'Mustafa', '45102-0511722-2', 'kinza.fatima.522@gmail.com', 'Teacher', 'qEH5YVuWfMLOZ3JgdoeYjokjZSkuaj2-', '$2y$13$kKWHsv4wBumdUKy4BcasVuoaH5CDd2OoelxrJ29fnC8f6R1HI40b.', NULL, 'userphotos/45102-0511722-2_photo.jpg', 1, 10, 1555571135, 1555571135),
(69, 5, 'Nauman', '', '31303-0511722-2', 'noman@gmail.com', 'Teacher', 'LkTwwUMGN5ESQtuzyjnzLAhDSHAgLwT-', '$2y$13$udjSFi6/Or.uC/JqZQs7suWvAGj0UH0bRMdjwStlKDsasqGgpnHPi', NULL, 'userphotos/31303-0511722-2_photo.jpg', 1, 10, 1555571173, 1555571173),
(97, 5, '', '', 'admin', 'admin@jammiaqadria.com', 'Admin', 'qeScJb_C5FfmfIiXb0MA2WWtyydOUk5L', '$2y$13$OKq.YDLvKljKeu.jdbfM0u/U2kaB5V1kdNBFjMvoN.TZchI7mf6CS', NULL, 'userphotos/admin_photo.jpg', 1, 10, 1560541714, 1560541714),
(98, 5, '', '', '34567-8909876-5', 'nawal@gmail.com', 'Teacher', '5sll7v1DmN0rONKNVP3LltejQ_W4kMaZ', '$2y$13$Qp/iqWpbUqO7v0uFM5jst.8hiWwhhgnYYueumOeiTXQSTbV9kO/CO', NULL, 'uploads/قاضی محمد اسماعیل_emp_photo.jpg', 1, 10, 1562388395, 1562388395),
(99, 5, '', '', '12345-6789876-5', 'nawal@gmail.com', 'Teacher', 'uOIRCp80NAu_rl_Algn8L-w53x4NXmBl', '$2y$13$PB1rdChBeQcsZ7UMK3O.k.KImiOs0LRB8h5fWnEzEEMeggk8y09rm', NULL, '0', 1, 10, 1562388821, 1562388821),
(100, 5, '', '', '23456-7898765-4', 'nawal@gmail.com', 'Teacher', 'I052M8vR8iSA8IAml-PdxOF2HPJsJkj3', '$2y$13$W2htgdkSMxgl7ZYjuVTvjOsti0WhHEyvz7j0nhlsE8hjFvi5NJHAC', NULL, 'uploads/قاضی محمد_emp_photo.jpg', 1, 10, 1562389304, 1562389304),
(101, 5, '', '', '34567-8987654-3', 'nawal@gmail.com', 'Teacher', 'GaEveD_TQB-LFSq9F2LZV-8Ey1YQzHrY', '$2y$13$XkPa1BDUJ.GeaFUOIE6yGuyrtas9wZNWj89tzaW7.UFgfglCQrn/u', NULL, 'uploads/محمد_emp_photo.jpg', 1, 10, 1562389608, 1562389608);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`) VALUES
(1, 'Principal'),
(2, 'Admin'),
(3, 'Vice Principal'),
(4, 'Superadmin'),
(5, 'Inquiry Head'),
(6, 'Registrar'),
(7, 'Accountant'),
(8, 'Exams Controller'),
(9, 'Student'),
(10, 'Teacher'),
(11, 'Parent');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_nature`
--
ALTER TABLE `account_nature`
  ADD PRIMARY KEY (`account_nature_id`);

--
-- Indexes for table `account_register`
--
ALTER TABLE `account_register`
  ADD PRIMARY KEY (`account_register_id`),
  ADD KEY `account_register_account_nature_id` (`account_nature_id`);

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`trans_id`),
  ADD KEY `trans_head_account_id` (`account_nature`),
  ADD KEY `trans_head_voucher_type_id` (`account_register_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Indexes for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`branch_id`),
  ADD KEY `institute_id` (`institute_id`);

--
-- Indexes for table `concession`
--
ALTER TABLE `concession`
  ADD PRIMARY KEY (`concession_id`);

--
-- Indexes for table `custom_sms`
--
ALTER TABLE `custom_sms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`emial_id`);

--
-- Indexes for table `emp_attendance`
--
ALTER TABLE `emp_attendance`
  ADD PRIMARY KEY (`att_id`),
  ADD KEY `emp_id` (`emp_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `emp_departments`
--
ALTER TABLE `emp_departments`
  ADD PRIMARY KEY (`emp_department_id`),
  ADD KEY `emp_id` (`emp_id`),
  ADD KEY `department_id` (`dept_id`);

--
-- Indexes for table `emp_designation`
--
ALTER TABLE `emp_designation`
  ADD PRIMARY KEY (`emp_designation_id`);

--
-- Indexes for table `emp_documents`
--
ALTER TABLE `emp_documents`
  ADD PRIMARY KEY (`emp_document_id`),
  ADD KEY `emp_info_id` (`emp_info_id`);

--
-- Indexes for table `emp_info`
--
ALTER TABLE `emp_info`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `emp_designation_id` (`emp_designation_id`),
  ADD KEY `emp_branch_id` (`emp_branch_id`),
  ADD KEY `emp_type_id` (`emp_type_id`);

--
-- Indexes for table `emp_leave`
--
ALTER TABLE `emp_leave`
  ADD PRIMARY KEY (`app_id`),
  ADD KEY `emp_id` (`emp_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `emp_reference`
--
ALTER TABLE `emp_reference`
  ADD PRIMARY KEY (`emp_ref_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `emp_type`
--
ALTER TABLE `emp_type`
  ADD PRIMARY KEY (`emp_type_id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `exams_category`
--
ALTER TABLE `exams_category`
  ADD PRIMARY KEY (`exam_category_id`);

--
-- Indexes for table `exams_criteria`
--
ALTER TABLE `exams_criteria`
  ADD PRIMARY KEY (`exam_criteria_id`),
  ADD KEY `exam_category_id` (`exam_category_id`,`class_id`),
  ADD KEY `std_enroll_head_id` (`class_id`);

--
-- Indexes for table `exams_report`
--
ALTER TABLE `exams_report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `std_id` (`std_id`),
  ADD KEY `para_id` (`para_id`);

--
-- Indexes for table `fee_month_detail`
--
ALTER TABLE `fee_month_detail`
  ADD PRIMARY KEY (`month_detail_id`);

--
-- Indexes for table `fee_transaction_detail`
--
ALTER TABLE `fee_transaction_detail`
  ADD PRIMARY KEY (`fee_trans_detail_id`),
  ADD KEY `fee_trans_detail_head_id` (`fee_trans_detail_head_id`),
  ADD KEY `fee_type_id` (`fee_type_id`);

--
-- Indexes for table `fee_transaction_head`
--
ALTER TABLE `fee_transaction_head`
  ADD PRIMARY KEY (`fee_trans_id`),
  ADD KEY `std_id` (`std_id`),
  ADD KEY `month_id` (`month`),
  ADD KEY `class_name_id` (`class_name_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `fee_type`
--
ALTER TABLE `fee_type`
  ADD PRIMARY KEY (`fee_type_id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`grade_id`);

--
-- Indexes for table `installment`
--
ALTER TABLE `installment`
  ADD PRIMARY KEY (`installment_id`);

--
-- Indexes for table `institute`
--
ALTER TABLE `institute`
  ADD PRIMARY KEY (`institute_id`);

--
-- Indexes for table `institute_name`
--
ALTER TABLE `institute_name`
  ADD PRIMARY KEY (`Institute_name_id`);

--
-- Indexes for table `marks_details`
--
ALTER TABLE `marks_details`
  ADD PRIMARY KEY (`marks_detail_id`),
  ADD KEY `marks_head_id` (`marks_head_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `marks_head`
--
ALTER TABLE `marks_head`
  ADD PRIMARY KEY (`marks_head_id`),
  ADD KEY `std_id` (`std_id`),
  ADD KEY `exam_criteria_id` (`exam_criteria_id`),
  ADD KEY `class_head_id` (`class_head_id`);

--
-- Indexes for table `marks_weightage_details`
--
ALTER TABLE `marks_weightage_details`
  ADD PRIMARY KEY (`weightage_detail_id`),
  ADD KEY `weightage_head_id` (`weightage_head_id`),
  ADD KEY `weightage_type_id` (`weightage_type_id`);

--
-- Indexes for table `marks_weightage_head`
--
ALTER TABLE `marks_weightage_head`
  ADD PRIMARY KEY (`marks_weightage_id`),
  ADD KEY `exam_category_id` (`exam_category_id`),
  ADD KEY `subjects_id` (`subjects_id`),
  ADD KEY `marks_weightage_head_ibfk_2` (`class_id`);

--
-- Indexes for table `marks_weightage_type`
--
ALTER TABLE `marks_weightage_type`
  ADD PRIMARY KEY (`weightage_type_id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `msg_of_day`
--
ALTER TABLE `msg_of_day`
  ADD PRIMARY KEY (`msg_of_day_id`),
  ADD UNIQUE KEY `msg_details` (`msg_details`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`notice_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `paraay`
--
ALTER TABLE `paraay`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_book`
--
ALTER TABLE `phone_book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `sms`
--
ALTER TABLE `sms`
  ADD PRIMARY KEY (`sms_id`);

--
-- Indexes for table `std_academic_info`
--
ALTER TABLE `std_academic_info`
  ADD PRIMARY KEY (`academic_id`),
  ADD KEY `std_id` (`std_id`),
  ADD KEY `class_name_id` (`class_name_id`),
  ADD KEY `subject_combination` (`subject_combination`);

--
-- Indexes for table `std_attendance`
--
ALTER TABLE `std_attendance`
  ADD PRIMARY KEY (`std_attend_id`),
  ADD KEY `teacher_id` (`user_id`),
  ADD KEY `class_id` (`class_name_id`),
  ADD KEY `student_id` (`std_id`);

--
-- Indexes for table `std_class_name`
--
ALTER TABLE `std_class_name`
  ADD PRIMARY KEY (`class_name_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `std_enrollment_detail`
--
ALTER TABLE `std_enrollment_detail`
  ADD PRIMARY KEY (`std_enroll_detail_id`),
  ADD KEY `std_enroll_detail_head_id` (`std_enroll_detail_head_id`),
  ADD KEY `std_enroll_detail_std_id` (`std_enroll_detail_std_id`);

--
-- Indexes for table `std_enrollment_head`
--
ALTER TABLE `std_enrollment_head`
  ADD PRIMARY KEY (`std_enroll_head_id`),
  ADD KEY `class_name_id` (`class_name_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `std_fee_details`
--
ALTER TABLE `std_fee_details`
  ADD PRIMARY KEY (`fee_id`),
  ADD KEY `std_id` (`std_id`);

--
-- Indexes for table `std_fee_installments`
--
ALTER TABLE `std_fee_installments`
  ADD PRIMARY KEY (`fee_installment_id`),
  ADD KEY `std_fee_id` (`std_fee_id`),
  ADD KEY `installment_no` (`installment_no`);

--
-- Indexes for table `std_fee_pkg`
--
ALTER TABLE `std_fee_pkg`
  ADD PRIMARY KEY (`std_fee_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `std_guardian_info`
--
ALTER TABLE `std_guardian_info`
  ADD PRIMARY KEY (`std_guardian_info_id`),
  ADD KEY `std_id` (`std_id`);

--
-- Indexes for table `std_ice_info`
--
ALTER TABLE `std_ice_info`
  ADD PRIMARY KEY (`std_ice_id`),
  ADD KEY `std_id` (`std_id`);

--
-- Indexes for table `std_inquiry`
--
ALTER TABLE `std_inquiry`
  ADD PRIMARY KEY (`std_inquiry_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `std_personal_info`
--
ALTER TABLE `std_personal_info`
  ADD PRIMARY KEY (`std_id`),
  ADD UNIQUE KEY `std_reg_no` (`std_reg_no`),
  ADD KEY `std_name` (`std_name`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `std_sections`
--
ALTER TABLE `std_sections`
  ADD PRIMARY KEY (`section_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `std_sessions`
--
ALTER TABLE `std_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `session_branch_id` (`session_branch_id`);

--
-- Indexes for table `std_subjects`
--
ALTER TABLE `std_subjects`
  ADD PRIMARY KEY (`std_subject_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `teacher_subject_assign_detail`
--
ALTER TABLE `teacher_subject_assign_detail`
  ADD PRIMARY KEY (`teacher_subject_assign_detail_id`),
  ADD KEY `teacher_subject_assign_detail_head_id` (`teacher_subject_assign_detail_head_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `teacher_subject_assign_head`
--
ALTER TABLE `teacher_subject_assign_head`
  ADD PRIMARY KEY (`teacher_subject_assign_head_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `time_table_detail`
--
ALTER TABLE `time_table_detail`
  ADD PRIMARY KEY (`time_table_d_id`),
  ADD KEY `time_table_h_id` (`time_table_h_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `time_table_head`
--
ALTER TABLE `time_table_head`
  ADD PRIMARY KEY (`time_table_h_id`),
  ADD KEY `time_table_head_ibfk_1` (`class_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_nature`
--
ALTER TABLE `account_nature`
  MODIFY `account_nature_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `account_register`
--
ALTER TABLE `account_register`
  MODIFY `account_register_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `concession`
--
ALTER TABLE `concession`
  MODIFY `concession_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `custom_sms`
--
ALTER TABLE `custom_sms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `emial_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `emp_attendance`
--
ALTER TABLE `emp_attendance`
  MODIFY `att_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `emp_departments`
--
ALTER TABLE `emp_departments`
  MODIFY `emp_department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `emp_designation`
--
ALTER TABLE `emp_designation`
  MODIFY `emp_designation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `emp_documents`
--
ALTER TABLE `emp_documents`
  MODIFY `emp_document_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `emp_info`
--
ALTER TABLE `emp_info`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `emp_leave`
--
ALTER TABLE `emp_leave`
  MODIFY `app_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `emp_reference`
--
ALTER TABLE `emp_reference`
  MODIFY `emp_ref_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `emp_type`
--
ALTER TABLE `emp_type`
  MODIFY `emp_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `exams_category`
--
ALTER TABLE `exams_category`
  MODIFY `exam_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `exams_criteria`
--
ALTER TABLE `exams_criteria`
  MODIFY `exam_criteria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exams_report`
--
ALTER TABLE `exams_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fee_month_detail`
--
ALTER TABLE `fee_month_detail`
  MODIFY `month_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `fee_transaction_detail`
--
ALTER TABLE `fee_transaction_detail`
  MODIFY `fee_trans_detail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_transaction_head`
--
ALTER TABLE `fee_transaction_head`
  MODIFY `fee_trans_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_type`
--
ALTER TABLE `fee_type`
  MODIFY `fee_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `grade_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `installment`
--
ALTER TABLE `installment`
  MODIFY `installment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `institute`
--
ALTER TABLE `institute`
  MODIFY `institute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `institute_name`
--
ALTER TABLE `institute_name`
  MODIFY `Institute_name_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `marks_details`
--
ALTER TABLE `marks_details`
  MODIFY `marks_detail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marks_head`
--
ALTER TABLE `marks_head`
  MODIFY `marks_head_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marks_weightage_details`
--
ALTER TABLE `marks_weightage_details`
  MODIFY `weightage_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `marks_weightage_head`
--
ALTER TABLE `marks_weightage_head`
  MODIFY `marks_weightage_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `marks_weightage_type`
--
ALTER TABLE `marks_weightage_type`
  MODIFY `weightage_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `msg_of_day`
--
ALTER TABLE `msg_of_day`
  MODIFY `msg_of_day_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `notice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `paraay`
--
ALTER TABLE `paraay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `phone_book`
--
ALTER TABLE `phone_book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `sms`
--
ALTER TABLE `sms`
  MODIFY `sms_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `std_academic_info`
--
ALTER TABLE `std_academic_info`
  MODIFY `academic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `std_attendance`
--
ALTER TABLE `std_attendance`
  MODIFY `std_attend_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `std_class_name`
--
ALTER TABLE `std_class_name`
  MODIFY `class_name_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `std_enrollment_detail`
--
ALTER TABLE `std_enrollment_detail`
  MODIFY `std_enroll_detail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `std_enrollment_head`
--
ALTER TABLE `std_enrollment_head`
  MODIFY `std_enroll_head_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `std_fee_details`
--
ALTER TABLE `std_fee_details`
  MODIFY `fee_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `std_fee_installments`
--
ALTER TABLE `std_fee_installments`
  MODIFY `fee_installment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `std_fee_pkg`
--
ALTER TABLE `std_fee_pkg`
  MODIFY `std_fee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `std_guardian_info`
--
ALTER TABLE `std_guardian_info`
  MODIFY `std_guardian_info_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `std_ice_info`
--
ALTER TABLE `std_ice_info`
  MODIFY `std_ice_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `std_inquiry`
--
ALTER TABLE `std_inquiry`
  MODIFY `std_inquiry_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `std_personal_info`
--
ALTER TABLE `std_personal_info`
  MODIFY `std_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `std_sections`
--
ALTER TABLE `std_sections`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `std_sessions`
--
ALTER TABLE `std_sessions`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `std_subjects`
--
ALTER TABLE `std_subjects`
  MODIFY `std_subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `teacher_subject_assign_detail`
--
ALTER TABLE `teacher_subject_assign_detail`
  MODIFY `teacher_subject_assign_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `teacher_subject_assign_head`
--
ALTER TABLE `teacher_subject_assign_head`
  MODIFY `teacher_subject_assign_head_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `time_table_detail`
--
ALTER TABLE `time_table_detail`
  MODIFY `time_table_d_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `time_table_head`
--
ALTER TABLE `time_table_head`
  MODIFY `time_table_h_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_register`
--
ALTER TABLE `account_register`
  ADD CONSTRAINT `account_register_ibfk_1` FOREIGN KEY (`account_nature_id`) REFERENCES `account_nature` (`account_nature_id`);

--
-- Constraints for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD CONSTRAINT `account_transactions_ibfk_2` FOREIGN KEY (`account_register_id`) REFERENCES `account_register` (`account_register_id`),
  ADD CONSTRAINT `account_transactions_ibfk_3` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`);

--
-- Constraints for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `branches_ibfk_1` FOREIGN KEY (`institute_id`) REFERENCES `institute` (`institute_id`);

--
-- Constraints for table `emp_attendance`
--
ALTER TABLE `emp_attendance`
  ADD CONSTRAINT `emp_attendance_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `emp_info` (`emp_id`),
  ADD CONSTRAINT `emp_attendance_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`);

--
-- Constraints for table `emp_departments`
--
ALTER TABLE `emp_departments`
  ADD CONSTRAINT `emp_departments_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `emp_info` (`emp_id`),
  ADD CONSTRAINT `emp_departments_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`department_id`);

--
-- Constraints for table `emp_documents`
--
ALTER TABLE `emp_documents`
  ADD CONSTRAINT `emp_documents_ibfk_1` FOREIGN KEY (`emp_info_id`) REFERENCES `emp_info` (`emp_id`);

--
-- Constraints for table `emp_info`
--
ALTER TABLE `emp_info`
  ADD CONSTRAINT `emp_info_ibfk_1` FOREIGN KEY (`emp_designation_id`) REFERENCES `emp_designation` (`emp_designation_id`),
  ADD CONSTRAINT `emp_info_ibfk_2` FOREIGN KEY (`emp_branch_id`) REFERENCES `branches` (`branch_id`),
  ADD CONSTRAINT `emp_info_ibfk_3` FOREIGN KEY (`emp_type_id`) REFERENCES `emp_type` (`emp_type_id`);

--
-- Constraints for table `emp_leave`
--
ALTER TABLE `emp_leave`
  ADD CONSTRAINT `emp_leave_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `emp_info` (`emp_id`),
  ADD CONSTRAINT `emp_leave_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`);

--
-- Constraints for table `emp_reference`
--
ALTER TABLE `emp_reference`
  ADD CONSTRAINT `emp_reference_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `emp_info` (`emp_id`);

--
-- Constraints for table `exams_criteria`
--
ALTER TABLE `exams_criteria`
  ADD CONSTRAINT `exams_criteria_ibfk_1` FOREIGN KEY (`exam_category_id`) REFERENCES `exams_category` (`exam_category_id`),
  ADD CONSTRAINT `exams_criteria_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `std_class_name` (`class_name_id`);

--
-- Constraints for table `exams_report`
--
ALTER TABLE `exams_report`
  ADD CONSTRAINT `exams_report_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `std_class_name` (`class_name_id`),
  ADD CONSTRAINT `exams_report_ibfk_2` FOREIGN KEY (`std_id`) REFERENCES `std_personal_info` (`std_id`),
  ADD CONSTRAINT `exams_report_ibfk_3` FOREIGN KEY (`para_id`) REFERENCES `paraay` (`id`);

--
-- Constraints for table `fee_transaction_detail`
--
ALTER TABLE `fee_transaction_detail`
  ADD CONSTRAINT `fee_transaction_detail_ibfk_2` FOREIGN KEY (`fee_type_id`) REFERENCES `fee_type` (`fee_type_id`),
  ADD CONSTRAINT `fee_transaction_detail_ibfk_3` FOREIGN KEY (`fee_trans_detail_head_id`) REFERENCES `fee_month_detail` (`month_detail_id`);

--
-- Constraints for table `fee_transaction_head`
--
ALTER TABLE `fee_transaction_head`
  ADD CONSTRAINT `fee_transaction_head_ibfk_10` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`),
  ADD CONSTRAINT `fee_transaction_head_ibfk_11` FOREIGN KEY (`class_name_id`) REFERENCES `std_class_name` (`class_name_id`),
  ADD CONSTRAINT `fee_transaction_head_ibfk_6` FOREIGN KEY (`session_id`) REFERENCES `std_sessions` (`session_id`),
  ADD CONSTRAINT `fee_transaction_head_ibfk_9` FOREIGN KEY (`section_id`) REFERENCES `std_sections` (`section_id`);

--
-- Constraints for table `marks_details`
--
ALTER TABLE `marks_details`
  ADD CONSTRAINT `marks_details_ibfk_1` FOREIGN KEY (`marks_head_id`) REFERENCES `marks_head` (`marks_head_id`),
  ADD CONSTRAINT `marks_details_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`);

--
-- Constraints for table `marks_head`
--
ALTER TABLE `marks_head`
  ADD CONSTRAINT `marks_head_ibfk_1` FOREIGN KEY (`exam_criteria_id`) REFERENCES `exams_criteria` (`exam_criteria_id`),
  ADD CONSTRAINT `marks_head_ibfk_3` FOREIGN KEY (`class_head_id`) REFERENCES `std_enrollment_head` (`std_enroll_head_id`);

--
-- Constraints for table `marks_weightage_details`
--
ALTER TABLE `marks_weightage_details`
  ADD CONSTRAINT `marks_weightage_details_ibfk_1` FOREIGN KEY (`weightage_head_id`) REFERENCES `marks_weightage_head` (`marks_weightage_id`),
  ADD CONSTRAINT `marks_weightage_details_ibfk_2` FOREIGN KEY (`weightage_type_id`) REFERENCES `marks_weightage_type` (`weightage_type_id`);

--
-- Constraints for table `marks_weightage_head`
--
ALTER TABLE `marks_weightage_head`
  ADD CONSTRAINT `marks_weightage_head_ibfk_1` FOREIGN KEY (`exam_category_id`) REFERENCES `exams_category` (`exam_category_id`),
  ADD CONSTRAINT `marks_weightage_head_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `std_class_name` (`class_name_id`),
  ADD CONSTRAINT `marks_weightage_head_ibfk_3` FOREIGN KEY (`subjects_id`) REFERENCES `subjects` (`subject_id`);

--
-- Constraints for table `std_academic_info`
--
ALTER TABLE `std_academic_info`
  ADD CONSTRAINT `std_academic_info_ibfk_3` FOREIGN KEY (`subject_combination`) REFERENCES `std_subjects` (`std_subject_id`),
  ADD CONSTRAINT `std_academic_info_ibfk_4` FOREIGN KEY (`class_name_id`) REFERENCES `std_class_name` (`class_name_id`),
  ADD CONSTRAINT `std_academic_info_ibfk_5` FOREIGN KEY (`std_id`) REFERENCES `std_personal_info` (`std_id`);

--
-- Constraints for table `std_attendance`
--
ALTER TABLE `std_attendance`
  ADD CONSTRAINT `std_attendance_ibfk_2` FOREIGN KEY (`class_name_id`) REFERENCES `std_class_name` (`class_name_id`),
  ADD CONSTRAINT `std_attendance_ibfk_3` FOREIGN KEY (`std_id`) REFERENCES `std_personal_info` (`std_id`),
  ADD CONSTRAINT `std_attendance_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `std_class_name`
--
ALTER TABLE `std_class_name`
  ADD CONSTRAINT `std_class_name_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`);

--
-- Constraints for table `std_enrollment_detail`
--
ALTER TABLE `std_enrollment_detail`
  ADD CONSTRAINT `std_enrollment_detail_ibfk_1` FOREIGN KEY (`std_enroll_detail_head_id`) REFERENCES `std_enrollment_head` (`std_enroll_head_id`);

--
-- Constraints for table `std_enrollment_head`
--
ALTER TABLE `std_enrollment_head`
  ADD CONSTRAINT `std_enrollment_head_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`),
  ADD CONSTRAINT `std_enrollment_head_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `std_sessions` (`session_id`),
  ADD CONSTRAINT `std_enrollment_head_ibfk_3` FOREIGN KEY (`section_id`) REFERENCES `std_sections` (`section_id`),
  ADD CONSTRAINT `std_enrollment_head_ibfk_4` FOREIGN KEY (`class_name_id`) REFERENCES `std_class_name` (`class_name_id`);

--
-- Constraints for table `std_fee_installments`
--
ALTER TABLE `std_fee_installments`
  ADD CONSTRAINT `std_fee_installments_ibfk_2` FOREIGN KEY (`installment_no`) REFERENCES `installment` (`installment_id`);

--
-- Constraints for table `std_fee_pkg`
--
ALTER TABLE `std_fee_pkg`
  ADD CONSTRAINT `std_fee_pkg_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `std_class_name` (`class_name_id`),
  ADD CONSTRAINT `std_fee_pkg_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `std_sessions` (`session_id`);

--
-- Constraints for table `std_inquiry`
--
ALTER TABLE `std_inquiry`
  ADD CONSTRAINT `std_inquiry_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`);

--
-- Constraints for table `std_personal_info`
--
ALTER TABLE `std_personal_info`
  ADD CONSTRAINT `std_personal_info_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`),
  ADD CONSTRAINT `std_personal_info_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `std_class_name` (`class_name_id`);

--
-- Constraints for table `std_sections`
--
ALTER TABLE `std_sections`
  ADD CONSTRAINT `std_sections_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`),
  ADD CONSTRAINT `std_sections_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `std_sessions` (`session_id`);

--
-- Constraints for table `std_sessions`
--
ALTER TABLE `std_sessions`
  ADD CONSTRAINT `std_sessions_ibfk_1` FOREIGN KEY (`session_branch_id`) REFERENCES `branches` (`branch_id`);

--
-- Constraints for table `std_subjects`
--
ALTER TABLE `std_subjects`
  ADD CONSTRAINT `std_subjects_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `std_class_name` (`class_name_id`);

--
-- Constraints for table `teacher_subject_assign_detail`
--
ALTER TABLE `teacher_subject_assign_detail`
  ADD CONSTRAINT `teacher_subject_assign_detail_ibfk_1` FOREIGN KEY (`teacher_subject_assign_detail_head_id`) REFERENCES `teacher_subject_assign_head` (`teacher_subject_assign_head_id`),
  ADD CONSTRAINT `teacher_subject_assign_detail_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `std_enrollment_head` (`std_enroll_head_id`),
  ADD CONSTRAINT `teacher_subject_assign_detail_ibfk_3` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`);

--
-- Constraints for table `teacher_subject_assign_head`
--
ALTER TABLE `teacher_subject_assign_head`
  ADD CONSTRAINT `teacher_subject_assign_head_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `emp_info` (`emp_id`);

--
-- Constraints for table `time_table_detail`
--
ALTER TABLE `time_table_detail`
  ADD CONSTRAINT `time_table_detail_ibfk_1` FOREIGN KEY (`time_table_h_id`) REFERENCES `time_table_head` (`time_table_h_id`),
  ADD CONSTRAINT `time_table_detail_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`);

--
-- Constraints for table `time_table_head`
--
ALTER TABLE `time_table_head`
  ADD CONSTRAINT `time_table_head_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `std_enrollment_head` (`std_enroll_head_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
