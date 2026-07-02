CREATE TABLE `Dokter` (
  `id_dokter` int PRIMARY KEY,
  `nama` varchar(30),
  `SP` varchar(30),
  `no_tlp` int,
  `kode_poli` int
);

CREATE TABLE `Poliklinik` (
  `kode_poli` int PRIMARY KEY,
  `nama_poli` varchar(20)
);

CREATE TABLE `Pasien` (
  `NIK` int PRIMARY KEY,
  `nama` varchar(30),
  `alamat` varchar(50),
  `DOD` datetime
);

CREATE TABLE `Pendaftaran` (
  `no_antr` int PRIMARY KEY,
  `tgl_daft` datetime,
  `kode_poli` int,
  `NIK` int
);

CREATE TABLE `rekam_medis` (
  `no_rm` int PRIMARY KEY,
  `NIK` int,
  `diagnosis` text,
  `kode_obat` int
);

CREATE TABLE `obat` (
  `kode_obat` int PRIMARY KEY,
  `nama_obat` varchar(255),
  `harga` int
);

ALTER TABLE `Dokter` ADD FOREIGN KEY (`kode_poli`) REFERENCES `Poliklinik` (`kode_poli`);

ALTER TABLE `Pendaftaran` ADD FOREIGN KEY (`kode_poli`) REFERENCES `Poliklinik` (`kode_poli`);

ALTER TABLE `Pendaftaran` ADD FOREIGN KEY (`NIK`) REFERENCES `Pasien` (`NIK`);

ALTER TABLE `rekam_medis` ADD FOREIGN KEY (`NIK`) REFERENCES `Pasien` (`NIK`);

ALTER TABLE `obat` ADD FOREIGN KEY (`kode_obat`) REFERENCES `rekam_medis` (`kode_obat`);
