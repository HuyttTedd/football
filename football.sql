-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th2 14, 2023 lúc 06:01 PM
-- Phiên bản máy phục vụ: 10.4.19-MariaDB
-- Phiên bản PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `football`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `club_entity`
--

CREATE TABLE `club_entity` (
  `entity_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `club_entity`
--

INSERT INTO `club_entity` (`entity_id`, `name`) VALUES
(2, 'teASfa');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `eav_entity_type`
--

CREATE TABLE `eav_entity_type` (
  `entity_type_id` smallint(6) NOT NULL,
  `entity_type_code` varchar(50) DEFAULT NULL,
  `entity_table` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `eav_entity_type`
--

INSERT INTO `eav_entity_type` (`entity_type_id`, `entity_type_code`, `entity_table`) VALUES
(1, 'league', 'league_entity'),
(2, 'club', 'club_entity');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `league_club`
--

CREATE TABLE `league_club` (
  `league_id` int(11) NOT NULL,
  `club_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `league_entity`
--

CREATE TABLE `league_entity` (
  `entity_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `league_entity`
--

INSERT INTO `league_entity` (`entity_id`, `name`) VALUES
(173, 'Ả Rập Xê Út King Cup'),
(168, 'AFF Suzuki Cup'),
(49, 'ALG D1'),
(56, 'Anh Isthmian League Premier Division'),
(14, 'ARM D1'),
(129, 'Bangladesh Premier League'),
(6, 'BEL U21'),
(15, 'BHR D'),
(48, 'BHR D1'),
(132, 'Bỉ National Division 1'),
(188, 'Brazil Campeonato Carioca'),
(81, 'Các Tiểu vương quốc Ả Rập Thống nhất Arabian Gulf Cup'),
(20, 'CHA CSL'),
(34, 'CHA D1'),
(54, 'Champions League Nữ'),
(41, 'COL D1'),
(76, 'Cộng hòa Séc Tipsport liga'),
(149, 'Copa por Mexico'),
(163, 'Cúp Algeria Ligue'),
(172, 'Cúp Bỉ'),
(57, 'Cúp FA'),
(164, 'Cúp FA Trung Quốc'),
(130, 'Cup Hong Kong  Elite'),
(150, 'Cúp Hy Lạp'),
(134, 'Cúp Israel'),
(171, 'Cúp Liên Đoàn Anh'),
(170, 'Cúp nhà vua Tây Ban Nha'),
(82, 'Cúp Quốc gia Azerbaijan'),
(80, 'Cúp Quốc gia Costa Rica'),
(136, 'Cúp Quốc gia UAE'),
(63, 'Cúp Romania'),
(64, 'Cúp Serie C'),
(169, 'Cúp Thổ Nhĩ Kỳ'),
(12, 'CYP D1'),
(32, 'EGY D1'),
(142, 'Empress’s Cup Nữ Nhật Bản'),
(4, 'ENG CN'),
(23, 'ENG Conf'),
(24, 'ENG CS'),
(45, 'ENG CWCUP'),
(43, 'ENG FAC'),
(26, 'ENG RYM'),
(17, 'ENG U21D2'),
(7, 'ENG U21LC'),
(27, 'ENG-S CE'),
(25, 'ENG-S PR'),
(162, 'England FA Vase'),
(133, 'England FA Women Super League'),
(114, 'England League 1'),
(144, 'England Southern League Central Division'),
(99, 'England U21 League Cup'),
(90, 'Eredivisie Nữ Hà Lan'),
(60, 'FA Cup Nữ'),
(100, 'FIFA World Cup'),
(13, 'FRA D3'),
(36, 'FRA U19'),
(103, 'French Championnat Amateur'),
(166, 'Ghana Premier League'),
(95, 'Giải Hạng hai Anh'),
(61, 'Giao hữu'),
(83, 'Giao hữu quốc tế'),
(16, 'GRE D2'),
(109, 'Hạng 2 Algeria Ligue'),
(96, 'Hạng 2 Bỉ'),
(190, 'Hạng 2 Bồ Đào Nha'),
(137, 'Hạng 2 Hà Lan'),
(74, 'Hạng 2 Hy Lạp'),
(108, 'Hạng 2 Síp'),
(53, 'Hạng 2 Tây Ban Nha'),
(75, 'Hạng 2 Tunisia'),
(59, 'Hạng 2 Ý'),
(98, 'Hạng 3 Pháp'),
(119, 'Hạng 3 Ý'),
(78, 'Hạng Ba Thổ Nhĩ Kỳ'),
(187, 'Hạng hai Pháp'),
(105, 'Hạng Hai Thổ Nhĩ Kỳ'),
(155, 'Hạng Nhất Ả Rập Xê Út'),
(72, 'Hạng Nhất Ấn Độ'),
(115, 'Hạng Nhất Anh'),
(146, 'Hạng Nhất Bahrain'),
(154, 'Hạng Nhất Kuwait'),
(86, 'Hạng Nhất Thái Lan'),
(79, 'Hạng Nhất Trung Quốc'),
(158, 'Hạng Nhất UAE'),
(124, 'Hạng Tư Thổ Nhĩ Kỳ'),
(128, 'Hồng Kông FA Cup'),
(178, 'Hồng Kông Senior Shield'),
(135, 'Hungary Merkantil Bank Liga'),
(19, 'IDN ISL'),
(22, 'IND D1'),
(9, 'INT CF'),
(47, 'ISR D2'),
(46, 'ISR LATTC'),
(65, 'Israel Leumit League'),
(156, 'Israel State League'),
(62, 'Israel Toto Cup'),
(152, 'Israel Women 1st National'),
(5, 'ITA C1'),
(44, 'ITA D2'),
(35, 'ITA PRO LC'),
(1, 'JAM D1'),
(175, 'Jamaica Premier League'),
(92, 'JWL'),
(91, 'Kuwait Crown Prince Cup'),
(148, 'League Trophy - Anh'),
(52, 'Liên đoàn Bồ Đào Nha'),
(38, 'MNE D1'),
(112, 'National League Anh'),
(58, 'National League North Anh'),
(116, 'National League South Anh'),
(151, 'Ngoại hạng Scotland'),
(88, 'Nicaragua Liga Primera'),
(157, 'NIFL Championship Bắc Ireland'),
(28, 'NIR LC'),
(37, 'OMA PL'),
(177, 'Omani Federation Cup'),
(126, 'POR L3'),
(21, 'Por U23'),
(2, 'PORLC'),
(117, 'Primavera 2'),
(125, 'Primera Division Nữ Tây Ban Nha'),
(10, 'ROM D1'),
(31, 'ROMC'),
(89, 'Scotland Challenge Cup'),
(161, 'Scotland Championship'),
(160, 'Scotland League 1'),
(113, 'Scotland League 2'),
(30, 'SLO D1'),
(55, 'Southern League South Division Anh'),
(3, 'SPA D2'),
(111, 'Spanish Segunda Division B'),
(29, 'SPDRFEF'),
(97, 'Super League Nữ Bỉ'),
(11, 'TFF 1. Lig'),
(39, 'TIP CUP'),
(33, 'TTLd'),
(40, 'TUR D3'),
(73, 'U19 Pháp'),
(143, 'U23 Liga Revelacao Bồ Đào Nha'),
(18, 'UAE'),
(42, 'UEFA WUC'),
(189, 'VĐQG  Ba Lan'),
(159, 'VĐQG  Israel'),
(153, 'VĐQG Ả Rập Xê Út'),
(66, 'VĐQG Ai Cập'),
(139, 'VĐQG Albania'),
(70, 'VĐQG Algerian Ligue'),
(110, 'VĐQG Ấn Độ'),
(183, 'VĐQG Argentina'),
(84, 'VĐQG Armenia'),
(147, 'VĐQG Azerbaijan'),
(94, 'VĐQG Bắc Ireland'),
(140, 'VĐQG Bắc Macedonia'),
(68, 'VĐQG Bahrain'),
(182, 'VĐQG Bồ Đào Nha'),
(180, 'VĐQG Bolivia'),
(179, 'VĐQG Chilê'),
(51, 'VĐQG Colombia'),
(141, 'VĐQG Georgia'),
(50, 'VĐQG Guatemala'),
(131, 'VĐQG Honduras'),
(174, 'VĐQG Hy Lạp'),
(77, 'VĐQG Indonesia'),
(167, 'VĐQG Iran'),
(145, 'VĐQG Kuwait'),
(123, 'VĐQG Malta'),
(71, 'VĐQG Montenegro'),
(69, 'VĐQG Oman'),
(184, 'VĐQG Peru'),
(107, 'VĐQG Pháp Nữ'),
(104, 'VĐQG Romania'),
(106, 'VĐQG Síp'),
(67, 'VĐQG Slovenia'),
(185, 'VĐQG Tây Ban Nha'),
(176, 'VĐQG Thổ Nhĩ Kỳ'),
(85, 'VĐQG Trung Quốc'),
(122, 'VĐQG Tunisia'),
(165, 'VĐQG UAE'),
(87, 'VĐQG Úc'),
(181, 'VĐQG Uruguay'),
(120, 'VĐQG Wales'),
(186, 'VĐQG Ý'),
(118, 'VĐQG Ý Nữ'),
(93, 'W-League Úc'),
(8, 'World Cup'),
(138, 'Đức 2. Bundesliga Nữ'),
(101, 'Đức Bundesliga Nữ'),
(127, 'Đức DFB Junioren Pokal'),
(121, 'Đức Junioren Bundesliga South'),
(102, 'Đức Regionalliga Sudwest');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `less_position_but_higher_odd_match`
--

CREATE TABLE `less_position_but_higher_odd_match` (
  `entity_id` int(11) NOT NULL,
  `league_name` varchar(200) DEFAULT NULL,
  `datetime` varchar(200) NOT NULL,
  `home_name` varchar(200) NOT NULL,
  `away_name` varchar(200) NOT NULL,
  `result` int(11) NOT NULL COMMENT '3 is draw, 2 is not set, 1 is win, 0 is lose, 4 is not found',
  `position_range` int(11) NOT NULL,
  `odd` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `less_position_but_higher_odd_match`
--

INSERT INTO `less_position_but_higher_odd_match` (`entity_id`, `league_name`, `datetime`, `home_name`, `away_name`, `result`, `position_range`, `odd`) VALUES
(1, 'VĐQG Indonesia', '2023-02-11 10:00:00', 'Pstni', 'Madura United', 2, 11, '0.25'),
(2, 'VĐQG Thái Lan', '2023-02-11 12:00:00', 'Nong Bua Lamphu', 'Nakhon Ratchasima', 2, 2, '0.75'),
(3, 'Hạng 2 Ý', '2023-02-11 13:00:00', 'Venezia F.C.', 'Spal', 2, 1, '0.5'),
(4, 'Hạng hai Pháp', '2023-02-11 14:00:00', 'Saint-Etienne', 'Dijon', 2, 1, '0.5'),
(5, 'VĐQG Séc', '2023-02-11 14:00:00', 'Zlin', 'Teplice', 2, 3, '0.25'),
(6, 'Hạng Nhất Anh', '2023-02-11 15:00:00', 'Wigan Athletic', 'Huddersfield Town', 2, 2, '0.25'),
(7, 'Hạng Nhất Anh', '2023-02-11 15:00:00', 'Blackpool', 'Rotherham United', 2, 3, '0.25'),
(8, 'Hạng Nhất Anh', '2023-02-11 15:00:00', 'Stoke City', 'Hull City', 2, 7, '0.5'),
(9, 'Hạng Nhất Anh', '2023-02-11 15:00:00', 'Coventry', 'Luton Town', 2, 14, '0.25'),
(10, 'VĐQG Áo', '2023-02-11 15:59:00', 'Wolfsberger AC', 'WSG Wattens', 2, 4, '0.5'),
(11, 'VĐQG Tây Ban Nha', '2023-02-11 17:30:00', 'Sevilla', 'Mallorca', 2, 7, '0.5'),
(12, 'VĐQG Đức', '2023-02-11 17:30:00', 'RB Leipzig', 'Union Berlin', 2, 2, '0.75'),
(13, 'Hạng 2 Tây Ban Nha', '2023-02-11 17:30:00', 'CD Mirandes', 'Villarreal B', 2, 4, '0.25'),
(14, 'Hạng hai Pháp', '2023-02-11 18:00:00', 'Stade Lavallois MFC', 'Annecy', 2, 3, '0.25'),
(15, 'Hạng hai Pháp', '2023-02-11 18:00:00', 'Guingamp', 'Valenciennes US', 2, 3, '0.5'),
(16, 'Hạng hai Pháp', '2023-02-11 18:00:00', 'Rodez Aveyron', 'Nimes', 2, 3, '0.25'),
(17, 'VĐQG Hà Lan', '2023-02-11 20:00:00', 'Emmen', 'Fortuna Sittard', 2, 5, '0.25'),
(18, 'VĐQG Argentina', '2023-02-11 20:00:00', 'San Lorenzo', 'Godoy Cruz', 2, 13, '0.25'),
(19, 'VĐQG Argentina', '2023-02-11 20:00:00', 'Defensa Y Justicia', 'Newells Old Boys', 2, 7, '0.25'),
(20, 'Hạng hai Pháp', '2023-02-11 18:00:00', 'Paris FC', 'Amiens SC', 2, 5, '0.25'),
(21, 'VĐQG Indonesia', '2023-02-11', 'Pstni', 'Madura United', 2, 11, '0.25'),
(22, 'VĐQG Thái Lan', '2023-02-11', 'Nong Bua Lamphu', 'Nakhon Ratchasima', 2, 2, '0.75'),
(23, 'Hạng 2 Ý', '2023-02-11', 'Venezia F.C.', 'Spal', 2, 1, '0.5'),
(24, 'Hạng hai Pháp', '2023-02-11', 'Saint-Etienne', 'Dijon', 2, 1, '0.5'),
(25, 'VĐQG Séc', '2023-02-11', 'Zlin', 'Teplice', 2, 3, '0.25'),
(26, 'Hạng Nhất Anh', '2023-02-11', 'Wigan Athletic', 'Huddersfield Town', 2, 2, '0.25'),
(27, 'Hạng Nhất Anh', '2023-02-11', 'Blackpool', 'Rotherham United', 2, 3, '0.25'),
(28, 'Hạng Nhất Anh', '2023-02-11', 'Stoke City', 'Hull City', 2, 7, '0.5'),
(29, 'Hạng Nhất Anh', '2023-02-11', 'Coventry', 'Luton Town', 2, 14, '0.25'),
(30, 'VĐQG Áo', '2023-02-11', 'Wolfsberger AC', 'WSG Wattens', 2, 4, '0.5'),
(31, 'VĐQG Tây Ban Nha', '2023-02-11', 'Sevilla', 'Mallorca', 2, 7, '0.5'),
(32, 'VĐQG Đức', '2023-02-11', 'RB Leipzig', 'Union Berlin', 2, 2, '0.75'),
(33, 'Hạng 2 Tây Ban Nha', '2023-02-11', 'CD Mirandes', 'Villarreal B', 2, 4, '0.25'),
(34, 'Hạng hai Pháp', '2023-02-11', 'Stade Lavallois MFC', 'Annecy', 2, 3, '0.25'),
(35, 'Hạng hai Pháp', '2023-02-11', 'Guingamp', 'Valenciennes US', 2, 3, '0.5'),
(36, 'Hạng hai Pháp', '2023-02-11', 'Rodez Aveyron', 'Nimes', 2, 3, '0.25'),
(37, 'VĐQG Hà Lan', '2023-02-11', 'Emmen', 'Fortuna Sittard', 2, 5, '0.25'),
(38, 'VĐQG Argentina', '2023-02-11', 'San Lorenzo', 'Godoy Cruz', 2, 13, '0.25'),
(39, 'VĐQG Argentina', '2023-02-11', 'Defensa Y Justicia', 'Newells Old Boys', 2, 7, '0.25'),
(40, 'VĐQG Úc', '2023-02-12', 'Newcastle Jets FC', 'Melbourne Victory FC', 2, 4, '-0.75'),
(41, 'Hạng hai Pháp', '2023-02-11', 'Paris FC', 'Amiens SC', 2, 5, '0.25'),
(82, 'VĐQG Úc', '2023-02-12 04:00:00', 'Newcastle Jets FC', 'Melbourne Victory FC', 2, 4, '-0.75');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `match_result_entity`
--

CREATE TABLE `match_result_entity` (
  `entity_id` int(11) NOT NULL,
  `league_id` int(11) NOT NULL,
  `datetime` varchar(200) NOT NULL,
  `home_club_id` int(11) DEFAULT NULL,
  `away_club_id` int(11) DEFAULT NULL,
  `home_name` varchar(200) NOT NULL,
  `away_name` varchar(200) NOT NULL,
  `home_result` int(11) DEFAULT NULL,
  `away_result` int(11) DEFAULT NULL,
  `home_position` int(11) NOT NULL,
  `away_position` int(11) NOT NULL,
  `home_corner` varchar(200) DEFAULT NULL,
  `away_corner` varchar(200) DEFAULT NULL,
  `total_corner` varchar(200) DEFAULT NULL,
  `odd` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `new_match_today`
--

CREATE TABLE `new_match_today` (
  `entity_id` int(11) NOT NULL,
  `league_name` varchar(200) DEFAULT NULL,
  `datetime` varchar(200) NOT NULL,
  `result` int(11) NOT NULL COMMENT '3 is draw, 2 is not set, 1 is win, 0 is lose, 4 is not found',
  `home_name` varchar(200) NOT NULL,
  `away_name` varchar(200) NOT NULL,
  `home_position` smallint(6) NOT NULL,
  `away_position` smallint(6) NOT NULL,
  `odd` varchar(50) NOT NULL,
  `odd_converted` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `new_match_today`
--

INSERT INTO `new_match_today` (`entity_id`, `league_name`, `datetime`, `result`, `home_name`, `away_name`, `home_position`, `away_position`, `odd`, `odd_converted`) VALUES
(1, 'VĐQG Úc', '2023-02-11 08:45:00', 2, 'Western Sydney Wanderers', 'Sydney FC', 3, 6, '0', '0'),
(2, 'VĐQG Indonesia', '2023-02-11 10:00:00', 2, 'Pstni', 'Madura United', 15, 4, '0/0.5', '0.25'),
(3, 'VĐQG Thái Lan', '2023-02-11 11:00:00', 2, 'Prachuap Khiri Khan', 'Chonburi Shark FC', 12, 3, '0/-0.5', '-0.75'),
(4, 'VĐQG Úc', '2023-02-11 11:30:00', 2, 'Perth Glory FC', 'Melbourne City', 7, 1, '-0.5/1', '-0.75'),
(5, 'VĐQG Thái Lan', '2023-02-11 11:30:00', 2, 'Khonkaen United', 'Singhtarua FC', 11, 6, '-0.5', '-0.5'),
(6, 'Hạng hai Đức', '2023-02-11 12:00:00', 2, 'Hannover 96', 'SC Paderborn 07', 7, 5, '0/-0.5', '-0.75'),
(7, 'Hạng hai Đức', '2023-02-11 12:00:00', 2, 'Holstein Kiel', 'FC Magdeburg', 8, 18, '0.5/1', '0.75'),
(8, 'Hạng hai Đức', '2023-02-11 12:00:00', 2, 'Nurnberg', 'SSV Jahn Regensburg', 16, 17, '0.5', '0.5'),
(9, 'VĐQG Thái Lan', '2023-02-11 12:00:00', 2, 'Nong Bua Lamphu', 'Nakhon Ratchasima', 15, 13, '0.5/1', '0.75'),
(10, 'Ngoại Hạng Anh', '2023-02-11 12:30:00', 2, 'West Ham United', 'Chelsea FC', 17, 9, '0/-0.5', '-0.75'),
(11, 'VĐQG Thái Lan', '2023-02-11 12:30:00', 2, 'Lamphun Warrior', 'Bangkok Glass', 14, 7, '-0.5', '-0.5'),
(12, 'Hạng 2 Ý', '2023-02-11 13:00:00', 2, 'Alto Adige/Sudtirol', 'Como', 4, 15, '0', '0'),
(13, 'Hạng 2 Ý', '2023-02-11 13:00:00', 2, 'Venezia F.C.', 'Spal', 18, 17, '0.5', '0.5'),
(14, 'Hạng 2 Ý', '2023-02-11 13:00:00', 2, 'Frosinone', 'Cittadella', 1, 12, '0.5/1', '0.75'),
(15, 'Hạng 2 Ý', '2023-02-11 13:00:00', 2, 'Reggina', 'Pisa', 3, 10, '0/0.5', '0.25'),
(16, 'Hạng 2 Ý', '2023-02-11 13:00:00', 2, 'Cagliari', 'Benevento', 9, 19, '0.5', '0.5'),
(17, 'Hạng 2 Ý', '2023-02-11 13:00:00', 2, 'Brescia', 'Modena', 16, 11, '0', '0'),
(18, 'VĐQG Ý', '2023-02-11 14:00:00', 2, 'Empoli', 'Spezia', 12, 17, '0.5', '0.5'),
(19, 'Hạng hai Pháp', '2023-02-11 14:00:00', 2, 'Saint-Etienne', 'Dijon', 18, 17, '0.5', '0.5'),
(20, 'VĐQG  Ba Lan', '2023-02-11 14:00:00', 2, 'Slask Wroclaw', 'Korona Kielce', 11, 17, '0.5', '0.5'),
(21, 'VĐQG Séc', '2023-02-11 14:00:00', 2, 'Slovan Liberec', 'Synot Slovacko', 8, 7, '0', '0'),
(22, 'VĐQG Séc', '2023-02-11 14:00:00', 2, 'Banik Ostrava', 'FK Baumit Jablonec', 9, 14, '0.5/1', '0.75'),
(23, 'VĐQG Séc', '2023-02-11 14:00:00', 2, 'Zlin', 'Teplice', 15, 12, '0/0.5', '0.25'),
(24, 'VĐQG Đức', '2023-02-11 14:30:00', 2, 'Hoffenheim', 'Bayer Leverkusen', 14, 10, '0/-0.5', '-0.75'),
(25, 'VĐQG Đức', '2023-02-11 14:30:00', 2, 'Werder Bremen', 'Borussia Dortmund', 8, 3, '-0.5/1', '-0.75'),
(26, 'VĐQG Đức', '2023-02-11 14:30:00', 2, 'SC Freiburg', 'VfB Stuttgart', 6, 16, '0.5', '0.5'),
(27, 'VĐQG Đức', '2023-02-11 14:30:00', 2, 'Mainz', 'Augsburg', 12, 13, '0.5/1', '0.75'),
(28, 'VĐQG Đức', '2023-02-11 14:30:00', 2, 'Bayern Munich', 'Bochum', 1, 15, '2.5', '2.5'),
(29, 'Ngoại Hạng Anh', '2023-02-11 15:00:00', 2, 'Leicester City', 'Tottenham Hotspur', 14, 5, '0/-0.5', '-0.75'),
(30, 'Ngoại Hạng Anh', '2023-02-11 15:00:00', 2, 'Arsenal', 'Brentford', 1, 7, '1/1.5', '1.25'),
(31, 'Ngoại Hạng Anh', '2023-02-11 15:00:00', 2, 'Fulham', 'Nottingham Forest', 8, 13, '0.5', '0.5'),
(32, 'Ngoại Hạng Anh', '2023-02-11 15:00:00', 2, 'Southampton', 'Wolves', 20, 15, '0', '0'),
(33, 'Ngoại Hạng Anh', '2023-02-11 15:00:00', 2, 'Crystal Palace', 'Brighton Hove Albion', 12, 6, '-0.5', '-0.5'),
(34, 'Hạng Nhất Anh', '2023-02-11 15:00:00', 2, 'Cardiff City', 'Middlesbrough', 21, 3, '0/-0.5', '-0.75'),
(35, 'Hạng Nhất Anh', '2023-02-11 15:00:00', 2, 'Wigan Athletic', 'Huddersfield Town', 24, 22, '0/0.5', '0.25'),
(36, 'Hạng Nhất Anh', '2023-02-11 15:00:00', 2, 'Watford', 'Blackburn Rovers', 5, 7, '0.5', '0.5'),
(37, 'Hạng Nhất Anh', '2023-02-11 15:00:00', 2, 'Burnley', 'Preston North End', 1, 11, '1', '1'),
(38, 'Hạng Nhất Anh', '2023-02-11 15:00:00', 2, 'Sheffield United', 'Swansea City', 2, 13, '0.5', '0.5'),
(39, 'Hạng Nhất Anh', '2023-02-11 15:00:00', 2, 'Queens Park Rangers', 'Millwall', 14, 8, '0', '0'),
(40, 'Hạng Nhất Anh', '2023-02-11 15:00:00', 2, 'Blackpool', 'Rotherham United', 23, 20, '0/0.5', '0.25'),
(41, 'Hạng Nhất Anh', '2023-02-11 15:00:00', 2, 'Sunderland', 'Reading', 9, 16, '0.5', '0.5'),
(42, 'Hạng Nhất Anh', '2023-02-11 15:00:00', 2, 'Stoke City', 'Hull City', 19, 12, '0.5', '0.5'),
(43, 'Hạng Nhất Anh', '2023-02-11 15:00:00', 2, 'Coventry', 'Luton Town', 18, 4, '0/0.5', '0.25'),
(44, 'Hạng Nhất Anh', '2023-02-11 15:00:00', 2, 'Bristol City', 'Norwich City', 17, 10, '0/-0.5', '-0.75'),
(45, 'VĐQG Bỉ', '2023-02-11 15:00:00', 2, 'Westerlo', 'Gent', 7, 5, '0', '0'),
(46, 'VĐQG Ai Cập', '2023-02-11 15:00:00', 2, 'Pharco', 'NBE SC', 11, 16, '0', '0'),
(47, 'VĐQG Tây Ban Nha', '2023-02-11 15:15:00', 2, 'Almeria', 'Real Betis', 14, 7, '0', '0'),
(48, 'Hạng 2 Ý', '2023-02-11 15:15:00', 2, 'Ternana', 'Parma', 8, 7, '0', '0'),
(49, 'Hạng 2 Ý', '2023-02-11 15:15:00', 2, 'Ascoli', 'Perugia', 13, 14, '0', '0'),
(50, 'Hạng 2 Tây Ban Nha', '2023-02-11 15:15:00', 2, 'Zaragoza', 'Alaves', 14, 5, '0', '0'),
(51, 'FIFA Club World Cup', '2023-02-11 15:30:00', 2, 'Al Ahly', 'Flamengo', 1, 1, '-1', '-1'),
(52, 'VĐQG Pháp', '2023-02-11 15:59:00', 2, 'AS Monaco', 'Paris Saint Germain', 4, 1, '0', '0'),
(53, 'VĐQG Áo', '2023-02-11 15:59:00', 2, 'Red Bull Salzburg', 'Lustenau Áo', 1, 8, '2/2.5', '2.25'),
(54, 'VĐQG Áo', '2023-02-11 15:59:00', 2, 'Wolfsberger AC', 'WSG Wattens', 9, 5, '0.5', '0.5'),
(55, 'VĐQG  Ba Lan', '2023-02-11 16:30:00', 2, 'Wisla Plock', 'Lech Poznan', 8, 3, '-0.5', '-0.5'),
(56, 'VĐQG Ý', '2023-02-11 17:00:00', 2, 'Lecce', 'AS Roma', 14, 4, '-0.5', '-0.5'),
(57, 'VĐQG Thụy Sĩ', '2023-02-11 17:00:00', 2, 'Servette', 'Grasshoppers', 4, 6, '0.5/1', '0.75'),
(58, 'VĐQG Séc', '2023-02-11 17:00:00', 2, 'Slavia Praha', 'Brno', 1, 11, '2/2.5', '2.25'),
(59, 'VĐQG Ai Cập', '2023-02-11 17:00:00', 2, 'Talaea EI-Gaish', 'El Dakhleya', 13, 18, '0.5', '0.5'),
(60, 'VĐQG Bỉ', '2023-02-11 17:15:00', 2, 'Sporting Charleroi', 'Seraing United', 12, 17, '1', '1'),
(61, 'Ngoại Hạng Anh', '2023-02-11 17:30:00', 2, 'AFC Bournemouth', 'Newcastle United', 19, 4, '-1', '-1'),
(62, 'VĐQG Tây Ban Nha', '2023-02-11 17:30:00', 2, 'Sevilla', 'Mallorca', 17, 10, '0.5', '0.5'),
(63, 'VĐQG Đức', '2023-02-11 17:30:00', 2, 'RB Leipzig', 'Union Berlin', 4, 2, '0.5/1', '0.75'),
(64, 'Hạng 2 Tây Ban Nha', '2023-02-11 17:30:00', 2, 'Levante', 'Andorra CF', 3, 15, '0.5/1', '0.75'),
(65, 'Hạng 2 Tây Ban Nha', '2023-02-11 17:30:00', 2, 'CD Mirandes', 'Villarreal B', 17, 13, '0/0.5', '0.25'),
(66, 'VĐQG Hà Lan', '2023-02-11 17:45:00', 2, 'N.E.C. Nijmegen', 'SC Cambuur', 10, 18, '0.5/1', '0.75'),
(67, 'Hạng hai Pháp', '2023-02-11 18:00:00', 2, 'Chamois Niortais', 'Bordeaux', 20, 3, '-0.5', '-0.5'),
(68, 'Hạng hai Pháp', '2023-02-11 18:00:00', 2, 'Sochaux', 'Le Havre', 2, 1, '0', '0'),
(69, 'Hạng hai Pháp', '2023-02-11 18:00:00', 2, 'Stade Lavallois MFC', 'Annecy', 14, 11, '0/0.5', '0.25'),
(70, 'Hạng hai Pháp', '2023-02-11 18:00:00', 2, 'Bastia', 'Quevilly Rouen', 6, 9, '0/0.5', '0.25'),
(71, 'Hạng hai Pháp', '2023-02-11 18:00:00', 2, 'Guingamp', 'Valenciennes US', 13, 10, '0.5', '0.5'),
(72, 'Hạng hai Pháp', '2023-02-11 18:00:00', 2, 'Grenoble', 'Pau FC', 5, 15, '0/0.5', '0.25'),
(73, 'Hạng hai Pháp', '2023-02-11 18:00:00', 2, 'Rodez Aveyron', 'Nimes', 19, 16, '0/0.5', '0.25'),
(74, 'VĐQG Bồ Đào Nha', '2023-02-11 18:00:00', 2, 'FC Arouca', 'Santa Clara', 7, 16, '0/0.5', '0.25'),
(75, 'VĐQG Hy Lạp', '2023-02-11 18:00:00', 2, 'Pas Giannina', 'Ionikos', 11, 12, '0.5', '0.5'),
(76, 'VĐQG Hà Lan', '2023-02-11 19:00:00', 2, 'PSV Eindhoven', 'FC Groningen', 4, 17, '2', '2'),
(77, 'FIFA Club World Cup', '2023-02-11 19:00:00', 2, 'Real Madrid', 'Al Hilal', 2, 4, '1.5/2', '1.75'),
(78, 'VĐQG  Ba Lan', '2023-02-11 19:00:00', 2, 'Jagiellonia Bialystok', 'Pogon Szczecin', 14, 5, '0/-0.5', '-0.75'),
(79, 'Hạng hai Đức', '2023-02-11 19:30:00', 2, 'Heidenheimer', 'Hamburger', 3, 2, '0/-0.5', '-0.75'),
(80, 'VĐQG Thụy Sĩ', '2023-02-11 19:30:00', 2, 'Basel', 'Sion', 7, 8, '0.5/1', '0.75'),
(81, 'VĐQG Ý', '2023-02-11 19:45:00', 2, 'Lazio', 'Atalanta', 5, 6, '0/0.5', '0.25'),
(82, 'VĐQG Tây Ban Nha', '2023-02-11 20:00:00', 2, 'Valencia', 'Athletic Bilbao', 18, 8, '0/-0.5', '-0.75'),
(83, 'VĐQG Pháp', '2023-02-11 20:00:00', 2, 'Clermont Foot', 'Marseille', 11, 2, '-0.5/1', '-0.75'),
(84, 'Hạng 2 Tây Ban Nha', '2023-02-11 20:00:00', 2, 'Las Palmas', 'CD Lugo', 1, 21, '1/1.5', '1.25'),
(85, 'VĐQG Hà Lan', '2023-02-11 20:00:00', 2, 'Emmen', 'Fortuna Sittard', 16, 11, '0/0.5', '0.25'),
(86, 'VĐQG Argentina', '2023-02-11 20:00:00', 2, 'San Lorenzo', 'Godoy Cruz', 17, 4, '0/0.5', '0.25'),
(87, 'VĐQG Argentina', '2023-02-11 20:00:00', 2, 'Defensa Y Justicia', 'Newells Old Boys', 16, 9, '0/0.5', '0.25'),
(88, 'VĐQG Bồ Đào Nha', '2023-02-11 20:30:00', 2, 'Vitoria Guimaraes', 'Portimonense', 5, 11, '0.5', '0.5'),
(89, 'VĐQG Argentina', '2023-02-11 22:15:00', 2, 'CA Platense', 'Atletico Tucuman', 7, 26, '0', '0'),
(90, 'VĐQG Argentina', '2023-02-12 00:30:00', 2, 'Talleres Cordoba', 'Boca Juniors', 15, 10, '0', '0'),
(91, 'VĐQG Argentina', '2023-02-12 00:30:00', 2, 'Velez Sarsfield', 'Independiente', 14, 18, '0.5', '0.5'),
(92, 'VĐQG Úc', '2023-02-12 04:00:00', 2, 'Newcastle Jets FC', 'Melbourne Victory FC', 8, 12, '0/-0.5', '-0.75'),
(93, 'VĐQG Thổ Nhĩ Kỳ', '2023-02-11 10:30:00', 2, 'Karagumruk', 'Sivasspor', 9, 12, '0/0.5', '0.25'),
(94, 'VĐQG Thổ Nhĩ Kỳ', '2023-02-11 13:00:00', 2, 'Alanyaspor', 'Istanbul Buyuksehir Belediyesi', 11, 3, '0', '0'),
(95, 'VĐQG Thổ Nhĩ Kỳ', '2023-02-11 15:59:00', 2, 'Trabzonspor', 'Umraniyespor', 6, 19, '1/1.5', '1.25'),
(96, 'Hạng hai Pháp', '2023-02-11 18:00:00', 2, 'Paris FC', 'Amiens SC', 12, 7, '0/0.5', '0.25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `random_list`
--

CREATE TABLE `random_list` (
  `entity_id` int(11) NOT NULL,
  `match_count` int(11) NOT NULL,
  `odd` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `random_list_item`
--

CREATE TABLE `random_list_item` (
  `entity_id` int(11) NOT NULL,
  `list_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `club_entity`
--
ALTER TABLE `club_entity`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `eav_entity_type`
--
ALTER TABLE `eav_entity_type`
  ADD PRIMARY KEY (`entity_type_id`);

--
-- Chỉ mục cho bảng `league_club`
--
ALTER TABLE `league_club`
  ADD PRIMARY KEY (`league_id`,`club_id`),
  ADD KEY `club_id` (`club_id`);

--
-- Chỉ mục cho bảng `league_entity`
--
ALTER TABLE `league_entity`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `name_2` (`name`),
  ADD KEY `name` (`name`);

--
-- Chỉ mục cho bảng `less_position_but_higher_odd_match`
--
ALTER TABLE `less_position_but_higher_odd_match`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `datetime` (`datetime`,`home_name`,`away_name`);

--
-- Chỉ mục cho bảng `match_result_entity`
--
ALTER TABLE `match_result_entity`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `datetime` (`datetime`,`home_name`,`away_name`),
  ADD KEY `home_club_id` (`home_club_id`),
  ADD KEY `away_club_id` (`away_club_id`),
  ADD KEY `league_id` (`league_id`);

--
-- Chỉ mục cho bảng `new_match_today`
--
ALTER TABLE `new_match_today`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `datetime` (`datetime`,`home_name`,`away_name`);

--
-- Chỉ mục cho bảng `random_list`
--
ALTER TABLE `random_list`
  ADD PRIMARY KEY (`entity_id`);

--
-- Chỉ mục cho bảng `random_list_item`
--
ALTER TABLE `random_list_item`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `list_id` (`list_id`,`match_id`),
  ADD KEY `match_id` (`match_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `club_entity`
--
ALTER TABLE `club_entity`
  MODIFY `entity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `eav_entity_type`
--
ALTER TABLE `eav_entity_type`
  MODIFY `entity_type_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `league_entity`
--
ALTER TABLE `league_entity`
  MODIFY `entity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT cho bảng `less_position_but_higher_odd_match`
--
ALTER TABLE `less_position_but_higher_odd_match`
  MODIFY `entity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT cho bảng `match_result_entity`
--
ALTER TABLE `match_result_entity`
  MODIFY `entity_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `new_match_today`
--
ALTER TABLE `new_match_today`
  MODIFY `entity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT cho bảng `random_list`
--
ALTER TABLE `random_list`
  MODIFY `entity_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `random_list_item`
--
ALTER TABLE `random_list_item`
  MODIFY `entity_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `league_club`
--
ALTER TABLE `league_club`
  ADD CONSTRAINT `league_club_ibfk_1` FOREIGN KEY (`league_id`) REFERENCES `league_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `league_club_ibfk_2` FOREIGN KEY (`club_id`) REFERENCES `club_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `match_result_entity`
--
ALTER TABLE `match_result_entity`
  ADD CONSTRAINT `match_result_entity_ibfk_1` FOREIGN KEY (`home_club_id`) REFERENCES `club_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `match_result_entity_ibfk_2` FOREIGN KEY (`home_club_id`) REFERENCES `club_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `match_result_entity_ibfk_3` FOREIGN KEY (`away_club_id`) REFERENCES `club_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `match_result_entity_ibfk_4` FOREIGN KEY (`league_id`) REFERENCES `league_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `random_list_item`
--
ALTER TABLE `random_list_item`
  ADD CONSTRAINT `random_list_item_ibfk_1` FOREIGN KEY (`list_id`) REFERENCES `random_list` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `random_list_item_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `new_match_today` (`entity_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
