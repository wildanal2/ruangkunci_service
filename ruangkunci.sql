-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2018 at 11:28 AM
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

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id`, `id_kelas`, `hari`, `waktu_mulai`, `waktu_selesai`, `matkul`, `sks`, `jam`, `kelas`, `pengajar`) VALUES
(1, 2, 'Senin', '07.00', '12.10', 'Praktikum Pemrograman Berbasis', 3, 6, 'TI-2E', 'Ridwan Rismanto, SST.,M.Kom.'),
(2, 2, 'Senin', '12.40', '18.00', 'Praktikum Pemrograman Berbasis', 3, 6, 'TI-2D', 'Arie Rachmad Syulistyo,S.Kom.,M.Kom.'),
(3, 1, 'Selasa', '07.00', '12.10', 'Praktikum Pemrograman Berbasis', 3, 6, 'TI-2C', 'Imam Fahrur Rozi,ST.,MT.'),
(4, 1, 'Selasa', '12.40', '18.00', 'Praktikum Pemrograman Berbasis', 3, 6, 'TI-2B', 'Dian Hanifudin Subhi,S.Kom,M.Kom'),
(5, 3, 'Selasa', '07.50', '12.10', 'Pemrograman Jaringan', 2, 5, 'TI-3E', 'Antonius Dutty Susilo,S.Pd, MT.'),
(6, 3, 'Selasa', '12.40', '17.10', 'Pemrograman Jaringan', 2, 5, 'TI-3F', 'Luqman Affandi'),
(7, 3, 'Senin', '07.50', '12.10', 'Pemrograman Jaringan', 2, 5, 'TI-3G', 'Grezio Arifi'),
(8, 3, 'Senin', '12.40', '17.10', 'Pemrograman Jaringan', 2, 5, 'TI-3H', 'Kadek Suarjuma'),
(9, 3, 'Rabu', '07.50', '12.10', 'Pemrograman Jaringan', 2, 5, 'TI-3C', 'Luqman Affandi');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id` int(11) NOT NULL,
  `ruang` varchar(30) NOT NULL,
  `nama_lab` varchar(30) NOT NULL,
  `lokasi` varchar(30) NOT NULL,
  `img` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id`, `ruang`, `nama_lab`, `lokasi`, `img`) VALUES
(1, 'LKJ 3', 'KOMPUTASI DAN JARINGAN 3', 'GD.SITI LT.7', 'ruangan/KR-01.jpg'),
(2, 'LPR 4', 'PEMROGRAMAN 4', 'GD.SITI LT.7', 'ruangan/KR-02.jpg'),
(3, 'LKJ 2', 'KOMPUTASI DAN JARINGAN 2', 'GD.SITI LT.7', 'ruangan/KR-03.jpg'),
(4, 'LPR 2', 'PEMROGRAMAN 2', 'GD.SITI LT.7', 'ruangan/KR-07.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `pinjaman`
--

CREATE TABLE `pinjaman` (
  `id` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL,
  `id_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `nim` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(36) NOT NULL,
  `img` varchar(200) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`nim`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `fk_kelasjad` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
