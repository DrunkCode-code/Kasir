-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2020 at 06:14 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kasir`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(20) DEFAULT NULL,
  `id_type` int(11) DEFAULT NULL,
  `harga_beli` int(11) DEFAULT NULL,
  `harga_jual` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `id_type`, `harga_beli`, `harga_jual`) VALUES
(11, 'Buku', 1, 5000, 7000),
(12, 'Pulpen', 1, 700, 1200);

-- --------------------------------------------------------

--
-- Table structure for table `detail`
--

CREATE TABLE `detail` (
  `id_detail` int(11) NOT NULL,
  `id_transaksi` int(11) DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail`
--

INSERT INTO `detail` (`id_detail`, `id_transaksi`, `id_barang`, `jumlah`, `harga`) VALUES
(13, 90, 11, 5, 7000),
(14, 90, 12, 5, 1200),
(15, 92, 11, 5, 7000),
(16, 93, 12, 5, 1200);

-- --------------------------------------------------------

--
-- Table structure for table `gudang`
--

CREATE TABLE `gudang` (
  `id_gudang` int(11) NOT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gudang`
--

INSERT INTO `gudang` (`id_gudang`, `id_barang`, `stock`) VALUES
(3, 11, 8),
(4, 12, 5);

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `id_jabatan` int(11) NOT NULL,
  `nama_jabatan` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id_jabatan`, `nama_jabatan`) VALUES
(1, 'kasir'),
(2, 'Tukang Gudang'),
(3, 'Manager');

-- --------------------------------------------------------

--
-- Table structure for table `jenis`
--

CREATE TABLE `jenis` (
  `id_jenis` int(11) NOT NULL,
  `nama_jenis` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis`
--

INSERT INTO `jenis` (`id_jenis`, `nama_jenis`) VALUES
(1, 'air'),
(2, 'listrik');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `nama_pegawai` varchar(20) DEFAULT NULL,
  `password_pegawai` varchar(20) DEFAULT NULL,
  `id_jabatan` int(11) DEFAULT NULL,
  `username_pegawai` varchar(20) NOT NULL,
  `status_pegawai` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `nama_pegawai`, `password_pegawai`, `id_jabatan`, `username_pegawai`, `status_pegawai`) VALUES
(1, 'Yuma Gunawan', 'K01', 1, 'K01', 0),
(2, 'Andar Sakti', 'K02', 1, 'K02', 1),
(5, 'Nathanael Richie', 'G01', 2, 'G01', 1),
(6, 'Adryan Bhueka', 'G02', 2, 'G02', 1),
(7, 'Dwiki Budilaksana', 'M01', 3, 'M01', 1),
(8, 'Edo Krishnanda', 'M02', 3, 'M02', 1),
(9, 'Fizi', 'K03', 1, 'K03', 1);

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_gudang`
--

CREATE TABLE `riwayat_gudang` (
  `id_riwgud` int(11) NOT NULL,
  `id_pegawai` int(11) DEFAULT NULL,
  `tgl_masuk_barang` date DEFAULT NULL,
  `id_gudang` int(11) DEFAULT NULL,
  `penambahan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `riwayat_gudang`
--

INSERT INTO `riwayat_gudang` (`id_riwgud`, `id_pegawai`, `tgl_masuk_barang`, `id_gudang`, `penambahan`) VALUES
(5, 7, '2020-05-31', 3, 3),
(6, 7, '2020-05-31', 3, 5),
(7, 7, '2020-05-31', 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `stat_pegawai`
--

CREATE TABLE `stat_pegawai` (
  `id_stat_pegawai` int(11) DEFAULT NULL,
  `nama_stat_pegawai` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stat_pegawai`
--

INSERT INTO `stat_pegawai` (`id_stat_pegawai`, `nama_stat_pegawai`) VALUES
(1, 'aktif'),
(0, 'nonaktif');

-- --------------------------------------------------------

--
-- Table structure for table `tagihan`
--

CREATE TABLE `tagihan` (
  `id_tagihan` int(11) NOT NULL,
  `id_pegawai` int(11) DEFAULT NULL,
  `id_jenis` int(11) DEFAULT NULL,
  `biaya` int(11) DEFAULT NULL,
  `tanggal_tagihan` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tagihan`
--

INSERT INTO `tagihan` (`id_tagihan`, `id_pegawai`, `id_jenis`, `biaya`, `tanggal_tagihan`) VALUES
(1, 7, 1, 5000, '2020-06-03'),
(2, 7, 1, 5000, '2020-06-03'),
(3, 7, 1, 5000, '2020-06-03'),
(4, 7, 1, 5000, '2020-06-03');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_pegawai` int(11) DEFAULT NULL,
  `tgl_transaksi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_pegawai`, `tgl_transaksi`) VALUES
(90, 2, '2020-06-02'),
(92, 2, '2020-06-02'),
(93, 2, '2020-06-01'),
(94, 1, '2020-06-03'),
(95, 2, '2020-06-03'),
(96, 7, '2020-06-03'),
(97, 2, '2020-06-03'),
(98, 2, '2020-06-03'),
(99, 2, '2020-06-03');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `id_type` int(11) NOT NULL,
  `nama_type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`id_type`, `nama_type`) VALUES
(1, 'buah'),
(2, 'lusin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `FK_dari_type` (`id_type`);

--
-- Indexes for table `detail`
--
ALTER TABLE `detail`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `FK_Dari_Barang` (`id_barang`),
  ADD KEY `FK_Dari_Tran` (`id_transaksi`);

--
-- Indexes for table `gudang`
--
ALTER TABLE `gudang`
  ADD PRIMARY KEY (`id_gudang`),
  ADD KEY `dari barang` (`id_barang`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indexes for table `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`),
  ADD KEY `FK_dari_jabatan` (`id_jabatan`);

--
-- Indexes for table `riwayat_gudang`
--
ALTER TABLE `riwayat_gudang`
  ADD PRIMARY KEY (`id_riwgud`),
  ADD KEY `ke pegawai` (`id_pegawai`),
  ADD KEY `dari gudang` (`id_gudang`);

--
-- Indexes for table `tagihan`
--
ALTER TABLE `tagihan`
  ADD PRIMARY KEY (`id_tagihan`),
  ADD KEY `FK_dari_jenis` (`id_jenis`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `FK_dari_pegawai` (`id_pegawai`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id_type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `detail`
--
ALTER TABLE `detail`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `gudang`
--
ALTER TABLE `gudang`
  MODIFY `id_gudang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `riwayat_gudang`
--
ALTER TABLE `riwayat_gudang`
  MODIFY `id_riwgud` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tagihan`
--
ALTER TABLE `tagihan`
  MODIFY `id_tagihan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `FK_dari_type` FOREIGN KEY (`id_type`) REFERENCES `type` (`id_type`);

--
-- Constraints for table `detail`
--
ALTER TABLE `detail`
  ADD CONSTRAINT `FK_Dari_Barang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `FK_Dari_Tran` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`);

--
-- Constraints for table `gudang`
--
ALTER TABLE `gudang`
  ADD CONSTRAINT `dari barang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);

--
-- Constraints for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `FK_dari_jabatan` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id_jabatan`);

--
-- Constraints for table `riwayat_gudang`
--
ALTER TABLE `riwayat_gudang`
  ADD CONSTRAINT `dari gudang` FOREIGN KEY (`id_gudang`) REFERENCES `gudang` (`id_gudang`),
  ADD CONSTRAINT `ke pegawai` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`);

--
-- Constraints for table `tagihan`
--
ALTER TABLE `tagihan`
  ADD CONSTRAINT `FK_dari_jenis` FOREIGN KEY (`id_jenis`) REFERENCES `jenis` (`id_jenis`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `FK_dari_pegawai` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
