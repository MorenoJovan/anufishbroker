-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 28, 2025 at 03:23 AM
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
-- Database: `anubroker`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_receivable`
--

CREATE TABLE `accounts_receivable` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `invoice_date` date NOT NULL,
  `due_date` date NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `paid_amount` decimal(10,2) NOT NULL,
  `outstanding_balance` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_receivable`
--

INSERT INTO `accounts_receivable` (`id`, `invoice_id`, `user_id`, `invoice_date`, `due_date`, `total_amount`, `paid_amount`, `outstanding_balance`) VALUES
(258, 2126, 252, '2024-10-23', '2024-10-24', 246800.00, 246800.00, 0.00),
(259, 2127, 252, '2024-10-25', '2024-10-30', 246762.98, 246762.98, 0.00),
(260, 2128, 253, '2024-10-25', '2024-10-28', 246800.00, 246800.00, 0.00),
(261, 2129, 253, '2024-10-25', '2024-10-28', 246800.00, 246800.00, 0.00),
(262, 2130, 252, '2024-10-28', '2024-10-30', 2462030.64, 2468.00, 2459562.64),
(263, 2131, 253, '2024-12-03', '2024-12-07', 4600.00, 4600.00, 0.00),
(264, 2132, 253, '2024-12-04', '2024-12-12', 4000.00, 2000.00, 2000.00),
(265, 2133, 259, '2024-12-04', '2024-12-12', 1500.00, 700.00, 800.00),
(266, 2134, 252, '2024-12-14', '2024-12-16', 24596.31, 0.00, 24596.31),
(267, 2135, 253, '2024-12-14', '2024-12-15', 2400.00, 123.00, 2277.00);

-- --------------------------------------------------------

--
-- Table structure for table `account_payable`
--

CREATE TABLE `account_payable` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `kilo` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `deduction` decimal(10,2) DEFAULT 0.00,
  `final_payable` decimal(10,2) NOT NULL,
  `payable_date` date NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `status` enum('unpaid','paid') DEFAULT 'unpaid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account_payable`
--

INSERT INTO `account_payable` (`id`, `product_id`, `kilo`, `total_price`, `deduction`, `final_payable`, `payable_date`, `supplier_id`, `status`) VALUES
(26, 237, 500, 100000.00, 7000.00, 93000.00, '2024-10-23', 18, 'unpaid'),
(27, 238, 23, 4600.00, 322.00, 4278.00, '2024-10-23', 18, 'paid'),
(28, 239, 213, 42600.00, 2982.00, 39618.00, '2024-10-23', 18, 'paid'),
(29, 240, 123, 24596.31, 1721.74, 22874.57, '2024-10-23', 18, 'paid'),
(30, 241, 231, 46200.00, 3234.00, 42966.00, '2024-10-25', 19, 'unpaid'),
(31, 242, 12, 2400.00, 168.00, 2232.00, '2024-10-28', 19, 'unpaid'),
(32, 243, 230, 46000.00, 3220.00, 42780.00, '2024-12-03', 18, 'unpaid'),
(33, 244, 200, 40000.00, 2800.00, 37200.00, '2024-12-04', 19, 'unpaid'),
(34, 245, 200, 30000.00, 2100.00, 27900.00, '2024-12-04', 20, 'unpaid');

-- --------------------------------------------------------

--
-- Table structure for table `ar_transactions`
--

CREATE TABLE `ar_transactions` (
  `id` int(11) NOT NULL,
  `ar_id` int(11) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `particulars` varchar(255) DEFAULT NULL,
  `debit_amount` decimal(15,2) DEFAULT 0.00,
  `credit_amount` decimal(15,2) DEFAULT 0.00,
  `balance` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ar_transactions`
--

INSERT INTO `ar_transactions` (`id`, `ar_id`, `transaction_date`, `particulars`, `debit_amount`, `credit_amount`, `balance`) VALUES
(305, 258, '2024-10-23', 'Payment Received', 123.00, 246800.00, 246677.00),
(306, 258, '2024-10-23', 'Payment Updated', 677.00, NULL, 246000.00),
(307, 258, '2024-10-23', 'Payment Updated', 46000.00, NULL, 200000.00),
(308, 258, '2024-10-23', 'Payment Updated', 1234.00, NULL, 198766.00),
(309, 259, '2024-10-25', 'Payment Received', 1234.00, 246762.98, 245528.98),
(310, 258, '2024-10-25', 'Payment Updated', 1234.00, NULL, 197532.00),
(311, 258, '2024-10-25', 'Payment Updated', 1234.00, NULL, 196298.00),
(312, 258, '2024-10-25', 'Payment Updated', 1234.00, NULL, 195064.00),
(313, 258, '2024-10-25', 'Payment Updated', 123.00, NULL, 194941.00),
(314, 258, '2024-10-25', 'Payment Updated', 194941.00, NULL, 0.00),
(315, 259, '2024-10-25', 'Payment Updated', 245528.98, NULL, 0.00),
(316, 260, '2024-10-25', 'Payment Received', 1234.00, 246800.00, 245566.00),
(317, 260, '2024-10-25', 'Payment Updated', 5566.00, NULL, 240000.00),
(318, 260, '2024-10-25', 'Payment Updated', 2000.00, NULL, 238000.00),
(319, 260, '2024-10-25', 'Payment Updated', 2000.00, NULL, 236000.00),
(320, 261, '2024-10-25', 'Payment Received', 1234.00, 246800.00, 245566.00),
(321, 262, '2024-10-28', 'Payment Received', 1234.00, 2462030.64, 2460796.64),
(322, 262, '2024-10-28', 'Payment Updated', 1234.00, NULL, 2459562.64),
(323, 260, '2024-12-03', 'Payment Updated', 2000.00, NULL, 234000.00),
(324, 263, '2024-12-03', 'Payment Received', 200.00, 4600.00, 4400.00),
(325, 264, '2024-12-04', 'Payment Received', 2000.00, 4000.00, 2000.00),
(326, 263, '2024-12-04', 'Payment Updated', 4400.00, NULL, 0.00),
(327, 260, '2024-12-04', 'Payment Updated', 234000.00, NULL, 0.00),
(328, 261, '2024-12-04', 'Payment Updated', 245566.00, NULL, 0.00),
(329, 265, '2024-12-04', 'Payment Received', 500.00, 1500.00, 1000.00),
(330, 265, '2024-12-04', 'Payment Updated', 200.00, NULL, 800.00),
(331, 267, '2024-12-14', 'Payment Received', 123.00, 2400.00, 2277.00);

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
  `admin_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `user_id`, `invoice_date`, `due_date`, `total_amount`, `status`, `paid_amount`, `admin_id`, `is_active`) VALUES
(2126, 252, '2024-10-23', '2024-10-24', 246800.00, 'Paid', 246800.00, NULL, 0),
(2127, 252, '2024-10-25', '2024-10-30', 246762.98, 'Paid', 246762.98, NULL, 0),
(2128, 253, '2024-10-25', '2024-10-28', 246800.00, 'Paid', 246800.00, NULL, 0),
(2129, 253, '2024-10-25', '2024-10-28', 246800.00, 'Paid', 246800.00, NULL, 0),
(2130, 252, '2024-10-28', '2024-10-30', 2462030.64, 'Pending', 2468.00, NULL, 1),
(2131, 253, '2024-12-03', '2024-12-07', 4600.00, 'Paid', 4600.00, NULL, 0),
(2132, 253, '2024-12-04', '2024-12-12', 4000.00, 'Pending', 2000.00, NULL, 1),
(2133, 259, '2024-12-04', '2024-12-12', 1500.00, 'Pending', 700.00, NULL, 1),
(2134, 252, '2024-12-14', '2024-12-16', 24596.31, 'Pending', 0.00, NULL, 1),
(2135, 253, '2024-12-14', '2024-12-15', 2400.00, 'Pending', 123.00, NULL, 1);

--
-- Triggers `invoices`
--
DELIMITER $$
CREATE TRIGGER `after_payment_update` AFTER UPDATE ON `invoices` FOR EACH ROW BEGIN
    -- Check if the paid_amount has changed
    IF NEW.paid_amount <> OLD.paid_amount THEN
        -- Update transactions table based on the invoice_id
        UPDATE transactions
        SET down_payment = NEW.paid_amount,
            outstanding_balance = (NEW.total_amount - NEW.paid_amount)
        WHERE invoice_id = NEW.id;
    END IF;
END
$$
DELIMITER ;

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
(251, 2126, 239, 1234, 200.00),
(252, 2127, 240, 1234, 199.97),
(253, 2128, 239, 1234, 200.00),
(254, 2129, 237, 1234, 200.00),
(255, 2130, 240, 12312, 199.97),
(256, 2131, 243, 23, 200.00),
(257, 2132, 244, 20, 200.00),
(258, 2133, 245, 10, 150.00),
(259, 2134, 240, 123, 199.97),
(260, 2135, 242, 12, 200.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `category` varchar(100) NOT NULL,
  `kilo` decimal(10,2) NOT NULL,
  `description` text NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `current_price` decimal(10,2) NOT NULL,
  `arrival_date` date DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `category`, `kilo`, `description`, `photo`, `current_price`, `arrival_date`, `arrival_time`, `supplier_id`) VALUES
(237, 'bangus', 'Saltwater Fish', 500.00, 'mao ni ang ni abot karon nga products bangus 500 kilo', NULL, 200.00, '2024-10-23', '17:55:00', 18),
(238, 'buwadbuwad', 'Freshwater Fish', 23.00, 'sdlfj', '1729679732040.png', 200.00, '2024-10-23', '18:35:00', 18),
(239, 'bloubugg', 'High-Value Species', 213.00, 'asda', '1729679919403.jpg', 200.00, '2024-10-23', '18:38:00', 18),
(240, 'grabgrabthisshit', 'Seasonal Fish', 123.00, 'asdas', '1729681007352.png', 199.97, '2024-10-23', '18:56:00', 18),
(241, 'sanicare', 'High-Value Species', 231.00, 'sdljfnds', '1729872034568.jpg', 200.00, '2024-10-25', '23:59:00', 19),
(242, 'asjd', 'High-Value Species', 12.00, 'ssdfsd', NULL, 200.00, '2024-10-28', '09:13:00', 19),
(243, 'bakokang', 'Freshwater Fish', 230.00, 'todays arriva bakokang with 230 kilo', NULL, 200.00, '2024-12-03', '22:29:00', 18),
(244, 'baronday', 'Freshwater Fish', 200.00, 'today arrival baronday', NULL, 200.00, '2024-12-04', '09:53:00', 19),
(245, 'tamarung', 'Freshwater Fish', 200.00, 'today arrival', NULL, 150.00, '2024-12-04', '10:17:00', 20);

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
(161, 237, '2024-10-23', 500.00, 200.00, '17:55:00'),
(162, 238, '2024-10-23', 23.00, 200.00, '18:35:00'),
(163, 239, '2024-10-23', 213.00, 200.00, '18:38:00'),
(164, 240, '2024-10-23', 123.00, 199.97, '18:56:00'),
(165, 241, '2024-10-26', 231.00, 200.00, '23:59:00'),
(166, 242, '2024-10-28', 12.00, 200.00, '09:13:00'),
(167, 243, '2024-12-03', 230.00, 200.00, '22:29:00'),
(168, 244, '2024-12-04', 200.00, 200.00, '09:53:00'),
(169, 245, '2024-12-04', 200.00, 150.00, '10:17:00');

-- --------------------------------------------------------

--
-- Table structure for table `stockout`
--

CREATE TABLE `stockout` (
  `id` int(11) NOT NULL,
  `stockout_date` date NOT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `invoice_id` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stockout`
--

INSERT INTO `stockout` (`id`, `stockout_date`, `quantity`, `unit_price`, `invoice_id`, `product_name`) VALUES
(172, '2024-10-23', 1234.00, 200.00, '2126', 'bloubugg'),
(173, '2024-10-25', 1234.00, 199.97, '2127', 'grabgrabthisshit'),
(174, '2024-10-25', 1234.00, 200.00, '2128', 'bloubugg'),
(175, '2024-10-25', 1234.00, 200.00, '2129', 'bangus'),
(176, '2024-10-28', 12312.00, 199.97, '2130', 'grabgrabthisshit'),
(177, '2024-12-03', 23.00, 200.00, '2131', 'bakokang'),
(178, '2024-12-04', 20.00, 200.00, '2132', 'baronday'),
(179, '2024-12-04', 10.00, 150.00, '2133', 'tamarung'),
(180, '2024-12-14', 123.00, 199.97, '2134', 'grabgrabthisshit'),
(181, '2024-12-14', 12.00, 200.00, '2135', 'asjd');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `SupplierID` int(11) NOT NULL,
  `SupplierFirstName` varchar(50) NOT NULL,
  `SupplierLastName` varchar(50) NOT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`SupplierID`, `SupplierFirstName`, `SupplierLastName`, `Address`, `City`, `PhoneNumber`) VALUES
(18, 'mark', 'Alpuerto', 'Baybay', 'Leyte', '23123'),
(19, 'estong', 'estong', 'estong', 'estong', 'estong'),
(20, 'tabinas', 'tabinas', 'bunga', 'baybay', '123123');

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
  `total_amount` decimal(10,2) DEFAULT NULL,
  `down_payment` decimal(10,2) DEFAULT NULL,
  `outstanding_balance` decimal(10,2) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `invoice_id`, `transaction_date`, `item_purchased`, `quantity`, `total_amount`, `down_payment`, `outstanding_balance`, `is_active`) VALUES
(258, 252, 2126, '2024-10-23', 'bloubugg', 1234.00, 246800.00, 246800.00, 0.00, 1),
(259, 252, 2127, '2024-10-25', 'grabgrabthisshit', 1234.00, 246762.98, 246762.98, 0.00, 1),
(260, 253, 2128, '2024-10-25', 'bloubugg', 1234.00, 246800.00, 246800.00, 0.00, 1),
(261, 253, 2129, '2024-10-25', 'bangus', 1234.00, 246800.00, 246800.00, 0.00, 1),
(262, 252, 2130, '2024-10-28', 'grabgrabthisshit', 12312.00, 2462030.64, 2468.00, 2459562.64, 1),
(263, 253, 2131, '2024-12-03', 'bakokang', 23.00, 4600.00, 4600.00, 0.00, 1),
(264, 253, 2132, '2024-12-04', 'baronday', 20.00, 4000.00, 2000.00, 2000.00, 1),
(265, 259, 2133, '2024-12-04', 'tamarung', 10.00, 1500.00, 700.00, 800.00, 1),
(266, 252, 2134, '2024-12-14', 'grabgrabthisshit', 123.00, 24596.31, 0.00, 24596.31, 1),
(267, 253, 2135, '2024-12-14', 'asjd', 12.00, 2400.00, 123.00, 2277.00, 1);

--
-- Triggers `transactions`
--
DELIMITER $$
CREATE TRIGGER `after_transaction_insert` AFTER INSERT ON `transactions` FOR EACH ROW BEGIN
    UPDATE accounts_receivable
    SET paid_amount = paid_amount + NEW.down_payment,
        outstanding_balance = total_amount - (paid_amount + NEW.down_payment)
    WHERE invoice_id = NEW.invoice_id;
END
$$
DELIMITER ;

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
(240, 'jovanie', 'jovanie', '123123', 'jovanie', '$2b$10$fAcWK9KL1966R26DszvshuXtHwdfrpthHwggnChrHEBt6dkwllgVy', 'admin'),
(252, 'bronwrevivial', 'bronwrevivial', 'bronwrevivial', 'bronwrevivial', '$2b$10$43AGd8ZOJcEf9uK0KvLbPeoYcXZUUHWANQpBPftmakWNe4JSIViOW', 'client'),
(253, 'marilou', 'marilou', 'marilou', 'marilou', '$2b$10$0zdB3tWUC8zB6QYN31IvNe6HF52KwhVdy2D/3kAonSlb7b637R/4y', 'client'),
(259, 'mark', 'mark', 'mark', 'mark', '$2b$10$Qmtm8k7c1R2MnceXfQWEvuYmC4tU7zez07xlkuOBExsE7FeeR7hYW', 'client');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_receivable`
--
ALTER TABLE `accounts_receivable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `account_payable`
--
ALTER TABLE `account_payable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `ar_transactions`
--
ALTER TABLE `ar_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ar_transactions_ibfk_1` (`ar_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
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
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `fk_product` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_supplier` (`supplier_id`);

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
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`SupplierID`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `invoice_id` (`invoice_id`);

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
-- AUTO_INCREMENT for table `accounts_receivable`
--
ALTER TABLE `accounts_receivable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=268;

--
-- AUTO_INCREMENT for table `account_payable`
--
ALTER TABLE `account_payable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `ar_transactions`
--
ALTER TABLE `ar_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=332;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2136;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=261;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;

--
-- AUTO_INCREMENT for table `stockin`
--
ALTER TABLE `stockin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT for table `stockout`
--
ALTER TABLE `stockout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `SupplierID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=268;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=260;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts_receivable`
--
ALTER TABLE `accounts_receivable`
  ADD CONSTRAINT `accounts_receivable_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`);

--
-- Constraints for table `account_payable`
--
ALTER TABLE `account_payable`
  ADD CONSTRAINT `account_payable_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_payable_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`SupplierID`) ON DELETE CASCADE;

--
-- Constraints for table `ar_transactions`
--
ALTER TABLE `ar_transactions`
  ADD CONSTRAINT `ar_transactions_ibfk_1` FOREIGN KEY (`ar_id`) REFERENCES `accounts_receivable` (`id`);

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`SupplierID`);

--
-- Constraints for table `stockin`
--
ALTER TABLE `stockin`
  ADD CONSTRAINT `stockin_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
