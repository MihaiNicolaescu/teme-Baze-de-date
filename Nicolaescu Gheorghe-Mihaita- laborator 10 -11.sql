DROP TABLE catalog_;
DROP TABLE studenti;
DROP TABLE discipline;
DROP TABLE catalog_log;

CREATE TABLE discipline(
	id int IDENTITY(1,1) PRIMARY KEY,
	cod_disciplina int,
	nume_disciplina varchar(255)
);

CREATE TABLE catalog_log(
	id int IDENTITY (1,1) PRIMARY KEY,
	info varchar(255)
);

CREATE TABLE studenti(
	id int IDENTITY(1,1) PRIMARY KEY,
	Nume varchar(255),
	Prenume varchar(255),
	Grupa int,
	NrLeg int
);

CREATE TABLE catalog_(
	id int IDENTITY(1,1) PRIMARY KEY,
	Nume varchar(255),
	Prenume varchar(255),
	cod_disciplina int,
	Nota float,
	NrLeg int, 
	Grupa int
);

INSERT INTO catalog_(Nume, Prenume, cod_disciplina,Nota, NrLeg) values('Nicolaescu', 'Mihaita', 4, 10, 1234);
INSERT INTO catalog_(Nume, Prenume, cod_disciplina,Nota, NrLeg) values('Rogociu', 'Alexandru', 2, 9.90, 1235);
INSERT INTO catalog_(Nume, Prenume, cod_disciplina,Nota, NrLeg) values('Ciobanu', 'Alexandru', 3, 9.50, 1238);
INSERT INTO catalog_(Nume, Prenume, cod_disciplina,Nota, NrLeg) values('Popescu', 'Ion', 1, 10, 1237);
INSERT INTO catalog_(Nume, Prenume, cod_disciplina,Nota, NrLeg) values('Enescu', 'George', 4, 6, 1242);
INSERT INTO catalog_(Nume, Prenume, cod_disciplina,Nota, NrLeg) values('Ionescu', 'Amalia', 4, 5, 1243);

INSERT INTO discipline(cod_disciplina, nume_disciplina) values (1, 'OOP');
INSERT INTO discipline(cod_disciplina, nume_disciplina) values (2, 'Java');
INSERT INTO discipline(cod_disciplina, nume_disciplina) values (4, 'Baze de date');

INSERT INTO studenti(Nume, Prenume, Grupa, NrLeg) values ('Nicolaescu', 'Mihaita', 223, 1234);
INSERT INTO studenti(Nume, Prenume, Grupa, NrLeg) values ('Rogociu', 'Alexandru', 223, 1235);
INSERT INTO studenti(Nume, Prenume, Grupa, NrLeg) values ('Ciobanu', 'Alexandru', 223, 1238);
INSERT INTO studenti(Nume, Prenume, Grupa, NrLeg) values ('Popescu', 'Ion', 222, 1237);
INSERT INTO studenti(Nume, Prenume, Grupa, NrLeg) values ('Sebastian', 'Iorgu', 221, 1239);
INSERT INTO studenti(Nume, Prenume, Grupa, NrLeg) values ('Nicolaescu', 'Ovidiu', 223, 1240);
INSERT INTO studenti(Nume, Prenume, Grupa, NrLeg) values ('Croitoru', 'Viorel', 223, 1241);
INSERT INTO studenti(Nume, Prenume, Grupa, NrLeg) values ('Enescu', 'George', 223, 1242);
INSERT INTO studenti(Nume, Prenume, Grupa, NrLeg) values ('Ionescu', 'Amalia', 221, 1243);

--tranzactie
BEGIN TRANSACTION
DECLARE @denumire char(255);
DECLARE @cod int;
SET @denumire = 'Tehnologi web';
set @COD = 4;
DECLARE @eroare int;
INSERT INTO discipline(cod_disciplina, nume_disciplina) values (@cod,@denumire);
SELECT @eroare = COUNT(*) FROM discipline WHERE cod_disciplina = @cod;
IF (@eroare > 1) BEGIN
	--DELETE  FROM discipline WHERE cod_disciplina = '4' AND nume_disciplina='Tehnologi Web';
	SELECT 'Deja exista o inregistrare cu acest cod';
	ROLLBACK;
END
ELSE BEGIN
COMMIT TRANSACTION
END
GO
SELECT * FROM discipline;


--cursor
DECLARE log_catalog CURSOR  FOR  SELECT  Nume, Prenume, Nota FROM catalog_;
OPEN log_catalog;    
DECLARE @nume varchar(225), @prenume varchar(255), @nota varchar(255);
FETCH NEXT FROM log_catalog     
INTO @nume,@prenume, @nota    
       
  
WHILE @@FETCH_STATUS = 0    
BEGIN
DECLARE @INPUT varchar(255);
  SET @INPUT = @nume + ' ' + @prenume + ' ' + @nota;
  INSERT INTO catalog_log (info) VALUES (@INPUT);
   FETCH NEXT FROM log_catalog     
INTO @nume,@prenume, @nota     
   
END     
CLOSE log_catalog;    
DEALLOCATE log_catalog;

SELECT * FROM catalog_log;