--AB loomine
Create database KovaljovaBaas;

use KovaljovaBaas;
CREATE TABLE opilane(
opilaneId int primary key identity(1,1),
eesnimi varchar(25) not null,
perenimi varchar(25) not null,
synniaeg date,
stip bit,
aadress text,
keskmine_hinne decimal(2,1)
)
select * from opilane;
--andmete lisamine tabelisse
INSERT INTO opilane(eesnimi,
perenimi,
synniaeg,
stip,
keskmine_hinne)
VALUES(
'Jelena',
'Jelena2',
'2008-12-03',
1,
4.5),
('Nastja',
'lol',
'2005-10-25',
1,
3.6),
('Adri',
'pikaljov',
'2003-04-07',
1,
2.4),
('danik',
'koko'
'2007-11-30',
1,
5.5)

--andmete uuendamine
UPDATE opilane SET aadress='Tartu'
select * from opilane;
