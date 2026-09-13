-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2026 at 07:33 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eims`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE `audit_log` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `entity_type` varchar(100) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `action` enum('CREATE','UPDATE','DELETE','LOGIN','LOGOUT','ACCESS_DENIED') NOT NULL,
  `old_value` text DEFAULT NULL,
  `new_value` text DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `occurred_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `audit_log`
--

INSERT INTO `audit_log` (`log_id`, `user_id`, `entity_type`, `entity_id`, `action`, `old_value`, `new_value`, `ip_address`, `occurred_at`) VALUES
(1, 1, 'products', 2, 'CREATE', NULL, '{\"name\":\"Test Product\",\"sku\":\"Test-001\"}', '::1', '2026-08-08 05:45:34'),
(2, 1, 'warehouses', 2, 'UPDATE', NULL, '{\"name\":\"Secondary Warehouse\",\"city\":\"Delhi 1\"}', '::1', '2026-08-08 05:51:15'),
(3, 1, 'inventory_items', 1, 'UPDATE', '{\"qty\":\"15.00\"}', '{\"qty\":4,\"type\":\"ISSUE\"}', '::1', '2026-08-08 06:04:26'),
(4, 1, 'suppliers', 1, 'CREATE', NULL, '{\"name\":\"Sharma Traders\",\"email\":\"sharma@test.com\"}', '::1', '2026-08-08 06:09:32'),
(5, 1, 'suppliers', 1, 'UPDATE', NULL, '{\"name\":\"Sharma Traders\",\"email\":\"sharma@test.com\"}', '::1', '2026-08-08 06:11:55'),
(6, 1, 'purchase_orders', 1, 'CREATE', NULL, '{\"supplier_id\":1,\"status\":\"DRAFT\"}', '::1', '2026-08-08 11:14:22'),
(7, 1, 'purchase_orders', 2, 'CREATE', NULL, '{\"supplier_id\":1,\"status\":\"DRAFT\"}', '::1', '2026-08-08 11:16:52'),
(8, 1, 'purchase_orders', 3, 'CREATE', NULL, '{\"supplier_id\":1,\"status\":\"DRAFT\"}', '::1', '2026-08-08 11:16:58'),
(9, 1, 'purchase_orders', 3, 'UPDATE', NULL, '{\"total_amount\":175000}', '::1', '2026-08-08 11:18:03'),
(10, 1, 'purchase_orders', 3, 'UPDATE', NULL, '{\"status\":\"SENT\"}', '::1', '2026-08-08 11:19:01'),
(11, 1, 'purchase_orders', 3, 'UPDATE', NULL, '{\"status\":\"SENT\"}', '::1', '2026-08-08 11:19:14'),
(12, 1, 'purchase_orders', 3, 'UPDATE', NULL, '{\"status\":\"CONFIRMED\"}', '::1', '2026-08-08 11:22:05'),
(13, 1, 'purchase_orders', 3, 'UPDATE', NULL, '{\"status\":\"RECEIVED\",\"action\":\"GOODS_RECEIVED\"}', '::1', '2026-08-08 11:23:15'),
(14, 1, 'sales_orders', 1, 'CREATE', NULL, '{\"customer_name\":\"Ramesh\"}', '::1', '2026-08-08 11:30:26'),
(15, 1, 'sales_orders', 2, 'CREATE', NULL, '{\"customer_name\":\"Rahul Verma\"}', '::1', '2026-08-08 11:32:34'),
(16, 1, 'sales_orders', 2, 'UPDATE', NULL, '{\"total_amount\":86000}', '::1', '2026-08-08 11:32:40'),
(17, 1, 'sales_orders', 2, 'UPDATE', NULL, '{\"status\":\"CONFIRMED\"}', '::1', '2026-08-08 11:34:13'),
(18, 1, 'sales_orders', 2, 'UPDATE', NULL, '{\"status\":\"PICKING\"}', '::1', '2026-08-08 11:34:16'),
(19, 1, 'sales_orders', 2, 'UPDATE', NULL, '{\"status\":\"DISPATCHED\"}', '::1', '2026-08-08 11:35:29'),
(20, 1, 'sales_orders', 2, 'UPDATE', NULL, '{\"status\":\"DELIVERED\"}', '::1', '2026-08-08 11:35:34'),
(21, 1, 'rma_records', 1, 'CREATE', NULL, '{\"so_id\":2,\"reason_code\":\"WRONG_ITEM\"}', '::1', '2026-08-08 11:41:24'),
(22, 1, 'rma_records', 1, 'UPDATE', NULL, '{\"status\":\"RECEIVED\"}', '::1', '2026-08-08 11:42:53'),
(23, 1, 'rma_records', 1, 'UPDATE', NULL, '{\"status\":\"INSPECTED\",\"disposition\":\"RESTOCK\"}', '::1', '2026-08-08 11:43:11'),
(24, 1, 'rma_records', 1, 'UPDATE', NULL, '{\"status\":\"CLOSED\"}', '::1', '2026-08-08 11:43:14'),
(25, 1, 'purchase_orders', 2, 'UPDATE', NULL, '{\"status\":\"CANCELLED\"}', '::1', '2026-08-08 11:48:22'),
(26, 1, 'users', 3, 'CREATE', NULL, '{\"full_name\":\"Test Staff\",\"role\":\"STAFF\"}', '::1', '2026-08-08 16:06:16'),
(27, 1, 'users', 3, 'UPDATE', NULL, '{\"role\":\"MANAGER\"}', '::1', '2026-08-08 16:06:57'),
(28, 1, 'users', 4, 'CREATE', NULL, '{\"full_name\":\"Test Viewer\",\"role\":\"VIEWER\"}', '::1', '2026-08-08 16:35:38'),
(29, 1, 'users', 3, 'UPDATE', NULL, '{\"role\":\"STAFF\"}', '::1', '2026-08-08 16:53:52'),
(30, 3, 'purchase_orders', 1, 'UPDATE', NULL, '{\"status\":\"SENT\"}', '::1', '2026-08-08 16:54:59'),
(31, 1, 'company_settings', 1, 'UPDATE', NULL, '{\"business_name\":\"Sharma Enterprise\"}', '::1', '2026-08-09 04:50:38'),
(32, 1, 'sales_orders', 3, 'CREATE', NULL, '{\"type\":\"QUICK_BILL\",\"total\":43000}', '::1', '2026-08-09 05:49:46'),
(33, 1, 'sales_orders', 4, 'CREATE', NULL, '{\"type\":\"QUICK_BILL\",\"total\":41000,\"payment_status\":\"PARTIAL\"}', '::1', '2026-08-09 10:51:39'),
(34, 1, 'company_settings', 1, 'UPDATE', NULL, '{\"business_name\":\"Sharma Enterprise\"}', '::1', '2026-08-09 11:04:30'),
(35, 1, 'sales_orders', 5, 'CREATE', NULL, '{\"type\":\"QUICK_BILL\",\"total\":43000,\"payment_status\":\"DUE\"}', '::1', '2026-08-09 11:08:01'),
(36, 1, 'sales_orders', 6, 'CREATE', NULL, '{\"type\":\"QUICK_BILL\",\"total\":43000,\"payment_status\":\"PARTIAL\"}', '::1', '2026-08-10 02:58:04'),
(37, 1, 'users', 3, 'UPDATE', NULL, '{\"role\":\"ADMIN\"}', '::1', '2026-08-10 03:04:24'),
(38, 1, 'users', 3, 'UPDATE', NULL, '{\"role\":\"MANAGER\"}', '::1', '2026-08-10 03:04:27'),
(39, 1, 'users', 3, 'UPDATE', NULL, '{\"action\":\"PASSWORD_RESET\"}', '::1', '2026-08-12 11:29:43'),
(40, 1, 'users', 3, 'UPDATE', NULL, '{\"action\":\"PASSWORD_RESET\"}', '::1', '2026-08-12 11:40:59'),
(41, 1, 'sales_orders', 7, 'CREATE', NULL, '{\"type\":\"QUICK_BILL\",\"total\":43000,\"payment_status\":\"DUE\"}', '::1', '2026-08-12 11:41:37');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `description`, `created_at`) VALUES
(1, 'Electronics', '', '2026-04-14 05:24:11'),
(2, 'Stationery', '', '2026-04-14 05:24:24'),
(3, 'Food Items', '', '2026-04-14 05:24:40'),
(4, 'Medicine', '', '2026-04-14 05:24:47'),
(5, 'Furniture', '', '2026-04-14 05:24:57');

-- --------------------------------------------------------

--
-- Table structure for table `company_settings`
--

CREATE TABLE `company_settings` (
  `id` int(11) NOT NULL DEFAULT 1,
  `business_name` varchar(255) NOT NULL DEFAULT 'Your Business Name',
  `address` text DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `gstin` varchar(50) DEFAULT NULL,
  `upi_id` varchar(100) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `company_settings`
--

INSERT INTO `company_settings` (`id`, `business_name`, `address`, `phone`, `email`, `gstin`, `upi_id`, `updated_at`) VALUES
(1, 'Sharma Enterprise', '', '9999999980', 'sharma@enter.com', '', '9888888765@upi', '2026-08-09 11:04:30');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_items`
--

CREATE TABLE `inventory_items` (
  `item_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `quantity_on_hand` decimal(10,2) NOT NULL DEFAULT 0.00,
  `quantity_reserved` decimal(10,2) NOT NULL DEFAULT 0.00,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `inventory_items`
--

INSERT INTO `inventory_items` (`item_id`, `product_id`, `location_id`, `quantity_on_hand`, `quantity_reserved`, `updated_at`) VALUES
(1, 1, 1, 3.00, 0.00, '2026-08-12 11:41:37');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `location_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `zone_code` varchar(50) DEFAULT NULL,
  `bin_code` varchar(50) DEFAULT NULL,
  `location_type` enum('RACK','FLOOR','COLD','QUARANTINE') DEFAULT 'RACK',
  `capacity` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`location_id`, `warehouse_id`, `zone_code`, `bin_code`, `location_type`, `capacity`, `created_at`) VALUES
(1, 1, 'A1', 'A1-01', 'RACK', 1000.00, '2026-08-08 04:54:50'),
(2, 1, 'B1', 'B1-01', 'FLOOR', 500.00, '2026-08-08 05:35:52');

-- --------------------------------------------------------

--
-- Table structure for table `movement_records`
--

CREATE TABLE `movement_records` (
  `movement_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `from_location_id` int(11) DEFAULT NULL,
  `to_location_id` int(11) DEFAULT NULL,
  `movement_type` enum('RECEIPT','ISSUE','TRANSFER','ADJUSTMENT','RESTOCK') NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `qty_before` decimal(10,2) NOT NULL,
  `qty_after` decimal(10,2) NOT NULL,
  `reference_type` varchar(50) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `performed_by` int(11) NOT NULL,
  `occurred_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `movement_records`
--

INSERT INTO `movement_records` (`movement_id`, `product_id`, `from_location_id`, `to_location_id`, `movement_type`, `quantity`, `qty_before`, `qty_after`, `reference_type`, `reference_id`, `notes`, `performed_by`, `occurred_at`) VALUES
(1, 1, NULL, 1, 'RECEIPT', 20.00, 0.00, 20.00, NULL, NULL, 'First Stock Entry', 1, '2026-08-08 05:05:33'),
(2, 1, 1, NULL, 'ISSUE', 5.00, 20.00, 15.00, NULL, NULL, 'Test Issue', 1, '2026-08-08 05:07:16'),
(3, 1, 1, NULL, 'ISSUE', 11.00, 15.00, 4.00, NULL, NULL, '', 1, '2026-08-08 06:04:26'),
(4, 1, NULL, 1, 'RECEIPT', 5.00, 4.00, 9.00, 'PO', 3, NULL, 1, '2026-08-08 11:23:15'),
(5, 1, 1, NULL, 'ISSUE', 2.00, 9.00, 7.00, 'SO', 2, NULL, 1, '2026-08-08 11:35:29'),
(6, 1, NULL, 1, 'RESTOCK', 1.00, 7.00, 8.00, 'RMA', 1, NULL, 1, '2026-08-08 11:43:11'),
(7, 1, 1, NULL, 'ISSUE', 1.00, 8.00, 7.00, 'SO', 3, NULL, 1, '2026-08-09 05:49:46'),
(8, 1, 1, NULL, 'ISSUE', 1.00, 7.00, 6.00, 'SO', 4, NULL, 1, '2026-08-09 10:51:39'),
(9, 1, 1, NULL, 'ISSUE', 1.00, 6.00, 5.00, 'SO', 5, NULL, 1, '2026-08-09 11:08:01'),
(10, 1, 1, NULL, 'ISSUE', 1.00, 5.00, 4.00, 'SO', 6, NULL, 1, '2026-08-10 02:58:04'),
(11, 1, 1, NULL, 'ISSUE', 1.00, 4.00, 3.00, 'SO', 7, NULL, 1, '2026-08-12 11:41:37');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `so_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` enum('CASH','UPI','CARD','CREDIT') DEFAULT 'CASH',
  `payment_date` date NOT NULL,
  `recorded_by` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `po_line_items`
--

CREATE TABLE `po_line_items` (
  `po_line_id` int(11) NOT NULL,
  `po_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity_ordered` decimal(10,2) NOT NULL,
  `quantity_received` decimal(10,2) DEFAULT 0.00,
  `unit_cost` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `po_line_items`
--

INSERT INTO `po_line_items` (`po_line_id`, `po_id`, `product_id`, `quantity_ordered`, `quantity_received`, `unit_cost`, `created_at`) VALUES
(1, 3, 1, 5.00, 5.00, 35000.00, '2026-08-08 11:18:03');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sku` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `unit_of_measure` varchar(50) DEFAULT 'EACH',
  `reorder_point` decimal(10,2) DEFAULT 0.00,
  `safety_stock` decimal(10,2) DEFAULT 0.00,
  `cost_price` decimal(10,2) NOT NULL,
  `selling_price` decimal(10,2) NOT NULL,
  `status` enum('ACTIVE','DISCONTINUED') DEFAULT 'ACTIVE',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `sku`, `description`, `category_id`, `unit_of_measure`, `reorder_point`, `safety_stock`, `cost_price`, `selling_price`, `status`, `created_by`, `created_at`) VALUES
(1, 'Dell Laptop', 'DELL-LAP-001', '', 1, 'EACH', 5.00, 2.00, 35000.00, 43000.00, 'ACTIVE', 1, '2026-08-07 12:10:31'),
(2, 'Test Product', 'Test-001', '', 3, 'EACH', 5.00, 2.00, 5000.00, 5001.00, 'ACTIVE', 1, '2026-08-08 05:45:34');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `po_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `status` enum('DRAFT','SENT','CONFIRMED','PARTIALLY_RECEIVED','RECEIVED','CLOSED','CANCELLED') DEFAULT 'DRAFT',
  `expected_delivery_date` date DEFAULT NULL,
  `total_amount` decimal(14,2) DEFAULT 0.00,
  `notes` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `purchase_orders`
--

INSERT INTO `purchase_orders` (`po_id`, `supplier_id`, `warehouse_id`, `status`, `expected_delivery_date`, `total_amount`, `notes`, `created_by`, `approved_by`, `created_at`) VALUES
(1, 1, 1, 'SENT', '2026-08-22', 0.00, '', 1, NULL, '2026-08-08 11:14:22'),
(2, 1, 1, 'CANCELLED', '2026-08-22', 0.00, '', 1, NULL, '2026-08-08 11:16:52'),
(3, 1, 1, 'RECEIVED', '2026-08-22', 175000.00, '', 1, 1, '2026-08-08 11:16:58');

-- --------------------------------------------------------

--
-- Table structure for table `reorder_alerts`
--

CREATE TABLE `reorder_alerts` (
  `alert_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `current_qty` decimal(10,2) NOT NULL,
  `reorder_point` decimal(10,2) NOT NULL,
  `alert_status` enum('ACTIVE','ACKNOWLEDGED') DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `acknowledged_by` int(11) DEFAULT NULL,
  `acknowledged_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `reorder_alerts`
--

INSERT INTO `reorder_alerts` (`alert_id`, `product_id`, `location_id`, `current_qty`, `reorder_point`, `alert_status`, `created_at`, `acknowledged_by`, `acknowledged_at`) VALUES
(1, 1, 1, 4.00, 5.00, 'ACKNOWLEDGED', '2026-08-08 06:04:26', NULL, '2026-08-08 16:53:15');

-- --------------------------------------------------------

--
-- Table structure for table `rma_records`
--

CREATE TABLE `rma_records` (
  `rma_id` int(11) NOT NULL,
  `so_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity_returned` decimal(10,2) NOT NULL,
  `reason_code` enum('DAMAGED','WRONG_ITEM','NOT_REQUIRED','EXPIRED','OTHER') NOT NULL,
  `status` enum('INITIATED','RECEIVED','INSPECTED','CLOSED') DEFAULT 'INITIATED',
  `item_condition` enum('GOOD','DAMAGED','EXPIRED') DEFAULT NULL,
  `disposition` enum('RESTOCK','SCRAP','RETURN_TO_SUPPLIER') DEFAULT NULL,
  `inspected_by` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `rma_records`
--

INSERT INTO `rma_records` (`rma_id`, `so_id`, `product_id`, `quantity_returned`, `reason_code`, `status`, `item_condition`, `disposition`, `inspected_by`, `notes`, `created_at`) VALUES
(1, 2, 1, 1.00, 'WRONG_ITEM', 'CLOSED', 'GOOD', 'RESTOCK', 1, '', '2026-08-08 11:41:24');

-- --------------------------------------------------------

--
-- Table structure for table `sales_orders`
--

CREATE TABLE `sales_orders` (
  `so_id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(100) DEFAULT NULL,
  `customer_phone` varchar(20) DEFAULT NULL,
  `order_reference` varchar(100) DEFAULT NULL,
  `status` enum('DRAFT','CONFIRMED','PICKING','DISPATCHED','DELIVERED','CANCELLED') DEFAULT 'DRAFT',
  `order_date` date NOT NULL,
  `dispatch_date` date DEFAULT NULL,
  `total_amount` decimal(14,2) DEFAULT 0.00,
  `discount_amount` decimal(10,2) DEFAULT 0.00,
  `payment_method` enum('CASH','UPI','CARD','CREDIT') DEFAULT 'CASH',
  `amount_paid` decimal(10,2) DEFAULT 0.00,
  `payment_status` enum('PAID','PARTIAL','DUE') DEFAULT 'DUE',
  `notes` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sales_orders`
--

INSERT INTO `sales_orders` (`so_id`, `customer_name`, `customer_email`, `customer_phone`, `order_reference`, `status`, `order_date`, `dispatch_date`, `total_amount`, `discount_amount`, `payment_method`, `amount_paid`, `payment_status`, `notes`, `created_by`, `created_at`) VALUES
(1, 'Ramesh', 'test123@tst.com', '7023839324', '78393', 'DRAFT', '2026-08-08', NULL, 0.00, 0.00, 'CASH', 0.00, 'DUE', NULL, 1, '2026-08-08 11:30:26'),
(2, 'Rahul Verma', 'rahul@test.com', '9998887777', '', 'DELIVERED', '2026-08-08', '2026-08-08', 86000.00, 0.00, 'CASH', 0.00, 'DUE', NULL, 1, '2026-08-08 11:32:34'),
(3, 'Walk-in Customer', NULL, NULL, NULL, 'DELIVERED', '2026-08-09', '2026-08-09', 43000.00, 0.00, 'CASH', 0.00, 'DUE', NULL, 1, '2026-08-09 05:49:46'),
(4, 'Walk-in Customer', NULL, NULL, NULL, 'DELIVERED', '2026-08-09', '2026-08-09', 41000.00, 2000.00, 'CREDIT', 20000.00, 'PARTIAL', NULL, 1, '2026-08-09 10:51:39'),
(5, 'Walk-in Customer', NULL, NULL, NULL, 'DELIVERED', '2026-08-09', '2026-08-09', 43000.00, 0.00, 'CREDIT', 0.00, 'DUE', NULL, 1, '2026-08-09 11:08:01'),
(6, 'Walk-in Customer', NULL, NULL, NULL, 'DELIVERED', '2026-08-10', '2026-08-10', 43000.00, 0.00, 'CARD', 30000.00, 'PARTIAL', NULL, 1, '2026-08-10 02:58:04'),
(7, 'Walk-in Customer', NULL, NULL, NULL, 'DELIVERED', '2026-08-12', '2026-08-12', 43000.00, 0.00, 'CREDIT', 0.00, 'DUE', NULL, 1, '2026-08-12 11:41:37');

-- --------------------------------------------------------

--
-- Table structure for table `so_line_items`
--

CREATE TABLE `so_line_items` (
  `so_line_id` int(11) NOT NULL,
  `so_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity_ordered` decimal(10,2) NOT NULL,
  `quantity_fulfilled` decimal(10,2) DEFAULT 0.00,
  `unit_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `so_line_items`
--

INSERT INTO `so_line_items` (`so_line_id`, `so_id`, `product_id`, `quantity_ordered`, `quantity_fulfilled`, `unit_price`, `created_at`) VALUES
(1, 2, 1, 2.00, 2.00, 43000.00, '2026-08-08 11:32:40'),
(2, 3, 1, 1.00, 1.00, 43000.00, '2026-08-09 05:49:46'),
(3, 4, 1, 1.00, 1.00, 43000.00, '2026-08-09 10:51:39'),
(4, 5, 1, 1.00, 1.00, 43000.00, '2026-08-09 11:08:01'),
(5, 6, 1, 1.00, 1.00, 43000.00, '2026-08-10 02:58:04'),
(6, 7, 1, 1.00, 1.00, 43000.00, '2026-08-12 11:41:37');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `payment_terms` varchar(100) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT 0.0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `name`, `contact_person`, `email`, `phone`, `address`, `payment_terms`, `rating`, `created_at`) VALUES
(1, 'Sharma Traders', 'Rajesh Sharma', 'sharma@test.com', '9876543210', '', 'Net 30 days', 4.4, '2026-08-08 06:09:32');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_items`
--

CREATE TABLE `supplier_items` (
  `supplier_item_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `unit_cost` decimal(10,2) NOT NULL,
  `lead_time_days` int(11) DEFAULT 0,
  `is_preferred` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `supplier_items`
--

INSERT INTO `supplier_items` (`supplier_item_id`, `supplier_id`, `product_id`, `unit_cost`, `lead_time_days`, `is_preferred`, `created_at`) VALUES
(1, 1, 1, 35000.00, 3, 1, '2026-08-08 06:11:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('ADMIN','MANAGER','STAFF','VIEWER') NOT NULL,
  `status` enum('ACTIVE','INACTIVE') DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_login_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`, `role`, `status`, `created_at`, `last_login_at`) VALUES
(1, 'Super Admin', 'admin@eims.com', '$2y$10$KgPXCgu6Y5YEz7bbUvNYEuBbGfEJx2AVz7nwYVR9tUKuupZCyUQAm', 'ADMIN', 'ACTIVE', '2026-04-14 04:44:51', '2026-09-07 10:51:10'),
(3, 'Test Staff', 'staff@test.com', '$2y$10$Tyw5rQ36BEi.uddQB7Ythu5xhFSCL9mYPsOXJIzQh64D3OZ3TN2CW', 'MANAGER', 'ACTIVE', '2026-08-08 16:06:16', '2026-08-08 22:24:16'),
(4, 'Test Viewer', 'viewer@test.com', '$2y$10$lTnIgipf/9L6gwC.b8SivOjb2BDIuW3igTW2/EY85hS/5M1qTA5HC', 'VIEWER', 'ACTIVE', '2026-08-08 16:35:38', '2026-08-08 22:15:35');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `warehouse_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`warehouse_id`, `name`, `address`, `city`, `manager_id`, `created_at`) VALUES
(1, 'Main Warehouse', 'Jaipur, Rajasthan', 'jaipur2', NULL, '2026-08-08 04:54:29'),
(2, 'Secondary Warehouse', '', 'Delhi 1', NULL, '2026-08-08 05:17:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `company_settings`
--
ALTER TABLE `company_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory_items`
--
ALTER TABLE `inventory_items`
  ADD PRIMARY KEY (`item_id`),
  ADD UNIQUE KEY `unique_product_location` (`product_id`,`location_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `movement_records`
--
ALTER TABLE `movement_records`
  ADD PRIMARY KEY (`movement_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `from_location_id` (`from_location_id`),
  ADD KEY `to_location_id` (`to_location_id`),
  ADD KEY `performed_by` (`performed_by`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `so_id` (`so_id`),
  ADD KEY `recorded_by` (`recorded_by`);

--
-- Indexes for table `po_line_items`
--
ALTER TABLE `po_line_items`
  ADD PRIMARY KEY (`po_line_id`),
  ADD UNIQUE KEY `unique_po_product` (`po_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `sku` (`sku`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`po_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `warehouse_id` (`warehouse_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `approved_by` (`approved_by`);

--
-- Indexes for table `reorder_alerts`
--
ALTER TABLE `reorder_alerts`
  ADD PRIMARY KEY (`alert_id`),
  ADD UNIQUE KEY `unique_product_location` (`product_id`,`location_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `acknowledged_by` (`acknowledged_by`);

--
-- Indexes for table `rma_records`
--
ALTER TABLE `rma_records`
  ADD PRIMARY KEY (`rma_id`),
  ADD KEY `so_id` (`so_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `inspected_by` (`inspected_by`);

--
-- Indexes for table `sales_orders`
--
ALTER TABLE `sales_orders`
  ADD PRIMARY KEY (`so_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `so_line_items`
--
ALTER TABLE `so_line_items`
  ADD PRIMARY KEY (`so_line_id`),
  ADD UNIQUE KEY `unique_so_product` (`so_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `supplier_items`
--
ALTER TABLE `supplier_items`
  ADD PRIMARY KEY (`supplier_item_id`),
  ADD UNIQUE KEY `unique_supplier_product` (`supplier_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`warehouse_id`),
  ADD KEY `manager_id` (`manager_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_log`
--
ALTER TABLE `audit_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `inventory_items`
--
ALTER TABLE `inventory_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `movement_records`
--
ALTER TABLE `movement_records`
  MODIFY `movement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `po_line_items`
--
ALTER TABLE `po_line_items`
  MODIFY `po_line_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `po_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reorder_alerts`
--
ALTER TABLE `reorder_alerts`
  MODIFY `alert_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rma_records`
--
ALTER TABLE `rma_records`
  MODIFY `rma_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sales_orders`
--
ALTER TABLE `sales_orders`
  MODIFY `so_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `so_line_items`
--
ALTER TABLE `so_line_items`
  MODIFY `so_line_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supplier_items`
--
ALTER TABLE `supplier_items`
  MODIFY `supplier_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `warehouse_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD CONSTRAINT `audit_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `inventory_items`
--
ALTER TABLE `inventory_items`
  ADD CONSTRAINT `inventory_items_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `inventory_items_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`);

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`warehouse_id`);

--
-- Constraints for table `movement_records`
--
ALTER TABLE `movement_records`
  ADD CONSTRAINT `movement_records_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `movement_records_ibfk_2` FOREIGN KEY (`from_location_id`) REFERENCES `locations` (`location_id`),
  ADD CONSTRAINT `movement_records_ibfk_3` FOREIGN KEY (`to_location_id`) REFERENCES `locations` (`location_id`),
  ADD CONSTRAINT `movement_records_ibfk_4` FOREIGN KEY (`performed_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`so_id`) REFERENCES `sales_orders` (`so_id`),
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`recorded_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `po_line_items`
--
ALTER TABLE `po_line_items`
  ADD CONSTRAINT `po_line_items_ibfk_1` FOREIGN KEY (`po_id`) REFERENCES `purchase_orders` (`po_id`),
  ADD CONSTRAINT `po_line_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD CONSTRAINT `purchase_orders_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`),
  ADD CONSTRAINT `purchase_orders_ibfk_2` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`warehouse_id`),
  ADD CONSTRAINT `purchase_orders_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `purchase_orders_ibfk_4` FOREIGN KEY (`approved_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `reorder_alerts`
--
ALTER TABLE `reorder_alerts`
  ADD CONSTRAINT `reorder_alerts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `reorder_alerts_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`),
  ADD CONSTRAINT `reorder_alerts_ibfk_3` FOREIGN KEY (`acknowledged_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `rma_records`
--
ALTER TABLE `rma_records`
  ADD CONSTRAINT `rma_records_ibfk_1` FOREIGN KEY (`so_id`) REFERENCES `sales_orders` (`so_id`),
  ADD CONSTRAINT `rma_records_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `rma_records_ibfk_3` FOREIGN KEY (`inspected_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `sales_orders`
--
ALTER TABLE `sales_orders`
  ADD CONSTRAINT `sales_orders_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `so_line_items`
--
ALTER TABLE `so_line_items`
  ADD CONSTRAINT `so_line_items_ibfk_1` FOREIGN KEY (`so_id`) REFERENCES `sales_orders` (`so_id`),
  ADD CONSTRAINT `so_line_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `supplier_items`
--
ALTER TABLE `supplier_items`
  ADD CONSTRAINT `supplier_items_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`),
  ADD CONSTRAINT `supplier_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD CONSTRAINT `warehouses_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
