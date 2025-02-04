(localdb)\mssqllocaldb
--SQL salvestatud protseduur - funktsioon, mis käivitab serveris mitu SQL tegvust järjest.
Kasutamine SQL Server

Create database protseduurKovaljova;
use protseduurTARpv24;
Create table linn(
linnId int Primary Key identity(1,1),
linnNimi varchar(30),
rahvaArv int);
Select * from linn;
insert into linn(linnNimi, rahvaArv)
Values('saaremaa', 1000)
--Protseduuri loomine
--protseduur, mis lisab uus linn ja kohe naitab tabelis

CREATE PROCEDURE lisaLinn
@lnimi varchar(30),
@rArv int
AS
BEGIN

insert into linn(linnNimi, rahvaArv)
Values(@lnimi, @rArv);
SELECT * FROM linn;

END;

--protseduuri kutse
EXEC lisaLinn @lnimi='Tartu', @rArv=1256
--lihtsam
EXEC lisalinn 'Tartu2', 1256
--kirje kustutamine
DELETE FROM linn WHERE linnID=6
--protseduur, mis kustutab linn id järgi
CREATE PROCEDURE kustutaLinn
@deleteID int 
AS
BEGIN
SELECT * FROM linn;
DELETE FROM linn WHERE linnID=@deleteID
SELECT * FROM linn;
END;

--kutse
EXEC kustutaLinn 4;
--proceduri kustutamine
DROP Procedure kustutalinn;

--Protseduur, mis otsib linn esimese tähte järgi
CREATE PROCEDURE linnaOtsing
@taht char(1)
AS
BEGIN
SELECT * FROM linn
WHERE linnNimi LIKE @taht + '%';
--% - kõik teised tähed
END;
--kutse
EXEC linnaOtsing T;

Create table linn(
linnId int Primary Key AUTO_INCREMENT,
linnNimi varchar(30),
rahvaArv int);

