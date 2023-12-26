-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2023 at 09:30 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `studycheck`
--

-- --------------------------------------------------------

--
-- Table structure for table `capacity_student`
--

CREATE TABLE `capacity_student` (
  `id` int(11) NOT NULL,
  `std_id` varchar(20) NOT NULL COMMENT 'รหัสนักศึกษา',
  `std_prefix` varchar(50) NOT NULL COMMENT 'คำนำหน้า',
  `std_name` varchar(100) NOT NULL COMMENT 'ชื่อ',
  `std_lastname` varchar(100) NOT NULL COMMENT 'สกุล',
  `pro_id` int(11) NOT NULL COMMENT 'รหัสสาขาวิชา',
  `pro_name` varchar(255) NOT NULL COMMENT 'ชื่อสาขาวิชา',
  `fac_id` int(11) NOT NULL COMMENT 'รหัสคณะ',
  `fac_name` varchar(255) NOT NULL COMMENT 'ชื่อคณะ',
  `cap_type_id` tinyint(4) NOT NULL COMMENT 'ประเภทสมรรถนะ',
  `path_certificate` longblob NOT NULL COMMENT 'ที่เก็บไฟล์',
  `approv_status` varchar(1) NOT NULL DEFAULT '0' COMMENT 'สถานะการอนุมัติ 0=รอ, 1=อนุมัติ , 2=ไม่อนุมัติ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `capacity_student`
--

INSERT INTO `capacity_student` (`id`, `std_id`, `std_prefix`, `std_name`, `std_lastname`, `pro_id`, `pro_name`, `fac_id`, `fac_name`, `cap_type_id`, `path_certificate`, `approv_status`) VALUES
(1, '164404140012', 'นาย', 'ทัศนัย', 'หนูเกตุ', 6, 'วิศวกรรมคอมพิวเตอร์', 1, '', 0, '', '0');

-- --------------------------------------------------------

--
-- Table structure for table `cappacity_type`
--

CREATE TABLE `cappacity_type` (
  `cap_type_id` int(11) NOT NULL,
  `cap_type_name` varchar(255) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `fac_id` int(11) NOT NULL COMMENT 'รหัสคณะ',
  `fac_name` varchar(255) NOT NULL COMMENT 'ชื่อคณะ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`fac_id`, `fac_name`) VALUES
(1, 'คณะวิศวกรรมศาสตร์'),
(2, 'คณะบริหารธุรกิจ'),
(3, 'คณะศิลปศาสตร์'),
(4, 'วิทยาลัยเทคโนโลยีอุตสาหกรรมและการจัดการ'),
(5, 'กองพัฒนานักศึกษา');

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE `file` (
  `id` int(11) NOT NULL,
  `topic` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `filePath` varchar(255) NOT NULL,
  `fileType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE `program` (
  `pro_id` int(11) NOT NULL,
  `pro_name` varchar(255) NOT NULL COMMENT 'ชื่อสาขาวิชา',
  `fac_id` int(11) NOT NULL COMMENT 'รหัสคณะ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `program`
--

INSERT INTO `program` (`pro_id`, `pro_name`, `fac_id`) VALUES
(1, 'การตลาด', 2),
(2, 'การจัดการ-การจัดการทั่วไป', 2),
(3, 'การท่องเที่ยว', 3),
(4, 'การโรงแรม', 3),
(5, 'วิศวกรรมไฟฟ้า', 1),
(6, 'วิศวกรรมคอมพิวเตอร์', 1);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `std_id` varchar(20) NOT NULL,
  `std_password` varchar(20) NOT NULL,
  `std_prefix` varchar(50) NOT NULL,
  `std_name` varchar(100) NOT NULL,
  `std_lastname` varchar(100) NOT NULL,
  `std_phone` varchar(15) NOT NULL,
  `std_email` varchar(100) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `pro_name` varchar(255) NOT NULL,
  `fac_id` int(11) NOT NULL,
  `fac_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`std_id`, `std_password`, `std_prefix`, `std_name`, `std_lastname`, `std_phone`, `std_email`, `pro_id`, `pro_name`, `fac_id`, `fac_name`) VALUES
('164404140012', '123456789', 'นาย ', 'ทัศนัย', 'หนูเกตุ', '0935575402', 'tatsanai.n@rmutsvmail.com', 6, 'วิศวกรรมคอมพิวเตอร์\r\n', 6, 'คณะวิศวกรรมศาสตร์'),
('660123456789', '123456789', 'นาย', 'อานนท์', 'ทดสอบ 2', '0123456789', 'test@rmutsvmail.com', 6, 'วิศวกรรมคอมพิวเตอร์', 6, 'คณะวิศวกรรมศาสตร์');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_email` varchar(100) NOT NULL COMMENT 'email ไว้ล็อกอิน',
  `user_password` varchar(20) NOT NULL COMMENT 'รหัสไว้ล็อคอิน',
  `user_name` varchar(100) NOT NULL COMMENT 'ชื่อ',
  `user_lastname` varchar(100) NOT NULL COMMENT 'สกุล',
  `user_role` varchar(1) NOT NULL COMMENT 'A=Admin , M=MasterAdmin',
  `fac_id` int(11) NOT NULL COMMENT 'รหัสคณะ',
  `status` varchar(1) NOT NULL DEFAULT '1' COMMENT 'สถานะใช้งาน หรือไม่ใช้งาน'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_email`, `user_password`, `user_name`, `user_lastname`, `user_role`, `fac_id`, `status`) VALUES
(1, 'test_fac001@rmutsv.ac.th', '1234', 'อานนท์', 'คณะ', 'M', 1, '1'),
(2, 'test_dept001@rmutsv.ac.th', '5678', 'กอง', 'ทดสอบ', 'A', 5, '1'),
(3, '404@test.com', '404404', 'test', 'bug', 'A', 1, '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `capacity_student`
--
ALTER TABLE `capacity_student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cappacity_type`
--
ALTER TABLE `cappacity_type`
  ADD PRIMARY KEY (`cap_type_id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`fac_id`);

--
-- Indexes for table `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`pro_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`std_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `capacity_student`
--
ALTER TABLE `capacity_student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cappacity_type`
--
ALTER TABLE `cappacity_type`
  MODIFY `cap_type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `fac_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสคณะ', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `program`
--
ALTER TABLE `program`
  MODIFY `pro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
