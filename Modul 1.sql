CREATE TABLE `dokter` (
  `id_dokter` varchar(255) PRIMARY KEY,
  `nama` varchar(255),
  `spesialis` varchar(255),
  `no_hp` varchar(255)
);

CREATE TABLE `poliklinik` (
  `kode_poli` varchar(255) PRIMARY KEY,
  `nama_poli` varchar(255)
);

CREATE TABLE `pasien` (
  `nik` varchar(255) PRIMARY KEY,
  `nama` varchar(255),
  `alamat` text,
  `tgl_lahir` date
);

CREATE TABLE `pendaftaran` (
  `no_antrian` int PRIMARY KEY,
  `tgl_daftar` date,
  `nik` varchar(255),
  `kode_poli` varchar(255)
);

CREATE TABLE `rekam_medis` (
  `no_rm` varchar(255) PRIMARY KEY,
  `tgl_periksa` date,
  `diagnosa` text,
  `nik` varchar(255),
  `id_dokter` varchar(255)
);

CREATE TABLE `obat` (
  `kode_obat` varchar(255) PRIMARY KEY,
  `nama_obat` varchar(255),
  `harga` int
);

CREATE TABLE `detail_resep` (
  `no_rm` varchar(255),
  `kode_obat` varchar(255),
  `jumlah` int
);

ALTER TABLE `rekam_medis` ADD FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`);

ALTER TABLE `pendaftaran` ADD FOREIGN KEY (`nik`) REFERENCES `pasien` (`nik`);

ALTER TABLE `pendaftaran` ADD FOREIGN KEY (`kode_poli`) REFERENCES `poliklinik` (`kode_poli`);

ALTER TABLE `rekam_medis` ADD FOREIGN KEY (`nik`) REFERENCES `pasien` (`nik`);

ALTER TABLE `detail_resep` ADD FOREIGN KEY (`no_rm`) REFERENCES `rekam_medis` (`no_rm`);

ALTER TABLE `detail_resep` ADD FOREIGN KEY (`kode_obat`) REFERENCES `obat` (`kode_obat`);
