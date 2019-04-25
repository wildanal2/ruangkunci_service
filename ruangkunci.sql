-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2019 at 03:23 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 5.6.40

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

--
-- Dumping data for table `fasilitas`
--

INSERT INTO `fasilitas` (`id`, `id_ruang`, `nama_fasilitas`, `jumlah`) VALUES
(15, 1, 'AC', 1),
(16, 1, 'AC', 1),
(17, 1, 'Ac', 1),
(18, 1, 'proyektor', 1),
(19, 2, 'ac', 0),
(20, 2, 'ac', 1),
(21, 2, 'proyektor', 1),
(22, 3, 'Ac', 1),
(23, 3, 'Projektor', 1),
(24, 4, 'Lcd', 1),
(25, 4, 'AC', 2),
(26, 5, 'AC', 1),
(27, 5, 'Sepidol', 2),
(28, 5, 'proyektor', 1),
(29, 6, 'Ac', 1),
(30, 6, 'Proyektor', 1);

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
(3, 1, 'Senin', '08:30', '13:30', 'Bahasa Inggris', 9, 3, 'KR 01', 'Bu Atiqa'),
(4, 1, 'Senin', '08:30', '13:30', 'Bahasa Inggris', 9, 3, 'KR 01', 'Bu Atiqa'),
(5, 4, 'Senin', '13:00', '16:30', 'Penerapan multimedia', 3, 4, 'KR 04', 'Eko jono'),
(6, 4, 'Senin', '13:00', '16:30', 'Penerapan multimedia', 3, 4, 'KR 04', 'Eko jono'),
(7, 3, 'Senin', '07:20', '12:15', 'Bahasa Inggris', 3, 4, 'Ti-3B', 'Bu Ahimsyahh'),
(8, 3, 'Selasa', '09:00', '12:10', 'Bahasa Inggris', 3, 2, 'Ti-4A', 'Bu Tutuk'),
(9, 2, 'Selasa', '09:00', '11:30', 'Pemrograman Jarkom', 5, 4, 'KR 02', 'Pak Luqman'),
(10, 4, 'Selasa', '07:35', '11:00', 'Proyek Tingkat 1', 3, 5, 'KR 04', 'Usman Efendi'),
(11, 2, 'kamis', '07:00', '11:30', 'bahasa inggria', 6, 4, 'ti-3c', 'bu ahimsa'),
(12, 5, 'senin', '08:15', '11:55', 'Multimedia', 3, 5, 'KR 02', 'Andi hermawan'),
(13, 5, 'Rabu', '12:50', '04:00', 'Aplikasi enterpres', 3, 4, 'KR 02', 'Luqman efendi'),
(14, 6, 'Senin', '07:40', '12:05', 'Proyek 2', 3, 4, 'TI-3G', 'Eko Jono'),
(15, 6, 'Senin', '12:51', '17:35', 'Enterpise', 4, 5, 'Ti-3A', 'Usman Nur Hasan'),
(16, 6, 'Selasa', '07:35', '12:05', 'Pemrograman Jaringan', 3, 4, 'Ti-2G', 'Pak Luqman'),
(17, 5, 'Sabtu', '07:00', '11:55', 'Jaringan komputer', 4, 6, 'Ti-3A', 'Dimas hariyanto'),
(18, 7, 'Selasa', '07:30', '11:55', 'Web jaringan', 6, 3, 'TI-3C', 'Arif muhamad');

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
(2, 'KR 03', 'Ruang Reguler', 'AF Lt.2', 'ruangan/1544611235.jpg', 'dipinjam'),
(3, 'KR 05', 'Ruang Reguler', 'AF Lt.3', 'ruangan/1544611764.jpg', 'tersedia'),
(4, 'KR 04', 'Jaringan', 'Gedung AF lt-2', 'ruangan/1545202055.jpg', 'tersedia'),
(5, 'KR 02', 'kelas besar', 'AF lt 3', 'ruangan/1545202526.jpg', 'tersedia'),
(6, 'LPJ 01', 'ruang belajar', 'gd sipil lt 7', 'ruangan/1545202590.jpg', 'tersedia'),
(7, 'LKJ 05', 'ruang lab', 'gd sipil lt 7', '', 'tersedia'),
(8, 'LKJ 04', 'lab basis data', 'gd AF lt 1', '', 'tersedia');

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
(26, 2, 1641720075, '2018-12-18 19:08:25', '2018-12-19 08:15:15', 'selesai', 'ruangan/1545134905.jpg', 3),
(27, 1, 1641720075, '2018-12-19 13:22:16', '2018-12-19 13:40:45', 'selesai', 'ruangan/1545200536.jpg', 3),
(28, 2, 1641720175, '2018-12-19 13:40:09', '0000-00-00 00:00:00', 'dipinjam', 'ruangan/1545201609.jpg', 3),
(29, 1, 1741723006, '2018-12-19 14:12:03', '2018-12-19 14:12:33', 'selesai', 'ruangan/1545203523.jpg', 3),
(30, 1, 1741723006, '2018-12-19 14:31:06', '2018-12-19 14:33:17', 'selesai', 'ruangan/1545204666.jpg', 3);

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
(2, 1641720076, 'fadli zainul', 'ccu', 'TI-3B', '', 'Www', 'users/1545204440.jpg', 2),
(3, 11111, 'Admin', 'as@gm.com', 'X', '', 'a', '', 1),
(4, 1641720065, 'Akbar Formadika', 'akbarfor@gmail.com', 'TI3C', '', 'a', '', 2),
(5, 1641720093, 'ahmad illyasa', 'ahmadillyasa2056@gmail.com', 'TI-3C', '', 'yasa', 'users/1545199159.jpg', 2),
(6, 1641720175, 'mar', 'mar@gmail.com', '3C', '', '1234', 'users/1545201995.jpg', 2),
(7, 1741723006, 'piping adel', 'piping@gmail.com', 'TI 3c', '', 'piping', 'users/1545201868.jpg', 2);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pinjaman`
--
ALTER TABLE `pinjaman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
