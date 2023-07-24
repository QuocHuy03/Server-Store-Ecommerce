-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th7 24, 2023 lúc 02:10 PM
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
(51, 'Asus', 'asus', 'outstanding', 'out-of-stock', '2023-07-01 17:02:07', '2023-07-01 17:02:07');

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
(57, 'black', 17, '2023-07-24 21:05:16', '2023-07-24 21:05:16'),
(58, 'yellow', 17, '2023-07-24 21:05:16', '2023-07-24 21:05:16'),
(59, 'black', 16, '2023-07-24 21:09:55', '2023-07-24 21:09:55'),
(60, 'red', 16, '2023-07-24 21:09:55', '2023-07-24 21:09:55');

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

--
-- Đang đổ dữ liệu cho bảng `discounts`
--

INSERT INTO `discounts` (`id`, `name`, `totalPrice`, `userID`, `createdAt`, `updatedAt`) VALUES
(29, 'HUYDEV', 500000, 6, '2023-07-24 20:51:08', '2023-07-24 20:51:08');

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
(65, 17, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1690207512/mytcpqye4t1jpeirbsg1.jpg', '2023-07-24 21:05:16', '2023-07-24 21:05:16');

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
(16, 'asus-rog-strix-g17-g713', 'ASUS ROG Strix G17 G713', 46000000, 51, 43500000, '<p><strong>Bộ vi xử lí</strong>: AMD Ryzen™ 9 7845HX Mobile Processor (12-core/24-thread, 12MB L2 cache, 64MB L3 cache, 3.0Ghz up to 5.2GHz max boost)</p><p><strong>RAM</strong>: 16GB DDR5-4800Mhz upto 32GB</p><p><strong>Bộ nhớ</strong>: 1TB PCIe® 4.0 NVMe™ M.2 SSD</p><p><strong>Card đồ hoạ:</strong> NVIDIA® GeForce RTX™ 4060 Laptop GPU 8GB GDDR6</p><p><strong>Màn hình:</strong> 17.3 inch 2.5K 240Hz</p><p><strong>Tình trạng sản phẩm:</strong>&nbsp;Mới 100% Nhập Khẩu Chính Hãng</p><p><strong>Bảo hành:&nbsp; 12 Tháng</strong></p>', '<p><strong>Laptop ASUS ROG Strix G17 G713</strong> tích hợp hàng loạt công nghệ hiện đại cùng cấu hình cực mạnh cho khả năng chơi game không giới hạn. Dòng máy tính xách tay chơi game cao cấp của ASUS chắc chắn sẽ làm hài lòng những game thủ khó tính nhất.</p><p>&nbsp;</p><p><i>Nguồn: ASUS</i></p><h2>Thiết kế ASUS ROG Strix G17 G713 hầm hố, mạnh mẽ</h2><p>Laptop Asus được hoàn thiện từ chất liệu vỏ nhựa với mặt sau bằng kim loại, các đường vân trên nắp máy sang trọng nhưng không kém phần hầm hố. 2.9kg vẫn nằm gọn trong một trong các ngăn của balo nên bạn có thể mang theo đi làm, đi chơi. Ánh sáng bàn phím Per-Key RGB cho phép bạn thể hiện phong cách của mình và khơi dậy hiệu quả chiến đấu, đồng thời giúp bạn làm việc dễ dàng trong môi trường thiếu sáng.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/ASUS/asus-rog-strix-g17-g713-2023/asus-rog-strix-g17-g713-2023-review.png\" alt=\"asus-rog-strix-g17-g713-2023\"></p><p>&nbsp;</p><h2>Hiệu suất ASUS ROG Strix G17 G713 mạnh mẽ</h2><p>ASUS ROG Strix G17 G713 chạy bộ xử lý AMD Ryzen™ 9 7845HX Mobile Processor (12-core/24-thread, 12MB L2 cache, 64MB L3 cache, 3.0Ghz up to 5.2GHz max boost), giúp máy chạy ở hiệu suất cao nhất khi chơi game. Đa nhiệm mượt mà không giật lag. ASUS ROG Strix G17 G713RM được trang bị bộ nhớ DDR5-4800 tiêu chuẩn và PCle 4.0 mới nhất cho khả năng phản hồi tuyệt vời. Ổ cứng 1TB cho bạn thoải mái lưu trữ game dung lượng lớn hay chạy các phần mềm thiết kế chuyên nghiệp.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/ASUS/asus-rog-strix-g17-g713-2023/2.png\" alt=\"asus-rog-strix-g17-g713-2023\"></p><p>&nbsp;</p><h2>Màn hình sắc nét, hệ thống tản nhiệt thông minh</h2><p>Laptop thiết kế đồ họa ASUS ROG Strix G17 G713 trang bị màn hình 2.5K 240Hz và công nghệ tiên tiến cho màu sắc rực rỡ và hạn chế lag khung hình. Công nghệ MUX Switch cải thiện hiệu suất đồ họa bằng cách kết nối trực tiếp card đồ họa với màn hình. Quạt Arc Flow với 84 cánh quạt chạy liên tục giúp nhiệt độ của máy luôn ở mức tối ưu. Thêm vào đó, hệ thống âm thanh vòm Dolby Atmos mang đến âm thanh sống động, chất lượng cao ở mọi nơi.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/ASUS/asus-rog-strix-g17-g713-2023/1.png\" alt=\"\"></p><p>&nbsp;</p><h2>Camera và âm thanh</h2><p>Máy tính xách tay không có webcam tích hợp giúp tăng cường bảo mật cho người dùng đồng thời giảm dấu chân của bất động sản màn hình lớn hơn. Nếu cần sử dụng webcam để họp trực tuyến hoặc phát trực tuyến, bạn có thể mua một webcam riêng để kết nối với máy tính xách tay của mình. Thưởng thức âm nhạc và phim đắm chìm, hay nghe rõ tiếng bước chân của đối thủ trên chiến trường ảo nhờ chứng nhận Hi-Res, Smart AMP và công nghệ Dolby Atmos tái tạo âm thanh độ nét cao, âm thanh vòm 3D sống động.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/ASUS/asus-rog-strix-g17-g713-2023/asus-rog-strix-g17-g713-2023-am-thanh.png\" alt=\"asus-rog-strix-g17-g713-2023\"></p><p>&nbsp;</p><h2>Hệ thống kết nối trên ASUS ROG Strix G17 G713</h2><p>Cạnh bên của laptop được trang bị các cổng kết nối thông dụng như: USB 3.2 Gen 2 Type-C, USB 3.2, LAN (RJ45) và USB Type-C phục vụ mọi nhu cầu truyền tải dữ liệu.</p>', 'stocking', '2023-07-08 23:16:10', '2023-07-08 23:16:10'),
(17, 'macbook-pro-m2-pro-2023', 'MacBook Pro M2 Pro 2023', 56000000, 31, 61000000, '<p><strong>Bộ vi xử lí</strong>: Apple M2 Pro chip 12-core CPU with 8 performance cores and 4 efficiency cores</p><p><strong>RAM:</strong> 16GB unified memory (Không hỗ trợ nâng cấp)</p><p><strong>Bộ nhớ:</strong> 512GB SSD</p><p><strong>Card đồ hoạ:&nbsp;</strong>Card tích hợp - 19-core GPU</p><p><strong>Màn hình: </strong>16.2 inch Liquid Retina XDR display (3456 x 2234), upto 120Hz, ProMotion, Wide color (P3), Độ sáng 1000 nits, True Tone Technology, 1 tỷ màu</p><p><strong>Thông số kỹ thuật tại hãng: </strong><a href=\"https://support.apple.com/kb/SP890?locale=en_US\"><strong>Click Link</strong></a></p><p><strong>Tình trạng sản phẩm:</strong>&nbsp;Mới 100% Nhập Khẩu Chính Hãng</p><p><strong>Bảo hành: 12 Tháng -&nbsp;</strong>Tuỳ chọn gói bảo hành mở rộng tới 24 tháng</p>', '<p>Đưa chip M2 Pro vào <strong>MacBook Pro 16 inch M2 Pro 2023</strong>, và Apple đã tạo ra mẫu laptop chuyên nghiệp nhất từ ​​trước đến nay. MacBook 2023 thế hệ tiếp theo sẽ giúp bạn xử lý mọi tác vụ nặng một cách nhanh chóng, với đồ họa tuyệt đẹp trên màn hình Liquid Retina XDR 16 inch và thời lượng pin dài kéo dài cả ngày.</p><p>&nbsp;</p><p><i>Nguồn: Austin Medz</i></p><h2>Duy trì thiết kế sang trọng, tỉ mỉ trong từng chi tiết</h2><p>Lớp vỏ kim loại không chỉ đủ chắc chắn để bảo vệ các linh kiện bên trong mà còn mang đến vẻ ngoài cực kỳ sang trọng. Bốn góc được bo cong tinh tế giảm biến dạng khi va chạm, logo “quả táo cắn dở” vẫn nằm chính giữa mặt lưng thu hút mọi ánh nhìn. Máy nặng 2,15kg và dày 16,8mm. Tuy nhiên, máy tính xách tay công nghệ đồ họa vẫn cho phép bạn linh hoạt di chuyển.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/Laptop/Macbook/Macbook-pro-16-inch-m2-pro-2023/macbook-pro-16-inch-m2-pro-2023-thiet-ke.png\" alt=\"macbook-pro-16-inch-m2-pro-2023\"></p><p>&nbsp;</p><p>Chỉ với một lần chạm thông qua cảm biến vân tay (Touch ID) được tích hợp trên nút nguồn, bạn có thể mở khóa <a href=\"https://laptopre.vn/laptop-apple-macbook-pro-16\">MacBook Pro</a> rất nhanh chóng. Nó không chỉ rút ngắn thời gian thao tác đăng nhập mà còn đảm bảo tính bảo mật cho dữ liệu bên trong so với mật khẩu truyền thống. Bàn phím Magic mang lại cảm giác gõ mượt mà trong khi gõ, giảm thiểu tác động của tiếng ồn đến những người xung quanh bạn, đồng thời hành trình ổn định và bố cục phím được sắp xếp hợp lý giúp tăng tốc độ gõ. Bàn phím cũng được trang bị đèn nền giúp người dùng làm việc tốt hơn trong môi trường thiếu sáng.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/Laptop/Macbook/Macbook-pro-16-inch-m2-pro-2023/macbook-pro-16-inch-m2-pro-2023-ban-phim.png\" alt=\"macbook-pro-16-inch-m2-pro-2023\"></p><p>&nbsp;</p><h2>Xử lý mượt mà mọi tác vụ nhờ con chip Apple M2 Pro</h2><p>Vẫn được sản xuất trên tiến trình 5nm, chip Apple M2 Pro có nhiều điểm cải tiến so với thế hệ <a href=\"https://laptopre.vn/laptop/macbook-pro-16-m1-pro-2021\">M1 Pro</a> ra mắt trước đó. Với CPU 12 nhân và băng thông bộ nhớ 200 GB/s sẽ cung cấp thêm 20% năng lượng để chạy mượt mà mọi tác vụ từ cơ bản đến nâng cao mà vẫn rất tiết kiệm điện năng. <a href=\"https://laptopre.vn/laptop-macbook\">Apple MacBook</a> có đồ họa tích hợp với 19 lõi GPU, mang lại hiệu suất đồ họa cao hơn 30% so với người tiền nhiệm và Công cụ thần kinh nhanh hơn 40% để tăng tốc các tác vụ đồ họa. . Người dùng có thể chỉnh sửa hình ảnh, thiết kế, chỉnh sửa video hay dựng video trên phần mềm đồ họa một cách hoàn toàn dễ dàng.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/Laptop/Macbook/Macbook-pro-16-inch-m2-pro-2023/macbook-pro-16-inch-m2-pro-2023-hieu-nang-1.png\" alt=\"macbook-pro-16-inch-m2-pro-2023\"></p><p>Được trang bị RAM 16 GB, chiếc MacBook này có khả năng chạy đa nhiệm cực kỳ mượt mà, cho phép người dùng mở nhiều cửa sổ làm việc, nhiều lớp đồ họa, file Excel dung lượng lớn,… mà không gặp bất kỳ trở ngại nào. Ngoài ra, máy còn có tốc độ đọc ghi cực nhanh, thời gian khởi động của ổ cứng SSD 512GB được rút ngắn.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/Laptop/Macbook/Macbook-pro-16-inch-m2-pro-2023/macbook-pro-16-inch-m2-pro-2023-am-thanh.png\" alt=\"macbook-pro-16-inch-m2-pro-2023\"></p><p>&nbsp;</p><h2>Màn hình chất lượng cao cho công việc và giải trí trọn vẹn</h2><p>Tự hào với màn hình 16,2 inch rộng rãi, <a href=\"https://laptopre.vn/thiet-bi-van-phong-man-hinh\">màn hình</a> Liquid Retina XDR (3456 x 2234) mang đến nội dung vô cùng sắc nét, kết hợp với màu sắc của công nghệ Gam màu rộng (P3). Rất sống động và chính xác đến từng chi tiết, phù hợp với người dùng làm việc trong lĩnh vực thiết kế. Với độ sáng 1000 nit, nội dung có thể được hiển thị rõ ràng trong nhiều môi trường sáng khác nhau, đảm bảo người dùng có thể làm việc hiệu quả bất kể họ ở đâu. Công nghệ True Tone trên MacBook Pro 2023 có thể tự động điều chỉnh độ sáng màn hình theo môi trường xung quanh để mang đến cho người dùng hình ảnh tự nhiên nhất.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/Laptop/Macbook/Macbook-pro-16-inch-m2-pro-2023/macbook-pro-16-inch-m2-pro-2023-man-hinh.png\" alt=\"macbook-pro-16-inch-m2-pro-2023\"></p><p>&nbsp;</p><p>Màn hình này cũng có tần số quét lên đến 120 Hz, kết hợp với công nghệ ProMotion tự động điều chỉnh để phù hợp với chuyển động của nội dung phục vụ nhu cầu chơi game, đồ họa và giải trí nhiều hơn. Khi chỉnh sửa video, bạn cũng có thể chọn tốc độ làm mới khung hình cho phù hợp với từng đoạn phim. Hệ thống âm thanh đa chiều Dolby Atmos sử dụng công nghệ âm thanh stereo và không gian rộng giúp người dùng đắm chìm trong không gian âm thanh sống động để tận hưởng những giai điệu say đắm hay những thước phim hành động gay cấn.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/Laptop/Macbook/Macbook-pro-16-inch-m2-pro-2023/macbook-pro-16-inch-m2-pro-2023-am-thanh-1.png\" alt=\"macbook-pro-16-inch-m2-pro-2023\"></p><p>&nbsp;</p><h2>Hệ thống kết nối trên MacBook Pro 16 inch M2 Pro 2023</h2><p>MacBook Pro 16 inch M2 Pro 2023 được trang bị 3 cổng Thunderbolt 4, HDMI và jack cắm tai nghe 3.5mm được phân bổ gọn gàng ở cạnh bên của laptop tạo nên tổng thể đẹp mắt nhưng vẫn đảm bảo kết nối và truyền tải dữ liệu trong quá trình sử dụng. Đảm bảo kết nối mạng của bạn luôn ổn định với Wi-Fi 6E (802.11ax) và kết nối không dây nhanh qua Bluetooth 5.3.</p><p>&nbsp;</p><p><img src=\"https://laptopre.vn/storage/photos/1/Laptop/Macbook/Macbook-pro-16-inch-m2-pro-2023/macbook-pro-16-inch-m2-pro-2023-ket-noi.png\" alt=\"macbook-pro-16-inch-m2-pro-2023\"></p><p>&nbsp;</p><h2>Lời kết</h2><p>MacBook Pro 16 inch M2 Pro 2023 có thiết kế thời trang, cùng hiệu năng mạnh mẽ của chip Apple M2 Pro có thể xử lý mọi tác vụ, trở thành chiếc máy tính xách tay hoàn hảo cho công việc và cuộc sống của bạn.</p>', 'stocking', '2023-07-24 21:03:14', '2023-07-24 21:03:14');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT cho bảng `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT cho bảng `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `images`
--
ALTER TABLE `images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
