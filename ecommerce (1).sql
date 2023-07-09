-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th7 09, 2023 lúc 02:42 AM
-- Phiên bản máy phục vụ: 10.4.25-MariaDB
-- Phiên bản PHP: 7.4.30

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
  `id` int(11) NOT NULL,
  `nameCategory` varchar(255) NOT NULL,
  `slugCategory` varchar(255) NOT NULL,
  `outstandingCategory` varchar(255) NOT NULL,
  `statusCategory` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `id` int(11) NOT NULL,
  `nameColor` varchar(255) NOT NULL,
  `product_color_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `colors`
--

INSERT INTO `colors` (`id`, `nameColor`, `product_color_id`, `createdAt`, `updatedAt`) VALUES
(47, 'black', 16, '2023-07-09 07:42:11', '2023-07-09 07:42:11'),
(48, 'red', 16, '2023-07-09 07:42:11', '2023-07-09 07:42:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `product_image_id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `createAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `images`
--

INSERT INTO `images` (`id`, `product_image_id`, `image_path`, `createAt`, `updatedAt`) VALUES
(45, 16, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/bjunwf9kjz9a5qhbwtxw.png', '2023-07-08 23:35:36', '2023-07-08 23:35:36'),
(46, 16, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/d8axwyhk8htgiiiha4ph.png', '2023-07-08 23:35:36', '2023-07-08 23:35:36'),
(47, 16, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/ueeyobaolsrdqbqmnvh7.png', '2023-07-08 23:35:36', '2023-07-08 23:35:36'),
(48, 16, 'https://res.cloudinary.com/djy3vgwfi/image/upload/v1688834137/h1ldbu6rirj0ghpfvj3m.png', '2023-07-08 23:35:36', '2023-07-08 23:35:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `productOrder` varchar(255) NOT NULL,
  `totalPrice` int(11) NOT NULL,
  `paymentMethod` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `slugProduct` varchar(255) NOT NULL,
  `nameProduct` varchar(255) NOT NULL,
  `price_has_ropped` int(11) NOT NULL,
  `categoryID` int(11) NOT NULL,
  `initial_price` int(11) NOT NULL,
  `contentProduct` text NOT NULL,
  `descriptionProduct` text NOT NULL,
  `statusProduct` varchar(255) NOT NULL,
  `createAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `slugProduct`, `nameProduct`, `price_has_ropped`, `categoryID`, `initial_price`, `contentProduct`, `descriptionProduct`, `statusProduct`, `createAt`, `updatedAt`) VALUES
(16, 'asus-rog-strix-g17-g713', 'ASUS ROG Strix G17 G713', 46000000, 51, 43500000, '<p><strong>Bộ vi xử lí</strong>: AMD Ryzen™ 9 7845HX Mobile Processor (12-core/24-thread, 12MB L2 cache, 64MB L3 cache, 3.0Ghz up to 5.2GHz max boost)</p><p><strong>RAM</strong>: 16GB DDR5-4800Mhz upto 32GB</p><p><strong>Bộ nhớ</strong>: 1TB PCIe® 4.0 NVMe™ M.2 SSD</p><p><strong>Card đồ hoạ:</strong> NVIDIA® GeForce RTX™ 4060 Laptop GPU 8GB GDDR6</p><p><strong>Màn hình:</strong> 17.3 inch 2.5K 240Hz</p><p><strong>Tình trạng sản phẩm:</strong>&nbsp;Mới 100% Nhập Khẩu Chính Hãng</p><p><strong>Bảo hành:&nbsp; 12 Tháng</strong></p>', '<p><strong>Laptop ASUS ROG Strix G17 G713</strong> tích hợp hàng loạt công nghệ hiện đại cùng cấu hình cực mạnh cho khả năng chơi game không giới hạn. Dòng máy tính xách tay chơi game cao cấp của ASUS chắc chắn sẽ làm hài lòng những game thủ khó tính nhất.</p><p>&nbsp;</p><p><i>Nguồn: ASUS</i></p><h2>Thiết kế ASUS ROG Strix G17 G713 hầm hố, mạnh mẽ</h2><p>Laptop Asus được hoàn thiện từ chất liệu vỏ nhựa với mặt sau bằng kim loại, các đường vân trên nắp máy sang trọng nhưng không kém phần hầm hố. 2.9kg vẫn nằm gọn trong một trong các ngăn của balo nên bạn có thể mang theo đi làm, đi chơi. Ánh sáng bàn phím Per-Key RGB cho phép bạn thể hiện phong cách của mình và khơi dậy hiệu quả chiến đấu, đồng thời giúp bạn làm việc dễ dàng trong môi trường thiếu sáng.</p><p><img src=\"https://laptopre.vn/storage/photos/1/ASUS/asus-rog-strix-g17-g713-2023/asus-rog-strix-g17-g713-2023-review.png\" alt=\"asus-rog-strix-g17-g713-2023\"></p><h2>Hiệu suất ASUS ROG Strix G17 G713 mạnh mẽ</h2><p>ASUS ROG Strix G17 G713 chạy bộ xử lý AMD Ryzen™ 9 7845HX Mobile Processor (12-core/24-thread, 12MB L2 cache, 64MB L3 cache, 3.0Ghz up to 5.2GHz max boost), giúp máy chạy ở hiệu suất cao nhất khi chơi game. Đa nhiệm mượt mà không giật lag. ASUS ROG Strix G17 G713RM được trang bị bộ nhớ DDR5-4800 tiêu chuẩn và PCle 4.0 mới nhất cho khả năng phản hồi tuyệt vời. Ổ cứng 1TB cho bạn thoải mái lưu trữ game dung lượng lớn hay chạy các phần mềm thiết kế chuyên nghiệp.</p><p><img src=\"https://laptopre.vn/storage/photos/1/ASUS/asus-rog-strix-g17-g713-2023/2.png\" alt=\"asus-rog-strix-g17-g713-2023\"></p><h2>Màn hình sắc nét, hệ thống tản nhiệt thông minh</h2><p>Laptop thiết kế đồ họa ASUS ROG Strix G17 G713 trang bị màn hình 2.5K 240Hz và công nghệ tiên tiến cho màu sắc rực rỡ và hạn chế lag khung hình. Công nghệ MUX Switch cải thiện hiệu suất đồ họa bằng cách kết nối trực tiếp card đồ họa với màn hình. Quạt Arc Flow với 84 cánh quạt chạy liên tục giúp nhiệt độ của máy luôn ở mức tối ưu. Thêm vào đó, hệ thống âm thanh vòm Dolby Atmos mang đến âm thanh sống động, chất lượng cao ở mọi nơi.</p><p><img src=\"https://laptopre.vn/storage/photos/1/ASUS/asus-rog-strix-g17-g713-2023/1.png\" alt=\"\"></p><h2>Camera và âm thanh</h2><p>Máy tính xách tay không có webcam tích hợp giúp tăng cường bảo mật cho người dùng đồng thời giảm dấu chân của bất động sản màn hình lớn hơn. Nếu cần sử dụng webcam để họp trực tuyến hoặc phát trực tuyến, bạn có thể mua một webcam riêng để kết nối với máy tính xách tay của mình. Thưởng thức âm nhạc và phim đắm chìm, hay nghe rõ tiếng bước chân của đối thủ trên chiến trường ảo nhờ chứng nhận Hi-Res, Smart AMP và công nghệ Dolby Atmos tái tạo âm thanh độ nét cao, âm thanh vòm 3D sống động.</p><p><img src=\"https://laptopre.vn/storage/photos/1/ASUS/asus-rog-strix-g17-g713-2023/asus-rog-strix-g17-g713-2023-am-thanh.png\" alt=\"asus-rog-strix-g17-g713-2023\"></p><h2>Hệ thống kết nối trên ASUS ROG Strix G17 G713</h2><p>Cạnh bên của laptop được trang bị các cổng kết nối thông dụng như: USB 3.2 Gen 2 Type-C, USB 3.2, LAN (RJ45) và USB Type-C phục vụ mọi nhu cầu truyền tải dữ liệu.</p>', 'stocking', '2023-07-08 23:16:10', '2023-07-08 23:16:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `role` enum('USER','ADMIN') NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `email`, `fullname`, `username`, `password`, `phone`, `address`, `role`, `createdAt`, `updatedAt`) VALUES
(6, 'qhuy.dev@gmail.com', 'LeQuocHuy', 'huydev', '$2b$10$bcHadi71jDQ93p5vUSITf.SFUtzDqYeMA7aa.WlwdFtLrnG10aQEa', NULL, NULL, 'ADMIN', '2023-06-27 13:59:30', '2023-06-27 13:59:30');

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
-- Chỉ mục cho bảng `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_image_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT cho bảng `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `colors`
--
ALTER TABLE `colors`
  ADD CONSTRAINT `colors_ibfk_1` FOREIGN KEY (`product_color_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`product_image_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
