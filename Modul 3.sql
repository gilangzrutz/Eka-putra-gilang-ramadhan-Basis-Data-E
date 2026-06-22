-- Nama		: Eka putra gilang ramadhan
-- NIM		: 24241166
-- Kelas	: E
-- Modul	: 3


-- menggunakan database
USE kelas_e_mart;

-- Nilai Literal
-- isi/data dari kolom dalam tabel
-- Penggunaannya dengan SELECT Statement
-- Praktek #1
-- menggunakan SELECT statment untuk menampilkan nilai literal
SELECT 77;  -- tipe data integer

-- Praktek #2
-- menampilkan nilai literal yang beda tipe data
SELECT 77 AS angka, true AS nilai_logika, 'PTI' AS teks;

-- NULL
-- literal khusus yang artinya tidak punya nilai (kosong)
-- Praktek #3
-- menampilkan NULL menggunakan SELECT
SELECT NULL AS kosong;

-- Operator Matematika
-- */+-MOD(sisa bagi)
-- 10 (literal), 11 (literal) 10 (+) 11 
-- derajat operator matematika (), */, +-
-- ex. (10+2)/2 -> 12/2 = 6
-- ex. 10+2/2 -> 10+1 = 11
-- Praktek #4
SELECT 5%2 AS sisa_bagi, 5/2 AS hasil_bagi1, 5 DIV 2 AS hasil_bagi2;

-- Latihan Mandiri
-- Soal 1
SELECT 4*2 AS hasil_kali;
-- Soal 2
SELECT 4*8 AS hasil_kali, 32%7 AS hasil_bagi;
-- Soal 3
SELECT 4*8 AS hasil_kali, 32 MOD 7 AS hasil_bagi;
-- Praktek 5 
-- mengalikan qty dan harga untuk mendapatkan total bayar dari penjualan
SELECT qty*harga AS total FROM tr_penjualan;

-- Operator Perbandingan 
-- selalu akan menghasilkan nilai true/false
-- Praktek #6
SELECT 5=5, 5<>5, 5<>4, 5!=5, 5!=4, 5>4;

-- Latihan mandiri
-- soal 1
SELECT 1 = true;
-- soal 2
SELECT 1 = false;
-- Soal 3
SELECT 5<>5;
-- Soal 4
SELECT 5.2 = 5.20000;
-- Soal 5
SELECT NULL = 1;
-- Soal 6
SELECT NULL = NULL;
-- Gabung dalam 1 query soal 1 - 6
SELECT 1 = true, 1 = false, 5<>5, 5.2 = 5.20000, NULL = 1, NULL = NULL;

-- FUNGSI
-- Praktek #7
SELECT NOW(), YEAR(NOW()), MONTH(NOW()), DAY(NOW()),
datediff(NOW(), '1990-03-12'), datediff('1990-03-12', NOW());

-- Latihan mandiri
-- Soal 1
SELECT NOW(), YEAR(NOW()), MONTH(NOW()), DAY(NOW()),
datediff(NOW(), "2022-07-23"), datediff("2022-07-23", NOW());
-- Soal 2
SELECT YEAR("2022-07-23"),
datediff(NOW(), "2022-07-23"), datediff("2022-07-23", NOW());
-- Soal 3
SELECT MONTH("2022-07-23"),
datediff(NOW(), "2022-07-23"), datediff("2022-07-23", NOW());
-- Soal 4 
SELECT DAY("2022-07-23"),
datediff(NOW(), "2022-07-23"), datediff("2022-07-23", NOW());
-- Soal 5
SELECT YEAR(NOW());

-- Praktek #10
-- Lama pelanggan tidak bertansaksi dalam hari 
SELECT datediff(NOW(), tgl_transaksi) FROM penjualan;

-- WHERE atau Filtering
-- digunakan untuk menyaring atau membatasi jumlah data yang 
-- ditampilkan dari satu query
-- Praktek #11
SELECT nama_produk, qty
FROM penjualan WHERE qty>2;

-- Filtering multi-kriteria atau banyak kriteria
-- Praktek #12
-- ambil semua produk yang qty > 3 dan harga > 200.000
SELECT nama_produk, qty, harga
FROM penjualan
WHERE qty>3 AND harga<200000;

-- Filter menggunakan teks 
-- Praktek #13
-- ambil semua produk yang namanya 'Flashdisk DQLab 32 GB'
SELECT tgl_transaksi, kode_pelanggan, 
nama_produk, qty, harga, qty*harga AS total
FROM penjualan
WHERE nama_produk = 'Flashdisk DQLab 32 GB';

-- Operator LIKE
-- Praktek #14
-- filtering teks dengan pola tertentu
SELECT nama_produk FROM penjualan
WHERE nama_produk LIKE 'f%';

-- latihan Mandiri
-- Soal 1
SELECT nama_produk FROM penjualan
WHERE nama_produk LIKE '_a%';
-- Soal 2
SELECT kategori_produk FROM produk
WHERE kategori_produk LIKE '%a%';
-- Soal 3
SELECT kategori_produk FROM produk
WHERE kategori_produk LIKE '%un%';
-- Operator logika
-- AND (dan), OR (atau), NOT(negasi)
-- Praktek #15
-- ambil nama produk dan qty yang berawal f dan qty > 2
SELECT nama_produk, qty
FROM tr_penjualan
WHERE nama_produk LIKE 'f%' AND qty>2;





