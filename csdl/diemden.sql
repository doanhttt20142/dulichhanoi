-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 19, 2015 at 11:05 AM
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
-- Table structure for table `diemden`
--

CREATE TABLE IF NOT EXISTS `diemden` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id của điểm đến',
  `ten` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'tên điểm đến',
  `dia_chi` varchar(1000) COLLATE utf8_unicode_ci NOT NULL COMMENT 'địa chỉ, để dạng json',
  `tom_tat` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'tóm tát ngắn gọn về các đặc điểm nổi bật của điểm đến',
  `anh_dai_dien` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ảnh đại diện cho điểm đến này',
  `album` varchar(1000) COLLATE utf8_unicode_ci NOT NULL COMMENT 'lưu danh sách các link ảnh, json',
  `mo_ta` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'mô tả về điểm đến này, json',
  `kinh_do` float NOT NULL,
  `vi_do` float NOT NULL,
  `tag` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'danh sách các id tag, json',
  `viewcount` int(11) NOT NULL DEFAULT '0',
  `ratecount` int(11) NOT NULL DEFAULT '0',
  `ratescore` int(11) NOT NULL DEFAULT '0',
  `rate` float NOT NULL,
  `tien_do` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='điểm đến' AUTO_INCREMENT=40 ;

--
-- Dumping data for table `diemden`
--

INSERT INTO `diemden` (`id`, `ten`, `dia_chi`, `tom_tat`, `anh_dai_dien`, `album`, `mo_ta`, `kinh_do`, `vi_do`, `tag`, `viewcount`, `ratecount`, `ratescore`, `rate`, `tien_do`) VALUES
(38, 'Chùa Hương', 'Hà Tây, Hà Nội', 'Chùa Hương là cách nói trong dân gian, trên thực tế chùa Hương hay Hương Sơn là cả một quần thể văn hóa - tôn giáo Việt Nam, gồm hàng chục ngôi chùa thờ Phật, vài ngôi đền thờ thần, các ngôi đình, thờ tín ngưỡng nông nghiệp.', 'chuahuong2.jpeg', '[{"src":"chuahuong.jpg"},{"src":"chuahuong1.jpeg"},{"src":"chuahuong2.jpeg"},{"src":"chuahuong3.jpg"},{"src":"chuahuong4.jpg"},{"src":"chuahuong5.jpeg"}]', '[{"type":"text","content":"Ch\\u00f9a H\\u01b0\\u01a1ng l\\u00e0 c\\u00e1ch n\\u00f3i trong d\\u00e2n gian, tr\\u00ean th\\u1ef1c t\\u1ebf ch\\u00f9a H\\u01b0\\u01a1ng hay H\\u01b0\\u01a1ng S\\u01a1n l\\u00e0 c\\u1ea3 m\\u1ed9t qu\\u1ea7n th\\u1ec3 v\\u0103n h\\u00f3a - t\\u00f4n gi\\u00e1o Vi\\u1ec7t Nam, g\\u1ed3m h\\u00e0ng ch\\u1ee5c ng\\u00f4i ch\\u00f9a th\\u1edd Ph\\u1eadt, v\\u00e0i ng\\u00f4i \\u0111\\u1ec1n th\\u1edd th\\u1ea7n, c\\u00e1c ng\\u00f4i \\u0111\\u00ecnh, th\\u1edd t\\u00edn ng\\u01b0\\u1ee1ng n\\u00f4ng nghi\\u1ec7p. Trung t\\u00e2m ch\\u00f9a H\\u01b0\\u01a1ng n\\u1eb1m \\u1edf x\\u00e3 H\\u01b0\\u01a1ng S\\u01a1n, huy\\u1ec7n M\\u1ef9 \\u0110\\u1ee9c, H\\u00e0 N\\u1ed9i, n\\u1eb1m ven b\\u1edd ph\\u1ea3i s\\u00f4ng \\u0110\\u00e1y. Trung t\\u00e2m c\\u1ee7a c\\u1ee5m \\u0111\\u1ec1n ch\\u00f9a t\\u1ea1i v\\u00f9ng n\\u00e0y ch\\u00ednh l\\u00e0 ch\\u00f9a H\\u01b0\\u01a1ng n\\u1eb1m trong \\u0111\\u1ed9ng H\\u01b0\\u01a1ng T\\u00edch hay c\\u00f2n g\\u1ecdi l\\u00e0 ch\\u00f9a Trong."},{"type":"title","content":"L\\u1ecbch s\\u1eed"},{"type":"text","content":"Ng\\u00f4i ch\\u00f9a \\u0111\\u01b0\\u1ee3c x\\u00e2y d\\u1ef1ng v\\u1edbi quy m\\u00f4 ch\\u00ednh v\\u00e0o kho\\u1ea3ng cu\\u1ed1i th\\u1ebf k\\u1ef7 17, sau \\u0111\\u00f3 b\\u1ecb hu\\u1ef7 ho\\u1ea1i trong kh\\u00e1ng chi\\u1ebfn ch\\u1ed1ng ph\\u00e1p n\\u0103m 1947, sau \\u0111\\u00f3 \\u0111\\u01b0\\u1ee3c ph\\u1ee5c d\\u1ef1ng l\\u1ea1i n\\u0103m 1988 do Th\\u01b0\\u1ee3ng To\\u1ea1 Th\\u00edch Vi\\u00ean Th\\u00e0nh d\\u01b0\\u1edbi s\\u1ef1 ch\\u1ec9 d\\u1ea1y c\\u1ee7a c\\u1ed1 Ho\\u00e0 th\\u01b0\\u1ee3ng Th\\u00edch thanh Ch\\u00e2n."},{"type":"title","content":"Ki\\u1ebfn tr\\u00fac"},{"type":"text","content":"Qu\\u1ea7n th\\u1ec3 ch\\u00f9a H\\u01b0\\u01a1ng c\\u00f3 nhi\\u1ec1u c\\u00f4ng tr\\u00ecnh ki\\u1ebfn tr\\u00fac r\\u1ea3i r\\u00e1c trong thung l\\u0169ng su\\u1ed1i Y\\u1ebfn. Khu v\\u1ef1c ch\\u00ednh l\\u00e0 ch\\u00f9a Ngo\\u00e0i, c\\u00f2n g\\u1ecdi l\\u00e0 ch\\u00f9a Tr\\u00f2, t\\u00ean ch\\u1eef l\\u00e0 ch\\u00f9a Thi\\u00ean Tr\\u00f9 (t\\u1ecda \\u0111\\u1ed9: 20\\u00b037\\u20325\\u2033B 105\\u00b044\\u203249\\u2033\\u0110). Ch\\u00f9a n\\u1eb1m kh\\u00f4ng xa b\\u1ebfn Tr\\u00f2 n\\u01a1i kh\\u00e1ch h\\u00e0nh h\\u01b0\\u01a1ng \\u0111i ng\\u01b0\\u1ee3c su\\u1ed1i Y\\u1ebfn t\\u1eeb b\\u1ebfn \\u0110\\u1ee5c v\\u00e0o ch\\u00f9a th\\u00ec xu\\u1ed1ng \\u0111\\u00f2 \\u1edf \\u0111\\u1ea5y m\\u00e0 l\\u00ean b\\u1ed9. Tam quan ch\\u00f9a \\u0111\\u01b0\\u1ee3c c\\u1ea5t tr\\u00ean ba kho\\u1ea3ng s\\u00e2n r\\u1ed9ng l\\u00e1t g\\u1ea1ch. S\\u00e2n th\\u1ee9 ba d\\u1ef1ng th\\u00e1p chu\\u00f4ng v\\u1edbi ba t\\u1ea7ng m\\u00e1i. \\u0110\\u00e2y l\\u00e0 m\\u1ed9t c\\u00f4ng tr\\u00ecnh c\\u1ed5, d\\u00e1ng d\\u1ea5p \\u0111\\u1ed9c \\u0111\\u00e1o v\\u00ec l\\u1ed9 hai \\u0111\\u1ea7u h\\u1ed3i tam gi\\u00e1c tr\\u00ean t\\u1ea7ng cao nh\\u1ea5t. Th\\u00e1p chu\\u00f4ng n\\u00e0y nguy\\u00ean th\\u1ee7y thu\\u1ed9c ch\\u00f9a l\\u00e0ng Cao M\\u1eadt, t\\u1ec9nh H\\u00e0 \\u0110\\u00f4ng, n\\u0103m 1980 \\u0111\\u01b0\\u1ee3c di chuy\\u1ec3n v\\u1ec1 ch\\u00f9a H\\u01b0\\u01a1ng l\\u00e0m th\\u00e1p chu\\u00f4ng.["},{"type":"text","content":"Ch\\u00f9a Ch\\u00ednh, t\\u1ee9c ch\\u00f9a Trong kh\\u00f4ng ph\\u1ea3i l\\u00e0 m\\u1ed9t c\\u00f4ng tr\\u00ecnh nh\\u00e2n t\\u1ea1o m\\u00e0 l\\u00e0 m\\u1ed9t \\u0111\\u1ed9ng \\u0111\\u00e1 thi\\u00ean nhi\\u00ean (t\\u1ecda \\u0111\\u1ed9: 20\\u00b036\\u203247\\u2033B 105\\u00b044\\u20324\\u2033\\u0110). \\u1ede l\\u1ed1i xu\\u1ed1ng hang c\\u00f3 c\\u1ed5ng l\\u1edbn, tr\\u00e1n c\\u1ed5ng ghi 4 ch\\u1eef H\\u01b0\\u01a1ng T\\u00edch \\u0111\\u1ed9ng m\\u00f4n. Qua c\\u1ed5ng l\\u00e0 con d\\u1ed1c d\\u00e0i, l\\u1ed1i \\u0111i x\\u00e2y th\\u00e0nh 120 b\\u1eadc l\\u00e1t \\u0111\\u00e1. V\\u00e1ch \\u0111\\u1ed9ng c\\u00f3 n\\u0103m ch\\u1eef H\\u00e1n \\u5357\\u5929\\u7b2c\\u4e00\\u5cdd (Nam thi\\u00ean \\u0111\\u1ec7 nh\\u1ea5t \\u0111\\u1ed9ng) kh\\u1eafc n\\u0103m 1770, l\\u00e0 b\\u00fat t\\u00edch c\\u1ee7a T\\u0129nh \\u0110\\u00f4 V\\u01b0\\u01a1ng Tr\\u1ecbnh S\\u00e2m (1739-1782). Ngo\\u00e0i ra \\u0111\\u1ed9ng c\\u00f2n c\\u00f3 m\\u1ed9t s\\u1ed1 bia v\\u00e0 thi v\\u0103n t\\u1ea1c tr\\u00ean v\\u00e1ch \\u0111\\u00e1."}]', 20.6183, 105.747, '["s\\u01a1n th\\u1ee7y h\\u1eefu t\\u00ecnh","ch\\u00e8 c\\u1ee7 m\\u00e0i","rau s\\u1eafng","hang \\u0111\\u1', 4, 0, 0, 0, 0),
(39, 'Test', 'Test', '', 'chuahuong.jpg', '[]', '[{"type":"text"}]', 0, 0, '[]', 0, 0, 0, 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
