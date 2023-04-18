-- *********************************************************************************
use sys;
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

SELECT * FROM ogretmen_lisesi;
Drop Table ogretmen_lisesi;

/*-------------------------------------------------------------------------
Q1: Sinav notu 80'den buyuk olan ogrencilerin tum bilgilerini listeleyin.
---------------------------------------------------------------------------*/

SELECT *
FROM ogretmen_lisesi
WHERE sinav_notu>80;

/*-------------------------------------------------------------------------
Q2: Adresi Ankara olan ogrencilerin isim ve adres bilgilerini listeleyin.
---------------------------------------------------------------------------*/

SELECT isim, adres
FROM ogretmen_lisesi
WHERE adres='ANKARA';

/*-------------------------------------------------------------------------
Q3: id'si 114 olan ogrencinin adini listeleyin.
---------------------------------------------------------------------------*/

SELECT isim
FROM ogretmen_lisesi
WHERE id=114;

/*-------------------------------------------------------------------------
Q4: id'si 115'ten buyuk olan ogrencilerin sehirlerini listeleyin.
---------------------------------------------------------------------------*/

SELECT adres
FROM ogretmen_lisesi
WHERE id>115;

/*-------------------------------------------------------------------------
Q5: Istanbulda yasayan ogrencilerin adini listeleyin.
---------------------------------------------------------------------------*/

SELECT isim
FROM ogretmen_lisesi
WHERE adres='Istanbul';

/*-------------------------------------------------------------------------
Q6: id'si 113ten buyuk 116'dan kucuk olan ogrencilerin derecesini listeleyin.
---------------------------------------------------------------------------*/

SELECT sinav_notu
FROM ogretmen_lisesi
WHERE id>113 AND id<116;

/*================================== SELECT-BETWEEN =============================================
BETWEEN iki mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla 
yazabilme imkani verir, yazdigimiz iki sinirda araliga dahildir.
​
-----Syntax-----
SELECT field1,field2,...
FROM table_name
WHERE field_name 
BETWEEN deger1 AND deger2;
​
=========================================================================================*/

/*==========================AND (ve) Operatoru kullanimi==================================
=> And ile belirtilen sartlarin tamami gerceklesiyorsa o kayit listelenir,
Sartlardan bir tanesi bile tutmazsa listelenmez.
​
SELECT * FROM matematik WHERE sinav1 < 50 AND sinav2 < 50
​
Bu ornekte hem sinav1 hem de sinav2 field'i 50'den kucuk olan kayitlar listelenecektir.
​
/*==========================OR (veya) Operatoru kullanimi==================================
=> Or ile belirtilen sartlardan en az biri gerceklesiyorsa o kayit listelenir,
sartlardan hicbiri gerceklesmiyorsa o kayit listelenmez.
​
SELECT * FROM matematik WHERE sinav1 < 50 OR sinav2 < 50
​
Bu ornekte sinav1 veya sinav2 field'i 50'den kucuk olan kayitlar listelenecektir.
=========================================================================================*/

/*-------------------------------------------------------------------------
Q7: Sinav notu 70'ten buyuk esit, 80'den kucuk esit olan ogrencilerin 
tum bilgilerini listeleyin.
---------------------------------------------------------------------------*/

-- ++++++++++++++++++++ 1. YOL ++++++++++++++++++++
SELECT *
FROM ogretmen_lisesi
WHERE sinav_notu>=70 AND sinav_notu<=80; 

-- ++++++++++++++++++++ 2. YOL ++++++++++++++++++++
SELECT *
FROM ogretmen_lisesi
WHERE sinav_notu
BETWEEN 70 AND 80;

/*-------------------------------------------------------------------------
Q8: Muhammet Talha ve Murat arasinda olan ogrencilerin isimlerini listeleyin.
---------------------------------------------------------------------------*/

SELECT isim
FROM ogretmen_lisesi
WHERE isim
BETWEEN 'Muhammet Talha' AND 'Murat';

-- NOT : String ifadeleri BETWEEN komutu ile kiyaslamak istedigimizde bize
-- sonucu ASCII degerlerine gore siralayarak gonderir.

/*-------------------------------------------------------------------------
Q9: Ankara ile Corum arasinda olan ogrencilerin isimlerini listeleyin.
---------------------------------------------------------------------------*/

SELECT isim, adres
FROM ogretmen_lisesi
WHERE adres
BETWEEN 'Ankara' AND 'Corum';

-- **************************************************************

CREATE TABLE personel(
id CHAR(5),
isim VARCHAR(50),
maas INT
);

INSERT INTO personel VALUES('10001','Ahmet Aslan',7000);
INSERT INTO personel VALUES('10002','Mehmet Yilmaz',12000);
INSERT INTO personel VALUES('10003','Meryem',7215);
INSERT INTO personel VALUES('10004','Veli Han',5000);
INSERT INTO personel VALUES('10005','Mustafa Ali',5500);
INSERT INTO personel VALUES('10006','Ayse Can',5600);
INSERT INTO personel VALUES('10010','Ayse',4700);
INSERT INTO personel VALUES('10009','Ayse Cemile',4000);
INSERT INTO personel VALUES('10008','Ayse Cano',4300);
INSERT INTO personel VALUES('10007','Can Ayse',7700);
INSERT INTO personel VALUES('10011','Yeliz Alina',12700);

SELECT * FROM personel;

/*-------------------------------------------------------------------------
Q10: id'si 10005 ile 10009 arasinda olan personelin bilgilerini listele
---------------------------------------------------------------------------*/

SELECT *
FROM personel
WHERE id
BETWEEN 10005 AND 10009;

/*-------------------------------------------------------------------------
Q11: Ismi Mehmet Yilmaz ile Veli arasinda olan personel bilgilerini listeleyin
---------------------------------------------------------------------------*/

SELECT *
FROM personel
WHERE isim
BETWEEN 'Mehmet Yilmaz' AND 'Veli';

-- Between komutu ile belli bir araliktaki kayitlari listelemek 
-- istedigimizde; filtrelemeyi verilen araliga gore yapar,
-- yazdirmayi da tablodaki kayit sirasina gore yapar

/*-------------------------------------------------------------------------
Q12: Ismi Ahmet ile Ayse Cano arasinda olan personel bilgilerini listeleyin
---------------------------------------------------------------------------*/

SELECT DIstinct * FROM personel
WHERE isim
BETWEEN 'Ahmet' AND 'Ayse CANO';


/*-------------------------------------------------------------------------
Q14: Maasi 7000 ya da ismi Ayse olan personel id'lerini listeleyin
---------------------------------------------------------------------------*/
Select distinct id from personel
where maas=7000 or isim='Ayse';

/*-------------------------------------------------------------------------
Q14: Id'si 10001, 10005 ya da 10008 olan personel isimlerini listeleyin
---------------------------------------------------------------------------*/

Select distinct isim from personel
where id=10001 or id=10005 or id=10008;
