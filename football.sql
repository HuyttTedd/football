-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 06, 2022 at 05:56 PM
-- Server version: 8.0.31-0ubuntu0.20.04.1
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `football`
--

-- --------------------------------------------------------

--
-- Table structure for table `club_entity`
--

CREATE TABLE `club_entity` (
  `entity_id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `club_entity`
--

INSERT INTO `club_entity` (`entity_id`, `name`) VALUES
(2, 'teASfa');

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_type`
--

CREATE TABLE `eav_entity_type` (
  `entity_type_id` smallint NOT NULL,
  `entity_type_code` varchar(50) DEFAULT NULL,
  `entity_table` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `eav_entity_type`
--

INSERT INTO `eav_entity_type` (`entity_type_id`, `entity_type_code`, `entity_table`) VALUES
(1, 'league', 'league_entity'),
(2, 'club', 'club_entity');

-- --------------------------------------------------------

--
-- Table structure for table `league_club`
--

CREATE TABLE `league_club` (
  `league_id` int NOT NULL,
  `club_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `league_entity`
--

CREATE TABLE `league_entity` (
  `entity_id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `league_entity`
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
-- Table structure for table `match_entity`
--

CREATE TABLE `match_entity` (
  `entity_id` int NOT NULL,
  `league_id` int NOT NULL,
  `datetime` datetime NOT NULL,
  `home_club_id` int DEFAULT NULL,
  `away_club_id` int DEFAULT NULL,
  `home_name` varchar(200) NOT NULL,
  `away_name` varchar(200) NOT NULL,
  `home_position` int NOT NULL,
  `away_position` int NOT NULL,
  `home_corner` int DEFAULT NULL,
  `away_corner` int DEFAULT NULL,
  `total_corner` int DEFAULT NULL,
  `odd` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `match_entity`
--

INSERT INTO `match_entity` (`entity_id`, `league_id`, `datetime`, `home_club_id`, `away_club_id`, `home_name`, `away_name`, `home_position`, `away_position`, `home_corner`, `away_corner`, `total_corner`, `odd`) VALUES
(5, 1, '2022-12-06 00:30:00', NULL, NULL, 'Arnett Gardens', 'Molynes United', 5, 8, 6, 9, 15, '0.5/1'),
(6, 1, '2022-12-05 22:00:00', NULL, NULL, 'Chapelton', 'Portmore United', 12, 11, 2, 9, 11, '-0.5'),
(7, 2, '2022-12-05 20:45:00', NULL, NULL, 'CD Mafra', 'Vizela', 12, 13, 5, 7, 12, '0/-0.5'),
(8, 3, '2022-12-05 20:00:00', NULL, NULL, 'SD Ponferradina', 'Burgos CF', 20, 3, 6, 0, 6, '0'),
(9, 4, '2022-12-05 19:45:00', NULL, NULL, 'Bradford Park Avenue', 'AFC Telford United', 18, 24, 2, 4, 6, '0'),
(10, 5, '2022-12-05 19:30:00', NULL, NULL, 'Delfino Pescara 1936', 'Taranto Sport', 3, 17, 5, 1, 6, '1.5/2'),
(11, 6, '2022-12-05 19:00:00', NULL, NULL, 'Deinze U21', 'U21 Kortrijk', 12, 7, 4, 10, 14, '-0.5'),
(12, 6, '2022-12-05 19:00:00', NULL, NULL, 'RWD Molenbeek U21', 'U21 AS Eupen', 9, 3, 4, 8, 12, '-0.5/1'),
(13, 6, '2022-12-05 19:00:00', NULL, NULL, 'U21 Westerlo', 'U21 Lommel SK', 5, 6, 2, 2, 4, '0.5'),
(14, 7, '2022-12-05 19:00:00', NULL, NULL, 'U21 Hull City', 'U21 Charlton Athletic', 11, 7, 6, 3, 9, '0/0.5'),
(15, 7, '2022-12-05 19:00:00', NULL, NULL, 'U21 Newcastle', 'U21 Sheffield Utd', 6, 3, 7, 4, 11, '0/-0.5'),
(16, 8, '2022-12-05 19:00:00', NULL, NULL, 'Brazil', 'Hàn Quốc', 1, 28, 5, 4, 9, '1.5/2'),
(17, 6, '2022-12-05 18:30:00', NULL, NULL, 'U21 St.-Truidense', 'FCV Dender EH U21', 2, 10, 6, 4, 10, '1/1.5'),
(18, 6, '2022-12-05 18:30:00', NULL, NULL, 'U21 RS Waasland Beveren', 'Lierse U21', 4, 8, 13, 3, 16, '0.5'),
(19, 9, '2022-12-05 17:30:00', NULL, NULL, 'Gzira United', 'Inter Milan', 4, 5, 1, 11, 12, '-3.5/4'),
(20, 10, '2022-12-05 17:10:00', NULL, NULL, 'Steaua Bucuresti', 'CS Mioveni', 5, 16, 7, 3, 10, '1/1.5'),
(21, 11, '2022-12-05 17:00:00', NULL, NULL, 'Rizespor', 'Pendikspor', 4, 5, 3, 4, 7, '0/0.5'),
(22, 12, '2022-12-05 17:00:00', NULL, NULL, 'Omonia Nicosia FC', 'Karmiotissa Pano Polemidion', 7, 9, 4, 5, 9, '1/1.5'),
(23, 13, '2022-12-05 17:00:00', NULL, NULL, 'Versailles 78', 'CS Sedan Ardennes', 5, 13, 0, 3, 3, '0/0.5'),
(24, 9, '2022-12-05 15:59:00', NULL, NULL, 'Aris Limassol', 'PAOK Saloniki', 3, 4, 1, 5, 6, '-1/1.5'),
(25, 14, '2022-12-05 15:00:00', NULL, NULL, 'FC Avan Academy', 'FC Pyunik', 2, 4, 10, 3, 13, '0/0.5'),
(26, 8, '2022-12-05 15:00:00', NULL, NULL, 'Nhật Bản', 'Croatia', 24, 12, 5, 4, 9, '-0.5'),
(27, 15, '2022-12-05 15:00:00', NULL, NULL, 'Etehad Alreef', 'Busaiteen', 11, 2, 1, 8, 9, '-1/1.5'),
(28, 15, '2022-12-05 15:00:00', NULL, NULL, 'Malkia', 'Buri', 3, 10, 4, 4, 8, '0.5/1'),
(29, 15, '2022-12-05 15:00:00', NULL, NULL, 'Al-Tadhmon', 'Al-Najma', 12, 1, 2, 4, 6, '-1/1.5'),
(30, 9, '2022-12-05 15:00:00', NULL, NULL, 'Sturm Graz', 'Empoli', 2, 13, 6, 4, 10, '0'),
(31, 7, '2022-12-05 14:00:00', NULL, NULL, 'U21 Crystal Palace', 'U21 Bristol City', 5, 1, 8, 4, 12, '0/-0.5'),
(32, 16, '2022-12-05 13:15:00', NULL, NULL, 'Kallithea', 'AEK Athens B', 8, 9, 5, 8, 13, '1'),
(33, 16, '2022-12-05 13:00:00', NULL, NULL, 'Apollon Kalamaria', 'Apollon Larissas', 14, 9, 3, 2, 5, '1'),
(34, 17, '2022-12-05 13:00:00', NULL, NULL, 'U21 Crewe Alexandra', 'U21 Barnsley', 19, 17, 8, 6, 14, '0/0.5'),
(35, 18, '2022-12-05 12:40:00', NULL, NULL, 'Al Fujairah Club', 'Hatta', 14, 5, 2, 6, 8, '-0.5/1'),
(36, 18, '2022-12-05 12:40:00', NULL, NULL, 'Al Bataeh', 'Al-Jazira Al-Hamra', 9, 3, 3, 4, 7, '1/1.5'),
(37, 18, '2022-12-05 12:40:00', NULL, NULL, 'City Club', 'Al Nasr Dubai', 15, 12, 0, 9, 9, '-3'),
(38, 17, '2022-12-05 12:00:00', NULL, NULL, 'U21 Millwall', 'U21 Ipswich', 2, 8, 7, 6, 13, '1'),
(39, 9, '2022-12-05 12:00:00', NULL, NULL, 'Legia Warszawa', 'GKS Tychy', 2, 11, 8, 2, 10, '1.5'),
(40, 19, '2022-12-05 11:50:00', NULL, NULL, 'Persita Tangerang', 'Bali United FC', 4, 5, 9, 3, 12, '-0.5'),
(41, 20, '2022-12-05 11:30:00', NULL, NULL, 'Henan Songshan Longmen', 'Chengdu Better City FC', 6, 5, 5, 2, 7, '0/0.5'),
(42, 20, '2022-12-05 11:30:00', NULL, NULL, 'Shanghai Shenhua', 'Zhejiang Greentown', 10, 3, 8, 5, 13, '-0.5/1'),
(43, 20, '2022-12-05 11:00:00', NULL, NULL, 'Hebei FC', 'Meizhou Hakka', 18, 9, 2, 2, 4, '-2.5'),
(44, 20, '2022-12-05 11:00:00', NULL, NULL, 'Tianjin Tigers', 'Guangzhou FC', 8, 16, 2, 3, 5, '1'),
(45, 21, '2022-12-05 10:00:00', NULL, NULL, 'Maritimo U23', 'Rio Ave U23', 6, 5, 5, 5, 10, '0/0.5'),
(46, 19, '2022-12-05 09:25:00', NULL, NULL, 'Bhayangkara Solo FC', 'PSS Sleman', 16, 11, 2, 0, 2, '0/0.5'),
(47, 19, '2022-12-05 09:15:00', NULL, NULL, 'PSM Makassar', 'Pstni', 3, 7, 8, 4, 12, '0.5'),
(48, 19, '2022-12-05 09:15:00', NULL, NULL, 'Madura United', 'PSIS Semarang', 2, 13, 7, 1, 8, '0'),
(49, 20, '2022-12-05 07:30:00', NULL, NULL, 'Beijing Guoan', 'Dalian Pro', 7, 12, 3, 3, 6, '1'),
(95, 19, '2022-12-06 08:30:00', NULL, NULL, 'Persebaya Surabaya', 'Barito Putera', 11, 17, 3, 3, 6, '1'),
(96, 22, '2022-12-06 08:30:00', NULL, NULL, 'Real Kashmir FC', 'Sreenidi Deccan', 1, 2, 9, 1, 10, '0/0.5');

-- --------------------------------------------------------

--
-- Table structure for table `new_match_today`
--

CREATE TABLE `new_match_today` (
  `entity_id` int NOT NULL,
  `league_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `datetime` datetime NOT NULL,
  `home_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `away_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `home_position` smallint NOT NULL,
  `away_position` smallint NOT NULL,
  `odd` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `odd_converted` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `new_match_today`
--

INSERT INTO `new_match_today` (`entity_id`, `league_name`, `datetime`, `home_name`, `away_name`, `home_position`, `away_position`, `odd`, `odd_converted`) VALUES
(1, 'IDN ISL', '2022-12-06 08:30:00', 'Persebaya Surabaya', 'Barito Putera', 11, 17, '1', '1'),
(2, 'IND D1', '2022-12-06 08:30:00', 'Real Kashmir FC', 'Sreenidi Deccan', 1, 2, '0/0.5', '0.25'),
(3, 'JAM D1', '2022-12-06 00:30:00', 'Arnett Gardens', 'Molynes United', 5, 8, '0.5/1', '0.75'),
(4, 'JAM D1', '2022-12-05 22:00:00', 'Chapelton', 'Portmore United', 12, 11, '-0.5', '-0.5'),
(5, 'PORLC', '2022-12-05 20:45:00', 'CD Mafra', 'Vizela', 12, 13, '0/-0.5', '0.75'),
(6, 'SPA D2', '2022-12-05 20:00:00', 'SD Ponferradina', 'Burgos CF', 20, 3, '0', '0'),
(7, 'ENG CN', '2022-12-05 19:45:00', 'Bradford Park Avenue', 'AFC Telford United', 18, 24, '0', '0'),
(8, 'ITA C1', '2022-12-05 19:30:00', 'Delfino Pescara 1936', 'Taranto Sport', 3, 17, '1.5/2', '1.75'),
(9, 'BEL U21', '2022-12-05 19:00:00', 'Deinze U21', 'U21 Kortrijk', 12, 7, '-0.5', '-0.5'),
(10, 'BEL U21', '2022-12-05 19:00:00', 'RWD Molenbeek U21', 'U21 AS Eupen', 9, 3, '-0.5/1', '-0.75'),
(11, 'BEL U21', '2022-12-05 19:00:00', 'U21 Westerlo', 'U21 Lommel SK', 5, 6, '0.5', '0.5'),
(12, 'ENG U21LC', '2022-12-05 19:00:00', 'U21 Hull City', 'U21 Charlton Athletic', 11, 7, '0/0.5', '0.25'),
(13, 'ENG U21LC', '2022-12-05 19:00:00', 'U21 Newcastle', 'U21 Sheffield Utd', 6, 3, '0/-0.5', '0.75'),
(14, 'World Cup', '2022-12-05 19:00:00', 'Brazil', 'Hàn Quốc', 1, 28, '1.5/2', '1.75'),
(15, 'BEL U21', '2022-12-05 18:30:00', 'U21 St.-Truidense', 'FCV Dender EH U21', 2, 10, '1/1.5', '1.25'),
(16, 'BEL U21', '2022-12-05 18:30:00', 'U21 RS Waasland Beveren', 'Lierse U21', 4, 8, '0.5', '0.5'),
(17, 'INT CF', '2022-12-05 17:30:00', 'Gzira United', 'Inter Milan', 4, 5, '-3.5/4', '-3.75'),
(18, 'ROM D1', '2022-12-05 17:10:00', 'Steaua Bucuresti', 'CS Mioveni', 5, 16, '1/1.5', '1.25'),
(19, 'TFF 1. Lig', '2022-12-05 17:00:00', 'Rizespor', 'Pendikspor', 4, 5, '0/0.5', '0.25'),
(20, 'CYP D1', '2022-12-05 17:00:00', 'Omonia Nicosia FC', 'Karmiotissa Pano Polemidion', 7, 9, '1/1.5', '1.25'),
(21, 'FRA D3', '2022-12-05 17:00:00', 'Versailles 78', 'CS Sedan Ardennes', 5, 13, '0/0.5', '0.25'),
(22, 'INT CF', '2022-12-05 15:59:00', 'Aris Limassol', 'PAOK Saloniki', 3, 4, '-1/1.5', '-1.25'),
(23, 'ARM D1', '2022-12-05 15:00:00', 'FC Avan Academy', 'FC Pyunik', 2, 4, '0/0.5', '0.25'),
(24, 'World Cup', '2022-12-05 15:00:00', 'Nhật Bản', 'Croatia', 24, 12, '-0.5', '-0.5'),
(25, 'BHR D', '2022-12-05 15:00:00', 'Etehad Alreef', 'Busaiteen', 11, 2, '-1/1.5', '-1.25'),
(26, 'BHR D', '2022-12-05 15:00:00', 'Malkia', 'Buri', 3, 10, '0.5/1', '0.75'),
(27, 'BHR D', '2022-12-05 15:00:00', 'Al-Tadhmon', 'Al-Najma', 12, 1, '-1/1.5', '-1.25'),
(28, 'INT CF', '2022-12-05 15:00:00', 'Sturm Graz', 'Empoli', 2, 13, '0', '0'),
(29, 'ENG U21LC', '2022-12-05 14:00:00', 'U21 Crystal Palace', 'U21 Bristol City', 5, 1, '0/-0.5', '0.75'),
(30, 'GRE D2', '2022-12-05 13:15:00', 'Kallithea', 'AEK Athens B', 8, 9, '1', '1'),
(31, 'GRE D2', '2022-12-05 13:00:00', 'Apollon Kalamaria', 'Apollon Larissas', 14, 9, '1', '1'),
(32, 'ENG U21D2', '2022-12-05 13:00:00', 'U21 Crewe Alexandra', 'U21 Barnsley', 19, 17, '0/0.5', '0.25'),
(33, 'UAE', '2022-12-05 12:40:00', 'Al Fujairah Club', 'Hatta', 14, 5, '-0.5/1', '-0.75'),
(34, 'UAE', '2022-12-05 12:40:00', 'Al Bataeh', 'Al-Jazira Al-Hamra', 9, 3, '1/1.5', '1.25'),
(35, 'UAE', '2022-12-05 12:40:00', 'City Club', 'Al Nasr Dubai', 15, 12, '-3', '-3'),
(36, 'ENG U21D2', '2022-12-05 12:00:00', 'U21 Millwall', 'U21 Ipswich', 2, 8, '1', '1'),
(37, 'INT CF', '2022-12-05 12:00:00', 'Legia Warszawa', 'GKS Tychy', 2, 11, '1.5', '1.5'),
(38, 'IDN ISL', '2022-12-05 11:50:00', 'Persita Tangerang', 'Bali United FC', 4, 5, '-0.5', '-0.5'),
(39, 'CHA CSL', '2022-12-05 11:30:00', 'Henan Songshan Longmen', 'Chengdu Better City FC', 6, 5, '0/0.5', '0.25'),
(40, 'CHA CSL', '2022-12-05 11:30:00', 'Shanghai Shenhua', 'Zhejiang Greentown', 10, 3, '-0.5/1', '-0.75'),
(41, 'CHA CSL', '2022-12-05 11:00:00', 'Hebei FC', 'Meizhou Hakka', 18, 9, '-2.5', '-2.5'),
(42, 'CHA CSL', '2022-12-05 11:00:00', 'Tianjin Tigers', 'Guangzhou FC', 8, 16, '1', '1'),
(43, 'INT CF', '2022-12-05 10:30:00', 'Adana Demirspor', 'Fortuna Sittard', 3, 12, '0.5/1', '0.75');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `club_entity`
--
ALTER TABLE `club_entity`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `eav_entity_type`
--
ALTER TABLE `eav_entity_type`
  ADD PRIMARY KEY (`entity_type_id`);

--
-- Indexes for table `league_club`
--
ALTER TABLE `league_club`
  ADD PRIMARY KEY (`league_id`,`club_id`),
  ADD KEY `club_id` (`club_id`);

--
-- Indexes for table `league_entity`
--
ALTER TABLE `league_entity`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `name_2` (`name`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `match_entity`
--
ALTER TABLE `match_entity`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `datetime` (`datetime`,`home_name`,`away_name`),
  ADD KEY `home_club_id` (`home_club_id`),
  ADD KEY `away_club_id` (`away_club_id`),
  ADD KEY `league_id` (`league_id`);

--
-- Indexes for table `new_match_today`
--
ALTER TABLE `new_match_today`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `datetime` (`datetime`,`home_name`,`away_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `club_entity`
--
ALTER TABLE `club_entity`
  MODIFY `entity_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `eav_entity_type`
--
ALTER TABLE `eav_entity_type`
  MODIFY `entity_type_id` smallint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `league_entity`
--
ALTER TABLE `league_entity`
  MODIFY `entity_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `match_entity`
--
ALTER TABLE `match_entity`
  MODIFY `entity_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `new_match_today`
--
ALTER TABLE `new_match_today`
  MODIFY `entity_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `league_club`
--
ALTER TABLE `league_club`
  ADD CONSTRAINT `league_club_ibfk_1` FOREIGN KEY (`league_id`) REFERENCES `league_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `league_club_ibfk_2` FOREIGN KEY (`club_id`) REFERENCES `club_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `match_entity`
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
