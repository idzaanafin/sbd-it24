-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 17, 2025 at 05:08 PM
-- Server version: 10.11.11-MariaDB-0ubuntu0.24.04.2
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `FRD-017`
--

-- --------------------------------------------------------

--
-- Table structure for table `AKUN`
--

CREATE TABLE `AKUN` (
  `ID_AKUN` int(11) NOT NULL,
  `NAMA_AKUN` varchar(50) NOT NULL,
  `NO_TELEPON` varchar(13) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `DRIVER`
--

CREATE TABLE `DRIVER` (
  `ID_DRIVER` int(11) NOT NULL,
  `NAMA_DRIVER` varchar(50) NOT NULL,
  `PLAT_KENDARAAN` varchar(10) NOT NULL,
  `RATING_DRIVER` decimal(3,2) DEFAULT NULL CHECK (`RATING_DRIVER` between 1.00 and 5.00)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `MERCHANT`
--

CREATE TABLE `MERCHANT` (
  `ID_MERCHANT` int(11) NOT NULL,
  `NAMA_MERCHANT` varchar(50) NOT NULL,
  `RATING_MERCHANT` decimal(3,2) DEFAULT NULL CHECK (`RATING_MERCHANT` between 1.00 and 5.00),
  `LOKASI_MERCHANT` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PEMBAYARAN`
--

CREATE TABLE `PEMBAYARAN` (
  `ID_PEMBAYARAN` int(11) NOT NULL,
  `ID_PESANAN` int(11) NOT NULL,
  `METODE_PEMBAYARAN` enum('Cash','IT Pay') NOT NULL,
  `TOTAL` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PESANAN`
--

CREATE TABLE `PESANAN` (
  `ID_PESANAN` int(11) NOT NULL,
  `ID_AKUN` int(11) NOT NULL,
  `ID_MERCHANT` int(11) NOT NULL,
  `ID_DRIVER` int(11) NOT NULL,
  `TANGGAL_PEMESANAN` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AKUN`
--
ALTER TABLE `AKUN`
  ADD PRIMARY KEY (`ID_AKUN`),
  ADD UNIQUE KEY `NAMA_AKUN` (`NAMA_AKUN`),
  ADD UNIQUE KEY `NO_TELEPON` (`NO_TELEPON`),
  ADD UNIQUE KEY `EMAIL` (`EMAIL`);

--
-- Indexes for table `DRIVER`
--
ALTER TABLE `DRIVER`
  ADD PRIMARY KEY (`ID_DRIVER`),
  ADD UNIQUE KEY `PLAT_KENDARAAN` (`PLAT_KENDARAAN`);

--
-- Indexes for table `MERCHANT`
--
ALTER TABLE `MERCHANT`
  ADD PRIMARY KEY (`ID_MERCHANT`);

--
-- Indexes for table `PEMBAYARAN`
--
ALTER TABLE `PEMBAYARAN`
  ADD PRIMARY KEY (`ID_PEMBAYARAN`),
  ADD UNIQUE KEY `ID_PESANAN` (`ID_PESANAN`);

--
-- Indexes for table `PESANAN`
--
ALTER TABLE `PESANAN`
  ADD PRIMARY KEY (`ID_PESANAN`),
  ADD KEY `ID_AKUN` (`ID_AKUN`),
  ADD KEY `ID_MERCHANT` (`ID_MERCHANT`),
  ADD KEY `ID_DRIVER` (`ID_DRIVER`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `AKUN`
--
ALTER TABLE `AKUN`
  MODIFY `ID_AKUN` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `DRIVER`
--
ALTER TABLE `DRIVER`
  MODIFY `ID_DRIVER` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `MERCHANT`
--
ALTER TABLE `MERCHANT`
  MODIFY `ID_MERCHANT` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PEMBAYARAN`
--
ALTER TABLE `PEMBAYARAN`
  MODIFY `ID_PEMBAYARAN` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PESANAN`
--
ALTER TABLE `PESANAN`
  MODIFY `ID_PESANAN` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `PEMBAYARAN`
--
ALTER TABLE `PEMBAYARAN`
  ADD CONSTRAINT `PEMBAYARAN_ibfk_1` FOREIGN KEY (`ID_PESANAN`) REFERENCES `PESANAN` (`ID_PESANAN`);

--
-- Constraints for table `PESANAN`
--
ALTER TABLE `PESANAN`
  ADD CONSTRAINT `PESANAN_ibfk_1` FOREIGN KEY (`ID_AKUN`) REFERENCES `AKUN` (`ID_AKUN`),
  ADD CONSTRAINT `PESANAN_ibfk_2` FOREIGN KEY (`ID_MERCHANT`) REFERENCES `MERCHANT` (`ID_MERCHANT`),
  ADD CONSTRAINT `PESANAN_ibfk_3` FOREIGN KEY (`ID_DRIVER`) REFERENCES `DRIVER` (`ID_DRIVER`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
