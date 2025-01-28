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

--andmete uuendamine
UPDATE opilane SET aadress='Tartu'
select * from opilane;

CREATE TABLE Language
(
ID int NOT NULL PRIMARY KEY,
Code char(3) NOT NULL,
Language varchar(50) NOT NULL,
IsOfficial bit,
Percentage smallint
);
select * from Language;

INSERT INTO Language(ID, Code, Language)
VALUES (2, 'RUS', 'vene'), (3, 'ENG', 'inglise'),
(4, 'DE', 'saksa')

Create table keeleValik(
keeleValikId int primary key identity(1,1),
valikuNimetus varchar(10) not null,
opilaneId int,
Foreign key(opilaneId) references opilane(opilaneId),
Language int,
Foreign key(language) references Language(ID)
)
select * from keelevalik;
select * from Language;
select * from opilane;

insert into keelevalik(valikunimetus, opilaneId, Language)
Values ('valik E', 1, 5)

SELECT *
FROM opilane, Language, keelevalik
WHERE opilane.opilaneId=keelevalik.opilaneID
AND Language.ID=keelevalik.Language

create table oppimine(
opilaneID int primary key identity (1,1),
aine varchar(25) not null,
opetaja varchar(25) not null,
aasta char(4),
hinne int,
foreign key (opilaneId) references opilane(opilaneId));

insert into oppimine(opilaneId, aine, opetaja, aasta, hinne)
values ('andmebaasid','tarpv24','merkulova',2025,5)
select * from oppimine 
 
