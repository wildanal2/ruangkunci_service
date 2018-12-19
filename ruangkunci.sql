-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2018 at 05:47 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ruangkunci`
--

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas`
--

CREATE TABLE `fasilitas` (
  `id` int(11) NOT NULL,
  `id_ruang` int(11) NOT NULL,
  `nama_fasilitas` varchar(50) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `id` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `hari` varchar(15) NOT NULL,
  `waktu_mulai` varchar(20) NOT NULL,
  `waktu_selesai` varchar(10) NOT NULL,
  `matkul` varchar(30) NOT NULL,
  `sks` int(11) NOT NULL,
  `jam` int(11) NOT NULL,
  `kelas` varchar(30) NOT NULL,
  `pengajar` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id` int(11) NOT NULL,
  `ruang` varchar(30) NOT NULL,
  `nama_lab` varchar(30) NOT NULL,
  `lokasi` varchar(30) NOT NULL,
  `img` varchar(200) NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id`, `ruang`, `nama_lab`, `lokasi`, `img`, `status`) VALUES
(1, 'KR 01', 'Kelas kecil', 'AF Lt.1', 'ruangan/1544611136.jpg', 'tersedia'),
(2, 'KR 03', 'Ruang Reguler', 'AF Lt.2', 'ruangan/1544611235.jpg', 'tersedia'),
(3, 'KR 05', 'Ruang Reguler', 'AF Lt.3', 'ruangan/1544611764.jpg', 'tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `pinjaman`
--

CREATE TABLE `pinjaman` (
  `id` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `mulai` datetime NOT NULL,
  `selesai` datetime NOT NULL,
  `status` varchar(10) NOT NULL,
  `img` varchar(240) NOT NULL,
  `id_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pinjaman`
--

INSERT INTO `pinjaman` (`id`, `id_kelas`, `id_user`, `mulai`, `selesai`, `status`, `img`, `id_admin`) VALUES
(22, 2, 1641720076, '2018-12-13 18:17:03', '2018-12-13 12:43:15', 'selesai', 'ruangan/1544613423.jpg', 3),
(23, 3, 1641720075, '2018-12-13 17:17:01', '2018-12-13 12:40:49', 'selesai', 'ruangan/1544696221.jpg', 3),
(24, 1, 1641720076, '2018-12-13 18:59:07', '2018-12-16 14:05:40', 'selesai', 'ruangan/1544702347.jpg', 3),
(25, 1, 1641720065, '2018-12-18 19:06:13', '2018-12-19 02:12:35', 'selesai', 'ruangan/1545134773.jpg', 3),
(26, 2, 1641720075, '2018-12-18 19:08:25', '2018-12-19 08:15:15', 'selesai', 'ruangan/1545134905.jpg', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nim` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `kelas` varchar(10) NOT NULL,
  `bio` varchar(225) NOT NULL,
  `password` varchar(36) NOT NULL,
  `img` varchar(200) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nim`, `nama`, `email`, `kelas`, `bio`, `password`, `img`, `level`) VALUES
(1, 1641720075, 'Wildan Almubarok', 'ssasa', 'TI-3C', '', 'yyy', 'users/1545161338.jpg', 2),
(2, 1641720076, 'fadli zainul', 'ccu', 'TI-3B', '', 'ccu', 'users/1545190090.jpg', 2),
(3, 11111, 'Admin', 'as@gm.com', 'X', '', 'a', '', 1),
(4, 1641720065, 'Akbar Formadika', 'akbarfor@gmail.com', 'TI3C', '', 'a', '', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_fasilitasruang` (`id_ruang`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_kelasjad` (`id_kelas`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ruang` (`ruang`);

--
-- Indexes for table `pinjaman`
--
ALTER TABLE `pinjaman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nim` (`nim`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fasilitas`
--
ALTER TABLE `fasilitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pinjaman`
--
ALTER TABLE `pinjaman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD CONSTRAINT `fk_fasilitasruang` FOREIGN KEY (`id_ruang`) REFERENCES `kelas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `fk_kelasjad` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
