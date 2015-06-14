-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2015 at 03:45 AM
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
-- Table structure for table `khachsan`
--

CREATE TABLE IF NOT EXISTS `khachsan` (
  `id` int(11) NOT NULL COMMENT 'ID của khách sạn',
  `ten` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL COMMENT 'tên của khách sạn',
  `dia_chi` varchar(1000) COLLATE utf8_vietnamese_ci NOT NULL COMMENT 'địa chỉ của khách sạn',
  `tom_tat` text COLLATE utf8_vietnamese_ci COMMENT 'tóm tắt ngắn gọn về khách sạn',
  `anh_dai_dien` varchar(100) COLLATE utf8_vietnamese_ci DEFAULT NULL COMMENT 'Ảnh đại diện',
  `album` varchar(1000) COLLATE utf8_vietnamese_ci DEFAULT NULL COMMENT 'album của khách sạn',
  `so_sao` int(11) NOT NULL COMMENT 'Số sao của khách sạn',
  `bonus` varchar(100) COLLATE utf8_vietnamese_ci DEFAULT NULL COMMENT 'các dịch vụ của khách sạn',
  `gia_re_nhat` int(11) DEFAULT NULL COMMENT 'giá phòng rẻ nhất của khách sạn',
  `gia_dat_nhat` int(11) DEFAULT NULL COMMENT 'giá phòng đắt nhất của khách sạn',
  `mo_ta` text COLLATE utf8_vietnamese_ci COMMENT 'mô tả về khách sạn',
  `kinh_do` float DEFAULT NULL COMMENT 'Kinh độ',
  `Vĩ độ` float DEFAULT NULL COMMENT 'Vĩ độ',
  `tag` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL COMMENT 'Danh sách các tag',
  `viewcount` int(11) NOT NULL COMMENT 'Số lượt view',
  `ratecount` int(11) NOT NULL COMMENT 'số người dùng đánh giá',
  `ratescore` float NOT NULL COMMENT 'điểm trung bình đánh giá',
  `rate` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `khachsan`
--

INSERT INTO `khachsan` (`id`, `ten`, `dia_chi`, `tom_tat`, `anh_dai_dien`, `album`, `so_sao`, `bonus`, `gia_re_nhat`, `gia_dat_nhat`, `mo_ta`, `kinh_do`, `Vĩ độ`, `tag`, `viewcount`, `ratecount`, `ratescore`, `rate`) VALUES
(2, 'Khách sạn Deawoo', '360 Kim Mã, Ba Đình,Hà Nội', 'Khách sạn Daewoo là một khách sạn 5 sao nổi tiếng ở Hà Nội, được khánh thành năm 1996', 'deawoo1.jpg', '[{"src":"deawoo1.jpg"},{"src":"deawoo2.jpg"},{"src":"deawoo3.jpg"},{"src":"deawoo4.jpg"},{"src":"deawoo5.jpg"},{"src":"deawoo6.jpg"}]', 0, NULL, NULL, NULL, '[{"type":"text","content":"\\u1ecda l\\u1ea1c t\\u1ea1i n\\u1eb1m \\u1edf s\\u1ed1 360 Kim M\\u00e3, Ba \\u0110\\u00ecnh, \\u0111\\u01b0\\u1ee3c xem l\\u00e0 kh\\u00e1ch s\\u1ea1n c\\u00f3 s\\u1ed1 l\\u01b0\\u1ee3ng ph\\u00f2ng l\\u1edbn nh\\u1ea5t trong th\\u00e0nh ph\\u1ed1 H\\u00e0 N\\u1ed9i, kh\\u00e1ch s\\u1ea1n \\u0111\\u01b0\\u1ee3c trang tr\\u00ed theo phong c\\u00e1ch ngh\\u1ec7 thu\\u1eadt \\u0111\\u01b0\\u01a1ng \\u0111\\u1ea1i Vi\\u1ec7t Nam. Kh\\u00e1ch s\\u1ea1n t\\u1eebng \\u0111\\u01b0\\u1ee3c nhi\\u1ec1u ch\\u00ednh kh\\u00e1ch cao c\\u1ea5p qu\\u1ed1c t\\u1ebf nh\\u01b0 T\\u1ed5ng th\\u1ed1ng M\\u1ef9 Bill Clinton, T\\u1ed5ng th\\u1ed1ng Nga Vladimir Putin, Ch\\u1ee7 t\\u1ecbch Trung Qu\\u1ed1c H\\u1ed3 C\\u1ea9m \\u0110\\u00e0o, T\\u1ed5ng th\\u1ed1ng Brasil Luiz Inacio Lula da Silva... ch\\u1ecdn ngh\\u1ec9 t\\u1ea1i \\u0111\\u00e2y khi sang Vi\\u1ec7t Nam. \\u0110\\u00e2y c\\u0169ng l\\u00e0 kh\\u00e1ch s\\u1ea1n ch\\u00ednh th\\u1ee9c c\\u1ee7a h\\u1ed9i ngh\\u1ecb APEC 2006, Cu\\u1ed9c thi Hoa h\\u1eadu Ho\\u00e0n v\\u0169 2008."}]', NULL, NULL, '["5 sao","deawoo","kh\\u00e1ch s\\u1ea1n cao c\\u1ea5p"]', 5, 0, 0, 0),
(3, 'Khách sạn Deawoo', '360 Kim Mã, Ba Đình,Hà Nội', 'Khách sạn Daewoo là một khách sạn 5 sao nổi tiếng ở Hà Nội, được khánh thành năm 1996', 'deawoo1.jpg', '[{"src":"deawoo1.jpg"},{"src":"deawoo2.jpg"},{"src":"deawoo3.jpg"},{"src":"deawoo4.jpg"},{"src":"deawoo5.jpg"},{"src":"deawoo6.jpg"}]', 0, NULL, NULL, NULL, '[{"type":"text","content":"\\u1ecda l\\u1ea1c t\\u1ea1i n\\u1eb1m \\u1edf s\\u1ed1 360 Kim M\\u00e3, Ba \\u0110\\u00ecnh, \\u0111\\u01b0\\u1ee3c xem l\\u00e0 kh\\u00e1ch s\\u1ea1n c\\u00f3 s\\u1ed1 l\\u01b0\\u1ee3ng ph\\u00f2ng l\\u1edbn nh\\u1ea5t trong th\\u00e0nh ph\\u1ed1 H\\u00e0 N\\u1ed9i, kh\\u00e1ch s\\u1ea1n \\u0111\\u01b0\\u1ee3c trang tr\\u00ed theo phong c\\u00e1ch ngh\\u1ec7 thu\\u1eadt \\u0111\\u01b0\\u01a1ng \\u0111\\u1ea1i Vi\\u1ec7t Nam. Kh\\u00e1ch s\\u1ea1n t\\u1eebng \\u0111\\u01b0\\u1ee3c nhi\\u1ec1u ch\\u00ednh kh\\u00e1ch cao c\\u1ea5p qu\\u1ed1c t\\u1ebf nh\\u01b0 T\\u1ed5ng th\\u1ed1ng M\\u1ef9 Bill Clinton, T\\u1ed5ng th\\u1ed1ng Nga Vladimir Putin, Ch\\u1ee7 t\\u1ecbch Trung Qu\\u1ed1c H\\u1ed3 C\\u1ea9m \\u0110\\u00e0o, T\\u1ed5ng th\\u1ed1ng Brasil Luiz Inacio Lula da Silva... ch\\u1ecdn ngh\\u1ec9 t\\u1ea1i \\u0111\\u00e2y khi sang Vi\\u1ec7t Nam. \\u0110\\u00e2y c\\u0169ng l\\u00e0 kh\\u00e1ch s\\u1ea1n ch\\u00ednh th\\u1ee9c c\\u1ee7a h\\u1ed9i ngh\\u1ecb APEC 2006, Cu\\u1ed9c thi Hoa h\\u1eadu Ho\\u00e0n v\\u0169 2008."}]', NULL, NULL, '["5 sao","deawoo","kh\\u00e1ch s\\u1ea1n cao c\\u1ea5p"]', 2, 0, 0, 0),
(4, 'Khách sạn Deawoo', '360 Kim Mã, Ba Đình,Hà Nội', 'Khách sạn Daewoo là một khách sạn 5 sao nổi tiếng ở Hà Nội, được khánh thành năm 1996', 'deawoo1.jpg', '[{"src":"deawoo1.jpg"},{"src":"deawoo2.jpg"},{"src":"deawoo3.jpg"},{"src":"deawoo4.jpg"},{"src":"deawoo5.jpg"},{"src":"deawoo6.jpg"}]', 0, NULL, NULL, NULL, '[{"type":"text","content":"\\u1ecda l\\u1ea1c t\\u1ea1i n\\u1eb1m \\u1edf s\\u1ed1 360 Kim M\\u00e3, Ba \\u0110\\u00ecnh, \\u0111\\u01b0\\u1ee3c xem l\\u00e0 kh\\u00e1ch s\\u1ea1n c\\u00f3 s\\u1ed1 l\\u01b0\\u1ee3ng ph\\u00f2ng l\\u1edbn nh\\u1ea5t trong th\\u00e0nh ph\\u1ed1 H\\u00e0 N\\u1ed9i, kh\\u00e1ch s\\u1ea1n \\u0111\\u01b0\\u1ee3c trang tr\\u00ed theo phong c\\u00e1ch ngh\\u1ec7 thu\\u1eadt \\u0111\\u01b0\\u01a1ng \\u0111\\u1ea1i Vi\\u1ec7t Nam. Kh\\u00e1ch s\\u1ea1n t\\u1eebng \\u0111\\u01b0\\u1ee3c nhi\\u1ec1u ch\\u00ednh kh\\u00e1ch cao c\\u1ea5p qu\\u1ed1c t\\u1ebf nh\\u01b0 T\\u1ed5ng th\\u1ed1ng M\\u1ef9 Bill Clinton, T\\u1ed5ng th\\u1ed1ng Nga Vladimir Putin, Ch\\u1ee7 t\\u1ecbch Trung Qu\\u1ed1c H\\u1ed3 C\\u1ea9m \\u0110\\u00e0o, T\\u1ed5ng th\\u1ed1ng Brasil Luiz Inacio Lula da Silva... ch\\u1ecdn ngh\\u1ec9 t\\u1ea1i \\u0111\\u00e2y khi sang Vi\\u1ec7t Nam. \\u0110\\u00e2y c\\u0169ng l\\u00e0 kh\\u00e1ch s\\u1ea1n ch\\u00ednh th\\u1ee9c c\\u1ee7a h\\u1ed9i ngh\\u1ecb APEC 2006, Cu\\u1ed9c thi Hoa h\\u1eadu Ho\\u00e0n v\\u0169 2008."}]', NULL, NULL, '["5 sao","deawoo","kh\\u00e1ch s\\u1ea1n cao c\\u1ea5p"]', 1, 0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `khachsan`
--
ALTER TABLE `khachsan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `khachsan`
--
ALTER TABLE `khachsan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID của khách sạn',AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
