-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 05, 2022 lúc 05:01 PM
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

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `match_entity`
--

CREATE TABLE `match_entity` (
  `entity_id` int(11) NOT NULL,
  `league_id` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `home_club_id` int(11) NOT NULL,
  `away_club_id` int(11) NOT NULL,
  `home_position` int(11) NOT NULL,
  `away_position` int(11) NOT NULL,
  `home_corner` int(11) DEFAULT NULL,
  `away_corner` int(11) DEFAULT NULL,
  `total_corner` int(11) DEFAULT NULL,
  `odd` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `club_entity`
--
ALTER TABLE `club_entity`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `name` (`name`);

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
-- Chỉ mục cho bảng `match_entity`
--
ALTER TABLE `match_entity`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `DATETIME_HOME_ID_AWAY_ID` (`datetime`,`home_club_id`,`away_club_id`),
  ADD KEY `home_club_id` (`home_club_id`),
  ADD KEY `away_club_id` (`away_club_id`),
  ADD KEY `league_id` (`league_id`);

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
  MODIFY `entity_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `match_entity`
--
ALTER TABLE `match_entity`
  MODIFY `entity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
