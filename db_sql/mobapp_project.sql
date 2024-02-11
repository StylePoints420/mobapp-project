-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 11, 2024 at 11:21 AM
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
-- Database: `mobapp_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_tbl`
--

CREATE TABLE `admin_tbl` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_tbl`
--

INSERT INTO `admin_tbl` (`admin_id`, `username`, `email`, `password`) VALUES
(1, 'AYO', 'ayo123@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
(2, 'rhod', 'rhod@yahoo.com', '202cb962ac59075b964b07152d234b70'),
(3, 'ALFRED', 'ALFRED360@gmail.com', 'bfd59291e825b5f2bbf1eb76569f8fe7'),
(4, 'admin', 'admin@gmail.com', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Table structure for table `products_tbl`
--

CREATE TABLE `products_tbl` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_category` varchar(255) NOT NULL,
  `product_brand` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_tbl`
--

INSERT INTO `products_tbl` (`product_id`, `product_name`, `product_category`, `product_brand`, `product_quantity`, `product_price`) VALUES
(1, 'I AM NEW PRODUCT', 'HAHA', 'BRONDO', 2, 3688),
(2, 'Fully Synthetic Motor Oil 5W-30', 'Lubricants', 'Shell Helix Ultra', 1, 200),
(3, 'Front Brake Pads for Sedan', 'Brake System', 'Brembo', 4, 5000),
(4, 'Adjustable Wrench Set', 'Tools', 'Stanley', 3, 3500),
(5, 'Fully Synthetic Motor Oil 5W-30', 'Lubricants', 'Shell Helix Ultra', 1, 550),
(6, 'Front Brake Pads for Sedan', 'Brake System', 'Brembo', 4, 2500),
(7, 'Radial Tire 205/55R16', 'Tires', 'Yokohama', 1, 4500),
(8, 'Maintenance-Free Car Battery 12V', 'Electrical', 'Motolite Excel', 1, 4700),
(9, 'LED Headlight Bulb H4', 'Lighting', 'Philips', 2, 3200),
(10, 'High-Performance Air Filter for SUV', 'Engine Parts', 'K&N', 1, 2800),
(11, 'Iridium Spark Plug', 'Engine Parts', 'NGK', 4, 920),
(12, 'Heavy Duty Motorcycle Chain', 'Motorcycle Parts', 'DID', 1, 1450),
(13, 'Universal Fit Car Seat Cover Set', 'Interior Accessories', 'Sparco', 1, 3500),
(14, 'Full HD 1080P Dash Cam', 'Electronic Accessories', 'Transcend', 1, 5000),
(15, 'Waterproof Motorcycle Cover', 'Motorcycle Accessories', 'Oxford', 1, 1500),
(16, 'Synthetic Chain Lube', 'Lubricants', 'Castrol', 1, 400),
(17, 'Alloy Wheel Rim 17\"', 'Wheels', 'Enkei', 1, 7000),
(18, 'Performance Exhaust System', 'Exhaust', 'Akrapovič', 1, 15000),
(19, 'Racing Helmet', 'Safety Gear', 'Arai', 1, 7500),
(20, 'Car Wash Shampoo', 'Cleaning Supplies', 'Meguiar\'s', 1, 600),
(21, 'Digital Tire Pressure Gauge', 'Tools', 'Michelin', 1, 1200),
(22, 'Leather Steering Wheel Cover', 'Interior Accessories', 'Momo', 1, 2500),
(23, 'Cooling System Antifreeze/Coolant', 'Fluids', 'Prestone', 1, 1200),
(24, 'Adjustable Wrench Set', 'Tools', 'Stanley', 3, 3500),
(25, 'LED Work Light', 'Lighting', 'Bosch', 1, 2200),
(26, 'Motorcycle Disk Brake Lock', 'Safety Gear', 'Xena', 1, 3200),
(27, 'GPS Navigation System', 'Electronic Accessories', 'Garmin', 1, 10000),
(28, 'Quick Detailer Spray', 'Cleaning Supplies', 'Chemical Guys', 1, 900),
(29, 'Tool Kit Set', 'Tools', 'Craftsman', 1, 4500),
(30, 'Windshield Wiper Blades', 'Exterior Accessories', 'Bosch', 2, 1400),
(31, 'Bluetooth Car Stereo', 'Electronic Accessories', 'Pioneer', 1, 8500),
(32, 'Jump Starter Kit', 'Tools', 'Black & Decker', 1, 5500);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_tbl`
--
ALTER TABLE `admin_tbl`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `products_tbl`
--
ALTER TABLE `products_tbl`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_tbl`
--
ALTER TABLE `admin_tbl`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products_tbl`
--
ALTER TABLE `products_tbl`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
