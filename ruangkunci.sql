-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 13 Nov 2018 pada 16.19
-- Versi Server: 10.1.28-MariaDB
-- PHP Version: 5.6.32

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
-- Struktur dari tabel `jadwal`
--

CREATE TABLE `jadwal` (
  `id` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `hari` varchar(15) NOT NULL,
  `waktu` varchar(20) NOT NULL,
  `matkul` varchar(30) NOT NULL,
  `sks` int(11) NOT NULL,
  `jam` int(11) NOT NULL,
  `kelas` varchar(30) NOT NULL,
  `pengajar` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jadwal`
--

INSERT INTO `jadwal` (`id`, `id_kelas`, `hari`, `waktu`, `matkul`, `sks`, `jam`, `kelas`, `pengajar`) VALUES
(1, 0, 'Senin', '07.00-12.10', 'Praktikum Pemrograman Berbasis', 3, 6, 'TI-2E', 'Ridwan Rismanto, SST.,M.Kom.'),
(2, 0, 'Senin', '12.40-18.00', 'Praktikum Pemrograman Berbasis', 3, 6, 'TI-2D', 'Arie Rachmad Syulistyo,S.Kom.,M.Kom.'),
(3, 0, 'Selasa', '07.00-12.10', 'Praktikum Pemrograman Berbasis', 3, 6, 'TI-2C', 'Imam Fahrur Rozi,ST.,MT.'),
(4, 0, 'Selasa', '12.40-18.00', 'Praktikum Pemrograman Berbasis', 3, 6, 'TI-2B', 'Dian Hanifudin Subhi,S.Kom,M.Kom');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id` int(11) NOT NULL,
  `ruang` varchar(30) NOT NULL,
  `nama_lab` varchar(30) NOT NULL,
  `lokasi` varchar(30) NOT NULL,
  `img` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id`, `ruang`, `nama_lab`, `lokasi`, `img`) VALUES
(1, 'LKJ 3', 'KOMPUTASI DAN JARINGAN 3', 'GD.SITI LT.7', ''),
(2, 'LPR 4', 'PEMROGRAMAN 4', 'GD.SITI LT.7', ''),
(3, 'LKJ 2', 'KOMPUTASI DAN JARINGAN 2', 'GD.SITI LT.7', ''),
(4, 'LPR 2', 'PEMROGRAMAN 2', 'GD.SITI LT.7', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pinjaman`
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
-- Struktur dari tabel `users`
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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
