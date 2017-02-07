-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2017 at 07:38 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tourism_company`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `clients_id` int(11) NOT NULL,
  `client_nameSurname` varchar(100) DEFAULT NULL,
  `clients_worker` varchar(30) DEFAULT NULL,
  `client_tour_packages` varchar(100) DEFAULT NULL,
  `clients_payments` int(11) DEFAULT NULL,
  `clients_other_datas` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `clients_worker`
--

CREATE TABLE `clients_worker` (
  `client_worker` varchar(100) DEFAULT NULL,
  `worker_client` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tours`
--

CREATE TABLE `tours` (
  `tour_id` int(11) NOT NULL,
  `tour_info` varchar(200) DEFAULT NULL,
  `amount_tourOrders` int(11) DEFAULT NULL,
  `ordered_clients` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `workers`
--

CREATE TABLE `workers` (
  `worker_id` int(11) NOT NULL,
  `worker_name` varchar(30) DEFAULT NULL,
  `worker_surname` varchar(30) DEFAULT NULL,
  `worker_position` varchar(30) DEFAULT NULL,
  `worker_clients` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`clients_id`),
  ADD KEY `client_nameSurname` (`client_nameSurname`),
  ADD KEY `clients_worker` (`clients_worker`),
  ADD KEY `client_tour_packages` (`client_tour_packages`);

--
-- Indexes for table `clients_worker`
--
ALTER TABLE `clients_worker`
  ADD KEY `client_worker` (`client_worker`),
  ADD KEY `worker_client` (`worker_client`);

--
-- Indexes for table `tours`
--
ALTER TABLE `tours`
  ADD PRIMARY KEY (`tour_id`),
  ADD KEY `ordered_clients` (`ordered_clients`);

--
-- Indexes for table `workers`
--
ALTER TABLE `workers`
  ADD PRIMARY KEY (`worker_id`),
  ADD KEY `worker_name` (`worker_name`),
  ADD KEY `worker_clients` (`worker_clients`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `clients_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tours`
--
ALTER TABLE `tours`
  MODIFY `tour_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `workers`
--
ALTER TABLE `workers`
  MODIFY `worker_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`clients_worker`) REFERENCES `clients_worker` (`client_worker`),
  ADD CONSTRAINT `clients_ibfk_2` FOREIGN KEY (`client_nameSurname`) REFERENCES `clients_worker` (`worker_client`),
  ADD CONSTRAINT `clients_ibfk_3` FOREIGN KEY (`client_tour_packages`) REFERENCES `tours` (`ordered_clients`);

--
-- Constraints for table `clients_worker`
--
ALTER TABLE `clients_worker`
  ADD CONSTRAINT `clients_worker_ibfk_2` FOREIGN KEY (`client_worker`) REFERENCES `workers` (`worker_name`);

--
-- Constraints for table `workers`
--
ALTER TABLE `workers`
  ADD CONSTRAINT `workers_ibfk_1` FOREIGN KEY (`worker_clients`) REFERENCES `clients_worker` (`worker_client`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
