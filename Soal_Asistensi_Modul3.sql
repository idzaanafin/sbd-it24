-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 17, 2025 at 05:09 PM
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
-- Database: `PERPUSTAKAAN`
--

-- --------------------------------------------------------

--
-- Table structure for table `Anggota`
--

CREATE TABLE `Anggota` (
  `ID_Anggota` int(11) NOT NULL,
  `Nama_Anggota` varchar(30) NOT NULL,
  `No_Hp` varchar(15) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Buku`
--

CREATE TABLE `Buku` (
  `ID_Buku` int(11) NOT NULL,
  `Judul_Buku` varchar(100) NOT NULL,
  `Tahun_Terbit_Buku` year(4) NOT NULL,
  `Genre_Buku` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PEMINJAMAN`
--

CREATE TABLE `PEMINJAMAN` (
  `ID_Peminjaman` int(11) NOT NULL,
  `Tanggal_Peminjaman` date NOT NULL,
  `ID_Buku` int(11) NOT NULL,
  `ID_Anggota` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Anggota`
--
ALTER TABLE `Anggota`
  ADD PRIMARY KEY (`ID_Anggota`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `Buku`
--
ALTER TABLE `Buku`
  ADD PRIMARY KEY (`ID_Buku`);

--
-- Indexes for table `PEMINJAMAN`
--
ALTER TABLE `PEMINJAMAN`
  ADD PRIMARY KEY (`ID_Peminjaman`),
  ADD KEY `ID_Buku` (`ID_Buku`),
  ADD KEY `ID_Anggota` (`ID_Anggota`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Anggota`
--
ALTER TABLE `Anggota`
  MODIFY `ID_Anggota` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Buku`
--
ALTER TABLE `Buku`
  MODIFY `ID_Buku` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PEMINJAMAN`
--
ALTER TABLE `PEMINJAMAN`
  MODIFY `ID_Peminjaman` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `PEMINJAMAN`
--
ALTER TABLE `PEMINJAMAN`
  ADD CONSTRAINT `PEMINJAMAN_ibfk_1` FOREIGN KEY (`ID_Buku`) REFERENCES `Buku` (`ID_Buku`),
  ADD CONSTRAINT `PEMINJAMAN_ibfk_2` FOREIGN KEY (`ID_Anggota`) REFERENCES `Anggota` (`ID_Anggota`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
