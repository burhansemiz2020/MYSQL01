use sys;

/*================================== SELECT-IN ===========================================
IN birden fazla mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla yazabilme
imkani verir. IN icerisine yazacagimiz sartlar ayni field'a ait olmali.
-----Syntax-----
SELECT field1,field2,...
FROM table_name
WHERE field_name IN (deger1,deger2,...);
=========================================================================================*/

/*-------------------------------------------------------------------------
Q1: Personel tablosundan ID'si Id'si 10001, 10005 ya da 10008 olan personel isimlerini listeleyin
---------------------------------------------------------------------------*/
Select distinct isim from personel
where id in(10001,10005,10008);

/*-------------------------------------------------------------------------
Q2: Maasi sadece 7000 veya 12000 olan personelin bilgilerini listele
---------------------------------------------------------------------------*/
Select distinct * from personel
where maas in(7000, 12000);




/*================================== SELECT-LIKE =============================================
LIKE keyword sorgulama yaparken belirli patternleri kullanabilmemize olanak saglar.
-----Syntax-----
 SELECT field1,field2,...
 FROM table_name
 WHERE field LIKE pattern
 
 ----------------
 Pattern icin :
 % ---> 0 veya daha fazla karakteri belirtir
 _ ---> Tek bir karakteri temsil eder.
=========================================================================================*/


/*-------------------------------------------------------------------------
Q3: Ismi A ile baslayan personeli listeleyiniz
---------------------------------------------------------------------------*/
select distinct isim from personel
where isim like 'a%';



/*-------------------------------------------------------------------------
Q4: Isminde Ayse olan personelin isimlerini listeleyiniz
---------------------------------------------------------------------------*/
select distinct isim from personel
where isim like '%ayse%';
/*
Ayse Can
Ayse
Ayse Cemile
Ayse Cano
Can Ayse
*/
select distinct isim from personel
where isim like '%ayse';
/*
Ayse
Can Ayse
*/

select distinct isim from personel
where isim like 'ayse%';
/*
Ayse Can
Ayse
Ayse Cemile
Ayse Cano
*/

select distinct isim from personel
where isim like 'ayse';
/*
Ayse
*/
/*-------------------------------------------------------------------------
Q5: Ismi n harfi ile biten personeli listeleyiniz
---------------------------------------------------------------------------*/
select distinct isim from personel
where isim like '%n';

/*-------------------------------------------------------------------------
Q6: Isminin 2. harfi e olan personeli listeleyiniz
---------------------------------------------------------------------------*/
select distinct isim from personel
where isim like '_e%';
/*
Mehmet Yilmaz
Meryem
Veli Han
Yeliz Alina
*/
/*-------------------------------------------------------------------------
Q7: Isminin 2. harfi e olup diger harflerinde y olan personeli listeleyiniz
---------------------------------------------------------------------------*/
select distinct isim from personel
where isim like '_e%' and isim like '%y%';
/*
Mehmet Yilmaz
Meryem
Yeliz Alina
*/

/*-------------------------------------------------------------------------
Q8: Isminde a harfi olmayan personeli listeleyiniz
---------------------------------------------------------------------------*/
select distinct isim from personel
where isim not like '%a%';
/*
Meryem
*/

/*-------------------------------------------------------------------------
Q9: Maasi 5 haneli olan personeli listeleyiniz
---------------------------------------------------------------------------*/
select distinct isim from personel
where maas like '_____'
/*
Mehmet Yilmaz
Yeliz Alina
*/

/*
eger burada tirnaklarin basina sonuna yuzde koysaydik en az bes haneli demis
olaacktik. bUrada hata vermez ama besten fazla olmus olsaydi hata verirdi
*/


/*-------------------------------------------------------------------------
Q9: Maasi 3  haneli den fazla olan personeli listeleyiniz
---------------------------------------------------------------------------*/




select distinct isim from personel
where maas like '%___%';
/*
Ahmet Aslan
Mehmet Yilmaz
Meryem
Veli Han
Mustafa Ali
Ayse Can
Ayse
Ayse Cemile
Ayse Cano
Can Ayse
Yeliz Alina
*/

/*-------------------------------------------------------------------------
Q10: 1. harfi a ve 7. harfi a olan personeli listeleyiniz
---------------------------------------------------------------------------*/
select distinct isim from personel
where isim like 'a%' and isim like '______a%';

select distinct isim from personel
where isim like 'a_____a%'

/*==================================SELECT-REGEXP_LIKE==================================
 Daha karmasik pattern ile sorgulama islemi icin REGEXP_LIKE kullanilabilir.
  -- 'c' => case-sensitive demektir
  -- 'i' => case-insensitive demektir ve default case-insensitive aktiftir.
  
-----Syntax-----
 SELECT sutun1,sutun2,...
 FROM tablo_adi
 WHERE REGEXP_LIKE(sutun_adi, 'pattern[]','c'[])
%
=========================================================================================*/
CREATE TABLE kelimeler
    (
        id int UNIQUE,
        kelime VARCHAR(50) NOT NULL,
        harf_sayisi int
    );
    
    INSERT INTO kelimeler VALUES 
    (1001, 'hot', 3),
    (1002, 'hat', 3),
    (1003, 'hit', 3),
    (1004, 'hbt', 3),
    (1005, 'hct', 3),
    (1006, 'adem', 4),
    (1007, 'selim', 5),
    (1008, 'yusuf', 5),
    (1009, 'hip', 3),
    (1010, 'HOT', 3),
    (1011, 'hOt', 3),
    (1012, 'h9t', 3),
    (1013, 'hoot', 4),
    (1014, 'haaat', 5),
    (1015, 'hooooot', 7),
    (1016, 'h-t', 3),
    (1017, 'h?t', 3),
    (1018, 'hOOOt', 5),
    (1019, 'O', 1);
SELECT * FROM kelimeler;

-- NOT: VEYA islemi icin | karakteri kullanilir.

/*Q1 : Icerisinde 'ot' veya 'at' bulunan kelimeleri case-sensitive'e dikkat ederek listele

select kelime
from kelimeler
where REGEXP_LIKE (kelime, 'ot|at', 'c');
/*
hot
hat
hoot
haaat
hooooot

BURADA CASE SENSITIVE OLDUGUNA DIKKAT ET
*/

/*Q2 : Icerisinde 'ot' veya 'at' bulunan kelimeleri case-sensitive'e dikkat etmeksizin listele
select kelime
from kelimeler
where regexp_like(kelime,'ot|at', 'i');
/*
hot
hat
HOT
hOt
hoot
haaat
hooooot
hOOOt
*/



