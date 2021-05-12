-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2021 at 07:38 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gadgetbadget`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `project_Id` int(11) NOT NULL,
  `project_code` char(7) NOT NULL,
  `project_category` varchar(255) NOT NULL,
  `project_name` varchar(255) NOT NULL,
  `project_descrip` varchar(255) NOT NULL,
  `project_price` decimal(9,2) NOT NULL,
  `no_of_projects` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`project_Id`, `project_code`, `project_category`, `project_name`, `project_descrip`, `project_price`, `no_of_projects`) VALUES
(2, '2345', 'Education', 'University', 'Functionalities', '34000.00', 8),
(3, '3435', 'Agriculture', 'AgriGrow', 'products', '19000.00', 6),
(4, '2111', 'Finacial', 'Banking', 'Accounts', '75000.00', 10),
(5, '4300', 'HotelManagement', 'Hotels', 'Administration', '58000.00', 6),
(6, '0976', 'InventoryManagement', 'Inventories', '-', '36000.00', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`project_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `project_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
