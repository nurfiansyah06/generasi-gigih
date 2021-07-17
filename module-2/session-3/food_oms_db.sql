-- Adminer 4.7.7 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `customers` (`id`, `name`, `phone`) VALUES
(1,	'Budiawan',	'+621412341'),
(2,	'Agus',	'+628592333'),
(3,	'Budi',	'+621412321'),
(4,	'Joko',	'+621412412'),
(5,	'Slamet',	'+621415555');

DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `stock` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `menus` (`id`, `name`, `price`, `stock`) VALUES
(1,	'Nasi Goreng',	10000,	1),
(2,	'Ice Cream',	5000,	2),
(3,	'Nasi Uduk',	10000,	3),
(4,	'Es Teh',	2500,	4),
(5,	'Teh Anget',	2000,	5);

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details` (
  `order_id` int DEFAULT NULL,
  `menu_id` int DEFAULT NULL,
  `total` int DEFAULT NULL,
  KEY `order_id` (`order_id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `order_details` (`order_id`, `menu_id`, `total`) VALUES
(1,	1,	10000),
(1,	2,	10000),
(2,	3,	15000),
(2,	2,	15000),
(3,	1,	10000),
(4,	5,	2000),
(5,	1,	12000),
(5,	5,	12000);

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total` int DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `orders` (`id`, `total`, `created_at`, `customer_id`) VALUES
(1,	NULL,	'2021-07-17',	1),
(2,	NULL,	'2021-07-17',	2),
(3,	NULL,	'2021-07-17',	3),
(4,	NULL,	'2021-07-17',	4),
(5,	NULL,	'2021-07-17',	5);

-- 2021-07-17 15:06:04