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
-- Cấu trúc bảng cho bảng `random_list_item`
--

CREATE TABLE `random_list_item` (
  `entity_id` int NOT NULL,
  `list_id` int NOT NULL,
  `match_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `random_list_item`
--

INSERT INTO `random_list_item` (`entity_id`, `list_id`, `match_id`) VALUES
(1, 1, 6),
(2, 1, 15),
(3, 1, 17),
(4, 1, 18),
(5, 2, 2),
(6, 2, 9),
(7, 2, 13),
(8, 2, 21),
(9, 3, 3),
(10, 3, 10),
(11, 3, 16),
(12, 3, 22),
(13, 4, 4),
(14, 4, 8),
(15, 4, 12),
(16, 4, 24),
(21, 6, 3),
(22, 6, 7),
(23, 6, 17),
(24, 6, 21);

--
-- Chỉ mục cho các bảng đã đổ
--

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
-- AUTO_INCREMENT cho bảng `random_list_item`
--
ALTER TABLE `random_list_item`
  MODIFY `entity_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Các ràng buộc cho các bảng đã đổ
--

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
