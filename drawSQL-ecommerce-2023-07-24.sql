CREATE TABLE `products`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `categoryID` BIGINT NOT NULL,
    `nameProduct` VARCHAR(255) NOT NULL,
    `slugProduct` VARCHAR(255) NOT NULL,
    `price_has_ropped` INT NOT NULL,
    `initial_price` INT NOT NULL,
    `contentProduct` TEXT NOT NULL,
    `descriptionProduct` TEXT NOT NULL,
    `statusProduct` VARCHAR(255) NOT NULL,
    `createAt` DATETIME NOT NULL,
    `updatedAt` DATETIME NOT NULL
);
ALTER TABLE
    `products` ADD INDEX `products_categoryid_index`(`categoryID`);
CREATE TABLE `discounts`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `totalPrice` INT NOT NULL,
    `userID` BIGINT NOT NULL,
    `createdAt` DATETIME NOT NULL,
    `updatedAt` DATETIME NOT NULL
);
CREATE TABLE `colors`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nameColor` VARCHAR(255) NOT NULL,
    `product_color_id` BIGINT NOT NULL,
    `createdAt` DATETIME NOT NULL,
    `updatedAt` DATETIME NOT NULL
);
CREATE TABLE `categories`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nameCategory` VARCHAR(255) NOT NULL,
    `slugCategory` VARCHAR(255) NOT NULL,
    `outstandingCategory` VARCHAR(255) NOT NULL,
    `statusCategory` VARCHAR(255) NOT NULL,
    `createdAt` DATETIME NOT NULL,
    `updatedAt` DATETIME NOT NULL
);
CREATE TABLE `paymentvnpay`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `vnp_Amount` VARCHAR(255) NOT NULL,
    `vnp_BankCode` VARCHAR(255) NOT NULL,
    `vnp_BankTranNo` VARCHAR(255) NOT NULL,
    `vnp_CardType` VARCHAR(255) NOT NULL,
    `vnp_OrderInfo` VARCHAR(255) NOT NULL,
    `vnp_TransactionNo` VARCHAR(255) NOT NULL,
    `createdAt` DATETIME NOT NULL,
    `updatedAt` DATETIME NOT NULL
);
CREATE TABLE `users`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `email` VARCHAR(255) NOT NULL,
    `fullname` VARCHAR(255) NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `phone` INT NOT NULL,
    `city` VARCHAR(255) NOT NULL,
    `district` VARCHAR(255) NOT NULL,
    `commune` VARCHAR(255) NOT NULL,
    `address` TEXT NOT NULL,
    `role` ENUM('') NOT NULL,
    `createdAt` DATETIME NOT NULL,
    `updatedAt` DATETIME NOT NULL
);
CREATE TABLE `images`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `image_path` VARCHAR(255) NOT NULL,
    `product_image_id` BIGINT NOT NULL,
    `createAt` DATETIME NOT NULL,
    `updatedAt` DATETIME NOT NULL
);
CREATE TABLE `orders`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `code` VARCHAR(255) NOT NULL,
    `userID` BIGINT NOT NULL,
    `vnpayID` BIGINT NOT NULL,
    `productOrder` TEXT NOT NULL,
    `totalPrice` INT NOT NULL,
    `paymentMethod` VARCHAR(255) NOT NULL,
    `status` VARCHAR(255) NOT NULL,
    `createdAt` DATETIME NOT NULL,
    `updatedAt` DATETIME NOT NULL
);
ALTER TABLE
    `orders` ADD CONSTRAINT `orders_userid_foreign` FOREIGN KEY(`userID`) REFERENCES `users`(`id`);
ALTER TABLE
    `colors` ADD CONSTRAINT `colors_product_color_id_foreign` FOREIGN KEY(`product_color_id`) REFERENCES `products`(`id`);
ALTER TABLE
    `products` ADD CONSTRAINT `products_categoryid_foreign` FOREIGN KEY(`categoryID`) REFERENCES `categories`(`id`);
ALTER TABLE
    `orders` ADD CONSTRAINT `orders_vnpayid_foreign` FOREIGN KEY(`vnpayID`) REFERENCES `paymentvnpay`(`id`);
ALTER TABLE
    `images` ADD CONSTRAINT `images_product_image_id_foreign` FOREIGN KEY(`product_image_id`) REFERENCES `products`(`id`);
ALTER TABLE
    `discounts` ADD CONSTRAINT `discounts_userid_foreign` FOREIGN KEY(`userID`) REFERENCES `users`(`id`);