-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2015 at 06:25 AM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

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
-- Table structure for table `giaitri`
--

CREATE TABLE IF NOT EXISTS `giaitri` (
  `id` int(11) NOT NULL COMMENT 'id cua giai tri',
  `ten` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ten cua gia tri',
  `dia_chi` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'dia chi cua khu vui choi giai tri',
  `tom_tat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `anh_dai_dien` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `album` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mo_ta` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `kinh_do` float NOT NULL,
  `vi_do` float NOT NULL,
  `tag` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `viewcount` int(11) NOT NULL,
  `ratecount` int(11) NOT NULL,
  `ratescore` int(11) NOT NULL,
  `rate` float NOT NULL,
  `tien_do` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `giaitri`
--

INSERT INTO `giaitri` (`id`, `ten`, `dia_chi`, `tom_tat`, `anh_dai_dien`, `album`, `mo_ta`, `kinh_do`, `vi_do`, `tag`, `viewcount`, `ratecount`, `ratescore`, `rate`, `tien_do`) VALUES
(1, 'Ecopark', 'Văn Lâm, Hưng Yên', '', 'ecopark4.jpg', '[]', '[{"type":"text"}]', 0, 0, '[]', 5, 0, 0, 0, 0),
(2, 'Ecopark 2', 'Văn Lâm, Hưng Yên', 'Khu đô thị xanh tươi', 'ecopark6.jpg', '[]', '[{"type":"text"}]', 0, 0, '[]', 3, 0, 0, 0, 0),
(3, 'Ecopark 2', 'Văn Lâm, Hưng Yên', 'Khu đô thị xanh tươi', 'ecopark6.jpg', '[{"src":"ecopark1.jpg"},{"src":"ecopark2.jpg"},{"src":"ecopark3.jpg"},{"src":"ecopark4.jpg"},{"src":"ecopark5.jpg"},{"src":"ecopark6.jpg"}]', '[{"type":"text"}]', 0, 0, '[]', 11, 0, 0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `giaitri`
--
ALTER TABLE `giaitri`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `giaitri`
--
ALTER TABLE `giaitri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id cua giai tri',AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
