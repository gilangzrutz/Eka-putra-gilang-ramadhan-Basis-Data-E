-- Nama		: Eka putra gilang ramadhan
-- NIM		: 24241166
-- Kelas	: E
-- Modul	: 4


-- menggunakan database
USE kelas_e_mart;

-- ORDER BY
-- Fungsinya untuk mengurutkan data hasil query secara ASC ataupun DESC
-- data yang diurutkan dapat dari kolom atau hasil pengelolaan (op, mat) kolom

-- Praktek #1
-- Ambil nama produk dan qty dari penjualan urut berdasarkan qty
SELECT nama_produk, qty FROM penjualan ORDER BY qty;

-- Praktek #2
-- Ambil nama_produk dan qty dari penjualan urut qty dan nama produk
SELECT nama_produk, qty FROM penjualan ORDER BY qty, nama_produk;

-- Latihan Mandiri 
-- Soal 1 
SELECT nama_produk, qty, harga 
FROM penjualan 
WHERE harga > 50000 
ORDER BY qty DESC;

-- Soal 2
SELECT nama_produk, harga 
FROM penjualan 
WHERE nama_produk LIKE '%GB' 
ORDER BY harga ASC;

-- Soal 3
SELECT nama_produk, harga 
FROM penjualan 
WHERE nama_produk LIKE '%GB' 
ORDER BY harga ASC;

-- Praktek #3
-- ORDER BY dari nilai terbesar ke terkecil gunakan desc
-- ORDER BY dari nilai terkecil ke terbesar gunuak ASC (tidak wajib)
SELECT nama_produk, qty FROM penjualan ORDER BY qty DESC;

-- Praktek #4
-- Menggunakan ASC dan DESC dalam satu query
SELECT nama_produk, qty FROM penjualan ORDER BY qty DESC, nama_produk ASC;

-- Latihan Mandiri
-- Soal 1: tampilkan semua kolom dari table penjualan
-- urutkan berdasarkan tgl_transaksi DESC dan qty ASC
SELECT * 
FROM penjualan
ORDER BY tgl_transaksi DESC, qty ASC;

-- Soal 2: tampilkan semua kolom dari table ms_pelanggan
-- urutkan berdasarkan nama_pelanggan DESC
SELECT nama_pelanggan
FROM pelanggan
ORDER BY nama_pelanggan DESC;

-- Soal 3: tampilkan semua kolom dari table ms_pelanggan
-- urutkan berdasarkan alamat DESC
SELECT alamat 
FROM pelanggan
ORDER BY alamat DESC;

-- Praktek #5
-- ORDER BY digunakan dari hasil operasi matematika ataupun dari fungsi
-- Ambil nama produk, harga, qty, dan total (qty*harga) urut total
SELECT nama_produk, harga, qty, qty*harga AS total
FROM penjualan ORDER BY total DESC;

-- Latihan Mandiri
-- Soal 1 - Cari Total Bayar Setelah dikurangi Diskon
-- Cari dulu total diskon dalam rupiah
-- setelah itu hitung total - diskon_rupiah = total_bayar
-- lakukan dalam 1 query
-- Langkah-langkah:
-- 1. Hitung total = qty * harga
-- 2. Hitung diskon_rupiah = total * 0.1
-- 3. Hitung total_bayar = total - diskon_rupiah
-- 4. Urutkan berdasarkan total_bayar DESC
SELECT nama_produk, qty, harga,
       qty*harga AS total,
       (qty*harga*0.1) AS diskon_rupiah,
       (qty*harga - qty*harga*0.1) AS total_bayar
FROM penjualan
ORDER BY total_bayar DESC;

-- Penggunaan WHERE dan ORDER BY
-- ORDER BY bisa digabungkan dengan WHERE untuk pengurutan hasil filter
-- ORDER BY diletakkan setelah WHERE
-- Praktek #6
-- Ambil nama produk yang berawalan huruf 'F' urut berdasarkan qty terbesar
SELECT nama_produk, qty FROM penjualan
WHERE nama_produk LIKE 'F%' ORDER BY qty DESC;

-- Latihan Mandiri
-- Soal 1: tampilkan semua kolom dari penjualan
-- filter hanya transaksi yang memiliki diskon
-- urutkan berdasarkan harga tertinggi
SELECT * 
FROM penjualan
WHERE diskon IS NOT NULL
ORDER BY harga DESC;

-- Soal 2: tampilkan nama_produk, qty, harga
-- filter harga >= 100000
-- urutkan berdasarkan harga tertinggi
SELECT nama_produk, qty, harga
FROM penjualan
WHERE harga >= 100000
ORDER BY harga DESC;

-- Soal 3: tampilkan nama_produk, qty, harga
-- filter harga >= 100000 OR nama_produk LIKE 'T%'
-- urutkan berdasarkan diskon tertinggi
SELECT nama_produk, qty, harga, diskon
FROM penjualan
WHERE harga >= 100000 OR nama_produk LIKE 'T%'
ORDER BY diskon DESC;

-- Fungsi Agregasi
-- Digunakan untuk mengelola beberapa row data untuk menghasilkan nilai baru
-- Praktek #7
-- Jumlahkan seluruh qty yang ada di tabel penjualan
SELECT SUM(qty) FROM penjualan;
-- Berapa rata-rata qty terjual dari penjualan
SELECT AVG(qty) FROM penjualan;

-- Praktek #8
-- Berapa banyak transaksi yang terjadi
SELECT COUNT(*) FROM penjualan;

-- Praktek #9 
-- Menggunakan dua fungsi agregasi secara bersamaan
SELECT SUM(qty), COUNT(*), SUM(qty)/COUNT(*) AS Rasio_Penjualan
FROM penjualan;

-- Praktek #10
-- Rata-rata, nilai tertinggi, nilai terendah
SELECT AVG(qty), MAX(qty), MIN(qty) FROM penjualan;

-- Praktek #11
-- COUNT DISTINCT untuk mencari nilai unik terdapat dari seluruh baris (row)
-- Berapa banyak produk unik yang terjual
SELECT COUNT(DISTINCT nama_produk) FROM penjualan;
-- Berapa banyak pelanggan unik yang bertransaksi
-- Praktek #12
SELECT COUNT(DISTINCT kode_pelanggan) FROM penjualan;
-- Praktek #13
-- Gabungakan 
SELECT 
COUNT(*) AS Jumlah_transaksi,
COUNT(DISTINCT nama_produk) AS Jumlah_Produk_terjual,
COUNT(DISTINCT kode_pelanggan) AS Jumlah_pelanggan_yang_transaksi
FROM penjualan;

-- GROUP BY
-- Mengelompokkan isi data dari sebuah kolom
-- Bisa dikelompokkan pada 1 kolom, 2 kolom, dan gabungan kolom dan fungsi agregasi
-- Praktek #14
-- Ambil kelompok produk dari nama produk
SELECT nama_produk FROM penjualan GROUP BY nama_produk;

-- Praktek #15
-- kelompok dengan 2 kolom
-- Ambil nama produk dan qty yang dikelompokkan berdasarkan nama dan qty
SELECT nama_produk, qty FROM penjualan
GROUP BY nama_produk, qty;

-- Praktek #16 
-- Kolompok dengan 1 kolom dan 1 hasil agregasi kolom
-- Ambil nama produk terjual berserta total qty nya
SELECT nama_produk, SUM(qty)
FROM penjualan GROUP BY nama_produk
ORDER BY SUM(qty); 

-- Praktek #17 diurutkan dengan ORDER BY
SELECT nama_produk, SUM(qty)
FROM penjualan GROUP BY nama_produk
ORDER BY SUM(qty) DESC;

-- HAVING adalah filtering untuk GROUP BY
-- Praktek #18
-- Ambil nama produk terjual berserta total qty nya, tampilkan total qty > 3
SELECT nama_produk, SUM(qty)
FROM penjualan GROUP BY nama_produk
HAVING SUM(qty) > 3
ORDER BY SUM(qty) DESC;

-- Latihan Mandiri 
-- Soal 1: tampilkan nama produk dengan total qty > 4
SELECT nama_produk, SUM(qty) AS total_qty
FROM penjualan
GROUP BY nama_produk
HAVING SUM(qty) > 4
ORDER BY total_qty DESC;

-- Soal 2: tampilkan nama produk dengan total qty = 9
SELECT nama_produk, SUM(qty) AS total_qty
FROM penjualan
GROUP BY nama_produk
HAVING SUM(qty) = 9
ORDER BY total_qty DESC;

-- Soal 3: tampilkan nama produk dan total nilai penjualan
-- rumus: (harga * qty) - diskon
-- urutkan berdasarkan total_nilai DESC
SELECT nama_produk, SUM((harga * qty) - IFNULL(diskon,0)) AS total_nilai
FROM penjualan
GROUP BY nama_produk
ORDER BY total_nilai DESC;



