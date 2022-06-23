-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Jun 2022 pada 10.43
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_menejemenbengkel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_kerja`
--

CREATE TABLE `jadwal_kerja` (
  `id_jadwal` int(11) NOT NULL,
  `tanggal` varchar(20) DEFAULT NULL,
  `Shift` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jadwal_kerja`
--

INSERT INTO `jadwal_kerja` (`id_jadwal`, `tanggal`, `Shift`) VALUES
(1, '12-06-2022', 1),
(2, '13-06-2022', 2),
(3, '14-06-2022', 3),
(4, '15-06-2022', 1),
(5, '16-06-2022', 2),
(6, '17-06-2022', 3),
(7, '18-06-2022', 1),
(8, '19-06-2022', 2),
(9, '20-06-2022', 3),
(10, '21-06-2022', 1),
(11, '22-06-2022', 2),
(12, '23-06-2022', 3),
(13, '24-06-2022', 1),
(14, '25-06-2022', 2),
(15, '26-06-2022', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_pelayanan`
--

CREATE TABLE `jenis_pelayanan` (
  `id_jenis` int(11) NOT NULL,
  `Deskripsi` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jenis_pelayanan`
--

INSERT INTO `jenis_pelayanan` (`id_jenis`, `Deskripsi`) VALUES
(1, 'Ganti Spakbor'),
(2, 'ganti oli'),
(3, 'service'),
(4, 'Ganti ban'),
(5, 'ganti oli mesin'),
(6, 'ganti spion'),
(7, 'ganti cakram'),
(8, 'service rem'),
(9, 'service lampu'),
(10, 'ganti fanbel'),
(11, 'service double starter'),
(12, 'service kabel sein'),
(13, 'service kabel lampu'),
(14, 'service aki'),
(15, 'ganti aki');

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `tgl_lahir` varchar(20) DEFAULT NULL,
  `umur` int(10) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `no_telp` varchar(13) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `nama`, `tgl_lahir`, `umur`, `alamat`, `no_telp`, `password`) VALUES
(1, 'Carles', '15-06-1998', 74, 'jl.Delima 5', '832123453', '123'),
(2, 'Bagus', '16-06-1990', 33, 'jl.Jeruk 49', '2147483647', NULL),
(3, 'Bagas', '18-02-2002', 66, 'jl.Melon 49', '831234568', NULL),
(4, 'Setyawan', '17-02-2000', 64, 'jl.Pisang 49', '2147483647', NULL),
(5, 'Handoko', '18-01-1998', 78, 'jl.Manggis 666', '2147483647', NULL),
(6, 'cak kur', '12-01-1999', 23, 'sidoarjo', NULL, '123'),
(7, 'danang', '12-02-1999', 21, 'sidoarjo', NULL, '123'),
(8, 'andy', '12-03-1999', 24, 'sidoarjo', NULL, '123'),
(9, 'nanang', '12-03-1998', 24, 'surabaya', NULL, '123'),
(10, 'hendro', '12-04-1998', 24, 'surabaya', NULL, '123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelayanan`
--

CREATE TABLE `pelayanan` (
  `id_pelayanan` int(11) NOT NULL,
  `jadwal_id` int(11) DEFAULT NULL,
  `jenis_id` int(11) DEFAULT NULL,
  `karyawan_id` int(11) DEFAULT NULL,
  `Nama_Pelayanan` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelayanan`
--

INSERT INTO `pelayanan` (`id_pelayanan`, `jadwal_id`, `jenis_id`, `karyawan_id`, `Nama_Pelayanan`) VALUES
(1, 1, 1, 1, 'Ganti Spakbor'),
(2, 2, 2, 2, 'ganti oli'),
(3, 3, 3, 3, 'ganti lampu'),
(4, 4, 4, 4, 'ganti stang'),
(5, 5, 5, 5, 'service lampu'),
(6, 6, 6, 6, 'service aki'),
(7, 7, 7, 7, 'service mesin'),
(8, 8, 8, 8, 'service kelistrikan'),
(9, 9, 9, 9, 'ganti ban'),
(10, 10, 10, 10, 'service rante');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `jadwal_kerja`
--
ALTER TABLE `jadwal_kerja`
  ADD PRIMARY KEY (`id_jadwal`);

--
-- Indeks untuk tabel `jenis_pelayanan`
--
ALTER TABLE `jenis_pelayanan`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indeks untuk tabel `pelayanan`
--
ALTER TABLE `pelayanan`
  ADD PRIMARY KEY (`id_pelayanan`),
  ADD KEY `fk_ID_Jadwal` (`jadwal_id`),
  ADD KEY `FK_jenispelayanan_id` (`jenis_id`),
  ADD KEY `fk_karyawan_id` (`karyawan_id`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pelayanan`
--
ALTER TABLE `pelayanan`
  ADD CONSTRAINT `FK_jenispelayanan_id` FOREIGN KEY (`jenis_id`) REFERENCES `jenis_pelayanan` (`id_jenis`),
  ADD CONSTRAINT `fk_id` FOREIGN KEY (`id_pelayanan`) REFERENCES `jenis_pelayanan` (`id_jenis`),
  ADD CONSTRAINT `fk_jadwal_id` FOREIGN KEY (`jadwal_id`) REFERENCES `jadwal_kerja` (`Id_Jadwal`),
  ADD CONSTRAINT `fk_karyawan_id` FOREIGN KEY (`karyawan_id`) REFERENCES `karyawan` (`id_karyawan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
