-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th2 16, 2023 lúc 11:47 PM
-- Phiên bản máy phục vụ: 8.0.32-0ubuntu0.20.04.2
-- Phiên bản PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
-- Cấu trúc bảng cho bảng `new_match_today`
--

CREATE TABLE `new_match_today` (
  `entity_id` int NOT NULL,
  `league_name` varchar(200) DEFAULT NULL,
  `datetime` varchar(200) NOT NULL,
  `result` int NOT NULL COMMENT '3 is draw, 2 is not set, 1 is win, 0 is lose, 4 is not found',
  `home_name` varchar(200) NOT NULL,
  `away_name` varchar(200) NOT NULL,
  `home_position` smallint NOT NULL,
  `away_position` smallint NOT NULL,
  `odd` varchar(50) NOT NULL,
  `odd_converted` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `new_match_today`
--

INSERT INTO `new_match_today` (`entity_id`, `league_name`, `datetime`, `result`, `home_name`, `away_name`, `home_position`, `away_position`, `odd`, `odd_converted`) VALUES
(1, 'VĐQG Ai Cập', '2023-02-16 17:00:00', 2, 'Pyramids FC', 'Enppi', 2, 14, '1', '1'),
(2, 'VĐQG Ả Rập Xê Út', '2023-02-16 17:30:00', 2, 'Al-Ettifaq', 'Al Ittihad Jeddah', 10, 3, '-1', '-1'),
(3, 'Europa League', '2023-02-16 17:45:00', 2, 'Ajax Amsterdam', 'Union Berlin', 3, 2, '0.5', '0.5'),
(4, 'Europa League', '2023-02-16 17:45:00', 2, 'Red Bull Salzburg', 'AS Roma', 1, 4, '0/-0.5', '-0.75'),
(5, 'Europa League', '2023-02-16 17:45:00', 2, 'Barcelona', 'Manchester United', 1, 3, '0.5/1', '0.75'),
(6, 'Europa League', '2023-02-16 17:45:00', 2, 'FC Shakhtar Donetsk', 'Stade Rennais FC', 2, 6, '0/-0.5', '-0.75'),
(7, 'Europa League', '2023-02-16 20:00:00', 2, 'Juventus', 'Nantes', 9, 13, '1.5', '1.5'),
(8, 'Europa League', '2023-02-16 20:00:00', 2, 'Sevilla', 'PSV Eindhoven', 12, 4, '0/0.5', '0.25'),
(9, 'Europa League', '2023-02-16 20:00:00', 2, 'Bayer Leverkusen', 'AS Monaco', 8, 3, '0/0.5', '0.25'),
(10, 'Europa League', '2023-02-16 20:00:00', 2, 'Sporting Clube de Portugal', 'Midtjylland', 4, 7, '1.5', '1.5'),
(11, 'Brazil Campeonato Paulista', '2023-02-16 21:00:00', 2, 'Mirassol FC', 'Ituano (SP)', 11, 15, '0.5', '0.5'),
(12, 'Brazil Campeonato Paulista', '2023-02-16 22:30:00', 2, 'EC Santo Andre', 'Santos', 8, 13, '0/-0.5', '-0.75'),
(13, 'VĐQG Chilê', '2023-02-16 23:30:00', 2, 'Curico Unido', 'CD Copiapo S.A.', 9, 16, '0.5/1', '0.75'),
(14, 'Brazil Campeonato Carioca', '2023-02-16 23:30:00', 2, 'Vasco Gama', 'Botafogo (RJ)', 6, 2, '0', '0'),
(15, 'Copa Libertadores', '2023-02-17 00:00:00', 2, 'Zamora FC Barinas', 'Boston River', 7, 10, '0/0.5', '0.25'),
(16, 'Brazil Campeonato Paulista', '2023-02-17 00:30:00', 2, 'Corinthians Paulista (SP)', 'Palmeiras', 4, 1, '0/-0.5', '-0.75'),
(17, 'Mexico Liga MX', '2023-02-17 03:00:00', 2, 'Mazatlan FC', 'Pachuca', 18, 4, '-0.5', '-0.5'),
(18, 'VĐQG Indonesia', '2023-02-17 08:00:00', 2, 'PSIS Semarang', 'Persis Solo FC', 8, 10, '0/0.5', '0.25'),
(19, 'NPL Victoria Úc', '2023-02-17 08:30:00', 2, 'Bentleigh Greens', 'North Geelong Warriors', 9, 10, '1', '1'),
(20, 'VĐQG Úc', '2023-02-17 08:45:00', 2, 'Western United FC', 'Wellington Phoenix', 11, 6, '0', '0'),
(21, 'NPL Victoria Úc', '2023-02-17 09:30:00', 2, 'Heidelberg United', 'Dandenong Thunder', 5, 8, '0.5', '0.5'),
(22, 'NPL Victoria Úc', '2023-02-17 09:30:00', 2, 'Oakleigh Cannons', 'Green Gully Cavaliers', 1, 2, '0.5/1', '0.75'),
(23, 'VĐQG Nhật Bản', '2023-02-17 10:00:00', 2, 'Kawasaki Frontale', 'Yokohama F Marinos', 2, 1, '0', '0'),
(24, 'VĐQG Indonesia', '2023-02-17 10:00:00', 2, 'PSS Sleman', 'Dewa United FC', 12, 14, '0/-0.5', '-0.75');

--
-- Chỉ mục cho các bảng đã đổ
--

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
-- AUTO_INCREMENT cho bảng `new_match_today`
--
ALTER TABLE `new_match_today`
  MODIFY `entity_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
