-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 07, 2022 lúc 05:42 PM
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
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `league_entity`
--

INSERT INTO `league_entity` (`entity_id`, `name`) VALUES
(14, 'ARM D1'),
(6, 'BEL U21'),
(15, 'BHR D'),
(20, 'CHA CSL'),
(34, 'CHA D1'),
(12, 'CYP D1'),
(32, 'EGY D1'),
(4, 'ENG CN'),
(23, 'ENG Conf'),
(24, 'ENG CS'),
(26, 'ENG RYM'),
(17, 'ENG U21D2'),
(7, 'ENG U21LC'),
(27, 'ENG-S CE'),
(25, 'ENG-S PR'),
(13, 'FRA D3'),
(36, 'FRA U19'),
(16, 'GRE D2'),
(19, 'IDN ISL'),
(22, 'IND D1'),
(9, 'INT CF'),
(5, 'ITA C1'),
(35, 'ITA PRO LC'),
(1, 'JAM D1'),
(38, 'MNE D1'),
(28, 'NIR LC'),
(37, 'OMA PL'),
(21, 'Por U23'),
(2, 'PORLC'),
(10, 'ROM D1'),
(31, 'ROMC'),
(30, 'SLO D1'),
(3, 'SPA D2'),
(29, 'SPDRFEF'),
(11, 'TFF 1. Lig'),
(39, 'TIP CUP'),
(33, 'TTLd'),
(40, 'TUR D3'),
(18, 'UAE'),
(8, 'World Cup');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `less_position_but_higher_odd_match`
--

CREATE TABLE `less_position_but_higher_odd_match` (
  `entity_id` int(11) NOT NULL,
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

INSERT INTO `less_position_but_higher_odd_match` (`entity_id`, `datetime`, `home_name`, `away_name`, `result`, `position_range`, `odd`) VALUES
(75, '2022-12-06 18:00:00', 'UD Logrones', 'Real Sociedad B', 0, 12, '0.25'),
(76, '2022-12-06 19:45:00', 'Cheshunt', 'Dover Athletic', 1, 10, '0.75'),
(77, '2022-12-06 19:45:00', 'Hemel Hempstead Town', 'Bath City', 1, 3, '0.25'),
(78, '2022-12-06 19:45:00', 'Slough Town', 'Concord Rangers', 0, 1, '0.5'),
(79, '2022-12-06 19:45:00', 'Tonbridge Angels', 'Eastbourne Borough', 1, 1, '0.75'),
(80, '2022-12-06 19:45:00', 'Hereford', 'Chorley', 0, 7, '0.75'),
(81, '2022-12-06 19:45:00', 'Kettering Town', 'Gloucester City', 0, 10, '0.75'),
(82, '2022-12-06 19:45:00', 'Leamington', 'Brackley Town', 0, 13, '0.75'),
(83, '2022-12-06 19:45:00', 'Spennymoor Town', 'Boston United', 1, 4, '0.25'),
(84, '2022-12-06 19:45:00', 'Glentoran FC', 'Linfield FC', 0, 2, '0.25'),
(85, '2022-12-06 19:45:00', 'Coalville Town', 'Nuneaton Town', 0, 3, '0.5'),
(86, '2022-12-07 11:00:00', 'Duzcespor', 'Corum Belediyespor', 1, 2, '0.75'),
(87, '2022-12-07 12:00:00', 'Hertha BSC Berlin', 'Eintr. Braunschweig', 2, 1, '1.25'),
(88, '2022-12-07 12:35:00', 'Ittihad Kalba', 'Al-Thaid', 1, 1, '1.5'),
(89, '2022-12-07 12:40:00', 'CLB Oman', 'Sohar Club', 1, 4, '0.75'),
(90, '2022-12-07 13:00:00', 'Bochum', 'FC Zwolle', 0, 15, '1.5'),
(91, '2022-12-07 13:30:00', 'Viterbese', 'Vicenza', 0, 18, '0.75'),
(92, '2022-12-07 13:30:00', 'Foggia', 'Catanzaro', 1, 8, '0.25'),
(93, '2022-12-07 13:30:00', 'Paris Saint Germain(U19)', 'U19 Valenciennes US', 0, 2, '1.5'),
(94, '2022-12-07 15:00:00', 'JS Kabylie', 'RC Arba', 2, 6, '0.75'),
(95, '2022-12-07 16:30:00', 'Domzale', 'NK Publikum Celje', 2, 4, '0.75'),
(96, '2022-12-07 17:00:00', 'Inter Milan', 'Red Bull Salzburg', 2, 4, '0.75'),
(97, '2022-12-07 17:00:00', 'Celta Vigo', 'Boavista (FC)', 2, 11, '1'),
(98, '2022-12-07 17:00:00', 'Fiorentina', 'Always Ready', 2, 8, '2.75'),
(99, '2022-12-07 17:00:00', 'Sektzia Nes Tziona', 'Hapoel Haifa', 2, 1, '0.75'),
(100, '2022-12-07 18:00:00', 'Universitaea Cluj', 'FC Rapid Bucuresti', 2, 11, '0.75'),
(101, '2022-12-07 18:00:00', 'Padova', 'JuventusU23', 2, 3, '0.25'),
(102, '2022-12-07 18:15:00', 'Maccabi Netanya', 'Hapoel Hadera', 2, 3, '0.5'),
(103, '2022-12-07 19:00:00', 'Sevilla', 'AS Monaco', 2, 12, '0.25'),
(104, '2022-12-07 19:30:00', 'Kidderminster', 'Chester FC', 2, 7, '0.5'),
(105, '2022-12-07 19:45:00', 'Bognor Regis Town', 'Cray Wanderers', 2, 6, '0.25'),
(106, '2022-12-07 20:00:00', 'Tenerife', 'Alaves', 2, 13, '0.25'),
(107, '2022-12-07 20:00:00', 'Algeciras', 'Linense', 2, 2, '0.25'),
(108, '2022-12-07 20:00:00', 'Talavera de la Reina', 'Celta Vigo B', 2, 6, '0.75'),
(109, '2022-12-07 20:00:00', 'Nữ Arsenal', 'Nữ Juventus', 2, 1, '1.25'),
(110, '2022-12-08 01:00:00', 'Club Comunicaciones', 'Coban Imperial', 2, 1, '1'),
(111, '2022-12-07 15:59:00', 'FK Mornar', 'Decic Tuzi', 2, 6, '0.75'),
(112, '2022-12-07 15:59:00', 'Crystal Palace', 'Trabzonspor', 2, 4, '0.75'),
(117, '2022-12-07 17:30:00', 'Maccabi Ahi Nazareth', 'Hapoel Kfar Saba', 2, 6, '0.25'),
(118, '2022-12-07 17:30:00', 'Hapoel Ramat Gan FC', 'Hapoel Umm Al Fahm', 2, 6, '0.75'),
(121, '2022-12-07 18:00:00', 'TuS Blau-Weiss Lohne', 'VfL Osnabruck', 2, 2, '-1.25'),
(123, '2022-12-07 19:00:00', 'Cadiz', 'Manchester United', 2, 14, '0.75'),
(130, '2022-12-08 00:00:00', 'Deportivo Pereira', 'Dep.Independiente Medellin', 2, 2, '0.25'),
(132, '2022-12-08 08:30:00', 'Aizawl FC', 'Neroca FC', 2, 1, '0.75');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `match_entity`
--

CREATE TABLE `match_entity` (
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
  `home_corner` int(11) DEFAULT NULL,
  `away_corner` int(11) DEFAULT NULL,
  `total_corner` int(11) DEFAULT NULL,
  `odd` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `match_entity`
--

INSERT INTO `match_entity` (`entity_id`, `league_id`, `datetime`, `home_club_id`, `away_club_id`, `home_name`, `away_name`, `home_result`, `away_result`, `home_position`, `away_position`, `home_corner`, `away_corner`, `total_corner`, `odd`) VALUES
(1, 19, '2022-12-07 08:15:00', NULL, NULL, 'Dewa United FC', 'Arema Malang', 0, 2, 15, 12, 4, 4, 8, '-0.5'),
(2, 34, '2022-12-07 06:00:00', NULL, NULL, 'Beikong Bắc Kinh', 'Jiangxi Liansheng', 0, 1, 6, 4, 5, 0, 5, '0.75'),
(3, 34, '2022-12-07 06:00:00', NULL, NULL, 'Guangxi Baoyun FC', 'Thanh Đảo Jonoon', 2, 2, 4, 1, 2, 3, 5, '-0.5'),
(4, 34, '2022-12-07 06:00:00', NULL, NULL, 'Xinjiang Tianshan Leopard', 'Tech Bắc Kinh', 0, 3, 5, 6, 4, 8, 12, '0'),
(5, 34, '2022-12-07 06:00:00', NULL, NULL, 'Heilongjiang Lava Spring', 'Shanxi Chang An Athletic FC', 2, 1, 2, 3, 9, 3, 12, '0.75'),
(6, 34, '2022-12-07 06:00:00', NULL, NULL, 'Hebei Gongfu', 'Nanjing City', 1, 3, 1, 4, 2, 3, 5, '-0.75'),
(7, 2, '2022-12-06 20:45:00', NULL, NULL, 'GD Estoril-Praia', 'SC Uniao Torreense', 2, 2, 12, 15, 5, 1, 6, '0.5'),
(8, 3, '2022-12-06 20:00:00', NULL, NULL, 'Albacete', 'Zaragoza', 0, 0, 10, 15, 7, 4, 11, '0.25'),
(9, 23, '2022-12-06 19:45:00', NULL, NULL, 'Boreham Wood', 'Oldham Athletic AFC', 2, 1, 12, 23, 6, 5, 11, '0.5'),
(10, 4, '2022-12-06 19:45:00', NULL, NULL, 'Curzon Ashton FC', 'Darlington', 0, 2, 18, 3, 2, 3, 5, '0'),
(11, 4, '2022-12-06 19:45:00', NULL, NULL, 'Farsley Celtic', 'Kings Lynn', 2, 0, 23, 2, 2, 8, 10, '-0.75'),
(12, 4, '2022-12-06 19:45:00', NULL, NULL, 'Hereford', 'Chorley', 1, 1, 17, 10, 10, 2, 12, '0.75'),
(13, 4, '2022-12-06 19:45:00', NULL, NULL, 'Kettering Town', 'Gloucester City', 0, 1, 21, 11, 3, 2, 5, '0.75'),
(14, 4, '2022-12-06 19:45:00', NULL, NULL, 'Leamington', 'Brackley Town', 0, 0, 14, 1, 1, 6, 7, '0.75'),
(15, 4, '2022-12-06 19:45:00', NULL, NULL, 'Scarborough', 'Peterborough Sports', 2, 1, 6, 7, 5, 4, 9, '0'),
(16, 4, '2022-12-06 19:45:00', NULL, NULL, 'Spennymoor Town', 'Boston United', 3, 2, 19, 15, 8, 3, 11, '0.25'),
(17, 24, '2022-12-06 19:45:00', NULL, NULL, 'Braintree Town', 'Oxford City', 0, 0, 6, 8, 3, 2, 5, '0.75'),
(18, 24, '2022-12-06 19:45:00', NULL, NULL, 'Cheshunt', 'Dover Athletic', 2, 0, 22, 12, 4, 6, 10, '0.75'),
(19, 24, '2022-12-06 19:45:00', NULL, NULL, 'Dulwich Hamlet', 'Chelmsford City', 2, 1, 20, 4, 0, 9, 9, '0'),
(20, 24, '2022-12-06 19:45:00', NULL, NULL, 'Hemel Hempstead Town', 'Bath City', 1, 0, 14, 11, 5, 6, 11, '0.25'),
(21, 24, '2022-12-06 19:45:00', NULL, NULL, 'Slough Town', 'Concord Rangers', 0, 0, 19, 18, 5, 3, 8, '0.5'),
(22, 24, '2022-12-06 19:45:00', NULL, NULL, 'Tonbridge Angels', 'Eastbourne Borough', 3, 0, 10, 9, 3, 4, 7, '0.75'),
(23, 24, '2022-12-06 19:45:00', NULL, NULL, 'Welling United', 'Farnborough Town', 1, 2, 13, 15, 3, 6, 9, '0'),
(24, 24, '2022-12-06 19:45:00', NULL, NULL, 'Worthing', 'Ebbsfleet United', 0, 6, 5, 1, 3, 6, 9, '-0.75'),
(25, 25, '2022-12-06 19:45:00', NULL, NULL, 'Yate Town', 'Chesham United', 0, 3, 16, 3, 5, 7, 12, '-0.5'),
(26, 25, '2022-12-06 19:45:00', NULL, NULL, 'Bracknell Town', 'Plymouth Parkway', 0, 0, 6, 19, 3, 3, 6, '0.75'),
(27, 26, '2022-12-06 19:45:00', NULL, NULL, 'Corinthian Casuals', 'Bishop Stortford', 0, 1, 20, 3, 2, 8, 10, '-1.25'),
(28, 26, '2022-12-06 19:45:00', NULL, NULL, 'AFC Hornchurch', 'Folkestone Invicta', 2, 1, 1, 16, 5, 2, 7, '1.5'),
(29, 27, '2022-12-06 19:45:00', NULL, NULL, 'Basford Utd', 'Kings Langley', 0, 1, 13, 20, 9, 5, 14, '0.5'),
(30, 27, '2022-12-06 19:45:00', NULL, NULL, 'Coalville Town', 'Nuneaton Town', 0, 2, 6, 3, 5, 6, 11, '0.5'),
(31, 27, '2022-12-06 19:45:00', NULL, NULL, 'Needham Market', 'Hednesford Town', 1, 0, 16, 22, 2, 5, 7, '0.5'),
(32, 27, '2022-12-06 19:45:00', NULL, NULL, 'Rushall Olympic', 'Leiston FC', 0, 2, 4, 2, 3, 5, 8, '0'),
(33, 28, '2022-12-06 19:45:00', NULL, NULL, 'Glentoran FC', 'Linfield FC', 0, 3, 5, 3, 2, 5, 7, '0.25'),
(34, 28, '2022-12-06 19:45:00', NULL, NULL, 'Cliftonville', 'Coleraine', 1, 1, 4, 6, 3, 5, 8, '0.25'),
(35, 23, '2022-12-06 19:45:00', NULL, NULL, 'Halifax Town', 'Dorking Wanderers', 3, 1, 14, 16, 5, 3, 8, '0.5'),
(36, 29, '2022-12-06 19:00:00', NULL, NULL, 'CF La Nucia', 'CF Intercity', 0, 0, 12, 18, 6, 2, 8, '0'),
(37, 29, '2022-12-06 19:00:00', NULL, NULL, 'CD Badajoz', 'Deportivo La Coruna', 1, 0, 16, 5, 8, 3, 11, '-0.5'),
(38, 8, '2022-12-06 19:00:00', NULL, NULL, 'Bồ Đào Nha', 'Thụy Sĩ', 6, 1, 9, 15, 6, 6, 12, '0.5'),
(39, 9, '2022-12-06 19:00:00', NULL, NULL, 'Cambridge United', 'West Ham United', 2, 4, 20, 16, 3, 8, 11, '-1.75'),
(40, 3, '2022-12-06 18:00:00', NULL, NULL, 'Leganes', 'CD Mirandes', 2, 2, 9, 17, 2, 2, 4, '0.5'),
(41, 3, '2022-12-06 18:00:00', NULL, NULL, 'Real Oviedo', 'Las Palmas', 0, 0, 14, 1, 3, 4, 7, '0'),
(42, 29, '2022-12-06 18:00:00', NULL, NULL, 'UD Logrones', 'Real Sociedad B', 1, 1, 15, 3, 5, 4, 9, '0.25'),
(43, 30, '2022-12-06 17:00:00', NULL, NULL, 'NK Maribor', 'Radomlje', 7, 0, 5, 8, 7, 4, 11, '1'),
(44, 31, '2022-12-06 17:00:00', NULL, NULL, 'Sepsi OSK Sfantul Gheorghe', 'FC Voluntari', 4, 0, 7, 9, 3, 2, 5, '0.75'),
(45, 31, '2022-12-06 17:00:00', NULL, NULL, 'Petrolul Ploiesti', 'Universitatea Craiova', 0, 1, 6, 13, 6, 5, 11, '0.75'),
(46, 31, '2022-12-06 17:00:00', NULL, NULL, 'FC Unirea 2004 Slobozia', 'Dinamo Bucuresti', 3, 3, 4, 8, 9, 4, 13, '0.75'),
(47, 9, '2022-12-06 17:00:00', NULL, NULL, 'Galatasaray', 'Villarreal', 3, 4, 2, 9, 7, 3, 10, '0.75'),
(48, 21, '2022-12-06 15:00:00', NULL, NULL, 'Vizela U23', 'Famalicao U23', 2, 2, 1, 2, 6, 3, 9, '0.25'),
(49, 21, '2022-12-06 15:00:00', NULL, NULL, 'Gil Vicente U23', 'Braga U23', 2, 0, 5, 3, 4, 5, 9, '0.75'),
(50, 8, '2022-12-06 15:00:00', NULL, NULL, 'Ma Rốc', 'Tây Ban Nha', 0, 0, 22, 7, 0, 4, 4, '-1'),
(51, 15, '2022-12-06 15:00:00', NULL, NULL, 'Al-Ittihad (BHR)', 'Um Alhassam', 0, 0, 7, 4, 7, 2, 9, '0'),
(52, 15, '2022-12-06 15:00:00', NULL, NULL, 'Qalali', 'Isa Town', 0, 1, 6, 5, 1, 6, 7, '0'),
(53, 22, '2022-12-06 13:30:00', NULL, NULL, 'Churchill Brothers', 'Mohammedan SC', 2, 1, 11, 6, 6, 5, 11, '0.75'),
(54, 9, '2022-12-06 13:15:00', NULL, NULL, 'SV Ried', 'First Vienna FC', 6, 1, 11, 6, 6, 2, 8, '1'),
(55, 30, '2022-12-06 13:00:00', NULL, NULL, 'Gorica', 'NK Bravo', 0, 0, 9, 7, 5, 5, 10, '0.75'),
(56, 21, '2022-12-06 13:00:00', NULL, NULL, 'CD Mafra U23', 'Benfica U23', 0, 1, 7, 1, 4, 7, 11, '-1.75'),
(57, 9, '2022-12-06 13:00:00', NULL, NULL, 'Panaitolikos Agrinio', 'Anderlecht', 1, 2, 7, 11, 2, 5, 7, '-0.75'),
(58, 18, '2022-12-06 12:50:00', NULL, NULL, 'Al-Dhafra', 'Baynounah SC', 3, 0, 13, 16, 7, 4, 11, '2.25'),
(59, 32, '2022-12-06 12:45:00', NULL, NULL, 'EL Masry', 'NBE SC', 0, 0, 10, 9, 2, 3, 5, '0.5'),
(60, 18, '2022-12-06 12:40:00', NULL, NULL, 'Al Taawon', 'Al-Hamriyah', 1, 2, 9, 6, 6, 1, 7, '0.75'),
(61, 18, '2022-12-06 12:40:00', NULL, NULL, 'Fursan Hispania FC', 'Gulf Heroes FC', 0, 2, 17, 11, 6, 3, 9, '-0.75'),
(62, 33, '2022-12-06 12:30:00', NULL, NULL, 'A.S. Marsa', 'AS Mhamdia', 4, 1, 10, 6, 1, 4, 5, '0.75'),
(63, 33, '2022-12-06 12:30:00', NULL, NULL, 'CS Korba', 'CS Bembla', 0, 0, 2, 11, 7, 5, 12, '0.75'),
(64, 33, '2022-12-06 12:30:00', NULL, NULL, 'ES Rades', 'J.S. Kairouanaise', 1, 0, 5, 1, 2, 6, 8, '0.25'),
(65, 33, '2022-12-06 12:30:00', NULL, NULL, 'Espoir Rogba', 'AS Gabes', 1, 0, 3, 8, 4, 1, 5, '0.25'),
(66, 33, '2022-12-06 12:30:00', NULL, NULL, 'CO Medenine', 'Jerba Midoun', 1, 1, 13, 12, 14, 1, 15, '0'),
(67, 19, '2022-12-06 11:30:00', NULL, NULL, 'Persis Solo FC', 'Cilegon United', 6, 1, 15, 16, 6, 4, 10, '0.25'),
(68, 19, '2022-12-06 11:30:00', NULL, NULL, 'Persija Jakarta', 'Borneo FC', 1, 0, 6, 3, 7, 1, 8, '0.25'),
(69, 29, '2022-12-06 11:05:00', NULL, NULL, 'CF Rayo Majadahonda', 'Real Madrid Castilla', 1, 2, 17, 3, 1, 9, 10, '-0.75'),
(70, 21, '2022-12-06 11:00:00', NULL, NULL, 'Portimonense U23', 'Sporting Lisbon Sad U23', 3, 2, 5, 6, 5, 1, 6, '0.5'),
(71, 21, '2022-12-06 11:00:00', NULL, NULL, 'Farense U23', 'Estoril U23', 4, 1, 4, 2, 2, 5, 7, '0.75'),
(72, 29, '2022-12-06 11:00:00', NULL, NULL, 'Fuenlabrada', 'Merida AD', 0, 1, 10, 9, 4, 5, 9, '0.25'),
(73, 29, '2022-12-06 11:00:00', NULL, NULL, 'Unionistas de Salamanca', 'Alcorcon', 2, 1, 15, 2, 3, 8, 11, '0'),
(74, 9, '2022-12-06 11:00:00', NULL, NULL, 'Athletic Bilbao', 'Real Valladolid', 2, 0, 4, 12, 4, 6, 10, '0.25'),
(75, 22, '2022-12-07 13:30:00', NULL, NULL, 'Gokulam', 'Sudeva Delhi', 3, 0, 5, 12, 6, 3, 9, '1'),
(76, 35, '2022-12-07 13:30:00', NULL, NULL, 'Viterbese', 'Vicenza', 0, 2, 19, 1, 4, 6, 10, '0.75'),
(77, 35, '2022-12-07 13:30:00', NULL, NULL, 'Foggia', 'Catanzaro', 2, 0, 9, 1, 5, 6, 11, '0.25'),
(78, 36, '2022-12-07 13:30:00', NULL, NULL, 'Paris Saint Germain(U19)', 'U19 Valenciennes US', 2, 1, 6, 4, 8, 1, 9, '1.5'),
(79, 9, '2022-12-07 13:30:00', NULL, NULL, 'Grasshoppers', 'FC Luzern', 0, 0, 7, 6, 5, 4, 9, '0.25'),
(80, 37, '2022-12-07 13:05:00', NULL, NULL, 'Dhofar', 'Al Oruba Sur', 3, 2, 6, 13, 3, 1, 4, '1.25'),
(81, 16, '2022-12-07 13:00:00', NULL, NULL, 'Apollon Smirnis', 'Olympiakos Piraeus B', 1, 0, 4, 13, 5, 3, 8, '0.25'),
(82, 16, '2022-12-07 13:00:00', NULL, NULL, 'Rouf FC', 'AE Kifisias', 1, 3, 15, 1, 3, 4, 7, '-1.5'),
(83, 9, '2022-12-07 13:00:00', NULL, NULL, 'Bochum', 'FC Zwolle', 1, 3, 17, 2, 5, 2, 7, '1.5'),
(84, 32, '2022-12-07 12:45:00', NULL, NULL, 'Pyramids FC', 'Arab Contractors', 2, 0, 6, 7, 9, 3, 12, '0.75'),
(85, 32, '2022-12-07 12:45:00', NULL, NULL, 'Pharco', 'El Dakhleya', 1, 1, 8, 18, 5, 5, 10, '0.25'),
(86, 18, '2022-12-07 12:45:00', NULL, NULL, 'Al Wasl FC', 'Masafi', 3, 0, 3, 8, 14, 3, 17, '2.5'),
(87, 37, '2022-12-07 12:40:00', NULL, NULL, 'CLB Oman', 'Sohar Club', 1, 0, 8, 4, 4, 8, 12, '0.75'),
(88, 18, '2022-12-07 12:35:00', NULL, NULL, 'Ittihad Kalba', 'Al-Thaid', 6, 2, 8, 7, 7, 6, 13, '1.75'),
(89, 33, '2022-12-07 12:30:00', NULL, NULL, 'A.S Djerba', 'Sporting Ben Arous', 0, 1, 6, 11, 7, 2, 9, '0.25'),
(90, 33, '2022-12-07 12:30:00', NULL, NULL, 'E. M. Mahdia', 'S.S. Sfaxien', 2, 1, 9, 12, 1, 3, 4, '1.25'),
(91, 9, '2022-12-07 12:05:00', NULL, NULL, 'Hertha BSC Berlin', 'Eintr. Braunschweig', 1, 0, 15, 14, 4, 9, 13, '1.5'),
(92, 38, '2022-12-07 12:00:00', NULL, NULL, 'Jedinstvo Bijelo Polje', 'FK Sutjeska Niksic', 0, 4, 6, 2, 4, 4, 8, '-0.75'),
(93, 39, '2022-12-07 12:00:00', NULL, NULL, 'Viktoria Zizkov', 'Slovan Liberec', 2, 3, 19, 9, 5, 9, 14, '-1.5'),
(94, 19, '2022-12-07 11:15:00', NULL, NULL, 'Persik Kediri', 'Persib Bandung', 0, 3, 18, 9, 3, 1, 4, '-1'),
(95, 40, '2022-12-07 11:00:00', NULL, NULL, 'Duzcespor', 'Corum Belediyespor', 3, 1, 6, 4, 7, 6, 13, '0.75'),
(96, 22, '2022-12-07 11:00:00', NULL, NULL, 'Rajasthan Club', 'Kenkre', 1, 1, 4, 10, 12, 1, 13, '1'),
(97, 9, '2022-12-07 10:00:00', NULL, NULL, 'Arka Gdynia', 'Olimpia Elblag', 3, 1, 6, 6, 8, 4, 12, '1.25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `new_match_today`
--

CREATE TABLE `new_match_today` (
  `entity_id` int(11) NOT NULL,
  `league_name` varchar(200) DEFAULT NULL,
  `datetime` varchar(200) NOT NULL,
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

INSERT INTO `new_match_today` (`entity_id`, `league_name`, `datetime`, `home_name`, `away_name`, `home_position`, `away_position`, `odd`, `odd_converted`) VALUES
(1, 'ROMC', '2022-12-06 17:00:00', 'Sepsi OSK Sfantul Gheorghe', 'FC Voluntari', 7, 9, '0.5/1', '0.75'),
(2, 'ROMC', '2022-12-06 17:00:00', 'Petrolul Ploiesti', 'Universitatea Craiova', 6, 13, '0/-0.5', '0.75'),
(3, 'ROMC', '2022-12-06 17:00:00', 'FC Unirea 2004 Slobozia', 'Dinamo Bucuresti', 4, 8, '0', '0'),
(4, 'SLO D1', '2022-12-06 17:00:00', 'NK Maribor', 'Radomlje', 5, 8, '1/1.5', '1.25'),
(5, 'INT CF', '2022-12-06 17:00:00', 'Galatasaray', 'Villarreal', 2, 9, '0/-0.5', '0.75'),
(6, 'SPA D2', '2022-12-06 18:00:00', 'Leganes', 'CD Mirandes', 9, 17, '0.5', '0.5'),
(7, 'SPA D2', '2022-12-06 18:00:00', 'Real Oviedo', 'Las Palmas', 14, 1, '0', '0'),
(8, 'SPDRFEF', '2022-12-06 18:00:00', 'UD Logrones', 'Real Sociedad B', 15, 3, '0/0.5', '0.25'),
(9, 'World Cup', '2022-12-06 19:00:00', 'Bồ Đào Nha', 'Thụy Sĩ', 9, 15, '0.5', '0.5'),
(10, 'SPDRFEF', '2022-12-06 19:00:00', 'CF La Nucia', 'CF Intercity', 12, 18, '0/0.5', '0.25'),
(11, 'SPDRFEF', '2022-12-06 19:00:00', 'CD Badajoz', 'Deportivo La Coruna', 16, 5, '-0.5', '-0.5'),
(12, 'INT CF', '2022-12-06 19:00:00', 'Cambridge United', 'West Ham United', 20, 16, '-1.5', '-1.5'),
(13, 'ENG Conf', '2022-12-06 19:45:00', 'Boreham Wood', 'Oldham Athletic AFC', 12, 23, '0.5', '0.5'),
(14, 'ENG Conf', '2022-12-06 19:45:00', 'Halifax Town', 'Dorking Wanderers', 14, 16, '0.5', '0.5'),
(15, 'ENG CS', '2022-12-06 19:45:00', 'Braintree Town', 'Oxford City', 6, 8, '0/-0.5', '0.75'),
(16, 'ENG CS', '2022-12-06 19:45:00', 'Cheshunt', 'Dover Athletic', 22, 12, '0/-0.5', '0.75'),
(17, 'ENG CS', '2022-12-06 19:45:00', 'Dulwich Hamlet', 'Chelmsford City', 20, 4, '0', '0'),
(18, 'ENG CS', '2022-12-06 19:45:00', 'Hemel Hempstead Town', 'Bath City', 14, 11, '0/0.5', '0.25'),
(19, 'ENG CS', '2022-12-06 19:45:00', 'Slough Town', 'Concord Rangers', 19, 18, '0.5', '0.5'),
(20, 'ENG CS', '2022-12-06 19:45:00', 'Tonbridge Angels', 'Eastbourne Borough', 10, 9, '0/-0.5', '0.75'),
(21, 'ENG CS', '2022-12-06 19:45:00', 'Welling United', 'Farnborough Town', 13, 15, '0', '0'),
(22, 'ENG CS', '2022-12-06 19:45:00', 'Worthing', 'Ebbsfleet United', 5, 1, '-0.5/1', '-0.75'),
(23, 'ENG CN', '2022-12-06 19:45:00', 'Blyth Spartans', 'Southport FC', 22, 9, '0', '0'),
(24, 'ENG CN', '2022-12-06 19:45:00', 'Curzon Ashton FC', 'Darlington', 18, 3, '0', '0'),
(25, 'ENG CN', '2022-12-06 19:45:00', 'Farsley Celtic', 'Kings Lynn', 23, 2, '-0.5/1', '-0.75'),
(26, 'ENG CN', '2022-12-06 19:45:00', 'Hereford', 'Chorley', 17, 10, '0/-0.5', '0.75'),
(27, 'ENG CN', '2022-12-06 19:45:00', 'Kettering Town', 'Gloucester City', 21, 11, '0/-0.5', '0.75'),
(28, 'ENG CN', '2022-12-06 19:45:00', 'Leamington', 'Brackley Town', 14, 1, '0/-0.5', '0.75'),
(29, 'ENG CN', '2022-12-06 19:45:00', 'Scarborough', 'Peterborough Sports', 6, 7, '0', '0'),
(30, 'ENG CN', '2022-12-06 19:45:00', 'Spennymoor Town', 'Boston United', 19, 15, '0/0.5', '0.25'),
(31, 'ENG-S PR', '2022-12-06 19:45:00', 'Yate Town', 'Chesham United', 16, 3, '-0.5', '-0.5'),
(32, 'ENG-S PR', '2022-12-06 19:45:00', 'Bracknell Town', 'Plymouth Parkway', 6, 19, '0.5/1', '0.75'),
(33, 'ENG RYM', '2022-12-06 19:45:00', 'Corinthian Casuals', 'Bishop Stortford', 20, 3, '-1/1.5', '-1.25'),
(34, 'ENG RYM', '2022-12-06 19:45:00', 'AFC Hornchurch', 'Folkestone Invicta', 1, 16, '1.5/2', '1.75'),
(35, 'NIR LC', '2022-12-06 19:45:00', 'Glentoran FC', 'Linfield FC', 5, 3, '0/0.5', '0.25'),
(36, 'NIR LC', '2022-12-06 19:45:00', 'Cliftonville', 'Coleraine', 4, 6, '0/0.5', '0.25'),
(37, 'ENG-S CE', '2022-12-06 19:45:00', 'Basford Utd', 'Kings Langley', 13, 20, '0.5', '0.5'),
(38, 'ENG-S CE', '2022-12-06 19:45:00', 'Coalville Town', 'Nuneaton Town', 6, 3, '0.5', '0.5'),
(39, 'ENG-S CE', '2022-12-06 19:45:00', 'Needham Market', 'Hednesford Town', 16, 22, '0.5', '0.5'),
(40, 'ENG-S CE', '2022-12-06 19:45:00', 'Rushall Olympic', 'Leiston FC', 4, 2, '0', '0'),
(41, 'SPA D2', '2022-12-06 20:00:00', 'Albacete', 'Zaragoza', 10, 15, '0', '0'),
(42, 'PORLC', '2022-12-06 20:45:00', 'GD Estoril-Praia', 'SC Uniao Torreense', 12, 15, '0.5', '0.5'),
(43, 'IND D1', '2022-12-07 11:00:00', 'Rajasthan Club', 'Kenkre', 4, 9, '1', '1'),
(215, 'IDN ISL', '2022-12-07 08:15:00', 'Dewa United FC', 'Arema Malang', 14, 10, '-0.5', '-0.5'),
(217, 'IDN ISL', '2022-12-07 11:15:00', 'Persik Kediri', 'Persib Bandung', 18, 8, '-0.5', '-0.5'),
(348, 'UKR D1', '2022-12-07 11:00:00', 'Rukh Vynnyky', 'Chernomorets Odessa', 13, 15, '0/0.5', '0.25'),
(349, 'TUR D3', '2022-12-07 11:00:00', 'Duzcespor', 'Corum Belediyespor', 6, 4, '0/-0.5', '0.75'),
(352, 'MNE D1', '2022-12-07 12:00:00', 'Jedinstvo Bijelo Polje', 'FK Sutjeska Niksic', 6, 2, '-0.5/1', '-0.75'),
(353, 'MNE D1', '2022-12-07 12:00:00', 'Arsenal Tivat', 'OFK Petrovac', 5, 4, '0', '0'),
(354, 'TIP CUP', '2022-12-07 12:00:00', 'Viktoria Zizkov', 'Slovan Liberec', 19, 9, '-1.5', '-1.5'),
(355, 'INT CF', '2022-12-07 12:00:00', 'Hertha BSC Berlin', 'Eintr. Braunschweig', 15, 14, '1/1.5', '1.25'),
(356, 'TTLd', '2022-12-07 12:30:00', 'A.S Djerba', 'Sporting Ben Arous', 6, 11, '0/0.5', '0.25'),
(357, 'TTLd', '2022-12-07 12:30:00', 'E. M. Mahdia', 'S.S. Sfaxien', 9, 12, '1/1.5', '1.25'),
(358, 'TTLd', '2022-12-07 12:30:00', 'Kalaa Sport', 'E.Gawafel.S.Gafsa', 5, 2, '0', '0'),
(359, 'UAE', '2022-12-07 12:35:00', 'Ittihad Kalba', 'Al-Thaid', 8, 7, '1.5', '1.5'),
(360, 'OMA PL', '2022-12-07 12:40:00', 'CLB Oman', 'Sohar Club', 8, 4, '0/-0.5', '0.75'),
(361, 'EGY D1', '2022-12-07 12:45:00', 'Pyramids FC', 'Arab Contractors', 6, 7, '1', '1'),
(362, 'EGY D1', '2022-12-07 12:45:00', 'Pharco', 'El Dakhleya', 8, 18, '0.5', '0.5'),
(363, 'UAE', '2022-12-07 12:45:00', 'Al Wasl FC', 'Masafi', 3, 8, '2/2.5', '2.25'),
(364, 'GRE D2', '2022-12-07 13:00:00', 'Apollon Smirnis', 'Olympiakos Piraeus B', 4, 13, '0.5', '0.5'),
(365, 'GRE D2', '2022-12-07 13:00:00', 'Rouf FC', 'AE Kifisias', 15, 1, '-1.5', '-1.5'),
(366, 'INT CF', '2022-12-07 13:00:00', 'Bochum', 'FC Zwolle', 17, 2, '1.5', '1.5'),
(367, 'OMA PL', '2022-12-07 13:05:00', 'Dhofar', 'Al Oruba Sur', 6, 13, '1', '1'),
(368, 'ITA PRO LC', '2022-12-07 13:30:00', 'Viterbese', 'Vicenza', 19, 1, '0/-0.5', '0.75'),
(369, 'ITA PRO LC', '2022-12-07 13:30:00', 'Foggia', 'Catanzaro', 9, 1, '0/0.5', '0.25'),
(370, 'INT CF', '2022-12-07 13:30:00', 'Grasshoppers', 'FC Luzern', 7, 6, '0', '0'),
(371, 'IND D1', '2022-12-07 13:30:00', 'Gokulam', 'Sudeva Delhi', 5, 12, '1/1.5', '1.25'),
(372, 'FRA U19', '2022-12-07 13:30:00', 'Paris Saint Germain(U19)', 'U19 Valenciennes US', 6, 4, '1.5', '1.5'),
(373, 'ALG D1', '2022-12-07 14:00:00', 'HB Chelghoum Laid', 'US Biskra', 16, 13, '-0.5', '-0.5'),
(374, 'ALG D1', '2022-12-07 14:00:00', 'CS Constantine', 'ASO Chlef', 2, 9, '1', '1'),
(375, 'ALG D1', '2022-12-07 14:00:00', 'El Bayadh', 'ES Setif', 10, 3, '0', '0'),
(376, 'ALG D1', '2022-12-07 14:00:00', 'USM Khenchela', 'MC Magra', 6, 11, '0.5/1', '0.75'),
(377, 'ALG D1', '2022-12-07 14:00:00', 'Paradou AC', 'JS Saoura', 15, 4, '0', '0'),
(378, 'ALG D1', '2022-12-07 14:00:00', 'USM Alger', 'CR Belouizdad', 7, 1, '0', '0'),
(379, 'SLO D1', '2022-12-07 14:00:00', 'FC Koper', 'Tabor Sezana', 5, 10, '1', '1'),
(380, 'MNE D1', '2022-12-07 14:00:00', 'FK Iskra Danilovgrad', 'FK Buducnost Podgorica', 10, 1, '-0.5/1', '-0.75'),
(381, 'BHR D1', '2022-12-07 14:30:00', 'Al Hidd', 'Al Riffa Club', 5, 2, '-1', '-1'),
(382, 'ALG D1', '2022-12-07 15:00:00', 'JS Kabylie', 'RC Arba', 14, 8, '0.5/1', '0.75'),
(383, 'ROMC', '2022-12-07 15:00:00', 'SCM Argesul Pitesti', 'CS Universitatea Craiova', 10, 5, '-0.5/1', '-0.75'),
(384, 'ROMC', '2022-12-07 15:00:00', 'Hermannstadt', 'Chindia Targoviste', 8, 11, '0.5', '0.5'),
(385, 'EGY D1', '2022-12-07 15:00:00', 'Ghazl El Mahallah', 'Al Ahly', 2, 1, '-1/1.5', '-1.25'),
(386, 'OMA PL', '2022-12-07 15:10:00', 'Alrstak', 'al bashaer', 3, 14, '1', '1'),
(387, 'BHR D1', '2022-12-07 15:30:00', 'Al-Muharraq', 'Al-Budaiya', 1, 12, '1/1.5', '1.25'),
(388, 'UAE', '2022-12-07 15:30:00', 'Al Ahli Dubai', 'Al Wahda', 2, 1, '0', '0'),
(389, 'MNE D1', '2022-12-07 15:59:00', 'FK Mornar', 'Decic Tuzi', 9, 3, '-0.5', '-0.5'),
(390, 'INT CF', '2022-12-07 15:59:00', 'KV Oostende', 'Lille OSC', 14, 7, '-1', '-1'),
(391, 'SLO D1', '2022-12-07 16:30:00', 'Domzale', 'NK Publikum Celje', 6, 2, '0/-0.5', '0.75'),
(392, 'INT CF', '2022-12-07 16:30:00', 'Nea Salamis', 'Panathinaikos', 8, 1, '-1/1.5', '-1.25'),
(393, 'ALG D1', '2022-12-07 17:00:00', 'MC Oran', 'MC An-giê', 12, 5, '0', '0'),
(394, 'ITA PRO LC', '2022-12-07 17:00:00', 'Virtus Entella', 'Renate AC', 6, 7, '0/0.5', '0.25'),
(395, 'INT CF', '2022-12-07 17:00:00', 'Inter Milan', 'Red Bull Salzburg', 5, 1, '0.5/1', '0.75'),
(396, 'INT CF', '2022-12-07 17:00:00', 'Celta Vigo', 'Boavista (FC)', 17, 6, '1', '1'),
(397, 'INT CF', '2022-12-07 17:00:00', 'Fiorentina', 'Always Ready', 10, 2, '2.5/3', '2.75'),
(398, 'ISR LATTC', '2022-12-07 17:00:00', 'Sektzia Nes Tziona', 'Hapoel Haifa', 13, 12, '0/-0.5', '0.75'),
(399, 'BHR D1', '2022-12-07 17:30:00', 'Sitra', 'Al Hala', 8, 10, '0', '0'),
(400, 'ISR D2', '2022-12-07 17:30:00', 'Hapoel Acco', 'Maccabi Petah Tikva FC', 2, 1, '-0.5', '-0.5'),
(401, 'ISR D2', '2022-12-07 17:30:00', 'Ironi Tiberias', 'AS Ashdod', 6, 15, '0.5/1', '0.75'),
(402, 'ISR D2', '2022-12-07 17:30:00', 'Maccabi Ahi Nazareth', 'Hapoel Kfar Saba', 10, 4, '0', '0'),
(403, 'ISR D2', '2022-12-07 17:30:00', 'Hapoel Ramat Gan FC', 'Hapoel Umm Al Fahm', 11, 5, '0', '0'),
(404, 'ISR D2', '2022-12-07 17:30:00', 'Hapoel Rishon Lezion', 'Kfar Kasem', 8, 14, '0/0.5', '0.25'),
(405, 'INT CF', '2022-12-07 17:45:00', 'Antalyaspor', 'Napoli', 11, 1, '-1', '-1'),
(406, 'ISR LATTC', '2022-12-07 17:45:00', 'Beitar Jerusalem', 'Hapoel Ironi Kiryat Shmona', 11, 14, '0/0.5', '0.25'),
(407, 'SPA D2', '2022-12-07 18:00:00', 'FC Cartagena', 'Villarreal B', 5, 12, '0.5/1', '0.75'),
(408, 'SPA D2', '2022-12-07 18:00:00', 'SD Huesca', 'Andorra CF', 11, 8, '0', '0'),
(409, 'SPDRFEF', '2022-12-07 18:00:00', 'SD Amorebieta', 'Calahorra', 8, 20, '0/0.5', '0.25'),
(410, 'SPDRFEF', '2022-12-07 18:00:00', 'Racing de Ferrol', 'CD Linares Deportivo', 4, 6, '0.5/1', '0.75'),
(411, 'ROMC', '2022-12-07 18:00:00', 'Farul Constanta', 'CFR Cluj', 1, 2, '0', '0'),
(412, 'ROMC', '2022-12-07 18:00:00', 'Universitaea Cluj', 'FC Rapid Bucuresti', 14, 3, '0/-0.5', '0.75'),
(413, 'ITA PRO LC', '2022-12-07 18:00:00', 'Padova', 'JuventusU23', 11, 8, '0/0.5', '0.25'),
(414, 'ISR LATTC', '2022-12-07 18:00:00', 'Maccabi Tel Aviv', 'Hapoel Jerusalem', 2, 4, '1/1.5', '1.25'),
(415, 'ISR LATTC', '2022-12-07 18:15:00', 'Maccabi Netanya', 'Hapoel Hadera', 8, 5, '0.5', '0.5'),
(416, 'PORLC', '2022-12-07 18:30:00', 'SC Farense', 'Maritimo', 2, 17, '0/0.5', '0.25'),
(417, 'INT CF', '2022-12-07 19:00:00', 'Cadiz', 'Manchester United', 19, 5, '-0.5', '-0.5'),
(418, 'INT CF', '2022-12-07 19:00:00', 'Sevilla', 'AS Monaco', 18, 6, '0/0.5', '0.25'),
(419, 'ITA D2', '2022-12-07 19:30:00', 'Ternana', 'Cagliari', 7, 12, '0', '0'),
(420, 'ENG CN', '2022-12-07 19:30:00', 'Kidderminster', 'Chester FC', 12, 5, '0.5', '0.5'),
(421, 'ENG FAC', '2022-12-07 19:45:00', 'Stockport County', 'Charlton Athletic', 12, 17, '0/0.5', '0.25'),
(422, 'ENG-S PR', '2022-12-07 19:45:00', 'Harrow Borough', 'Hartley Wintney', 18, 21, '0/0.5', '0.25'),
(423, 'ENG-S PR', '2022-12-07 19:45:00', 'Truro City', 'Beaconsfield SYCOB', 2, 14, '1/1.5', '1.25'),
(424, 'ENG RYM', '2022-12-07 19:45:00', 'Kingstonian', 'Lewes', 17, 12, '0', '0'),
(425, 'ENG RYM', '2022-12-07 19:45:00', 'Bognor Regis Town', 'Cray Wanderers', 14, 8, '0/0.5', '0.25'),
(426, 'SPA D2', '2022-12-07 20:00:00', 'Tenerife', 'Alaves', 16, 3, '0/0.5', '0.25'),
(427, 'SPDRFEF', '2022-12-07 20:00:00', 'Barcelona B', 'Eldense', 9, 2, '0', '0'),
(428, 'SPDRFEF', '2022-12-07 20:00:00', 'CD Castellon', 'Numancia', 1, 14, '0.5', '0.5'),
(429, 'SPDRFEF', '2022-12-07 20:00:00', 'Algeciras', 'Linense', 16, 14, '0/0.5', '0.25'),
(430, 'SPDRFEF', '2022-12-07 20:00:00', 'Cordoba C.F.', 'Pontevedra', 1, 18, '1/1.5', '1.25'),
(431, 'SPDRFEF', '2022-12-07 20:00:00', 'Talavera de la Reina', 'Celta Vigo B', 19, 13, '0/-0.5', '0.75'),
(432, 'SPDRFEF', '2022-12-07 20:00:00', 'Cultural Leonesa', 'C.D. San Fernando Isleno', 9, 15, '0.5', '0.5'),
(433, 'UEFA WUC', '2022-12-07 20:00:00', 'Nữ Arsenal', 'Nữ Juventus', 3, 2, '1/1.5', '1.25'),
(434, 'UEFA WUC', '2022-12-07 20:00:00', 'Nữ Bayern Munich', 'Nữ FC Barcelona', 2, 1, '-1.5', '-1.5'),
(435, 'PORLC', '2022-12-07 20:30:00', 'Rio Ave', 'Sporting Clube de Portugal', 10, 4, '-1', '-1'),
(436, 'COL D1', '2022-12-08 00:00:00', 'Deportivo Pereira', 'Dep.Independiente Medellin', 5, 3, '0', '0'),
(437, 'GUA D1', '2022-12-08 01:00:00', 'Club Comunicaciones', 'Coban Imperial', 3, 2, '1', '1'),
(439, 'INT CF', '2022-12-07 15:59:00', 'Crystal Palace', 'Trabzonspor', 11, 7, '0.5/1', '0.75'),
(441, 'INT CF', '2022-12-07 15:59:00', 'Alanyaspor', 'Fenerbahce', 9, 1, '-0.5', '-0.5'),
(465, 'INT CF', '2022-12-07 18:00:00', 'TuS Blau-Weiss Lohne', 'VfL Osnabruck', 8, 10, '-1/1.5', '-1.25'),
(490, 'IDN ISL', '2022-12-08 08:15:00', 'PSM Makassar', 'Persita Tangerang', 1, 6, '0.5/1', '0.75'),
(491, 'IDN ISL', '2022-12-08 08:15:00', 'PSS Sleman', 'Madura United', 14, 5, '-0.5', '-0.5'),
(492, 'IND D1', '2022-12-08 08:30:00', 'Aizawl FC', 'Neroca FC', 8, 7, '0.5/1', '0.75');

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
-- Chỉ mục cho bảng `match_entity`
--
ALTER TABLE `match_entity`
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
  MODIFY `entity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `less_position_but_higher_odd_match`
--
ALTER TABLE `less_position_but_higher_odd_match`
  MODIFY `entity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT cho bảng `match_entity`
--
ALTER TABLE `match_entity`
  MODIFY `entity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT cho bảng `new_match_today`
--
ALTER TABLE `new_match_today`
  MODIFY `entity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=493;

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
-- Các ràng buộc cho bảng `match_entity`
--
ALTER TABLE `match_entity`
  ADD CONSTRAINT `match_entity_ibfk_1` FOREIGN KEY (`home_club_id`) REFERENCES `club_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `match_entity_ibfk_2` FOREIGN KEY (`home_club_id`) REFERENCES `club_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `match_entity_ibfk_3` FOREIGN KEY (`away_club_id`) REFERENCES `club_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `match_entity_ibfk_4` FOREIGN KEY (`league_id`) REFERENCES `league_entity` (`entity_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
