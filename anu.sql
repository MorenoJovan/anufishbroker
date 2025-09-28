-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 06, 2024 at 03:33 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `anu`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Freshwater Fish'),
(3, 'High-Value Species'),
(2, 'Saltwater Fish'),
(4, 'Seasonal Fish');

-- --------------------------------------------------------

--
-- Table structure for table `fish_names`
--

CREATE TABLE `fish_names` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `current_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fish_names`
--

INSERT INTO `fish_names` (`id`, `name`, `current_price`) VALUES
(26, 'bangus', 350.00),
(27, 'buwad', 50.00),
(28, 'baronday', 400.00),
(29, 'boasd', 300.00),
(30, 'nukos', 300.00),
(31, 'ering', 450.00),
(32, 'ilaga', 200.00),
(33, 'cora', 200.00),
(34, 'heso', 111.00),
(35, 'winsboro', 10.00),
(36, 'eros', 20.00),
(37, 'marlboro', 10.00);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `invoice_date` date NOT NULL,
  `due_date` date NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('Pending','Partially Paid','Paid') DEFAULT 'Pending',
  `paid_amount` decimal(10,2) DEFAULT 0.00,
  `admin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `user_id`, `invoice_date`, `due_date`, `total_amount`, `status`, `paid_amount`, `admin_id`) VALUES
(112, 9, '0000-00-00', '2024-09-04', 11700.00, 'Pending', 20000.00, NULL),
(113, NULL, '0000-00-00', '0000-00-00', 0.00, 'Paid', 5000.00, NULL),
(114, 14, '0000-00-00', '2024-09-07', 140000.00, 'Pending', 50000.00, NULL),
(115, NULL, '0000-00-00', '0000-00-00', 0.00, 'Pending', 1244.00, NULL),
(116, 10, '2024-09-04', '2024-09-04', 12300.00, 'Pending', 21341.00, NULL),
(117, NULL, '0000-00-00', '0000-00-00', 0.00, 'Paid', 12345.00, NULL),
(118, 10, '2024-09-04', '2024-09-04', 10650.00, 'Pending', 1234.00, NULL),
(119, NULL, '0000-00-00', '0000-00-00', 0.00, 'Paid', 12441.00, NULL),
(120, NULL, '0000-00-00', '0000-00-00', 0.00, 'Pending', 4123.00, NULL),
(121, 12, '2024-09-04', '2024-09-04', 3694200.00, 'Pending', 123124.00, NULL),
(122, NULL, '0000-00-00', '0000-00-00', 0.00, 'Paid', 234.00, NULL),
(123, NULL, '0000-00-00', '0000-00-00', 0.00, 'Paid', 2000.00, NULL),
(124, 12, '2024-09-05', '2024-09-14', 9369900.00, 'Pending', 44124.00, NULL),
(125, 11, '2024-09-05', '2024-09-07', 36900.00, 'Pending', 123.00, NULL),
(126, 10, '2024-09-05', '2024-09-20', 49200.00, 'Pending', 1412.00, NULL),
(127, 11, '2024-09-05', '2024-09-05', 36900.00, 'Pending', 4123.00, NULL),
(128, 10, '2024-09-05', '2024-09-05', 4924800.00, 'Pending', 213.00, NULL),
(129, 10, '2024-09-05', '2024-09-05', 4924800.00, 'Pending', 213.00, NULL),
(130, 11, '2024-09-05', '2024-09-13', 36900.00, 'Pending', 123.00, NULL),
(131, 11, '2024-09-05', '2024-10-04', 493600.00, 'Pending', 12341.00, NULL),
(132, 12, '2024-09-05', '2024-09-06', 36900.00, 'Pending', 12341.00, NULL),
(133, 11, '2024-09-05', '2024-09-13', 3694200.00, 'Pending', 12412.00, NULL),
(134, 16, '2024-09-05', '2024-09-05', 49249600.00, 'Pending', 123412.00, NULL),
(135, 12, '2024-09-05', '2024-09-19', 693600.00, 'Pending', 124123.00, NULL),
(136, 13, '2024-09-05', '2024-09-05', 37237200.00, 'Pending', 1234.00, NULL),
(137, 12, '2024-09-05', '2024-09-05', 64237200.00, 'Pending', 123124.00, NULL),
(138, 11, '2024-09-05', '2024-09-05', 36900.00, 'Pending', 124124.00, NULL),
(139, 11, '2024-09-05', '2024-10-09', 63900.00, 'Pending', 123123.00, NULL),
(140, 11, '2024-09-05', '2024-09-05', 49200.00, 'Pending', 123123.00, NULL),
(141, 11, '2024-09-05', '2024-09-27', 36936900.00, 'Pending', 123.00, NULL),
(142, 11, '2024-09-05', '2024-09-20', 6936900.00, 'Pending', 12412.00, NULL),
(143, 11, '2024-09-05', '2024-09-20', 3694200.00, 'Pending', 1234124.00, NULL),
(144, 13, '2024-09-05', '2024-09-25', 36942300.00, 'Pending', 123.00, NULL),
(145, 12, '2024-09-05', '2024-09-05', 36900.00, 'Pending', 12.00, NULL),
(146, 9, '2024-09-05', '2024-09-07', 200.00, 'Pending', 1234.00, NULL),
(147, 12, '2024-09-05', '2024-09-05', 99900.00, 'Pending', 333.00, NULL),
(148, NULL, '0000-00-00', '0000-00-00', 0.00, 'Paid', 123.00, NULL),
(149, NULL, '0000-00-00', '0000-00-00', 0.00, 'Paid', 123.00, NULL),
(150, 12, '2024-09-05', '2024-09-05', 6150.00, 'Pending', 1234.00, NULL),
(151, 10, '2024-09-05', '2024-09-21', 69801.00, 'Pending', 22345.00, NULL),
(152, 12, '2024-09-05', '2024-09-05', 63900.00, 'Pending', 0.00, NULL),
(153, NULL, '0000-00-00', '0000-00-00', 0.00, 'Paid', 213.00, NULL),
(154, 15, '2024-09-06', '2024-09-06', 50.00, 'Pending', 0.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `item_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `line_total` decimal(10,2) GENERATED ALWAYS AS (`quantity` * `unit_price`) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoice_items`
--

INSERT INTO `invoice_items` (`item_id`, `invoice_id`, `product_id`, `quantity`, `unit_price`) VALUES
(85, 112, 27, 234, 50.00),
(86, 113, 27, 123, 50.00),
(87, 114, 26, 400, 350.00),
(88, 115, 29, 231, 300.00),
(89, 116, 29, 41, 300.00),
(90, 117, 29, 1232, 300.00),
(91, 118, 27, 213, 50.00),
(92, 119, 28, 123, 400.00),
(93, 120, 30, 1234, 300.00),
(94, 121, 30, 12314, 300.00),
(95, 122, 28, 213, 400.00),
(96, 123, 29, 10, 300.00),
(97, 124, 29, 31233, 300.00),
(98, 125, 29, 123, 300.00),
(99, 126, 28, 123, 400.00),
(100, 127, 29, 123, 300.00),
(101, 128, 28, 12312, 400.00),
(102, 129, 28, 12312, 400.00),
(103, 130, 30, 123, 300.00),
(104, 131, 28, 1234, 400.00),
(105, 132, 29, 123, 300.00),
(106, 133, 29, 12314, 300.00),
(107, 134, 28, 123124, 400.00),
(108, 135, 30, 2312, 300.00),
(109, 136, 30, 124124, 300.00),
(110, 137, 30, 214124, 300.00),
(111, 138, 30, 123, 300.00),
(112, 139, 29, 213, 300.00),
(113, 140, 28, 123, 400.00),
(114, 141, 29, 123123, 300.00),
(115, 142, 30, 23123, 300.00),
(116, 143, 29, 12314, 300.00),
(117, 144, 29, 123141, 300.00),
(118, 145, 29, 123, 300.00),
(119, 146, 35, 20, 10.00),
(120, 147, 29, 333, 300.00),
(121, 148, 28, 234, 400.00),
(122, 149, 32, 234, 200.00),
(123, 150, 27, 123, 50.00),
(124, 151, 27, 123, 50.00),
(125, 151, 28, 123, 400.00),
(126, 151, 29, 31, 300.00),
(127, 151, 32, 3, 200.00),
(128, 151, 34, 41, 111.00),
(129, 152, 30, 213, 300.00),
(130, 153, 36, 12, 20.00),
(131, 154, 37, 5, 10.00);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `invoice_id`, `payment_date`, `amount`) VALUES
(3, NULL, '2024-08-31', 400.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `kilo` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `current_price` decimal(10,2) DEFAULT NULL,
  `arrival_date` date DEFAULT NULL,
  `arrival_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `category`, `kilo`, `description`, `photo`, `current_price`, `arrival_date`, `arrival_time`) VALUES
(1, 'Sample Product', 'Category', 10.00, 'Description', 'photo.jpg', 100.00, '2024-09-02', '20:41:51'),
(28, 'buwad', 'Saltwater Fish', 3000.00, 'buwadlame', NULL, 50.00, '2024-08-29', '22:41:00'),
(29, 'baronday', 'Saltwater Fish', 5000.00, '', NULL, 400.00, '2024-09-01', '21:37:00'),
(30, 'boasd', 'Saltwater Fish', 5000.00, '123', NULL, 300.00, '2024-09-02', '09:00:00'),
(31, 'nukos', 'Saltwater Fish', 500.00, 'asdg', NULL, 300.00, '2024-09-02', '10:54:00'),
(32, 'ering', 'Freshwater Fish', 3999.00, 'cat', NULL, 450.00, '2024-09-02', '20:47:00'),
(33, 'ilaga', 'Saltwater Fish', 350.00, '2asd', NULL, 200.00, '2024-09-04', '16:23:00'),
(34, 'cora', 'Freshwater Fish', 532.00, 'uktfghv', NULL, 200.00, '2024-09-05', '16:51:00'),
(35, 'heso', 'Freshwater Fish', 122.00, 'asas', NULL, 111.00, '2024-09-04', '20:14:00'),
(36, 'bangus', 'Freshwater Fish', 350.00, 'today price is 350', NULL, 350.00, '2024-09-04', '22:42:00'),
(37, 'winsboro', 'High-Value Species', 50.00, '10 kilo for to days video', NULL, 10.00, '2024-09-08', '15:53:00'),
(38, 'eros', 'Saltwater Fish', 500.00, 'asdasf', NULL, 20.00, '2024-09-06', '08:55:00'),
(39, 'marlboro', 'Freshwater Fish', 100.00, 'asdasf', NULL, 10.00, '2024-09-15', '08:58:00');

--
-- Triggers `products`
--
DELIMITER $$
CREATE TRIGGER `after_product_insert` AFTER INSERT ON `products` FOR EACH ROW BEGIN
    INSERT INTO stockin (product_id, date, weight, price, arrival_time)
    VALUES (NEW.product_id, CURDATE(), NEW.kilo, NEW.current_price, NEW.arrival_time);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `stockin`
--

CREATE TABLE `stockin` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `weight` decimal(10,2) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `arrival_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stockin`
--

INSERT INTO `stockin` (`id`, `product_id`, `date`, `weight`, `price`, `arrival_time`) VALUES
(1, 33, '2024-09-04', 350.00, 200.00, '16:23:00'),
(2, 34, '2024-09-04', 532.00, 200.00, '16:51:00'),
(3, 35, '2024-09-04', 122.00, 111.00, '20:14:00'),
(4, 36, '2024-09-04', 350.00, 350.00, '22:42:00'),
(5, 37, '2024-09-05', 50.00, 10.00, '15:53:00'),
(6, 38, '2024-09-06', 500.00, 20.00, '08:55:00'),
(7, 39, '2024-09-06', 100.00, 10.00, '08:58:00');

-- --------------------------------------------------------

--
-- Table structure for table `stockout`
--

CREATE TABLE `stockout` (
  `id` int(11) NOT NULL,
  `stockout_date` date NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `invoice_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stockout`
--

INSERT INTO `stockout` (`id`, `stockout_date`, `product_name`, `quantity`, `unit_price`, `invoice_id`) VALUES
(1, '2024-09-05', 'bangus', 35.00, 123.00, '1'),
(2, '2024-09-05', 'boasd', 12314.00, 300.00, '143'),
(3, '2024-09-05', 'boasd', 123141.00, 300.00, '144'),
(4, '2024-09-05', 'boasd', 123.00, 300.00, '145'),
(5, '2024-09-05', 'winsboro', 20.00, 10.00, '146'),
(6, '2024-09-05', 'boasd', 333.00, 300.00, '147'),
(7, '2024-09-05', 'baronday', 234.00, 400.00, '148'),
(8, '2024-09-05', 'ilaga', 234.00, 200.00, '149'),
(9, '2024-09-05', 'buwad', 123.00, 50.00, '150'),
(10, '2024-09-05', 'buwad', 123.00, 50.00, '151'),
(11, '2024-09-05', 'baronday', 123.00, 400.00, '151'),
(12, '2024-09-05', 'boasd', 31.00, 300.00, '151'),
(13, '2024-09-05', 'ilaga', 3.00, 200.00, '151'),
(14, '2024-09-05', 'heso', 41.00, 111.00, '151'),
(15, '2024-09-05', 'nukos', 213.00, 300.00, '152'),
(16, '2024-09-06', 'eros', 12.00, 20.00, '153'),
(17, '2024-09-06', 'marlboro', 5.00, 10.00, '154');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `item_purchased` varchar(255) DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `amount_paid` decimal(10,2) DEFAULT NULL,
  `down_payment` decimal(10,2) DEFAULT NULL,
  `outstanding_balance` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `invoice_id`, `transaction_date`, `item_purchased`, `quantity`, `amount_paid`, `down_payment`, `outstanding_balance`) VALUES
(1, 15, NULL, '2024-08-27', 'baronday', 30.00, 4000.00, 3000.00, 50000.00);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_table`
--

CREATE TABLE `transaction_table` (
  `transaction_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_of_transaction` date DEFAULT NULL,
  `item_purchased` varchar(255) DEFAULT NULL,
  `amount_paid` decimal(10,2) DEFAULT NULL,
  `down_payment` decimal(10,2) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `outstanding_balance` decimal(10,2) DEFAULT NULL,
  `kilos_purchased` decimal(10,2) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction_table`
--

INSERT INTO `transaction_table` (`transaction_id`, `user_id`, `date_of_transaction`, `item_purchased`, `amount_paid`, `down_payment`, `total_amount`, `outstanding_balance`, `kilos_purchased`, `invoice_id`) VALUES
(1, 16, '2024-08-01', 'barunday', 50000.00, 20000.00, 10000.00, 400000.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','client') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `lastName`, `contact`, `username`, `password`, `role`) VALUES
(9, 'jovanie', 'moreno', '1234234234', 'jovanie', 'jovanie', 'admin'),
(10, 'renato', 'cabintoy', '21342348', 'renato', 'renato', 'client'),
(11, 'travic', 'travoc', '1231238123', 'trav', 'trav', 'client'),
(12, 'lorenie', 'lorenie', '238798347', 'lorenie', 'lorenie', 'client'),
(13, 'moreno', 'moreno', '083240823', 'moreno', 'moreno', 'client'),
(14, 'belat', 'belat', '2308402834', 'belat', 'belat', 'client'),
(15, 'condoriano', 'condoriano', '123123213', 'condoriano', 'condorian', 'client'),
(16, 'junkok', 'junkok', '23408234', 'junkok', 'junkok', 'client'),
(17, 'gogo', 'gogo', '123123', 'gogo', 'gogo', 'client'),
(18, 'paraloyskie', 'paraloyskie', '123123', 'paraloyskie', 'paraloyskie', 'client'),
(19, 'sherwin', 'sherwin', '3248324', 'sherwin', 'sherwin', 'client');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `fish_names`
--
ALTER TABLE `fish_names`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `stockin`
--
ALTER TABLE `stockin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `stockout`
--
ALTER TABLE `stockout`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `transaction_table`
--
ALTER TABLE `transaction_table`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_invoice` (`invoice_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fish_names`
--
ALTER TABLE `fish_names`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `stockin`
--
ALTER TABLE `stockin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `stockout`
--
ALTER TABLE `stockout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transaction_table`
--
ALTER TABLE `transaction_table`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`);

--
-- Constraints for table `stockin`
--
ALTER TABLE `stockin`
  ADD CONSTRAINT `stockin_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`);

--
-- Constraints for table `transaction_table`
--
ALTER TABLE `transaction_table`
  ADD CONSTRAINT `fk_invoice` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `transaction_table_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
