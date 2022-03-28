-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Mar 2022 pada 05.58
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_deluna`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_bayar`
--

CREATE TABLE `tb_bayar` (
  `id_bayar` char(10) NOT NULL,
  `id_reservasi` char(10) NOT NULL,
  `nama_rek` varchar(50) NOT NULL,
  `no_rek` int(20) NOT NULL,
  `tgl_bayar` date NOT NULL,
  `bukti_bayar` int(255) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_fasilitas`
--

CREATE TABLE `tb_fasilitas` (
  `id_fasilitas` int(10) NOT NULL,
  `fasilitas` varchar(50) NOT NULL,
  `deskripsi` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_fasilitas`
--

INSERT INTO `tb_fasilitas` (`id_fasilitas`, `fasilitas`, `deskripsi`) VALUES
(1, 'Swimming Pool', 'Kolam renang adalah suatu kontruksi buatan yang dirancang untuk diisi dengan air dan digunakan untuk berenang, menyelam atau aktivitas air lainnya.'),
(2, 'gym', 'tempat untuk melakukan kegiatan latihan dan olahraga sepertilayanan senam, atletik, atau kordio.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kamar`
--

CREATE TABLE `tb_kamar` (
  `id_kamar` int(10) NOT NULL,
  `tipekamar` varchar(20) NOT NULL,
  `fasilitas` varchar(200) NOT NULL,
  `harga` int(10) NOT NULL,
  `jmlkamar` int(10) NOT NULL,
  `batasorang` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_kamar`
--

INSERT INTO `tb_kamar` (`id_kamar`, `tipekamar`, `fasilitas`, `harga`, `jmlkamar`, `batasorang`) VALUES
(1, 'Standar Room', 'Free Wi-fi, Bed Standar Size, TV LED, AC, Coffe Maker, Sarapan Pagi dan Makan Malam, Rain Shower, House Kiping Harian', 800000, 10, 2),
(2, 'Deluxe Room', 'Free Wi-fi, Bed King Size, Sofa, TV LED, AC, Coffe Maker, Sarapan Pagi dan Makan Malam, Rain Shower,Bathub, House Kiping Harian', 1000000, 10, 2),
(3, 'Deluxe Double', 'Free Wi-fi, Bed King Size, Sofa, TV LED, AC, Coffe Maker, Sarapan Pagi dan Makan Malam, Rain Shower,Bathub, House Kiping Harian', 1200000, 12, 2),
(4, 'Deluxe Twin', 'Free Wi-fi, 2 Bed Standar Size, Sofa, TV LED, AC, Coffe Maker, Sarapan Pagi dan Makan Malam, Rain Shower,Bathub, House Kiping Harian', 1400000, 5, 2),
(5, 'Deluxe Double Twin', 'Free Wi-fi, 2 Bed King Size, Sofa, TV LED, AC, Coffe Maker, Sarapan Pagi dan Makan Malam, Rain Shower,Bathub, House Kiping Harian', 1600000, 5, 4),
(6, 'Suite Room', 'Free Wi-fi, 2 Bed King Size, Sofa, TV LED, AC, Coffe Maker, Sarapan Pagi dan Makan Malam, Rain Shower,Bathub,Pemanas AirElektronik, House Kiping Harian', 1800000, 5, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_multi`
--

CREATE TABLE `tb_multi` (
  `id_petugas` int(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_multi`
--

INSERT INTO `tb_multi` (`id_petugas`, `username`, `password`, `level`) VALUES
(1, 'felix', 'felix21', 'admin'),
(2, 'rizky', 'rizky22', 'admin'),
(3, 'rafli', 'rafli29', 'resepsionis'),
(4, 'dellia', 'dellia29', 'resepsionis'),
(5, 'wida', 'wida11', 'resepsionis');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_reservasi`
--

CREATE TABLE `tb_reservasi` (
  `id_reservasi` char(10) NOT NULL,
  `id_tamu` char(10) NOT NULL,
  `id_kamar` int(10) NOT NULL,
  `checkin` date NOT NULL,
  `checkout` date NOT NULL,
  `jml_kamar` int(10) NOT NULL,
  `jml_orang` int(10) NOT NULL,
  `jml_hari` varchar(10) NOT NULL,
  `tgl_pesan` date NOT NULL,
  `total_bayar` int(10) NOT NULL,
  `status_reservasi` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_reservasi`
--

INSERT INTO `tb_reservasi` (`id_reservasi`, `id_tamu`, `id_kamar`, `checkin`, `checkout`, `jml_kamar`, `jml_orang`, `jml_hari`, `tgl_pesan`, `total_bayar`, `status_reservasi`) VALUES
('RSV001', 'DFTR001', 1, '2022-03-28', '2022-03-29', 0, 1, '1', '2022-03-28', 800000, 0),
('RSV002', 'DFTR001', 2, '2022-03-29', '2022-03-30', 0, 1, '1', '2022-03-28', 1000000, 0),
('RSV003', 'DFTR001', 1, '2022-03-30', '2022-03-31', 0, 2, '1', '2022-03-28', 1600000, 0),
('RSV004', 'DFTR001', 1, '2022-03-28', '2022-03-31', 0, 2, '3', '2022-03-28', 4800000, 0),
('RSV005', 'DFTR001', 1, '2022-03-29', '2022-03-31', 0, 2, '2', '2022-03-28', 3200000, 0),
('RSV006', 'DFTR001', 1, '2022-03-29', '2022-03-30', 0, 1, '1', '2022-03-28', 800000, 0),
('RSV007', 'DFTR001', 1, '2022-03-28', '2022-03-29', 0, 1, '1', '2022-03-28', 800000, 0),
('RSV008', 'DFTR001', 1, '2022-03-29', '2022-03-30', 0, 1, '1', '2022-03-28', 800000, 0),
('RSV009', 'DFTR001', 1, '2022-03-28', '2022-03-29', 0, 1, '2', '2022-03-28', 1600000, 0),
('RSV010', 'DFTR001', 1, '2022-03-29', '2022-03-30', 0, 2, '2', '2022-03-28', 3200000, 0),
('RSV011', 'DFTR001', 1, '2022-03-29', '2022-03-30', 0, 1, '1', '2022-03-28', 800000, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_tamu`
--

CREATE TABLE `tb_tamu` (
  `id_tamu` char(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(10) NOT NULL,
  `no_telepon` char(11) NOT NULL,
  `email` varchar(20) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `kecamatan` varchar(20) NOT NULL,
  `kabupaten` varchar(20) NOT NULL,
  `provinsi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_tamu`
--

INSERT INTO `tb_tamu` (`id_tamu`, `username`, `password`, `no_telepon`, `email`, `alamat`, `kecamatan`, `kabupaten`, `provinsi`) VALUES
('DFTR001', 'dede', 'dede', '08953429270', 'dede@gmail.com', 'batujajar', 'batujajar', 'bandung barat', 'jawa barat');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_bayar`
--
ALTER TABLE `tb_bayar`
  ADD PRIMARY KEY (`id_bayar`),
  ADD KEY `id_reservasi` (`id_reservasi`);

--
-- Indeks untuk tabel `tb_fasilitas`
--
ALTER TABLE `tb_fasilitas`
  ADD PRIMARY KEY (`id_fasilitas`);

--
-- Indeks untuk tabel `tb_kamar`
--
ALTER TABLE `tb_kamar`
  ADD PRIMARY KEY (`id_kamar`);

--
-- Indeks untuk tabel `tb_multi`
--
ALTER TABLE `tb_multi`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indeks untuk tabel `tb_reservasi`
--
ALTER TABLE `tb_reservasi`
  ADD PRIMARY KEY (`id_reservasi`),
  ADD KEY `id_kamar` (`id_kamar`),
  ADD KEY `id_tamu` (`id_tamu`);

--
-- Indeks untuk tabel `tb_tamu`
--
ALTER TABLE `tb_tamu`
  ADD PRIMARY KEY (`id_tamu`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_multi`
--
ALTER TABLE `tb_multi`
  MODIFY `id_petugas` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_bayar`
--
ALTER TABLE `tb_bayar`
  ADD CONSTRAINT `tb_bayar_ibfk_1` FOREIGN KEY (`id_reservasi`) REFERENCES `tb_reservasi` (`id_reservasi`);

--
-- Ketidakleluasaan untuk tabel `tb_reservasi`
--
ALTER TABLE `tb_reservasi`
  ADD CONSTRAINT `tb_reservasi_ibfk_1` FOREIGN KEY (`id_kamar`) REFERENCES `tb_kamar` (`id_kamar`),
  ADD CONSTRAINT `tb_reservasi_ibfk_2` FOREIGN KEY (`id_tamu`) REFERENCES `tb_tamu` (`id_tamu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
