-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 06, 2022 lúc 06:17 PM
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
(12, 'CYP D1'),
(4, 'ENG CN'),
(17, 'ENG U21D2'),
(7, 'ENG U21LC'),
(13, 'FRA D3'),
(16, 'GRE D2'),
(19, 'IDN ISL'),
(22, 'IND D1'),
(9, 'INT CF'),
(5, 'ITA C1'),
(1, 'JAM D1'),
(21, 'Por U23'),
(2, 'PORLC'),
(10, 'ROM D1'),
(3, 'SPA D2'),
(11, 'TFF 1. Lig'),
(18, 'UAE'),
(8, 'World Cup');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `less_position_but_higher_odd_match`
--

CREATE TABLE `less_position_but_higher_odd_match` (
  `entity_id` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `home_name` varchar(200) NOT NULL,
  `away_name` varchar(200) NOT NULL,
  `result` int(11) NOT NULL COMMENT '2 is not set, 1 is win, 0 is lose',
  `position_range` int(11) NOT NULL,
  `odd` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `less_position_but_higher_odd_match`
--

INSERT INTO `less_position_but_higher_odd_match` (`entity_id`, `datetime`, `home_name`, `away_name`, `result`, `position_range`, `odd`) VALUES
(75, '2022-12-06 18:00:00', 'UD Logrones', 'Real Sociedad B', 2, 12, '0.25'),
(76, '2022-12-06 19:45:00', 'Cheshunt', 'Dover Athletic', 2, 10, '0.75'),
(77, '2022-12-06 19:45:00', 'Hemel Hempstead Town', 'Bath City', 2, 3, '0.25'),
(78, '2022-12-06 19:45:00', 'Slough Town', 'Concord Rangers', 2, 1, '0.5'),
(79, '2022-12-06 19:45:00', 'Tonbridge Angels', 'Eastbourne Borough', 2, 1, '0.75'),
(80, '2022-12-06 19:45:00', 'Hereford', 'Chorley', 2, 7, '0.75'),
(81, '2022-12-06 19:45:00', 'Kettering Town', 'Gloucester City', 2, 10, '0.75'),
(82, '2022-12-06 19:45:00', 'Leamington', 'Brackley Town', 2, 13, '0.75'),
(83, '2022-12-06 19:45:00', 'Spennymoor Town', 'Boston United', 2, 4, '0.25'),
(84, '2022-12-06 19:45:00', 'Glentoran FC', 'Linfield FC', 2, 2, '0.25'),
(85, '2022-12-06 19:45:00', 'Coalville Town', 'Nuneaton Town', 2, 3, '0.5');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `match_entity`
--

CREATE TABLE `match_entity` (
  `entity_id` int(11) NOT NULL,
  `league_id` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `home_club_id` int(11) DEFAULT NULL,
  `away_club_id` int(11) DEFAULT NULL,
  `home_name` varchar(200) NOT NULL,
  `away_name` varchar(200) NOT NULL,
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

INSERT INTO `match_entity` (`entity_id`, `league_id`, `datetime`, `home_club_id`, `away_club_id`, `home_name`, `away_name`, `home_position`, `away_position`, `home_corner`, `away_corner`, `total_corner`, `odd`) VALUES
(1, 19, '2022-12-06 08:30:00', NULL, NULL, 'Persebaya Surabaya', 'Barito Putera', 11, 17, 3, 3, 6, '1'),
(2, 22, '2022-12-06 08:30:00', NULL, NULL, 'Real Kashmir FC', 'Sreenidi Deccan', 1, 2, 9, 1, 10, '0.25'),
(3, 1, '2022-12-06 00:30:00', NULL, NULL, 'Arnett Gardens', 'Molynes United', 5, 8, 6, 9, 15, '0.75'),
(4, 1, '2022-12-05 22:00:00', NULL, NULL, 'Chapelton', 'Portmore United', 12, 11, 2, 9, 11, '-0.5'),
(5, 2, '2022-12-05 20:45:00', NULL, NULL, 'CD Mafra', 'Vizela', 12, 13, 5, 7, 12, '0.75'),
(6, 3, '2022-12-05 20:00:00', NULL, NULL, 'SD Ponferradina', 'Burgos CF', 20, 3, 6, 0, 6, '0'),
(7, 4, '2022-12-05 19:45:00', NULL, NULL, 'Bradford Park Avenue', 'AFC Telford United', 18, 24, 2, 4, 6, '0'),
(8, 5, '2022-12-05 19:30:00', NULL, NULL, 'Delfino Pescara 1936', 'Taranto Sport', 3, 17, 5, 1, 6, '1.75'),
(9, 6, '2022-12-05 19:00:00', NULL, NULL, 'Deinze U21', 'U21 Kortrijk', 12, 7, 4, 10, 14, '-0.5'),
(10, 6, '2022-12-05 19:00:00', NULL, NULL, 'RWD Molenbeek U21', 'U21 AS Eupen', 9, 3, 4, 8, 12, '-0.75'),
(11, 6, '2022-12-05 19:00:00', NULL, NULL, 'U21 Westerlo', 'U21 Lommel SK', 5, 6, 2, 2, 4, '0.5'),
(12, 7, '2022-12-05 19:00:00', NULL, NULL, 'U21 Hull City', 'U21 Charlton Athletic', 11, 7, 6, 3, 9, '0.25'),
(13, 7, '2022-12-05 19:00:00', NULL, NULL, 'U21 Newcastle', 'U21 Sheffield Utd', 6, 3, 7, 4, 11, '0.75'),
(14, 8, '2022-12-05 19:00:00', NULL, NULL, 'Brazil', 'Hàn Quốc', 1, 28, 5, 4, 9, '1.75'),
(15, 6, '2022-12-05 18:30:00', NULL, NULL, 'U21 St.-Truidense', 'FCV Dender EH U21', 2, 10, 6, 4, 10, '1.25'),
(16, 6, '2022-12-05 18:30:00', NULL, NULL, 'U21 RS Waasland Beveren', 'Lierse U21', 4, 8, 13, 3, 16, '0.5'),
(17, 9, '2022-12-05 17:30:00', NULL, NULL, 'Gzira United', 'Inter Milan', 4, 5, 1, 11, 12, '-3.75'),
(18, 10, '2022-12-05 17:10:00', NULL, NULL, 'Steaua Bucuresti', 'CS Mioveni', 5, 16, 7, 3, 10, '1.25'),
(19, 11, '2022-12-05 17:00:00', NULL, NULL, 'Rizespor', 'Pendikspor', 4, 5, 3, 4, 7, '0.25'),
(20, 12, '2022-12-05 17:00:00', NULL, NULL, 'Omonia Nicosia FC', 'Karmiotissa Pano Polemidion', 7, 9, 4, 5, 9, '1.25'),
(21, 13, '2022-12-05 17:00:00', NULL, NULL, 'Versailles 78', 'CS Sedan Ardennes', 5, 13, 0, 3, 3, '0.25'),
(22, 9, '2022-12-05 15:59:00', NULL, NULL, 'Aris Limassol', 'PAOK Saloniki', 3, 4, 1, 5, 6, '-1.25'),
(23, 14, '2022-12-05 15:00:00', NULL, NULL, 'FC Avan Academy', 'FC Pyunik', 2, 4, 10, 3, 13, '0.25'),
(24, 8, '2022-12-05 15:00:00', NULL, NULL, 'Nhật Bản', 'Croatia', 24, 12, 5, 4, 9, '-0.5'),
(25, 15, '2022-12-05 15:00:00', NULL, NULL, 'Etehad Alreef', 'Busaiteen', 11, 2, 1, 8, 9, '-1.25'),
(26, 15, '2022-12-05 15:00:00', NULL, NULL, 'Malkia', 'Buri', 3, 10, 4, 4, 8, '0.75'),
(27, 15, '2022-12-05 15:00:00', NULL, NULL, 'Al-Tadhmon', 'Al-Najma', 12, 1, 2, 4, 6, '-1.25'),
(28, 9, '2022-12-05 15:00:00', NULL, NULL, 'Sturm Graz', 'Empoli', 2, 13, 6, 4, 10, '0'),
(29, 7, '2022-12-05 14:00:00', NULL, NULL, 'U21 Crystal Palace', 'U21 Bristol City', 5, 1, 8, 4, 12, '0.75'),
(30, 16, '2022-12-05 13:15:00', NULL, NULL, 'Kallithea', 'AEK Athens B', 8, 9, 5, 8, 13, '1'),
(31, 16, '2022-12-05 13:00:00', NULL, NULL, 'Apollon Kalamaria', 'Apollon Larissas', 14, 9, 3, 2, 5, '1'),
(32, 17, '2022-12-05 13:00:00', NULL, NULL, 'U21 Crewe Alexandra', 'U21 Barnsley', 19, 17, 8, 6, 14, '0.25'),
(33, 18, '2022-12-05 12:40:00', NULL, NULL, 'Al Fujairah Club', 'Hatta', 14, 5, 2, 6, 8, '-0.75'),
(34, 18, '2022-12-05 12:40:00', NULL, NULL, 'Al Bataeh', 'Al-Jazira Al-Hamra', 9, 3, 3, 4, 7, '1.25'),
(35, 18, '2022-12-05 12:40:00', NULL, NULL, 'City Club', 'Al Nasr Dubai', 15, 12, 0, 9, 9, '-3');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `new_match_today`
--

CREATE TABLE `new_match_today` (
  `entity_id` int(11) NOT NULL,
  `league_name` varchar(200) DEFAULT NULL,
  `datetime` datetime NOT NULL,
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
(217, 'IDN ISL', '2022-12-07 11:15:00', 'Persik Kediri', 'Persib Bandung', 18, 8, '-0.5', '-0.5');

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
  MODIFY `entity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `less_position_but_higher_odd_match`
--
ALTER TABLE `less_position_but_higher_odd_match`
  MODIFY `entity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT cho bảng `match_entity`
--
ALTER TABLE `match_entity`
  MODIFY `entity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `new_match_today`
--
ALTER TABLE `new_match_today`
  MODIFY `entity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=348;

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
