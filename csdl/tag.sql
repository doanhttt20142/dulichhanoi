-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 18, 2015 at 10:44 PM
-- Server version: 5.5.41-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dulichhanoi`
--

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `hint` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nhahang` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `khachsan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `monan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `diemden` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `giaitri` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tour` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`),
  KEY `name_2` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`name`, `hint`, `nhahang`, `khachsan`, `monan`, `diemden`, `giaitri`, `tour`) VALUES
('chè củ mài', 'chè củ mài', '', '', '', '[38]', '', ''),
('chùa chiền', 'chùa chiền', '', '', '', '[38]', '', ''),
('du lịch tâm linh', 'du lịch tâm linh', '', '', '', '[38]', '', ''),
('hang động', 'hang động', '', '', '', '[38]', '', ''),
('rau sắng', 'rau sắng', '', '', '', '[38]', '', ''),
('sơn thủy hữu tình', 'sơn thủy hữu tình', '', '', '', '[38]', '', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
