use sys;
-- ************************ Anadolu Lisesi Tablosundan *****************************
-- Q1 : Okul_no'su 1005'ten buyuk olan ogrencilerin tum bilgilerini listeleyin.
-- Q2 : Ismi Anil Fidan olan ogrencinin derecesini listeleyin.
-- Q3 : Derecesi 90'dan buyuk olan ogrencilerin okul_no ve isimlerini listeleyin.
-- Q4 : Okul nosu 1003 ile 1007 arasinda olan ogrencilerin sehrini listeleyin 
-- Q5 : Istanbul'da yasayan ogrencilerin isimlerini listeleyin.
-- *********************************************************************************
CREATE TABLE ogretmen_lisesi(
id int,
isim VARCHAR(45),
adres VARCHAR(100),
sinav_notu DOUBLE
);
INSERT INTO ogretmen_lisesi VALUES (111, 'Emine Yucel', 'Ankara', 75);
INSERT INTO ogretmen_lisesi VALUES (112, 'Muhammet Talha Kurt', 'Istanbul', 85);
INSERT INTO ogretmen_lisesi VALUES (113, 'Ilhan Sahin', 'Ankara', 70);
INSERT INTO ogretmen_lisesi VALUES (114, 'Kadir Corumlu', 'Corum', 90);
INSERT INTO ogretmen_lisesi VALUES (115, 'Selman Kasabali', 'Ankara',70);
INSERT INTO ogretmen_lisesi VALUES (116, 'Murat Aycicek', 'Izmir', 85);
INSERT INTO ogretmen_lisesi VALUES (117, 'Tugba Ozsoy', 'Bolu', 85);
/*-------------------------------------------------------------------------
Q1: Sinav notu 80'den buyuk olan ogrencilerin tum bilgilerini listeleyin.
---------------------------------------------------------------------------*/
select * from ogretmen_lisesi
where sinav_notu >80; 
/*-------------------------------------------------------------------------
Q2: Adresi Ankara olan ogrencilerin isim ve adres bilgilerini listeleyin.
---------------------------------------------------------------------------*/
select isim,adres from ogretmen_lisesi
where adres='ankara';
/*-------------------------------------------------------------------------
Q3: id'si 114 olan ogrencinin adini listeleyin.
---------------------------------------------------------------------------*/
select isim from ogretmen_lisesi
where id=114;
/*-------------------------------------------------------------------------
Q4: id'si 115'ten buyuk olan ogrencilerin sehirlerini listeleyin.
---------------------------------------------------------------------------*/
select adres from ogretmen_lisesi
where id>115;
/*-------------------------------------------------------------------------
Q5: Istanbulda yasayan ogrencilerin adini listeleyin.
---------------------------------------------------------------------------*/
select isim from 
/*-------------------------------------------------------------------------
Q6: id'si 113ten buyuk 116'dan kucuk olan ogrencilerin derecesini listeleyin.
---------------------------------------------------------------------------*/