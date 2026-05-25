-- Nama : Eka putra gilang ramadhan
-- NIM : 24241166
-- Kelas : E
-- Modul : 2

-- select statement
-- perintah yang digunakan untuk mengambil data dari satu atau lebih tabel dalam database

-- praktek
-- mengambil satu kolom dari tabel

-- objek databse
-- 1. database (tertinggi)
-- 2. tabel
-- 3. kolom
-- 4. nilai (value/data)

-- menggunakan database
USE kelas_e_mart;

-- praktek 1
SELECT nama_produk FROM produk;

-- Praktek 2
-- ambil dua kolom dari sebuah tabel
SELECT nama_produk, harga FROM produk;

-- Praktek 3
-- mgambil semua kolom dari sebuah tabel
SELECT * FROM produk;

-- Latihan mandiri
SELECT kode_produk, nama_produk FROM produk;
SELECT * FROM penjualan;

-- PREFIX dan ALIAS
-- prefix adalah objek database yang hirarkinya lebih tinggi
-- contoh 'database.tabel.kolom'
SELECT kelas_e_mart.pelanggan.nama_pelanggan
FROM pelanggan;

SELECT nama_pelanggan FROM pelanggan;

-- ALIAS 
SELECT nama_produk as np FROM produk;

-- tanpa as
SELECT nama_produk np FROM produk;

-- penggunaan alias pada nama table
SELECT nama_produk FROM produk as msp;

SELECT msp.nama_produk FROM produk as msp;

-- CASE 1
SELECT nama_pelanggan, alamat FROM pelanggan;

-- CASE 2
SELECT nama_produk, harga FROM produk;
 