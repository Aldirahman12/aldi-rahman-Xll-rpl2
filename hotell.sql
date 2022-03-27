-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2022 at 07:28 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas`
--

CREATE TABLE `fasilitas` (
  `id_kota` int(11) NOT NULL,
  `fasilitas` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fasilitas`
--

INSERT INTO `fasilitas` (`id_kota`, `fasilitas`) VALUES
(1, 'TV,KULKAS,AC,KIPAS ANGIN,SOPA,KAMAR MANDI,SATU BAUAH TEMPAT TIDUR'),
(2, 'TV,KULKAS,AC,KIPAS ANGIN,SOPA,KAMAR MANDI,LEMARI,,SATU TEMPAT TIDUR'),
(3, 'TV,KIPAS ANGIN,SOPA,KAMAR MANDI,LEMARI,MEJA MAKAN,SATU TEMPAT TIDUR');

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `id_hotel` int(11) NOT NULL,
  `nama_fasilitas` varchar(200) NOT NULL,
  `id_fasilitas` int(11) NOT NULL,
  `foto` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `id_kamar` int(11) NOT NULL,
  `nama_kamar` varchar(200) NOT NULL,
  `id_kota` int(11) NOT NULL,
  `harga` double NOT NULL,
  `harga_bulan` double NOT NULL,
  `harga_tahun` double NOT NULL,
  `foto` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kamar`
--

INSERT INTO `kamar` (`id_kamar`, `nama_kamar`, `id_kota`, `harga`, `harga_bulan`, `harga_tahun`, `foto`) VALUES
(22, 'Singgel Room', 1, 100000, 200000, 3000000, 'WhatsApp_Image_2022-03-17_at_11_40_07_(1)1.jpeg'),
(23, 'Double Room', 2, 200000, 4000000, 80000000, 'hotel-bagus-di-bandung-trans-luxury-hotel-mewah111.jpg'),
(24, 'Family Room', 3, 150000, 300000, 6000000, 'WhatsApp_Image_2022-03-17_at_11_40_07_(3)1.jpeg'),
(25, 'cd,xjnxkvnjklv', 2, 121213213231, 23131, 23123123, 'jakarta.png');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesanan` int(11) NOT NULL,
  `kode_booking` varchar(20) NOT NULL,
  `nomor_kamar` varchar(20) DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `id_kamar` int(11) NOT NULL,
  `hari` int(11) NOT NULL,
  `checkin` date NOT NULL,
  `paket` varchar(200) NOT NULL,
  `jumlah_paket` int(11) NOT NULL,
  `total_bayar` double NOT NULL,
  `bukti_transfer` text DEFAULT NULL,
  `jenis_pembayaran` varchar(100) NOT NULL,
  `status_pembayaran` enum('sudah_dibayar','belum_dibayar','proses_verifikasi','ditolak') NOT NULL DEFAULT 'belum_dibayar',
  `tgl_pesan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`id_pesanan`, `kode_booking`, `nomor_kamar`, `id_user`, `id_kamar`, `hari`, `checkin`, `paket`, `jumlah_paket`, `total_bayar`, `bukti_transfer`, `jenis_pembayaran`, `status_pembayaran`, `tgl_pesan`) VALUES
(25, 'BK-0025', NULL, 2, 22, 34, '2022-03-26', 'Permalam', 34, 3400000, NULL, 'transfer', 'belum_dibayar', '2022-03-25');

-- --------------------------------------------------------

--
-- Table structure for table `umum`
--

CREATE TABLE `umum` (
  `id_fasilitas` int(11) NOT NULL,
  `fasilitas_hotel` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `level` int(11) NOT NULL COMMENT '1 = admin, 2 = tamu'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `alamat`, `no_hp`, `username`, `password`, `level`) VALUES
(1, 'Administrasi', 'Bandung', '085865747438', 'admin', '202cb962ac59075b964b07152d234b70', 1),
(2, 'aldi rahman', 'Cimahi', '0858532324352', 'aldi', '202cb962ac59075b964b07152d234b70', 2),
(3, 'resepsionis', 'ciamhi', '08780780678', 'pelayan', '202cb962ac59075b964b07152d234b70', 2),
(10, 'atalah yusup', 'cimahi', '09897867866', 'atalah', '202cb962ac59075b964b07152d234b70', 2),
(11, 'aldi rahman', 'cimahi', '085897654567', 'aldi', '202cb962ac59075b964b07152d234b70', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`id_kota`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD KEY `id_fasilitas` (`id_fasilitas`);

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`id_kamar`),
  ADD KEY `id_kota` (`id_kota`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesanan`),
  ADD KEY `id_kamar` (`id_kamar`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `umum`
--
ALTER TABLE `umum`
  ADD PRIMARY KEY (`id_fasilitas`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fasilitas`
--
ALTER TABLE `fasilitas`
  MODIFY `id_kota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kamar`
--
ALTER TABLE `kamar`
  MODIFY `id_kamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id_pesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `umum`
--
ALTER TABLE `umum`
  MODIFY `id_fasilitas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`id_fasilitas`) REFERENCES `umum` (`id_fasilitas`);

--
-- Constraints for table `kamar`
--
ALTER TABLE `kamar`
  ADD CONSTRAINT `kamar_ibfk_1` FOREIGN KEY (`id_kota`) REFERENCES `fasilitas` (`id_kota`);

--
-- Constraints for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`id_kamar`) REFERENCES `kamar` (`id_kamar`),
  ADD CONSTRAINT `pesanan_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
