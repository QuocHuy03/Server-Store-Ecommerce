-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th7 26, 2023 lúc 04:00 AM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ecommerce`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `nameCategory` varchar(255) NOT NULL,
  `slugCategory` varchar(255) NOT NULL,
  `outstandingCategory` varchar(255) NOT NULL,
  `statusCategory` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `nameCategory`, `slugCategory`, `outstandingCategory`, `statusCategory`, `createdAt`, `updatedAt`) VALUES
(29, 'Dell', 'dell', 'outstanding', 'stocking', '2023-06-29 22:24:45', '2023-06-29 22:24:45'),
(30, 'MSI', 'msi', 'outstanding', 'stocking', '2023-06-29 22:25:00', '2023-06-29 22:25:00'),
(31, 'Macbook', 'macbook', 'notstandout', 'stocking', '2023-06-29 22:25:11', '2023-06-29 22:25:11'),
(44, 'Lenovo', 'lenovo', 'outstanding', 'stocking', '2023-06-30 14:56:32', '2023-06-30 14:56:32'),
(51, 'Asus', 'asus', 'outstanding', 'out-of-stock', '2023-07-01 17:02:07', '2023-07-01 17:02:07'),
(52, 'Acer', 'acer', 'outstanding', 'stocking', '2023-07-26 10:47:02', '2023-07-26 10:47:02'),
(53, ' LG Gram', 'lg-gram', 'outstanding', 'stocking', '2023-07-26 10:49:30', '2023-07-26 10:49:30'),
(54, 'Razer', 'razer', 'outstanding', 'stocking', '2023-07-26 10:49:50', '2023-07-26 10:49:50'),
(55, 'HP', 'hp', 'outstanding', 'stocking', '2023-07-26 10:50:07', '2023-07-26 10:50:07'),
(56, 'Samsung', 'samsung', 'outstanding', 'stocking', '2023-07-26 10:50:46', '2023-07-26 10:50:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `colors`
--

CREATE TABLE `colors` (
  `id` int NOT NULL,
  `nameColor` varchar(255) NOT NULL,
  `product_color_id` int NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `colors`
--

INSERT INTO `colors` (`id`, `nameColor`, `product_color_id`, `createdAt`, `updatedAt`) VALUES
(61, 'black', 16, '2023-07-26 09:33:34', '2023-07-26 09:33:34'),
(62, 'red', 16, '2023-07-26 09:33:34', '2023-07-26 09:33:34'),
(65, 'black', 18, '2023-07-26 10:35:16', '2023-07-26 10:35:16'),
(66, 'white', 18, '2023-07-26 10:35:16', '2023-07-26 10:35:16'),
(67, 'white', 19, '2023-07-26 10:39:05', '2023-07-26 10:39:05'),
(68, 'black', 17, '2023-07-26 10:39:18', '2023-07-26 10:39:18'),
(69, 'white', 17, '2023-07-26 10:39:18', '2023-07-26 10:39:18'),
(70, 'black', 20, '2023-07-26 10:42:42', '2023-07-26 10:42:42'),
(71, 'black', 21, '2023-07-26 10:45:18', '2023-07-26 10:45:18'),
(72, 'black', 22, '2023-07-26 10:48:32', '2023-07-26 10:48:32'),
(73, 'white', 23, '2023-07-26 10:52:48', '2023-07-26 10:52:48'),
(76, 'black', 24, '2023-07-26 10:56:52', '2023-07-26 10:56:52'),
(77, 'white', 25, '2023-07-26 10:59:46', '2023-07-26 10:59:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discounts`
--

CREATE TABLE `discounts` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `totalPrice` int NOT NULL,
  `userID` int NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `images`
--

CREATE TABLE `images` (
  `id` int NOT NULL,
  `product_image_id` int NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `createAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `images`
--

INSERT INTO `images` (`id`, `product_image_id`, `image_path`, `createAt`, `updatedAt`) VALUES
(45, 16, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/bjunwf9kjz9a5qhbwtxw.png', '2023-07-08 23:35:36', '2023-07-08 23:35:36'),
(46, 16, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/d8axwyhk8htgiiiha4ph.png', '2023-07-08 23:35:36', '2023-07-08 23:35:36'),
(47, 16, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/ueeyobaolsrdqbqmnvh7.png', '2023-07-08 23:35:36', '2023-07-08 23:35:36'),
(48, 16, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/h1ldbu6rirj0ghpfvj3m.png', '2023-07-08 23:35:36', '2023-07-08 23:35:36'),
(62, 17, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690207514/ul3uvrvdh0hnjuyl2hy7.jpg', '2023-07-24 21:05:16', '2023-07-24 21:05:16'),
(63, 17, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690207513/ltwyucbvlzp7f1dcgwiw.jpg', '2023-07-24 21:05:16', '2023-07-24 21:05:16'),
(64, 17, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690207514/hp87nveuxjelrtbyinsx.jpg', '2023-07-24 21:05:16', '2023-07-24 21:05:16'),
(65, 17, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690207512/mytcpqye4t1jpeirbsg1.jpg', '2023-07-24 21:05:16', '2023-07-24 21:05:16'),
(66, 18, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690341870/xat8pjrxsmzhrzpwtjip.jpg', '2023-07-26 10:24:30', '2023-07-26 10:24:30'),
(67, 18, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690341870/oss6zh6x1edgmzdpxwlm.jpg', '2023-07-26 10:24:30', '2023-07-26 10:24:30'),
(68, 18, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690341870/kk0wc5kraiwjinr25erk.jpg', '2023-07-26 10:24:30', '2023-07-26 10:24:30'),
(69, 18, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690341870/vhepy7npjhlnqy0njwuk.jpg', '2023-07-26 10:24:30', '2023-07-26 10:24:30'),
(70, 19, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690342745/g18hrxasmquojudzjyav.png', '2023-07-26 10:39:05', '2023-07-26 10:39:05'),
(71, 19, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690342745/jjqgkdxzpnlfagjpvb8s.png', '2023-07-26 10:39:05', '2023-07-26 10:39:05'),
(72, 19, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690342745/we9m7vhod5yo12ivguqb.png', '2023-07-26 10:39:05', '2023-07-26 10:39:05'),
(73, 19, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690342745/qudf9cbjmhwkwmy01ytv.png', '2023-07-26 10:39:05', '2023-07-26 10:39:05'),
(74, 20, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690342962/dhpcf37ap2lid6efh5c3.png', '2023-07-26 10:42:42', '2023-07-26 10:42:42'),
(75, 20, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690342962/oig9jnma61dq4cjhfd1w.png', '2023-07-26 10:42:42', '2023-07-26 10:42:42'),
(76, 20, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690342962/ocypawpxaluziwszdb5o.png', '2023-07-26 10:42:42', '2023-07-26 10:42:42'),
(77, 20, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690342962/nz1jvnu7efx8jtgfysej.png', '2023-07-26 10:42:42', '2023-07-26 10:42:42'),
(78, 21, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690343118/iftzvl7qelj0wci33vbw.png', '2023-07-26 10:45:18', '2023-07-26 10:45:18'),
(79, 21, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690343118/yfbndjdgluqc4zu5gm5o.png', '2023-07-26 10:45:18', '2023-07-26 10:45:18'),
(80, 21, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690343118/etbvilb5lp5l9hi8yoor.png', '2023-07-26 10:45:18', '2023-07-26 10:45:18'),
(81, 21, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690343118/yqnb6fwc69pngac6x6zl.png', '2023-07-26 10:45:18', '2023-07-26 10:45:18'),
(82, 22, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690343312/szca43imvfeq4euoiftx.png', '2023-07-26 10:48:32', '2023-07-26 10:48:32'),
(83, 22, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690343312/uys8kjmk7uefbpts7fqu.png', '2023-07-26 10:48:32', '2023-07-26 10:48:32'),
(84, 22, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690343312/bbvjocn9f8wlzw5ymzbw.png', '2023-07-26 10:48:32', '2023-07-26 10:48:32'),
(85, 22, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690343312/w1oibxbydqj3yvkjrihk.png', '2023-07-26 10:48:32', '2023-07-26 10:48:32'),
(86, 23, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690343568/mqcxeop258cicjewr5hh.png', '2023-07-26 10:52:48', '2023-07-26 10:52:48'),
(87, 23, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690343568/frtksyi8dhmojxspe0y0.png', '2023-07-26 10:52:48', '2023-07-26 10:52:48'),
(88, 23, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690343568/qsior8o7uiqa0ph6jopm.png', '2023-07-26 10:52:48', '2023-07-26 10:52:48'),
(89, 23, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690343568/dweggpsjvkxcgv3fjbjz.png', '2023-07-26 10:52:48', '2023-07-26 10:52:48'),
(94, 24, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690343780/bsrunljzoe2n31il42jr.jpg', '2023-07-26 10:56:20', '2023-07-26 10:56:20'),
(95, 24, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690343780/nfpaykq9jnydsrfccfcb.jpg', '2023-07-26 10:56:20', '2023-07-26 10:56:20'),
(96, 24, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690343780/mjgyxdq9sowiqnphwkwh.jpg', '2023-07-26 10:56:20', '2023-07-26 10:56:20'),
(97, 24, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690343780/dkkugzc7kzrostzvqzlr.jpg', '2023-07-26 10:56:20', '2023-07-26 10:56:20'),
(98, 25, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690343985/tej1cdjexfbn6ckttgvb.png', '2023-07-26 10:59:46', '2023-07-26 10:59:46'),
(99, 25, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690343985/xak3y5d3hpur3hhc5aov.png', '2023-07-26 10:59:46', '2023-07-26 10:59:46'),
(100, 25, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690343985/qhk178b9johgxhymm3an.png', '2023-07-26 10:59:46', '2023-07-26 10:59:46'),
(101, 25, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690343986/w8khnyey2fiwfm8uzr6m.png', '2023-07-26 10:59:46', '2023-07-26 10:59:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `code` varchar(255) NOT NULL,
  `userID` int NOT NULL,
  `vnpayID` int DEFAULT NULL,
  `productOrder` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `totalPrice` int NOT NULL,
  `paymentMethod` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `code`, `userID`, `vnpayID`, `productOrder`, `totalPrice`, `paymentMethod`, `status`, `createdAt`, `updatedAt`) VALUES
(36, '5d0e2e6d-d0de-4523-84fd-d13c4d308b02', 6, 1, '[{\"id\":16,\"name\":\"ASUS ROG Strix G17 G713\",\"color\":\"black\",\"price\":46000000,\"image\":\"https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/bjunwf9kjz9a5qhbwtxw.png,https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/d8axwyhk8htgiiiha4ph.png,https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/h1ldbu6rirj0ghpfvj3m.png,https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/ueeyobaolsrdqbqmnvh7.png\",\"category\":\"Asus\",\"quantity\":1}]', 45960000, 'vnpay', 'Đã Thanh Toán', '2023-07-21 18:00:37', '2023-07-21 18:00:37'),
(37, 'd274742a-6a08-4551-b72c-5b7e6caa0ac4', 6, NULL, '[{\"id\":16,\"name\":\"ASUS ROG Strix G17 G713\",\"color\":\"black\",\"price\":46000000,\"image\":\"https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/bjunwf9kjz9a5qhbwtxw.png,https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/d8axwyhk8htgiiiha4ph.png,https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/h1ldbu6rirj0ghpfvj3m.png,https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/ueeyobaolsrdqbqmnvh7.png\",\"category\":\"Asus\",\"quantity\":1}]', 45960000, 'receive', 'Chưa Thanh Toán', '2023-07-21 18:02:38', '2023-07-21 18:02:38'),
(38, '8d280382-58de-443f-be83-2e216fc6c639', 6, 2, '[{\"id\":16,\"name\":\"ASUS ROG Strix G17 G713\",\"color\":\"black\",\"price\":46000000,\"image\":\"https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/bjunwf9kjz9a5qhbwtxw.png,https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/d8axwyhk8htgiiiha4ph.png,https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/h1ldbu6rirj0ghpfvj3m.png,https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/ueeyobaolsrdqbqmnvh7.png\",\"category\":\"Asus\",\"quantity\":1}]', 45960000, 'vnpay', 'Đã Thanh Toán', '2023-07-21 18:26:25', '2023-07-21 18:26:25'),
(60, '0580045f-a10c-495f-8cc7-fdc14d23b82d', 6, NULL, '[{\"id\":16,\"name\":\"ASUS ROG Strix G17 G713\",\"color\":\"black\",\"price\":46000000,\"image\":\"https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/bjunwf9kjz9a5qhbwtxw.png,https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/d8axwyhk8htgiiiha4ph.png,https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/h1ldbu6rirj0ghpfvj3m.png,https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/ueeyobaolsrdqbqmnvh7.png\",\"category\":\"Asus\",\"quantity\":2}]', 91460000, 'receive', 'Chưa Thanh Toán', '2023-07-22 07:14:01', '2023-07-22 07:14:01'),
(62, 'e33a0426-2538-4a38-95e1-791f42855b88', 6, 4, '[{\"id\":16,\"name\":\"ASUS ROG Strix G17 G713\",\"color\":\"black\",\"price\":46000000,\"image\":\"https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/bjunwf9kjz9a5qhbwtxw.png,https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/d8axwyhk8htgiiiha4ph.png,https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/h1ldbu6rirj0ghpfvj3m.png,https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/ueeyobaolsrdqbqmnvh7.png\",\"category\":\"Asus\",\"quantity\":2}]', 91960000, 'vnpay', 'Đã Thanh Toán', '2023-07-22 07:16:31', '2023-07-22 07:16:31'),
(63, '85e9b61b-5484-4fca-8ff6-1d8c7153b9b4', 6, NULL, '[{\"id\":16,\"name\":\"ASUS ROG Strix G17 G713\",\"color\":\"black\",\"price\":46000000,\"image\":\"https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/bjunwf9kjz9a5qhbwtxw.png,https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/d8axwyhk8htgiiiha4ph.png,https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/h1ldbu6rirj0ghpfvj3m.png,https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/ueeyobaolsrdqbqmnvh7.png\",\"category\":\"Asus\",\"quantity\":2}]', 91460000, 'receive', 'Chưa Thanh Toán', '2023-07-22 07:18:02', '2023-07-22 07:18:02'),
(64, '0d458349-9ceb-4a68-9381-45a18d303bc8', 6, NULL, '[{\"id\":16,\"name\":\"ASUS ROG Strix G17 G713\",\"color\":\"black\",\"price\":46000000,\"image\":\"https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/bjunwf9kjz9a5qhbwtxw.png,https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/d8axwyhk8htgiiiha4ph.png,https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/h1ldbu6rirj0ghpfvj3m.png,https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/ueeyobaolsrdqbqmnvh7.png\",\"category\":\"Asus\",\"quantity\":1}]', 45960000, 'receive', 'Chưa Thanh Toán', '2023-07-24 20:50:39', '2023-07-24 20:50:39'),
(65, '47ab49f7-5f43-4e5f-bc61-c1388f1ebcda', 6, NULL, '[{\"id\":16,\"name\":\"ASUS ROG Strix G17 G713\",\"color\":\"black\",\"price\":46000000,\"image\":\"https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/bjunwf9kjz9a5qhbwtxw.png,https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/d8axwyhk8htgiiiha4ph.png,https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/h1ldbu6rirj0ghpfvj3m.png,https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/ueeyobaolsrdqbqmnvh7.png\",\"category\":\"Asus\",\"quantity\":2}]', 91460000, 'receive', 'Chưa Thanh Toán', '2023-07-24 20:51:28', '2023-07-24 20:51:28'),
(66, '293ea547-9aba-44ac-a494-42b248348956', 6, NULL, '[{\"id\":17,\"name\":\"MacBook Pro M2 Pro 2023\",\"color\":\"yellow\",\"price\":56000000,\"image\":\"https://res.cloudinary.com/djy3vgwfi/image/upload/v1690207512/mytcpqye4t1jpeirbsg1.jpg,https://res.cloudinary.com/djy3vgwfi/image/upload/v1690207513/ltwyucbvlzp7f1dcgwiw.jpg,https://res.cloudinary.com/djy3vgwfi/image/upload/v1690207514/hp87nveuxjelrtbyinsx.jpg,https://res.cloudinary.com/djy3vgwfi/image/upload/v1690207514/ul3uvrvdh0hnjuyl2hy7.jpg\",\"category\":\"Macbook\",\"quantity\":1},{\"id\":16,\"name\":\"ASUS ROG Strix G17 G713\",\"color\":\"red\",\"price\":46000000,\"image\":\"https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/bjunwf9kjz9a5qhbwtxw.png,https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/d8axwyhk8htgiiiha4ph.png,https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/h1ldbu6rirj0ghpfvj3m.png,https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/ueeyobaolsrdqbqmnvh7.png\",\"category\":\"Asus\",\"quantity\":1}]', 101460000, 'receive', 'Chưa Thanh Toán', '2023-07-24 21:06:19', '2023-07-24 21:06:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `paymentvnpay`
--

CREATE TABLE `paymentvnpay` (
  `id` int NOT NULL,
  `vnp_Amount` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `vnp_BankCode` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `vnp_BankTranNo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `vnp_CardType` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `vnp_OrderInfo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `vnp_TransactionNo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `paymentvnpay`
--

INSERT INTO `paymentvnpay` (`id`, `vnp_Amount`, `vnp_BankCode`, `vnp_BankTranNo`, `vnp_CardType`, `vnp_OrderInfo`, `vnp_TransactionNo`) VALUES
(1, '4596000000', 'NCB', 'VNP14072936', 'ATM', 'Thanh toan cho ma GD:21175728', '14072936'),
(2, '4596000000', 'NCB', 'VNP14072956', 'ATM', 'Thanh toan cho ma GD:21182521', '14072956'),
(4, '9196000000', 'NCB', 'VNP14073086', 'ATM', 'Thanh toan cho ma GD:22071556', '14073086');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `slugProduct` varchar(255) NOT NULL,
  `nameProduct` varchar(255) NOT NULL,
  `price_has_ropped` int NOT NULL,
  `categoryID` int NOT NULL,
  `initial_price` int NOT NULL,
  `contentProduct` text NOT NULL,
  `descriptionProduct` text NOT NULL,
  `statusProduct` varchar(255) NOT NULL,
  `createAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `slugProduct`, `nameProduct`, `price_has_ropped`, `categoryID`, `initial_price`, `contentProduct`, `descriptionProduct`, `statusProduct`, `createAt`, `updatedAt`) VALUES
(16, 'asus-rog-strix-g17-g713', 'ASUS ROG Strix G17 G713', 43500000, 51, 46000000, '<p><strong>Bộ vi xử lí</strong>: AMD Ryzen™ 9 7845HX Mobile Processor (12-core/24-thread, 12MB L2 cache, 64MB L3 cache, 3.0Ghz up to 5.2GHz max boost)</p><p><strong>RAM</strong>: 16GB DDR5-4800Mhz upto 32GB</p><p><strong>Bộ nhớ</strong>: 1TB PCIe® 4.0 NVMe™ M.2 SSD</p><p><strong>Card đồ hoạ:</strong> NVIDIA® GeForce RTX™ 4060 Laptop GPU 8GB GDDR6</p><p><strong>Màn hình:</strong> 17.3 inch 2.5K 240Hz</p><p><strong>Tình trạng sản phẩm:</strong>&nbsp;Mới 100% Nhập Khẩu Chính Hãng</p><p><strong>Bảo hành:&nbsp; 12 Tháng</strong></p>', '<p><strong>Laptop ASUS ROG Strix G17 G713</strong> tích hợp hàng loạt công nghệ hiện đại cùng cấu hình cực mạnh cho khả năng chơi game không giới hạn. Dòng máy tính xách tay chơi game cao cấp của ASUS chắc chắn sẽ làm hài lòng những game thủ khó tính nhất.</p><p>&nbsp;</p><p><i>Nguồn: ASUS</i></p><h2>Thiết kế ASUS ROG Strix G17 G713 hầm hố, mạnh mẽ</h2><p>Laptop Asus được hoàn thiện từ chất liệu vỏ nhựa với mặt sau bằng kim loại, các đường vân trên nắp máy sang trọng nhưng không kém phần hầm hố. 2.9kg vẫn nằm gọn trong một trong các ngăn của balo nên bạn có thể mang theo đi làm, đi chơi. Ánh sáng bàn phím Per-Key RGB cho phép bạn thể hiện phong cách của mình và khơi dậy hiệu quả chiến đấu, đồng thời giúp bạn làm việc dễ dàng trong môi trường thiếu sáng.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/ASUS/asus-rog-strix-g17-g713-2023/asus-rog-strix-g17-g713-2023-review.png\" alt=\"asus-rog-strix-g17-g713-2023\"></p><p>&nbsp;</p><h2>Hiệu suất ASUS ROG Strix G17 G713 mạnh mẽ</h2><p>ASUS ROG Strix G17 G713 chạy bộ xử lý AMD Ryzen™ 9 7845HX Mobile Processor (12-core/24-thread, 12MB L2 cache, 64MB L3 cache, 3.0Ghz up to 5.2GHz max boost), giúp máy chạy ở hiệu suất cao nhất khi chơi game. Đa nhiệm mượt mà không giật lag. ASUS ROG Strix G17 G713RM được trang bị bộ nhớ DDR5-4800 tiêu chuẩn và PCle 4.0 mới nhất cho khả năng phản hồi tuyệt vời. Ổ cứng 1TB cho bạn thoải mái lưu trữ game dung lượng lớn hay chạy các phần mềm thiết kế chuyên nghiệp.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/ASUS/asus-rog-strix-g17-g713-2023/2.png\" alt=\"asus-rog-strix-g17-g713-2023\"></p><p>&nbsp;</p><h2>Màn hình sắc nét, hệ thống tản nhiệt thông minh</h2><p>Laptop thiết kế đồ họa ASUS ROG Strix G17 G713 trang bị màn hình 2.5K 240Hz và công nghệ tiên tiến cho màu sắc rực rỡ và hạn chế lag khung hình. Công nghệ MUX Switch cải thiện hiệu suất đồ họa bằng cách kết nối trực tiếp card đồ họa với màn hình. Quạt Arc Flow với 84 cánh quạt chạy liên tục giúp nhiệt độ của máy luôn ở mức tối ưu. Thêm vào đó, hệ thống âm thanh vòm Dolby Atmos mang đến âm thanh sống động, chất lượng cao ở mọi nơi.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/ASUS/asus-rog-strix-g17-g713-2023/1.png\" alt=\"\"></p><p>&nbsp;</p><h2>Camera và âm thanh</h2><p>Máy tính xách tay không có webcam tích hợp giúp tăng cường bảo mật cho người dùng đồng thời giảm dấu chân của bất động sản màn hình lớn hơn. Nếu cần sử dụng webcam để họp trực tuyến hoặc phát trực tuyến, bạn có thể mua một webcam riêng để kết nối với máy tính xách tay của mình. Thưởng thức âm nhạc và phim đắm chìm, hay nghe rõ tiếng bước chân của đối thủ trên chiến trường ảo nhờ chứng nhận Hi-Res, Smart AMP và công nghệ Dolby Atmos tái tạo âm thanh độ nét cao, âm thanh vòm 3D sống động.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/ASUS/asus-rog-strix-g17-g713-2023/asus-rog-strix-g17-g713-2023-am-thanh.png\" alt=\"asus-rog-strix-g17-g713-2023\"></p><p>&nbsp;</p><h2>Hệ thống kết nối trên ASUS ROG Strix G17 G713</h2><p>Cạnh bên của laptop được trang bị các cổng kết nối thông dụng như: USB 3.2 Gen 2 Type-C, USB 3.2, LAN (RJ45) và USB Type-C phục vụ mọi nhu cầu truyền tải dữ liệu.</p>', 'stocking', '2023-07-08 23:16:10', '2023-07-08 23:16:10'),
(17, 'macbook-pro-m2-pro-2023', 'MacBook Pro M2 Pro 2023', 56000000, 31, 61000000, '<p><strong>Bộ vi xử lí</strong>: Apple M2 Pro chip 12-core CPU with 8 performance cores and 4 efficiency cores</p><p><strong>RAM:</strong> 16GB unified memory (Không hỗ trợ nâng cấp)</p><p><strong>Bộ nhớ:</strong> 512GB SSD</p><p><strong>Card đồ hoạ:&nbsp;</strong>Card tích hợp - 19-core GPU</p><p><strong>Màn hình: </strong>16.2 inch Liquid Retina XDR display (3456 x 2234), upto 120Hz, ProMotion, Wide color (P3), Độ sáng 1000 nits, True Tone Technology, 1 tỷ màu</p><p><strong>Thông số kỹ thuật tại hãng: </strong><a href=\"https://support.apple.com/kb/SP890?locale=en_US\"><strong>Click Link</strong></a></p><p><strong>Tình trạng sản phẩm:</strong>&nbsp;Mới 100% Nhập Khẩu Chính Hãng</p><p><strong>Bảo hành: 12 Tháng -&nbsp;</strong>Tuỳ chọn gói bảo hành mở rộng tới 24 tháng</p>', '<p>Đưa chip M2 Pro vào <strong>MacBook Pro 16 inch M2 Pro 2023</strong>, và Apple đã tạo ra mẫu laptop chuyên nghiệp nhất từ ​​trước đến nay. MacBook 2023 thế hệ tiếp theo sẽ giúp bạn xử lý mọi tác vụ nặng một cách nhanh chóng, với đồ họa tuyệt đẹp trên màn hình Liquid Retina XDR 16 inch và thời lượng pin dài kéo dài cả ngày.</p><p>&nbsp;</p><p><i>Nguồn: Austin Medz</i></p><h2>Duy trì thiết kế sang trọng, tỉ mỉ trong từng chi tiết</h2><p>Lớp vỏ kim loại không chỉ đủ chắc chắn để bảo vệ các linh kiện bên trong mà còn mang đến vẻ ngoài cực kỳ sang trọng. Bốn góc được bo cong tinh tế giảm biến dạng khi va chạm, logo “quả táo cắn dở” vẫn nằm chính giữa mặt lưng thu hút mọi ánh nhìn. Máy nặng 2,15kg và dày 16,8mm. Tuy nhiên, máy tính xách tay công nghệ đồ họa vẫn cho phép bạn linh hoạt di chuyển.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/Laptop/Macbook/Macbook-pro-16-inch-m2-pro-2023/macbook-pro-16-inch-m2-pro-2023-thiet-ke.png\" alt=\"macbook-pro-16-inch-m2-pro-2023\"></p><p>&nbsp;</p><p>Chỉ với một lần chạm thông qua cảm biến vân tay (Touch ID) được tích hợp trên nút nguồn, bạn có thể mở khóa <a href=\"https://laptopre.vn/laptop-apple-macbook-pro-16\">MacBook Pro</a> rất nhanh chóng. Nó không chỉ rút ngắn thời gian thao tác đăng nhập mà còn đảm bảo tính bảo mật cho dữ liệu bên trong so với mật khẩu truyền thống. Bàn phím Magic mang lại cảm giác gõ mượt mà trong khi gõ, giảm thiểu tác động của tiếng ồn đến những người xung quanh bạn, đồng thời hành trình ổn định và bố cục phím được sắp xếp hợp lý giúp tăng tốc độ gõ. Bàn phím cũng được trang bị đèn nền giúp người dùng làm việc tốt hơn trong môi trường thiếu sáng.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/Laptop/Macbook/Macbook-pro-16-inch-m2-pro-2023/macbook-pro-16-inch-m2-pro-2023-ban-phim.png\" alt=\"macbook-pro-16-inch-m2-pro-2023\"></p><p>&nbsp;</p><h2>Xử lý mượt mà mọi tác vụ nhờ con chip Apple M2 Pro</h2><p>Vẫn được sản xuất trên tiến trình 5nm, chip Apple M2 Pro có nhiều điểm cải tiến so với thế hệ <a href=\"https://laptopre.vn/laptop/macbook-pro-16-m1-pro-2021\">M1 Pro</a> ra mắt trước đó. Với CPU 12 nhân và băng thông bộ nhớ 200 GB/s sẽ cung cấp thêm 20% năng lượng để chạy mượt mà mọi tác vụ từ cơ bản đến nâng cao mà vẫn rất tiết kiệm điện năng. <a href=\"https://laptopre.vn/laptop-macbook\">Apple MacBook</a> có đồ họa tích hợp với 19 lõi GPU, mang lại hiệu suất đồ họa cao hơn 30% so với người tiền nhiệm và Công cụ thần kinh nhanh hơn 40% để tăng tốc các tác vụ đồ họa. . Người dùng có thể chỉnh sửa hình ảnh, thiết kế, chỉnh sửa video hay dựng video trên phần mềm đồ họa một cách hoàn toàn dễ dàng.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/Laptop/Macbook/Macbook-pro-16-inch-m2-pro-2023/macbook-pro-16-inch-m2-pro-2023-hieu-nang-1.png\" alt=\"macbook-pro-16-inch-m2-pro-2023\"></p><p>Được trang bị RAM 16 GB, chiếc MacBook này có khả năng chạy đa nhiệm cực kỳ mượt mà, cho phép người dùng mở nhiều cửa sổ làm việc, nhiều lớp đồ họa, file Excel dung lượng lớn,… mà không gặp bất kỳ trở ngại nào. Ngoài ra, máy còn có tốc độ đọc ghi cực nhanh, thời gian khởi động của ổ cứng SSD 512GB được rút ngắn.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/Laptop/Macbook/Macbook-pro-16-inch-m2-pro-2023/macbook-pro-16-inch-m2-pro-2023-am-thanh.png\" alt=\"macbook-pro-16-inch-m2-pro-2023\"></p><p>&nbsp;</p><h2>Màn hình chất lượng cao cho công việc và giải trí trọn vẹn</h2><p>Tự hào với màn hình 16,2 inch rộng rãi, <a href=\"https://laptopre.vn/thiet-bi-van-phong-man-hinh\">màn hình</a> Liquid Retina XDR (3456 x 2234) mang đến nội dung vô cùng sắc nét, kết hợp với màu sắc của công nghệ Gam màu rộng (P3). Rất sống động và chính xác đến từng chi tiết, phù hợp với người dùng làm việc trong lĩnh vực thiết kế. Với độ sáng 1000 nit, nội dung có thể được hiển thị rõ ràng trong nhiều môi trường sáng khác nhau, đảm bảo người dùng có thể làm việc hiệu quả bất kể họ ở đâu. Công nghệ True Tone trên MacBook Pro 2023 có thể tự động điều chỉnh độ sáng màn hình theo môi trường xung quanh để mang đến cho người dùng hình ảnh tự nhiên nhất.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/Laptop/Macbook/Macbook-pro-16-inch-m2-pro-2023/macbook-pro-16-inch-m2-pro-2023-man-hinh.png\" alt=\"macbook-pro-16-inch-m2-pro-2023\"></p><p>&nbsp;</p><p>Màn hình này cũng có tần số quét lên đến 120 Hz, kết hợp với công nghệ ProMotion tự động điều chỉnh để phù hợp với chuyển động của nội dung phục vụ nhu cầu chơi game, đồ họa và giải trí nhiều hơn. Khi chỉnh sửa video, bạn cũng có thể chọn tốc độ làm mới khung hình cho phù hợp với từng đoạn phim. Hệ thống âm thanh đa chiều Dolby Atmos sử dụng công nghệ âm thanh stereo và không gian rộng giúp người dùng đắm chìm trong không gian âm thanh sống động để tận hưởng những giai điệu say đắm hay những thước phim hành động gay cấn.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/Laptop/Macbook/Macbook-pro-16-inch-m2-pro-2023/macbook-pro-16-inch-m2-pro-2023-am-thanh-1.png\" alt=\"macbook-pro-16-inch-m2-pro-2023\"></p><p>&nbsp;</p><h2>Hệ thống kết nối trên MacBook Pro 16 inch M2 Pro 2023</h2><p>MacBook Pro 16 inch M2 Pro 2023 được trang bị 3 cổng Thunderbolt 4, HDMI và jack cắm tai nghe 3.5mm được phân bổ gọn gàng ở cạnh bên của laptop tạo nên tổng thể đẹp mắt nhưng vẫn đảm bảo kết nối và truyền tải dữ liệu trong quá trình sử dụng. Đảm bảo kết nối mạng của bạn luôn ổn định với Wi-Fi 6E (802.11ax) và kết nối không dây nhanh qua Bluetooth 5.3.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/Laptop/Macbook/Macbook-pro-16-inch-m2-pro-2023/macbook-pro-16-inch-m2-pro-2023-ket-noi.png\" alt=\"macbook-pro-16-inch-m2-pro-2023\"></p><p>&nbsp;</p><h2>Lời kết</h2><p>MacBook Pro 16 inch M2 Pro 2023 có thiết kế thời trang, cùng hiệu năng mạnh mẽ của chip Apple M2 Pro có thể xử lý mọi tác vụ, trở thành chiếc máy tính xách tay hoàn hảo cho công việc và cuộc sống của bạn.</p>', 'stocking', '2023-07-24 21:03:14', '2023-07-24 21:03:14'),
(18, 'macbook-pro-13-m1-2020-touch-bar', 'Macbook Pro 13 M1 2020 Touch Bar', 19800000, 31, 36000000, '<p><strong>Bộ vi xử lí:&nbsp;</strong>Apple M1 chip with 8‑core CPU and 8‑core GPU</p><p><strong>RAM:&nbsp;</strong>8 GB</p><p><strong>Bộ nhớ:&nbsp;</strong>256GB SSD</p><p><strong>Card đồ hoạ:&nbsp;</strong>Card tích hợp - 8 nhân GPU</p><p><strong>Màn hình:&nbsp;</strong>13.3 inch Retina (2560 x 1600), 500 nits brightness, LED Backlit, Retina, True Tone Technology, Tấm nền IPS</p><p><strong>Tình trạng sản phẩm:&nbsp;</strong>Mới 99% Like New Full Box</p>', '<p>Macbook Pro 2020 M1 MYD82SA kế thừa thiết kế sang trọng của các thế hệ trước Cấu hình bên trong đến từ con chip M1 lần đầu tiên xuất hiện trên MacBook Pro Hiệu năng CPU của máy được nâng lên 2,8 lần, hiệu năng GPU tăng lên 5 lần.</p><p>&nbsp;</p><p><i>Nguồn: Tim Schofield</i></p><h2>Thiết kế Macbook Pro M1 2020 mỏng, nhẹ, cao cấp</h2><p>Vẫn là thiết kế kim loại nguyên khối thường thấy ở các thế hệ trước, phiên bản Macbook Pro M1 2020 luôn mang đến vẻ ngoài thanh lịch và sang trọng, độ dày chỉ 15,6 mm, trọng lượng 1,4 kg có thể dễ dàng mang đi bất kì đâu.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/Laptop/Macbook/macbook-pro-2020-m1-myd82saa/macbook-pro-2020-m1-myd82saa-laptop-moi.jpg\" alt=\"macbook-pro-2020-m1-myd82saa\"></p><p>&nbsp;</p><h2>Hiệu năng mạnh mẽ từ chip Apple M1</h2><p>Macbook Pro M1 2020 sở hữu chip M1 độc quyền cho dòng Macbook, được phát triển theo kiến ​​trúc ARM mới, có nhiều chức năng bất ngờ giúp nâng cao hiệu suất hoạt động tối đa của máy. Với hiệu suất gấp 3,5 lần GPU 8 nhân, bạn có thể dễ dàng xử lý Word, Excel, ... Không những vậy, máy phát huy tối đa hiệu năng và phục vụ các yêu cầu đồ họa phức tạp như phần mềm AI và Photoshop, giúp thao tác mượt mà hơn. Giải phóng khả năng sáng tạo nội dung, sử dụng mượt mà kết xuất video, kết xuất 3D, phát sóng trực tiếp độ nét cao lên đến 4K đáng kinh ngạc và các thao tác khác để tiết kiệm điện năng cho thiết bị.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/Laptop/Macbook/macbook-pro-2020-m1-myd82saa/macbook-pro-2020-m1-myd82saa-moi.jpg\" alt=\"macbook-pro-2020-m1-myd82saa\"></p><p>&nbsp;</p><p>RAM 8 GB đáp ứng tốt đa nhiệm, bạn có thể sử dụng nhiều ứng dụng cùng lúc ổn định hơn, tránh bị chậm trễ khi thao tác, lướt Internet nhanh hơn, các ứng dụng văn phòng mượt mà hơn, dễ dàng xử lý công việc thiết kế đồ họa. Nhờ có ổ cứng SSD 256GB mà thời gian khởi động hay mở các phần mềm nặng được tiết kiệm hơn, tốc độ đọc ghi thông tin cũng được cải thiện nhanh chóng. Ngoài ra, bạn có thể lưu trữ dữ liệu công việc, những bộ phim hay,… một cách tiện lợi. Ngoài nâng cấp về hiệu năng, kho ứng dụng trên macOS cũng được cập nhật để tương thích với chip mới và cải tiến nhiều hơn. Bạn có thể tham khảo các ứng dụng tương thích của Macbook chip M1 trên kho ứng dụng này.</p><p><img src=\"https://laptopre.vn/storage/photos/1/Laptop/Macbook/macbook-pro-2020-m1-myd82saa/macbook-pro-2020-m1-myd82saa-da-nang.jpg\" alt=\"\"></p><p>&nbsp;</p><h2>Màn hình Macbook Pro M1 2020 Retina chất lượng cao thời trang với viền mỏng</h2><p>Màn hình 13.3 inch sở hữu khung viền màn hình siêu mỏng, giúp mở rộng không gian nhìn và mang đến cho người xem cảm giác như đang đắm chìm trong không gian giải trí vô cùng sắc nét. Độ phân giải Retina 2560 x 1600, độ sáng lên đến 500 nits, cho hình ảnh đẹp và rõ nét, màu sắc tươi tắn trong từng khung hình. Ngoài ra, công nghệ đèn nền LED giúp màn hình mỏng hơn, tiết kiệm điện năng hơn, tấm nền IPS cho góc nhìn rộng lên đến 178 độ, dù bạn không cần ngồi ở khu vực bàn lễ tân cũng có thể mang đến chất lượng cao. , hình ảnh không bị biến dạng.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/Laptop/Macbook/macbook-pro-2020-m1-myd82saa/macbook-pro-2020-m1-myd82saa.jpg\" alt=\"macbook-pro-2020-m1-myd82saa\"></p><p>&nbsp;</p><h2>Bàn phím, âm thanh và bảo mật cảm biến vân tay</h2><p>Có ý kiến ​​cho rằng, bàn phím Magic trên Macbook Pro 2020 M1 MYD82SA đã khắc phục được hầu hết những khuyết điểm của các thế hệ bàn phím Butterfly trước đây. Với sự hỗ trợ của đèn nền và các phím tắt, bạn có thể xử lý công việc một cách thuận tiện và nhanh chóng hơn. Hệ thống loa kép kết hợp với công nghệ Dolby Atmos, MacBook mang đến trải nghiệm âm thanh tuyệt vời, với chất lượng âm thanh rõ ràng và sống động đến từng chi tiết, thoải mái thưởng thức phim, nhạc, game giải trí. Máy tính xách tay có tới 3 micrô tích hợp để đảm bảo chất lượng cuộc gọi tốt hơn khi thực hiện cuộc gọi video, họp trực tuyến và học tập với gia đình hoặc bạn bè. Apple trang bị cho laptop Macbook Pro 2020 M1 MYD82SA chip bảo mật T2 có thể mã hóa dữ liệu ổ cứng, tích hợp cảm biến vân tay nhỏ gọn nên bạn có thể mở nhanh chỉ với một lần chạm mà không mất quá nhiều thời gian và nhập mật khẩu rườm rà.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/Laptop/Macbook/macbook-pro-2020-m1-myd82saa/macbook-pro-2020-m1-myd82saa-laptop-new.jpg\" alt=\"macbook-pro-2020-m1-myd82saa\"></p><p>&nbsp;</p><h2>Hệ thống kết nối trên Macbook Pro M1 2020</h2><p>Macbook Pro M1 2020 được trang bị hai cổng Thunderbolt 3 (USB-C) ở hai bên thân máy bay, có thể nhanh chóng sạc và truyền dữ liệu với tốc độ lên đến 40 Gb / giây, đồng thời dễ dàng xuất dữ liệu ra màn hình, máy chiếu và chia sẻ thông tin.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/Laptop/Macbook/macbook-pro-2020-m1-myd82saa/macbook-pro-2020-m1-myd82saa-new.jpg\" alt=\"macbook-pro-2020-m1-myd82saa\"></p><p>&nbsp;</p><h2>Lời kết</h2><p>Macbook Pro M1 2020 mang thiết kế sang trọng và tinh tế, kết hợp với hiệu năng mạnh mẽ, dễ dàng hơn trong việc xử lý mọi tác vụ, đây chắc chắn là một sản phẩm máy tính xách tay sang trọng và lịch lãm đáng có.</p>', 'stocking', '2023-07-26 10:24:30', '2023-07-26 10:24:30'),
(19, 'dell-inspiron-14-7430-2-in-1', 'Dell Inspiron 14 7430 2 in 1', 16300000, 29, 21000000, '<p><strong>Bộ vi xử lí</strong>: 13th Gen Intel® Core™ i5-1335U (12 MB cache, 10 cores, 12 threads, up to 4.60 GHz Turbo)</p><p><strong>RAM</strong>: 8 GB, LPDDR5, 4800 MHz, integrated</p><p><strong>Bộ nhớ:</strong> 512 GB, M.2, PCIe NVMe, SSD</p><p><strong>Card đồ hoạ:</strong> Intel® Iris® Xe Graphics</p><p><strong>Màn hình:</strong> 14.0-inch 16:10 FHD+ (1920 x 1200) Touch 250nits WVA Display with ComfortView Support</p><p><strong>Chi tiết thông số từ kỹ thuật Dell:</strong> <a href=\"https://www.dell.com/en-uk/shop/laptops-2-in-1-pcs/inspiron-14-2-in-1-laptop/spd/inspiron-14-7430-2-in-1-laptop\">Click Link</a></p><p><strong>Tình trạng sản phẩm:&nbsp;</strong>Mới 100% Nhập Khẩu Chính Hãng</p><p><strong>Bảo hành:&nbsp; 12 Tháng -&nbsp;</strong>Tuỳ chọn gói bảo hành mở rộng tới 24 tháng</p>', '<p>Khả năng gập mở linh hoạt, cấu hình mạnh mẽ, thiết kế tinh tế, màn hình chất lượng cao, <strong>Dell Inspiron 14 7430 2 in 1</strong> dành cho những ai thiên về thao tác, cảm ứng và cần một thiết bị đủ sức sáng tạo các tác vụ, thuyết trình... Từ người dùng thông thường đến người tạo nội dung, doanh nhân, v.v. Hãy cùng <a href=\"https://laptopre.vn/\">laptopre.vn</a> tìm hiểu rõ hơn về sản phẩm qua bài viết dưới đây nhé!</p><p>&nbsp;</p><p><i>Nguồn: Dell</i></p><h2>Thiết kế xoay gập 360 độ</h2><p>Laptop Dell Inspiron 14 7430 2 in 1 trông rất đẹp với các chi tiết được sắp xếp hợp lý và các điểm nhấn màu bạc sang trọng, nắp lưng và chiếu nghỉ tay bằng kim loại cũng mang đến sự chắc chắn trong quá trình sử dụng. Trọng lượng tổng thể của <a href=\"https://laptopre.vn/laptop\">laptop</a> là 1.58 kg rất thuận tiện để bạn mang theo đi làm. Ngoài ra, bản lề được thiết kế để mở và gập 360 độ, hoàn toàn có thể sử dụng máy như một chiếc máy tính bảng.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/DELL/7430-2-in-1-inspiron/dell-inspiron-14-7430-2-in-1-thiet-ke.png\" alt=\"dell-inspiron-14-7430-2-in-1\"></p><p>&nbsp;</p><h2>Hiệu năng Dell Inspiron 14 7430 2 in 1 ổn định</h2><p><a href=\"https://laptopre.vn/laptop-dell\">Laptop Dell</a> được trang bị bộ vi xử lý Intel Core i5 1335U thế hệ thứ 13 mới kết hợp với đồ họa Intel Iris Xe có sức mạnh xử lý mạnh mẽ giúp thực hiện mượt mà mọi tác vụ trên PowerPoint, Word, Excel… hay các ứng dụng đồ họa, thiết kế phức tạp cho các tác vụ công việc hàng ngày. Bộ nhớ RAM 8GB giúp máy chạy đa nhiệm hiệu quả, chạy đồng thời nhiều ứng dụng hay tác vụ nặng mà không bị đơ, giật lag. SSD 512 GB PCIe NVMe cho phép truy cập và lưu trữ dữ liệu nhanh hơn so với ổ cứng truyền thống, đồng thời cung cấp nhiều không gian lưu trữ cho tài liệu và tệp.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/DELL/7430-2-in-1-inspiron/dell-inspiron-14-7430-2-in-1-hieu-nang.png\" alt=\"dell-inspiron-14-7430-2-in-1\"></p><p>&nbsp;</p><h2>Màn hình 14 inch FHD+ cảm ứng sắc nét</h2><p>Laptop Dell Inspiron 14 7430 2 in 1 được trang bị <a href=\"https://laptopre.vn/thiet-bi-van-phong-man-hinh\">màn hình</a> 14 inch sử dụng tấm nền WVA với độ phân giải Full HD+ (1920 x 1200), đáp ứng độ rõ nét và chi tiết hình ảnh cao cho các hoạt động làm việc cũng như giải trí của bạn. Hơn nữa, màn hình còn hỗ trợ chức năng cảm ứng, cho phép người dùng thao tác trực tiếp, tiện lợi hơn rất nhiều so với việc sử dụng chuột và bàn phím.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/DELL/7430-2-in-1-inspiron/dell-inspiron-14-7430-2-in-1-man-hinh.png\" alt=\"dell-inspiron-14-7430-2-in-1\"></p><p>&nbsp;</p><h2>Âm thanh và webcam</h2><p>Công nghệ Waves MaxxAudio Pro và Dolby Atmos mang đến âm thanh tần số cao rõ ràng, to và tái tạo âm thanh vòm, hứa hẹn mang đến trải nghiệm nghe nhạc, xem phim sống động và chân thực cho người dùng. Webcam Full HD giúp bạn làm việc và học tập trực tuyến mà không cần kết nối với các thiết bị bên ngoài. Ngoài ra, đèn nền phím cũng hỗ trợ người dùng sử dụng tốt hơn ngay cả trong môi trường thiếu sáng, tính năng bảo mật vân tay cũng giúp truy cập máy an toàn, bảo mật chỉ với một chạm.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/DELL/7430-2-in-1-inspiron/dell-inspiron-14-7430-2-in-1-review.png\" alt=\"dell-inspiron-14-7430-2-in-1\"></p><p>&nbsp;</p><h2>Bàn phím và touchpad</h2><p>Khác với nhiều sản phẩm <a href=\"https://laptopre.vn/laptop-dell-inspiron\">Inspiron</a> thế hệ mới khác có bàn phím nhô ra hai bên, Dell Inspiron 14 7430 2 in 1 sẽ có khu vực này hơi dốc vào trong để không gian ngoài cùng có thể chứa hai thanh loa âm thanh. Các keycaps có kích thước hợp lý và hành trình gõ ổn. Không quá nổi bật nhưng dễ sử dụng và dễ làm quen với người dùng mới. Touchpad của Dell Inspiron 14 cũng được hoàn thiện tốt, cho cảm giác lướt web thoải mái, độ phản hồi cũng tốt. Nhờ trình điều khiển Windows Precision được cài đặt sẵn, mọi thao tác của người dùng trong khu vực này cũng sẽ được thực hiện chính xác.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/DELL/7430-2-in-1-inspiron/dell-inspiron-14-7430-2-in-1-ban-phim.png\" alt=\"dell-inspiron-14-7430-2-in-1\"></p><p>&nbsp;</p><h2>Hệ thống kết nối trên Dell Inspiron 14 7430 2 in 1</h2><p>Về cổng kết nối, Dell Inspiron 14 7430 2 in 1 sẽ được trang bị 2 cổng USB-C hỗ trợ giao thức Thunderbolt 4, 1 cổng USB-A 3.2 Gen1, cổng HDMI 1.4, khe cắm thẻ nhớ SD và giắc cắm tai nghe 3.5mm kết hợp . Nói chung số cổng này vừa đủ để chúng ta cắm sạc smartphone, sạc laptop và kết nối các thiết bị ngoại vi như chuột, thẻ nhớ. Các kết nối không dây thiết bị sử dụng sẽ là Bluetooth 5.2 và Intel Wi-Fi 6E – hai công nghệ mới đảm bảo chất lượng trao đổi thông tin tốt nhất.</p>', 'stocking', '2023-07-26 10:39:05', '2023-07-26 10:39:05'),
(20, 'laptop-msi-cyborg-15-i5-12450h-rtx-4050-6gb-moi-100percent', 'Laptop MSI Cyborg 15/ i5-12450H/ RTX 4050 6GB - Mới 100%', 21900000, 30, 25000000, '<p><strong>Bộ vi xử lí:</strong> Intel® Core™ i5-12450H, 8 nhân 12 luồng, 3.30 Ghz upto 4.40 Ghz, 12MB cache</p><p><strong>RAM:</strong> 8GB (1 x 8GB) DDR5 4800MHz (2x SO-DIMM socket, up to 64GB SDRAM)</p><p><strong>Bộ nhớ</strong>: 512GB NVMe PCIe Gen 4 SSD</p><p><strong>Card đồ hoạ:</strong> NVIDIA® GeForce RTX™ 4050 Laptop GPU 6GB GDDR6</p><p><strong>Màn hình:</strong> 15.6\" FHD (1920*1080), 144Hz 45%NTSC IPS-Level</p><p><strong>Tình trạng sản phẩm:</strong>&nbsp;Mới 100% Nhập Khẩu Chính Hãng</p><p><strong>Bảo hành: 12 Tháng -&nbsp;</strong>Tuỳ chọn gói bảo hành mở rộng tới 24 tháng&nbsp;</p>', '<p><strong>Laptop MSI Cyborg 15</strong>&nbsp;với cấu hình mạnh mẽ, màn hình tốc độ cao cùng thiết kế trẻ trung, năng động đáp ứng tốt nhu cầu chơi game và làm việc đồ họa, phù hợp với nhiều đối tượng người dùng.&nbsp;</p><p>&nbsp;</p><p><i>Nguồn: MSI Gaming</i></p><h2>Thiết kế hướng đến tương lai</h2><p>Đúng như tên gọi, MSI Cyborg 15 mang một vẻ ngoài rất hiện đại, với những đường nét thể hiện vẻ đẹp của công nghệ tương lai. Mặt dưới của laptop gaming <a href=\"https://laptopre.vn/laptop-msi\">MSI</a> nhấn mạnh slogan của dòng sản phẩm Nhà Rồng - \"MSI True Gaming\", như một lời khẳng định về nhóm người dùng mà nó thuộc về. Vỏ sau của máy tính xách tay được làm bằng chất liệu kim loại nguyên khối, với các điểm nhấn màu đen và các chi tiết mạ crôm mang lại vẻ bóng bẩy, sang trọng.&nbsp;</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/MSI/msi-cyborg-15-a12ucx-281vn/msi-cyborg-15-a12ucx-281vn-review.png\" alt=\"msi-cyborg-15-a12ucx-281vn\"></p><p>&nbsp;</p><h2>Hiệu năng MSI Cyborg 15 ổn định với CPU thế hệ 12</h2><p>Máy tính xách tay MSI Cyborg 15 có bộ xử lý Intel Core i5 12450H và card đồ họa NVIDIA GeForce RTX 4050 6GB. Các thông số này phù hợp để chơi các game đồ họa chuyên sâu và làm việc với các phần mềm sử dụng nhiều tài nguyên như Photoshop, Illustrator, Premiere Pro hay AutoCAD và SolidWorks. Bộ nhớ DDR5 dung lượng 8 GB, có thể nâng cấp lên đến 64 GB cho phép máy chạy nhiều tác vụ cùng lúc, xử lý đa tác vụ nhanh chóng và hiệu quả. Ổ cứng SSD 512 GB cung cấp cho người dùng không gian lưu trữ rộng rãi để dễ dàng lưu trữ các tệp cá nhân, phần mềm và các dữ liệu khác.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/MSI/msi-cyborg-15-a12ucx-281vn/msi-cyborg-15-a12ucx-281vn-hieu-nang-1.png\" alt=\"msi-cyborg-15-a12ucx-281vn\"></p><p>&nbsp;</p><h2>Màn hình 15.6 inch sắc nét với 144Hz</h2><p>MSI Cyborg 15 hiển thị mọi chi tiết hình ảnh trên <a href=\"https://laptopre.vn/thiet-bi-van-phong-man-hinh\">màn hình</a> 15,6 inch. Với độ phân giải Full HD và 45% NTSC, A12UCX 281VN cho phép người dùng tận hưởng trọn vẹn từng khoảnh khắc. Sinh ra dành cho game thủ, laptop MSI không thể bỏ qua tần số quét lên đến 144Hz, đảm bảo vận hành mượt mà và bắt trọn mọi hành động của mọi game.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/MSI/msi-cyborg-15-a12ucx-281vn/msi-cyborg-15-a12ucx-281vn-man-hinh.png\" alt=\"msi-cyborg-15-a12ucx-281vn\"></p><p>&nbsp;</p><h2>Bàn phím dành riêng cho game thủ</h2><p>MSI Cyborg 15 A12 có thiết kế bàn phím full-size cao cấp. Bố cục nút hợp lý, vị trí nút và khoảng cách được tính toán kỹ lưỡng. Kết hợp với độ nảy phím tốt giúp cho việc gõ phím nhanh và chính xác. Ngoài ra, bàn phím của MSI Cyborg 15 còn được trang bị một bộ phím WASD khác nhau, giúp người chơi có thể chơi mọi game trên chiếc laptop gaming này. Hệ thống đèn nền đơn sắc màu xanh cũng mở ra không gian đắm chìm trong game tuyệt đẹp cho game thủ.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/MSI/msi-cyborg-15-a12ucx-281vn/msi-cyborg-15-a12ucx-281vn-hieu-nang.png\" alt=\"msi-cyborg-15-a12ucx-281vn\"></p><p>&nbsp;</p><h2>Hệ thống kết nối trên MSI Cyborg 15 A12</h2><p>Nó không thể thiếu với các cổng kết nối của máy tính xách tay chơi game như MSI Cyborg 15. Dragon House trang bị cho “Chiến binh” của mình các cổng USB 3.2 Gen1 Type-C/Type-A thông dụng nhất, cổng HDMI hỗ trợ 4K@60Hz, RJ45 và hỗ trợ ngõ ra âm thanh. Tất cả những điều này đều được tích hợp đầy đủ trên MSI Cyborg 15 để đáp ứng mọi nhu cầu kết nối thiết bị ngoại vi trong quá trình sử dụng.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/MSI/msi-cyborg-15-a12ucx-281vn/msi-cyborg-15-a12ucx-281vn-ket-noi.png\" alt=\"msi-cyborg-15-a12ucx-281vn\"></p><p>&nbsp;</p><h2>Lời kết</h2><p>Dựa vào những thông tin trên, có thể đánh giá MSI Cyborg 15 là một mẫu laptop lý tưởng cho những chiếc laptop thích sự mới lạ và mức giá đột phá.</p>', 'stocking', '2023-07-26 10:42:42', '2023-07-26 10:42:42'),
(21, 'lenovo-xiaoxin-14-pro', 'Lenovo Xiaoxin 14 Pro', 15700000, 44, 19000000, '<p><strong>Bộ vi xử lí</strong>: AMD Ryzen™ 7 6800HS, 8 nhân 16 luồng, 3.20 Ghz upto 4.70 Ghz, 4MB L2 cache, 16MB L3 cache</p><p><strong>RAM</strong>: 16GB RAM Dual Channel LPDDR5</p><p><strong>Bộ nhớ:</strong> 512GB PCIe 4.0 SSD</p><p><strong>Card đồ hoạ:</strong> AMD Radeon 680M Graphics</p><p><strong>Màn hình:</strong> 14 inch 2.8K (2880x1800) 16:10, 120Hz, 100% sRGB</p><p><strong>Tình trạng sản phẩm:&nbsp;</strong>Mới 100% Nhập Khẩu Chính Hãng</p><p><strong>Bảo hành:&nbsp; 12 Tháng -&nbsp;</strong>Tuỳ chọn gói bảo hành mở rộng tới 24 tháng</p>', '<h2>Thiết kế sang trọng, đậm chất Lenovo</h2><p>Thân máy Lenovo Xiaoxin 14 Pro được làm bằng kim loại nguyên khối cho cảm giác bền bỉ, chắc chắn nhưng vẫn rất sang trọng. Máy có trọng lượng khoảng 1.3kg và dày 14.6 mm, đủ để bạn cho vào balo đi đến bất kì đâu.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/LENOVO/xiaoxin-14-pro/lenovo-xiaoxin-14-pro-new.png\" alt=\"lenovo-xiaoxin-14-pro\"></p><p>&nbsp;</p><h2>Màn hình 14 inch sắc nét</h2><p>Lenovo Xiaoxin 14 Pro có <a href=\"https://laptopre.vn/thiet-bi-van-phong-man-hinh\">màn hình</a> 14 inch, độ phân giải 2,8K (2880x1800), tốc độ làm mới 120Hz, chứng nhận bảo vệ mắt TUVRhineland và công nghệ làm mờ DC. Giúp hình ảnh trở nên rõ ràng sắc nét, không bị nhòe khi chuyển động nhanh.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/LENOVO/xiaoxin-14-pro/lenovo-xiaoxin-14-pro.png\" alt=\"lenovo-xiaoxin-14-pro\"></p><p>&nbsp;</p><h2>Hiệu năng Lenovo Xiaoxin 14 Pro ổn định</h2><p>Laptop Lenovo Xiaoxin 14 Pro được trang bị bộ vi xử lí AMD Ryzen™ 7 6800HS, 8 nhân 16 luồng, 3.20 Ghz upto 4.70 Ghz, 4MB L2 cache, 16MB L3 cache. Bên cạnh đó với bộ nhớ RAM 16GB và SSD 512GB cho khả năng đa nhiệm và lưu trữ rộng lớn. Card đồ họa tích hợp AMD Radeon 680M Graphics mạnh mẽ giúp người dùng thực hiện các tác vụ văn phòng, hoặc đồ họa ở mức cơ bản.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/LENOVO/xiaoxin-14-pro/lenovo-xiaoxin-14-pro-moi.png\" alt=\"lenovo-xiaoxin-14-pro\"></p><p>&nbsp;</p><h2>Dung lượng pin, âm thanh và cổng kết nối</h2><p>Máy tính xách tay được trang bị pin 61Wh hỗ trợ sạc nhanh PD 100W. Lenovo Xiaoxin Pro 14 được trang bị loa kép hỗ trợ Dolby Atomos. Về cổng kết nối, model này có một cổng 1 Jack 3.5mm, 1 USB-A 3.2 Gen 1, 1 USB-C, 1 USB 4.0 Gen 3 40G.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/LENOVO/xiaoxin-14-pro/lenovo-xiaoxin-14-pro-pin.png\" alt=\"lenovo-xiaoxin-14-pro\"></p><p>&nbsp;</p><h2>Lời kết</h2><p>Trên đây là những đặc điểm nổi bật của chiếc laptop Lenovo Xiaoxin 14 Pro. Đừng quên liên hệ ngay cho <a href=\"https://www.facebook.com/ThanhHuongTechnology\">Thanh Hương</a> nếu bạn quan tâm đến chiếc laptop này nhé!</p>', 'stocking', '2023-07-26 10:45:18', '2023-07-26 10:45:18'),
(22, 'acer-nitro-16-phoenix-an16-51-525e', 'Acer Nitro 16 Phoenix AN16-51-525E', 24300000, 52, 28000000, '<p><strong>CPU:</strong> Intel® Core™ i5-13500H, 12 nhân 16 luồng, 1.90 Ghz upto 4.70 Ghz, 18Mb cache</p><p><strong>RAM:</strong> 16GB (8x2) DDR5 4800MHz (2x SO-DIMM socket, up to 32GB SDRAM)</p><p><strong>Bộ nhớ</strong>: 512GB PCIe NVMe SED SSD (Còn trống 1 khe SSD M.2 PCIe Gen 4)</p><p><strong>Card đồ hoạ:</strong> NVIDIA® GeForce RTX™ 4050 6GB GDDR6</p><p><strong>Màn hình:&nbsp;</strong>16\" WUXGA (1920 x 1200) IPS, Slim Bezel, 165Hz, 400 nits, sRGB 100%, Acer ComfyView™</p><p><strong>Tình trạng sản phẩm:&nbsp;</strong>Mới 100% Nhập Khẩu Chính Hãng</p><p><strong>Bảo hành:&nbsp; 12 Tháng -&nbsp;</strong>Tuỳ chọn gói bảo hành mở rộng tới 24 tháng</p>', '<p>Thương hiệu laptop đến từ Đài Loan không chỉ ghi dấu ấn ở các mẫu laptop văn phòng mà hiển nhiên còn chiếm được cảm tình của game thủ với dòng laptop chơi game tầm trung đình đám Acer Nitro 5. Sau đó, hãng đã trở lại đường đua với mẫu <strong>Acer Nitro 16 Phoenix AN16-51-525E</strong> với vẻ ngoài hầm hố đặc trưng của dòng laptop gaming cùng sức mạnh siêu nội tại hứa hẹn sẽ gây bão trong thời gian tới.</p><p>&nbsp;</p><p><i>Nguồn: Admin Kha</i></p><h2>Thiết kế Acer Nitro 16 Phoenix AN16-51-525E hấp dẫn và hiện đại</h2><p>Acer Nitro 16 Phoenix AN16-51-525E được phủ một lớp sơn đen mờ, mang đến cho game thủ cảm giác mạnh mẽ thường thấy. Ưu điểm của thiết kế này là phần họa tiết phía sau cách điệu mà không quá \"sến\". Logo Nitro hình ba chiều ở trung tâm tạo thành một kết nối liền mạch với kết cấu, thêm vào bản sắc thương hiệu của máy tính xách tay. Khung máy quen thuộc trong dòng máy tính xách tay chơi game của Acer có một diện mạo mới trung tính. Nhờ đó, hệ thống tản nhiệt của Acer Nitro 16 Phoenix được đảm bảo, hiệu năng của chiếc máy tính xách tay luôn ổn định.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/ACER/acer-nitro-16-phoenix-an16-51-525e/acer-nitro-16-phoenix-an16-51-525e-review.png\" alt=\"acer-nitro-16-phoenix-an16-51-525e\"></p><p>&nbsp;</p><h2>Hiệu suất mạnh mẽ chinh phục mọi tựa game</h2><p>Máy tính xách tay chơi game phải tập trung vào hiệu suất. Acer Nitro 16 Phoenix AN16-51-525E vẫn giữ được phong độ và không làm người chơi thất vọng. Được trang bị bộ vi xử lý Intel Core™ i5-13500H, 12 nhân 16 luồng, 1.90 Ghz upto 4.70 Ghz, 18Mb cache, RAM 16GB cho khả năng xử lý tác vụ ổn định, mượt mà và đa nhiệm mượt mà không giật lag.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/ACER/acer-nitro-16-phoenix-an16-51-525e/acer-nitro-16-phoenix-an16-51-525e-1.png\" alt=\"acer-nitro-16-phoenix-an16-51-525e\"></p><p>&nbsp;</p><p>Đồng thời, SSD 512GB mang đến không gian lưu trữ rộng rãi, bạn có thể dễ dàng lưu trữ tất cả các ứng dụng và tài liệu cần thiết trong laptop. Acer Nitro còn được trang bị card đồ họa NVIDIA GeForce RTX 4050 mang đến sức mạnh xử lý đồ họa tốt, đồ họa khi chơi game cũng không gây khó khăn cho Acer Nitro 16 Phoenix.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/ACER/acer-nitro-16-phoenix-an16-51-525e/acer-nitro-16-phoenix-an16-51-525e-3.png\" alt=\"acer-nitro-16-phoenix-an16-51-525e\"></p><p>&nbsp;</p><h2>Màn hình 16 inch sắc nét chân thật</h2><p>Màn hình Acer Nitro 16 Phoenix có kích thước 16 inch độ phân giải WUXGA (1920x1200) trang bị tấm nền IPS cho khả năng hiển thị chính xác, chân thực và cực kỳ sắc nét. Viền màn hình siêu mỏng giúp hình ảnh hiển thị liền mạch và người dùng không bị phân tâm bởi các viền đen lớn có thể ảnh hưởng xấu đến trải nghiệm người dùng. Tất nhiên, đối với các dòng máy tính xách tay chơi game, tần số quét luôn là một vấn đề nóng hổi và thu hút được sự quan tâm nhất định của các game thủ. AN16-51-525E còn được trang bị tốc độ làm mới 165Hz để giúp bạn nắm bắt mọi chuyển động của kẻ thù trong trò chơi của mình và phản ứng tức thì để giúp bạn dẫn đầu kẻ thù và làm chủ mọi trận đấu.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/ACER/acer-nitro-16-phoenix-an16-51-525e/acer-nitro-16-phoenix-an16-51-525e-man-hinh.png\" alt=\"acer-nitro-16-phoenix-an16-51-525e\"></p><p>&nbsp;</p><h2>Bàn phím và touchpad trên Acer Nitro 16 Phoenix AN16-51-525E</h2><p>Bàn phím của laptop Acer là bàn phím full-size đầy đủ tính năng, hỗ trợ tốt mọi nhu cầu của người dùng với việc gõ văn bản, đánh máy, v.v. Thêm vào đó, bàn phím hỗ trợ đèn LED 4 vùng bắt mắt giúp bạn làm việc thoải mái trong mọi điều kiện ánh sáng. Touchpad tương đối nhỏ nhưng đủ cho phép bạn thực hiện một số thao tác đơn giản trên màn hình. Bề mặt mờ để di chuyển chuột dễ dàng. Bàn di chuột cũng được trang bị chức năng cảm ứng đa điểm hiện đại, giúp bàn di chuột phản ứng nhanh và mượt mà hơn.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/ACER/acer-nitro-16-phoenix-an16-51-525e/acer-nitro-16-phoenix-an16-51-525e-ban-phim-1.png\" alt=\"acer-nitro-16-phoenix-an16-51-525e\"></p><p>&nbsp;</p><h2>Khả năng kết nối</h2><p>Nhằm đảm bảo trải nghiệm kết nối của người dùng, Acer Nitro 16 Phoenix được đặc biệt trang bị đầy đủ các cổng kết nối thông dụng hỗ trợ quá trình kết nối với các thiết bị ngoại vi khác nhau. Kết nối Bluetooth 5.1 và WiFi 6E hiện đại đảm bảo kết nối ổn định khi chơi game.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/ACER/acer-nitro-16-phoenix-an16-51-525e/acer-nitro-16-phoenix-an16-51-525e-2.png\" alt=\"acer-nitro-16-phoenix-an16-51-525e\"></p><p>&nbsp;</p><p>Laptop Nitro 16 Phoenix&nbsp; hỗ trợ tất cả các thiết bị ngoại vi cần thiết nhờ có nhiều cổng kết nối. Chúng bao gồm HDMI 2.1 cho chất lượng hình ảnh cực nhanh và chuẩn USB 3.2 mới nhất (cả Gen 1 và Gen 2) cho tốc độ truyền cực nhanh.</p>', 'stocking', '2023-07-26 10:48:32', '2023-07-26 10:48:32'),
(23, 'lg-gram-16z90p-g.ah73a5', 'LG Gram 16Z90P-G.AH73A5', 36600000, 53, 45000000, '<p><strong>Bộ vi xử lí:&nbsp;</strong>Intel Core i7 Tiger Lake - 1165G7, 4 nhân 8 luồng, 2.80 Ghz Turbo Boost 4.70 Ghz, 12MB cache</p><p><strong>RAM:&nbsp;</strong>16GB LPDDR4X 4266MHz</p><p><strong>Bộ nhớ:&nbsp;</strong>256GB PCIe M.2 2280 NVMe SSD</p><p><strong>Card đồ hoạ:&nbsp;</strong>Intel Iris Xe Graphics&nbsp;</p><p><strong>Màn hình:&nbsp;</strong>16.0\" WQXGA (2560 x 1600), IPS LCD, DCI-P3 99% (Typical, min 95%)</p><p><strong>Tình trạng sản phẩm:&nbsp;</strong>Mới 100%</p><p>Xem thêm cấu hình chi tiết</p>', '<p><strong>LG Gram 16Z90P - G.AH73A5</strong> là một chiếc laptop nhỏ gọn và hiệu năng ổn định. Hãy cùng <a href=\"https://laptopre.vn/\">Thanh Hương</a> tìm hiểu rõ hơn về chiếc laptop này qua bài viết sau đây nhé!</p><p>&nbsp;</p><p><i>Nguồn: LG</i></p><h2>Thiết kế nhỏ gọn, siêu di động</h2><p>LG Gram 16Z90P có thiết kế thân máy bằng hợp kim magiê carbon nano bạc độc đáo, chỉ nặng 1.190kg và dày 16,8mm. Vì vậy, bất cứ nơi nào bạn đi, bạn có thể thuận tiện mang theo bên mình suốt cả ngày. Máy cũng đã được kiểm tra nghiêm ngặt trong các điều kiện môi trường khác nhau như nhiệt độ, rung, sốc, phun muối ... và đạt tiêu chuẩn quân sự MIL-STD-810G nên không lo máy bị hư hỏng. Việc giảm kích thước viền và thân giúp 16Z90P - G.AH73A5 nhỏ gọn hơn so với các mẫu trước đó. Thiết kế 4 góc cùng với bản lề ẩn giúp hạn chế sự phân tâm và cải thiện khả năng tập trung vào công việc của bạn.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/Laptop/lg/lg-gram-16z90p-gah73a5/lg-gram-16z90p-gah73a5-moi.png\" alt=\"LG Gram 16Z90P\"></p><p>&nbsp;</p><h2>Hiệu năng LG Gram 16Z90P ổn định</h2><p>Tích hợp bộ vi xử lý Intel Core i5 Tiger Lake 1135G7 Turbo Boost 4,2 GHz có thể xử lý nhanh chóng mọi ứng dụng văn phòng thông thường và chạy ổn định. Kết hợp với bộ nhớ RAM 8GB giúp máy chạy đa nhiệm các tác vụ nặng mà vẫn mượt mà không lo thời gian chết máy. Đồ họa Intel Iris Xe cung cấp cho bạn hiệu suất đồ họa gấp đôi so với thế hệ trước. Việc tạo nội dung video 4K, chỉnh sửa ảnh có độ phân giải cao và chơi trò chơi 1080p trở nên dễ dàng hơn bao giờ hết. Ổ cứng SSD NVMe PCIe 512GB mang lại tốc độ đọc và ghi nhanh chóng để khởi động máy tính hoặc các ứng dụng trong Windows của bạn chỉ trong vài giây.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/Laptop/lg/lg-gram-16z90p-gah73a5/lg-gram-16z90p-gah73a5-laptop-moi.png\" alt=\"LG Gram 16Z90P\"></p><p>&nbsp;</p><h2>Hình ảnh rõ nét, sống động đến từng chi tiết</h2><p>LG Gram 16Z90P được thiết kế lại nâng cao năng suất của bạn với <a href=\"https://laptopre.vn/thiet-bi-van-phong-man-hinh\">màn hình</a> chuyên nghiệp 16:10, thiết kế nâng cao năng suất và bộ xử lý mạnh mẽ, đồng thời vẫn giữ nguyên thân hình mỏng của nó. Giúp bạn hoàn thành công việc mọi lúc mọi nơi. Với màn hình 16 inch và tấm nền IPS, LG Gram 16Z90P cung cấp độ phân giải WQXGA (2560x1600) cho màu sắc sống động, sắc nét, làm sống động mọi khung hình. Nhờ phạm vi bao phủ màu rộng lên đến 99% DCI-P3, các mẫu LG gram mới thể hiện chính xác khả năng sáng tạo của bạn và màu sắc bạn hình dung.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/Laptop/lg/lg-gram-16z90p-gah73a5/lg-gram-16z90p-gah73a5-man-hinh.png\" alt=\"LG Gram 16Z90P\"></p><p>&nbsp;</p><h2>Bàn phím và touchpad trên LG Gram 16ZD90P</h2><p>Bàn phím đã được thiết kế hoàn thiện để cải thiện sự thoải mái và hiệu quả cho trải nghiệm đánh máy vượt trội. Các phím phẳng và quá khổ cho phép bạn gõ liên tục với lỗi chính tả tối thiểu. So với model trước, hành trình phím đã được tăng từ 1.5mm lên 1.65mm, giúp bạn đỡ mỏi tay hơn. Touchpad rộng hơn so với các mẫu <a href=\"https://laptopre.vn/laptop-lg-gram\">LG gram</a> trước đây, mang đến khả năng điều khiển thoải mái ngay cả khi không có chuột.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/Laptop/lg/lg-gram-16z90p-gah73a5/lg-gram-16z90p-gah73a5-ban-phim.png\" alt=\"LG Gram 16Z90P\"></p><p>&nbsp;</p><h2>Đắm mình trong âm thanh</h2><p>DTS: X Ultra cho phép bạn đắm chìm trong kết xuất âm thanh 3D ngay cả khi không có tai nghe để có trải nghiệm âm thanh phong phú, đầy đủ. Ngoài ra, LG Gram 16Z90P cũng được nâng cấp về phần cứng, được trang bị bộ khuếch đại thông minh và loa stereo mang đến âm thanh sống động và mạnh mẽ như thật.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/Laptop/lg/lg-gram-16z90p-gah73a5/lg-gram-16z90p-gah73a5-laptop-new.png\" alt=\"LG Gram 16Z90P\"></p><p>&nbsp;</p><h2>Hệ thống kết nối trên LG Gram 16Z90P</h2><p>LG Gram 16Z90P được trang bị các cổng kết nối thông dụng như: 2 cổng USB 3.2, 2 cổng Thunderbolt 4 USB-C, HDMI thuận tiện cho bạn trong việc truyền tải dữ liệu với các thiết bị khác. Đồng thời, máy còn hỗ trợ kết nối không dây Bluetooth 5.1 và kết nối mạng Wi-Fi 6 (802.11ax) ổn định, không bị gián đoạn.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/Laptop/lg/lg-gram-16z90p-gah73a5/lg-gram-16z90p-gah73a5-ket-noi.png\" alt=\"LG Gram 16Z90P\"></p><p>&nbsp;</p><h2>Lời kết</h2><p>Trên đây là những đặc điểm nổi bật của LG Gram 16Z90P, nếu bạn yêu thích sản phẩm này thì đừng quên liên hệ ngay cho Thanh Hương qua website <a href=\"https://laptopre.vn/\">laptopre.vn</a> nhé!</p>', 'stocking', '2023-07-26 10:52:48', '2023-07-26 10:52:48'),
(24, 'razer-blade-15-2018', 'Razer Blade 15 2018', 28500000, 54, 31000000, '<p><strong>Bộ vi xử lí:&nbsp;</strong>Intel Core i7-8750H Processor 2.20 GHz&nbsp;(9M&nbsp;Cache, Up to 4.1GHz)</p><p><strong>RAM:&nbsp;</strong>16GB DDR4 Bus 2666MHz</p><p><strong>Bộ nhớ:&nbsp;</strong>SSD 512GB&nbsp;M.2 NVMe</p><p><strong>Card đồ hoạ:&nbsp;</strong>Intel UHD Graphics 630 +&nbsp;Nvidia GeForce GTX 1060 Max-Q 6GB GDDR5</p><p><strong>Màn hình:&nbsp;</strong>15.6 inch Full HD (1920 x 1080), IPS Anti-Glare</p><p><strong>Tình trạng sản phẩm:</strong> Mới 100%</p>', '<p>Khi nhắc đến Razer, điều đầu tiên người ta nghĩ đến là một chiếc máy tính xách tay chơi game mạnh mẽ, thiết kế Unibody nổi bật, mỏng và sang trọng. Và hôm nay Laptop Thanh Hương muốn giới thiệu với các bạn một cuốn sách game như vậy, Razer Blade 15.</p><p>&nbsp;</p><h2>Thiết kế Razer Blade 15 2018 sang trọng</h2><p>Lớp vỏ Unibody anodized của Razer Blade 15 2018 vẫn kế thừa thiết kế của các thế hệ trước, sử dụng kiểu dáng vuông vức, được làm từ một miếng nhôm duy nhất và được sơn màu đen rất cao cấp. Mặt trên của máy có thiết kế đơn giản với logo \"rắn ba đầu\" màu xanh lá truyền thống của Razer. Đáy máy có các rãnh hút và thoát nhiệt của máy cùng 2 dây chun giúp máy chắc chắn hơn khi nằm ở bất kỳ đâu.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/Laptop/Razer/Razer-Blade-15-2018/razer-blade-15-2018-laptop.jpg\" alt=\"razer-blade-15-2018\"></p><p>&nbsp;</p><h2>Màn hình Razer Blade 15 2018&nbsp;</h2><p>Mở máy, điều đầu tiên đập vào mắt bạn chính là màn hình lớn lên đến 15,6 inch, độ phân giải full HD (1920x1080), tốc độ làm tươi màn hình lên đến 144Hz, mang đến trải nghiệm hình ảnh chơi game chất lượng cao. Màn hình đạt 100% sRGB, hình ảnh trên màn hình sống động và bắt mắt hơn. Cùng với khung viền màn hình siêu mỏng, tổng thể màn hình rất sang trọng và bắt mắt. Phía trên màn hình được tích hợp webcam độ nét cao cho phép bạn thực hiện các tác vụ như cuộc gọi video với chất lượng cao hơn.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/Laptop/Razer/Razer-Blade-15-2018/razer-blade-15-2018.jpg\" alt=\"razer-blade-15-2018\"></p><p>&nbsp;</p><h2>Hiệu năng Razer Blade 15 2018&nbsp;</h2><p>Razer Blade 15 2018&nbsp; được trang bị CPU i7 thế hệ 8: Intel Core i7-8750H với 6 lõi 12 luồng với xung nhịp lên tới 4.2GHz cộng với dung lượng RAM có thể lên tới 64GB DDR4 rất phù hợp cho việc chạy đa nhiệm và những tác vụ nặng. Ngoài ra, nay Razer Blade 15 2018 đã có các tùy chọn cấu hình với card đồ họa thuộc dòng Turing RTX max-Q kết hợp với màn hình FHD (có tùy chọn UHD 4k) 144Hz hoàn toàn có thể cân được những tựa game khủng hiện nay hay những phần mềm đồ họa nặng ký, hứa hẹn sẽ giúp cho bạn có những trải nghiệm cực kỳ mượt mà dù đang làm việc hay giải trí.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/Laptop/Razer/Razer-Blade-15-2018/razer-blade-15-2018-laptop-moi.jpg\" alt=\"razer-blade-15-2018\"></p><p>&nbsp;</p><h2>Bàn phím và Touchpad</h2><p>Bàn phím của Razer Blade 15 2018 được thiết kế rất bắt mắt và đèn chiếu sáng phím RGB, có thể tùy chỉnh bằng phần mềm thông qua ánh sáng của từng phím. Cách bố trí bàn phím của Razer rất khoa học, khoảng cách giữa các phím hợp lý, hành trình phím tốt, cho cảm giác gõ phím rất tốt. TouchPad của Blade 15 được đánh giá là có chất lượng tốt nhất trong số các máy tính xách tay Windows. Di chuột trên TouchPad có kích thước lớn bằng kính cho cảm giác rất thích, chuột sẽ không bị rít hay đơ như các mẫu TouchPad khác.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/Laptop/Razer/Razer-Blade-15-2018/razer-blade-15-2018-moi.jpg\" alt=\"razer-blade-15-2018\"></p><p>&nbsp;</p><h2>Loa và cổng kết nối</h2><p>Hai loa stereo bố trí hai bên bàn phím được hỗ trợ công nghệ Dolby Atmos mang đến chất lượng âm thanh rõ ràng. Âm lượng của cặp loa Blade 15 khá lớn, khi bật âm lượng tối đa thì không có hiện tượng rè, vẫn cho chất lượng âm thanh như bình thường.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/Laptop/Razer/Razer-Blade-15-2018/razer-blade-15-2018-ket-noi.jpg\" alt=\"razer-blade-15-2018\"></p><p>&nbsp;</p><p>Về cổng kết nối, Razer Blade 15 cung cấp cho chúng ta đầy đủ các loại kết nối thường dùng. Chiếc máy này cung cấp cho chúng ta 3 cổng USB 3.0 Type A, 1 cổng USB Type C hỗ trợ giao thức Thunderbolt, 1 cổng HDMI, 1 Mini DisplayPort và jack kết hợp 3.5. Đối với thiết bị hướng đến game thủ, theo tôi, một cổng như vậy là tốt. Với ba cổng HDMI, Mini DisplayPort và USB Loại C, bạn có thể kết nối tối đa 3 màn hình ngoài để có trải nghiệm chơi game đồ họa cao tốt hơn.</p>', 'out-of-stock', '2023-07-26 10:55:57', '2023-07-26 10:55:57');
INSERT INTO `products` (`id`, `slugProduct`, `nameProduct`, `price_has_ropped`, `categoryID`, `initial_price`, `contentProduct`, `descriptionProduct`, `statusProduct`, `createAt`, `updatedAt`) VALUES
(25, 'hp-elitebook-x360-1040-g8', 'HP EliteBook X360 1040 G8', 19800000, 55, 31300000, '<p><strong>CPU:</strong> Intel® Core™ I7-1165G7 (12M Cache, 2.80Ghz up to 4.70Ghz)</p><p><strong>RAM:</strong> 8GB LPDDR4x 4266 MHz</p><p><strong>Bộ nhớ:</strong> PCIe® NVMe™ TLC 256GB SSD</p><p><strong>Card:</strong> Intel® Iris® Xᵉ Graphics</p><p><strong>Màn hình:</strong> 14.0\" FHD (1920 x 1080), Touch, IPS, BrightView, 400 nits</p><p><strong>Tình trạng sản phẩm:</strong>&nbsp;Mới 100% Nhập Khẩu Chính Hãng</p><p><strong>Bảo hành:&nbsp; 12 Tháng -&nbsp;</strong>Tuỳ chọn gói bảo hành mở rộng tới 24 tháng</p>', '<p>Thị trường máy tính xách tay 2in1 cao cấp hướng đến một nhóm đối tượng rất cụ thể. Cuối cùng, những gì họ cần là sự bảo mật tối ưu, sự ổn định không giới hạn. Đừng quên rằng là một thiết bị 2in1, nó phải cung cấp màu sắc chính xác để bạn có thể cho khách hàng thấy hình ảnh chân thực nhất. <a href=\"https://laptopre.vn/laptop/hp-elitebook-x360-1040-g8\"><strong>HP EliteBook x360 1040 G8</strong></a> phải kiên quyết theo mọi hướng để duy trì tính cạnh tranh.</p><p>&nbsp;</p><p><i><strong>Nguồn: Projekt Neptun</strong></i></p><h2><strong>Thiết kế sang trọng, khả năng \"biến hình\" linh hoạt 360 độ</strong></h2><p>Về cơ bản, ngoại hình của EliteBook x360 1040 G8 thừa hưởng nhiều nét tương đồng với đời trước theo phong cách tối giản, hạn chế các chi tiết thừa nhưng vẫn đảm bảo tính thẩm mỹ. Máy tạo ấn tượng sang trọng nhờ toàn bộ lớp vỏ được làm bằng kim loại nguyên khối, kể cả khu vực xung quanh bàn phím và phần chiếu nghỉ tay. Toàn bộ mặt trên của máy không sử dụng bất kỳ họa tiết trang trí nào ngoài logo HP bóng bẩy, hiện đại, nổi bật ở giữa. Máy thực sự rất mỏng và nhẹ với trọng lượng chỉ 1,21Kg và độ dày chỉ 1,61cm, dễ dàng nhét trong ba lô hoặc cầm bằng một tay, rất thuận tiện khi di chuyển. Đây cũng là một trong những chiếc laptop 13 inch mỏng và nhẹ nhất trên thị trường hiện nay.</p><p>&nbsp;</p><figure class=\"image\"><img src=\"https://laptopre.vn/storage/photos/1/Laptop/Laptop-HP/elitebook-x360-1040-g8/Hp-Elitebook-x360-1040-G8-moi.png\" alt=\"HP elitebook x360 1040 g8\"></figure><h2>&nbsp;</h2><h2><strong>Cấu hình mạnh mẽ từ HP Elitebook X360 1040 G8</strong></h2><p>Được trang bị phần cứng mạnh mẽ với bộ xử lý Intel® Core ™ thế hệ thứ 11 Tiger Lake với tùy chọn cao nhất lên đến Intel® Core ™ i7-1165G7, 8GB RAM LPDDR4X-4266, card đồ họa tích hợp Intel® Iris® Xe Graphics, 256GB PCIe NVMe SSD + Bộ nhớ 32GB Intel® Optane ™ mang lại khả năng đáp ứng cần thiết để làm việc hiệu quả và tốn ít thời gian chờ đợi hơn; Cùng với ổ SSD 3D Xpoint, cài sẵn Windows 10 Pro, HP EliteBook x360 1040 G8 xử lý tốt mọi tác vụ, kể cả các tác vụ nặng như biên tập, chỉnh sửa ảnh, xuất file trong Lightroom hay Premiere Pro, khả năng chạy đa nhiệm. tốt, có thể mở song song nhiều ứng dụng mà không làm máy bị đơ, lag.</p><p>&nbsp;</p><figure class=\"image\"><img src=\"https://laptopre.vn/storage/photos/1/Laptop/Laptop-HP/elitebook-x360-1040-g8/Hp-Elitebook-x360-1040-G8-thanh-huong.png\" alt=\"HP elitebook x360 1040 g8\"></figure><h2>&nbsp;</h2><h2><strong>Màn hình cảm ứng mượt mà, chống nhìn trộm</strong></h2><p>Xu hướng viền màn hình mỏng đang phổ biến trên smartphone và laptop cũng không thể nằm ngoài cuộc chơi. Với EliteBook x360 1040 G8, viền hai bên mỏng ấn tượng và viền trên và dưới chỉ dày hơn một chút. Tấm nền màn hình được đẩy sát viền giúp hình ảnh hiển thị sống động, thoáng, rộng rãi, hiệu quả ngay cả khi duyệt web và rõ nét hơn khi xem phim, chơi game. Kích thước 14 inch, độ phân giải Full HD, tấm nền IPS cho độ sắc nét và chi tiết tốt. Màu sắc theo hướng trung tính, tông ấm phù hợp với những người kinh doanh hoặc phải làm việc nhiều với nội dung văn bản. Màn hình cho màu đen sâu, độ tương phản cao, góc nhìn rộng. Độ sáng màn hình tốt, có thể nhìn đẹp ngay cả khi sử dụng ngoài trời. Thêm vào đó, lớp phủ Anti Glare giúp giảm độ chói ngay cả dưới ánh nắng trực tiếp, tăng tính linh hoạt khi làm việc trong nhiều môi trường khác nhau.</p><p>&nbsp;</p><figure class=\"image\"><img src=\"https://laptopre.vn/storage/photos/1/Laptop/Laptop-HP/elitebook-x360-1040-g8/Hp-Elitebook-x360-1040-G8.png\" alt=\"HP elitebook x360 1040 g8\"></figure><h2>&nbsp;</h2><h2><strong>Bút đi kèm tiện lợi</strong></h2><p>Để khai thác triệt để sức mạnh \"biến hình\" 360 độ của EliteBook x360 1040 G8, nó còn được trang bị bút HP Rechar Charge Active Pen G3. Chiếc bút này hỗ trợ 4096 mức lực, có hai nút trên thân để thực hiện các thao tác được giao, sạc bằng cổng USB-C. Cảm giác viết và vẽ ghi chú bằng ngòi bút rõ ràng nhanh chóng và tiện lợi hơn rất nhiều so với dùng tay không. Bạn cũng có thể gắn bút vào cạnh trái của máy nhờ có nam châm đi kèm, rất tiện lợi.</p><p>&nbsp;</p><figure class=\"image\"><img src=\"https://laptopre.vn/storage/photos/1/Laptop/Laptop-HP/elitebook-x360-1040-g8/laptop-Hp-Elitebook-x360-1040-G8-dn.png\" alt=\"HP elitebook x360 1040 g8\"></figure><h2>&nbsp;</h2><h2><strong>Bàn phím tiện dụng, bàn di chuột rộng rãi</strong></h2><p>Các dòng laptop HP luôn được đánh giá cao về phần bàn phím nhờ cảm giác gõ tốt, độ nảy cao, các phím bố trí hợp lý. Trên EliteBook x360 1040 G8, điều này tiếp tục là trường hợp. Tuy kích thước thân máy rất mỏng nhưng phần bàn phím vẫn cho độ đi tốt, phím nảy, bám tay. Hiện tượng uốn cong (suy thoái) khi bị căng thẳng cũng được hạn chế. Chữ in trên phím sắc nét, phông chữ đẹp, bàn phím rộng rãi, thao tác thuận tiện. Touchpad cũng được làm với kích thước lớn, rộng rãi, phủ kính, cho độ nhạy cao, mượt mà, không bị rít. Touchpad có hỗ trợ trình điều khiển Microsoft Precision nên cho phép thao tác đa chạm mượt mà, đặc biệt là phóng to và thu nhỏ trên trình duyệt Edge hoặc Chrome. Nếu chỉ sử dụng các tác vụ văn phòng, chỉnh sửa ảnh cơ bản, touchpad trên máy hoàn toàn có thể thay thế chuột ngoài.</p><p>&nbsp;</p><figure class=\"image\"><img src=\"https://laptopre.vn/storage/photos/1/Laptop/Laptop-HP/elitebook-x360-1040-g8/laptop-hp-elitebook-x360-1040-g8.png\" alt=\"HP elitebook x360 1040 g8\"></figure><h2>&nbsp;</h2><h2><strong>Bảo mật nhiều lớp chuyên sâu</strong></h2><p>Hướng đến đối tượng là doanh nhân, EliteBook x360 1040 G8 được trang bị hàng loạt tính năng bảo mật chuyên sâu. Ngoài màn hình Anti-peep Sure View, Presence Aware tự khóa khi người dùng rời đi và HP Sure Shutter để tắt webcam, máy còn có bảo mật sinh trắc học nhận dạng khuôn mặt và vân tay. Cảm biến vân tay được đặt giống như phím thông thường ngay cạnh phím Alt bên phải. Người dùng có thể quét bằng cách chạm hoặc nhấn phím xuống hoàn toàn, với tốc độ nhận diện nhanh và chính xác.</p><p>&nbsp;</p><figure class=\"image\"><img src=\"https://laptopre.vn/storage/photos/1/Laptop/Laptop-HP/elitebook-x360-1040-g8/Hp-Elitebook-x360-1040-G8-tai-dn.png\" alt=\"HP elitebook x360 1040 g8\"></figure><p>&nbsp;</p><p>Đồng thời, mẫu laptop của HP có thêm gói công cụ bảo mật và quản lý máy tính HP Client Security Manager Gen 4, bao gồm các công nghệ như Sure Click, Sure Start, Sure Run, BIOSphere và chip mã hóa TPM 2.0. Mỗi lần bật máy tính, Sure Start sẽ tự động kiểm tra mã nguồn BIOS để tìm bất kỳ thay đổi trái phép nào và khôi phục về cài đặt gốc nếu cần. Trong khi người dùng sử dụng máy, Sure Start liên tục theo dõi bộ nhớ, trong trường hợp có tấn công sẽ tạo một bản sao của BIOS và cách ly nó khỏi hệ thống trong vòng chưa đầy 1 phút.</p><p>&nbsp;</p><figure class=\"image\"><img src=\"https://laptopre.vn/storage/photos/1/Laptop/Laptop-HP/elitebook-x360-1040-g8/Hp-Elitebook-x360-1040-G8-dn.png\" alt=\"HP elitebook x360 1040 g8\"></figure><h2>&nbsp;</h2><h2><strong>Lời kết</strong></h2><p>Là dòng máy cao cấp của HP, EliteBook x360 1040 G8 đã thể hiện đầy đủ những đặc điểm tạo nên thế mạnh của dòng laptop này từ độ mỏng, gọn nhẹ cho đến sự linh hoạt, đa năng. Sản phẩm được hoàn thiện, gia công tỉ mỉ để toát lên nét cao cấp, sang trọng. Máy có nhiều tính năng hiện đại, bắt kịp xu hướng như màn hình viền mỏng, webcam quét khuôn mặt, đầu đọc dấu vân tay. Hiệu suất, thời lượng pin, chất lượng bàn phím và touchpad của x360 1040 G8 đều có chất lượng tốt, giống hệt EliteBook từ trước đến nay.</p>', 'stocking', '2023-07-26 10:59:46', '2023-07-26 10:59:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` int DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `commune` varchar(255) DEFAULT NULL,
  `address` text,
  `role` enum('USER','ADMIN') NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `email`, `fullname`, `username`, `password`, `phone`, `city`, `district`, `commune`, `address`, `role`, `createdAt`, `updatedAt`) VALUES
(6, 'qhuy.dev@gmail.com', 'LeQuocHuy', 'huydev', '$2b$10$bcHadi71jDQ93p5vUSITf.SFUtzDqYeMA7aa.WlwdFtLrnG10aQEa', 901961341, 'Đà Nẵng', 'Huyện Hòa Vang', 'Xã Hòa Phước', 'Tổ 2 , Thôn Cồn Mong', 'ADMIN', '2023-06-27 13:59:30', '2023-06-27 13:59:30');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_color_id`);

--
-- Chỉ mục cho bảng `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`);

--
-- Chỉ mục cho bảng `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_image_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `vnpayID` (`vnpayID`);

--
-- Chỉ mục cho bảng `paymentvnpay`
--
ALTER TABLE `paymentvnpay`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryID` (`categoryID`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT cho bảng `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT cho bảng `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `images`
--
ALTER TABLE `images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT cho bảng `paymentvnpay`
--
ALTER TABLE `paymentvnpay`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `colors`
--
ALTER TABLE `colors`
  ADD CONSTRAINT `colors_ibfk_1` FOREIGN KEY (`product_color_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `discounts`
--
ALTER TABLE `discounts`
  ADD CONSTRAINT `discounts_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`product_image_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`vnpayID`) REFERENCES `paymentvnpay` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
