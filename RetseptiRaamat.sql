Create database retseptiRaamatKovaljova;
use retseptiRaamatKovaljova

--tabeli loomine
Create table kasutaja(
kasutaja_id int primary key identity(1,1),
eesnimi varchar(50),
perenimi varchar(50) not null,
email varchar(150));
insert into kasutaja(eesnimi,perenimi,email)
Values ('Nikita', 'Nilita', 'nikita@tthk.ee'),
('Mark', 'Mark', 'mark@tthk.ee'),
('Jelena', 'Jelena', 'jelena@tthk.ee'),
('Roman', 'Roman', 'roman@tthk.ee');

SELECT * FROM Kasutaja;

--tabeli loomine
Create table kategooria(
kategooria_id int primary key identity(1,1),
kategooria_nimi varchar(50));
insert into kategooria(kategooria_nimi)
VALUES ('supp'), ('grill'), ('kook');
SELECT * FROM kategooria;
SELECT * FROM kasutaja;

--tabeli loomine
Create table toiduaine(
touiduaine_Id int primary key identity(1,1),
toiduaine_nimi varchar(100))
insert into toiduaine(toiduaine_nimi)
values('munad'), ('juust'), ('õlu'), ('vorst'), ('vesi')

SELECT * FROM toiduaine

--tabeli loomine
Create table yhik(
yhik_Id int primary key identity(1,1),
yhik_nimi varchar(100))

INSERT INTO yhik(yhik_nimi)
VALUES
('ml'),
('g'),
('kg'),
('tl'),
('sl')

SELECT * FROM yhik

--tabeli loomine
Create table retsept(
retsept_Id int primary key identity(1,1),
retsepti_nimi varchar(100),
kirjeldus varchar(200),
juhend varchar(500),
sisestatud_kp date,
kasutaja_Id int,
foreign key (kasutaja_id) references kasutaja(kasutaja_Id),
kategooria_Id int,
foreign key (kategooria_Id) references kategooria(kategooria_Id));
insert into retsept(
retsepti_nimi, kirjeldus, juhend, sisestatud_kp, kasutaja_Id, kategooria_Id)
VALUES ('Pasta', 'keeta makaroonid', 'kasuta elektripliit', '2025-6-17', 1, 1),
('Porgandikook', 'vaga magus', 'kasuta porgandi', '2025-6-16', 1, 1),
('Pankoogid', 'teha tainas', 'kasuta elektripliit', '2025-6-18', 1, 1),
('Mesi', 'väga magus', 'kasuta mesilased', '2025-6-19', 1, 1),
('Grill', 'nii soola', 'kasuta aerogrill', '2025-6-20', 1, 1)

SELECT * FROM retsept;

--tabeli loomine

create table koostis(
koostis_id int primary key identity(1,1),
kogus int,
retsept_retsept_Id int,
toiduaine_Id int,
yhik_Id int,
foreign key (retsept_retsept_Id) references retsept(retsept_Id),
foreign key (toiduaine_Id) references toiduaine(touiduaine_Id),
foreign key (yhik_Id) references yhik(yhik_Id));

--kustuta tabel
DROP TABLE koostis

INSERT INTO koostis(kogus, retsept_retsept_Id, toiduaine_Id, yhik_Id)
VALUES (3,4,2,1), (2,3,1,4), (1,2,3,4), (4,3,2,1)
SELECT * FROM koostis;
SELECT * FROM kasutaja;
SELECT * FROM tehtud;

--proceduuri AddKasutaja loomine
Create procedure AddKasutaja

@enimi varchar(50),
@pnimi varchar(50),
@mail varchar(150)
AS
BEGIN
insert into kasutaja(eesnimi,perenimi,email)
values (@enimi, @pnimi, @mail);
SELECT * FROM kasutaja

END;

--PROTSEDUURI KUTSE
exec AddKasutaja @enimi='Alan', @pnimi='Iranium', @mail='omegamail@mail.ee'
select * from retsept
exec @kogus=1, @retsept_retsept_id=1, @toiduaine_id=1, yhik_id=1

--Protseduuri loomine
CREATE PROCEDURE AddTehtud
@tehtud_kp DATE,
@retsept_id INT
AS
BEGIN
INSERT INTO Tehtud (tehtud_kp, retsept_id)
VALUES (@tehtud_kp, @retsept_id);
END;

--PROTSEDUURI KUTSE
EXEC AddTehtud @tehtud_kp = '2025-02-14', @retsept_id = 1;

--protseduuri veeruLisaKustuta loomine
CREATE PROCEDURE veeruLisaKustuta
@valik varchar(20),
@tabelinimi varchar(20),
@veerunimi varchar(20),
@tyyp varchar(20)=null


AS
BEGIN
Declare @sqltegevus as varchar(max)
set @sqltegevus=case
when @valik='add' then concat('ALTER TABLE ',  @tabelinimi,' ADD ', @veerunimi, ' ', @tyyp )
when @valik='drop' then concat('ALTER TABLE ', @tabelinimi, ' DROP COLUMN ', @veerunimi)
END;
print @sqltegevus 
BEGIN
EXEC (@sqltegevus)
END
END;

drop procedure veeruLisaKustuta
--PROTSEDUURI KUTSE
EXEC veeruLisaKustuta @valik='add', @tabelinimi='retsept', @veerunimi='test3', @tyyp='int';
SELECT * FROM retsept;
EXEC veeruLisaKustuta @valik='drop',@tabelinimi='retsept', @veerunimi='test3';

--loomine minu table
CREATE TABLE tooted(
toode_Id INT PRIMARY KEY IDENTITY(1,1),
toode_nimi VARCHAR(100),
kirjeldus VARCHAR(200),
hind DECIMAL(10,2),
saadavus VARCHAR(50), 
kasutaja_Id INT,
FOREIGN KEY (kasutaja_Id) REFERENCES kasutaja(kasutaja_Id));

INSERT INTO tooted(
toode_nimi, kirjeldus, hind, saadavus, kasutaja_Id) 
VALUES
('Õun', 'Magus õun', 0.99, 'laos', 1),
('Piim', '1L täispiim', 1.49, 'pole saadaval', 2),
('Leib', 'voileib', 2.35, 'laos', 3),
('Kohv', 'Arabica kohv', 5.75, 'pole saadaval', 4),
('Šokolaad', 'Piimašokolaad', 3.99, 'laos', 5);
