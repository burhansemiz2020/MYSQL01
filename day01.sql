use sys;
-- Yorum satiri 
-- bu da 2. yorum satiri
CREATE TABLE ogrenci_bilgileri_yeniv2
(
okul_no CHAR(4),
isim VARCHAR(20),
soyisim VARCHAR(20),
iletisim_bilgileri CHAR(11),
ortaogretim_basari_puani INT,
son_guncellenme_tarihi DATE
);


/*========================================
	TABLO OLUSTURMA 1 (CRUD - Create)
========================================*/
-- id, isim, not ortalamasi, adres ve son degistirme tarihi
-- fieldlari iceren bir ogrenciler table'i olusturunuz.

CREATE TABLE ogrenciler1
(
id INT,
isim VARCHAR(25),
not_ortalamasi DOUBLE,
adres VARCHAR(50),
son_degistirme_tarihi DATE
);
SELECT * FROM ogrenciler1;

/*------------------------------------------------------------
Q1: "tedarikciler" isminde bir tablo olusturun.
   "tedarikci_id", "tedarikci_ismi", "tedarikci_adres" ve 
   "ulasim_tarihi" field'lari olsun.
-------------------------------------------------------------*/
CREATE TABLE tedarikciler1
(
tedarikci_id INT,
tedarikci_ismi VARCHAR(25),
tedarikci_adres VARCHAR(50),
ulasim_tarihi DATE
);
SELECT * FROM tedarikciler1

/*========================================
	VAROLAN TABLODAN TABLO OLUSTURMA  
========================================
​
------------------Syntax------------------
​
CREATE TABLE table_name
AS
SELECT field1,field2
FROM other_table_name
​-- alarak ogrenci_derece isimli yeni bir tablo olustur.
-- alarak ogrenci_derece isimli yeni bir tablo olustur.
========================================*/

CREATE TABLE ogrenci_derece1
AS
SELECT isim, not_ortalamasi
FROM ogrenciler1;
SELECT * FROM ogrenci_derece1;
/*--------------------------------------------------------
Q2: "tedarikciler" table'indan "tedarikci_ismi" ve
 "ulasim_tarihi" field'lari olan "tedarikciler_son" 
 isimli yeni bir table olusturun.
---------------------------------------------------------*/

CREATE TABLE tedarikciler_son1
AS
SELECT tedarikci_ismi,ulasim_tarihi
FROM tedarikciler1;
