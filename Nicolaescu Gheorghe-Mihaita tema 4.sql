
DROP TABLE catalog_;
DROP TABLE studenti;
DROP TABLE discipline;

CREATE TABLE discipline(
	id int IDENTITY(1,1) PRIMARY KEY,
	cod_disciplina int,
	nume_disciplina varchar(255)
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

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'adaugare_studenti' AND type='P')
	DROP PROCEDURE adaugare_studenti;
GO
CREATE PROCEDURE adaugare_studenti --procedura pentru a adauga un student in baza de date
	@nume char(250),
	@prenume char(250),
	@grupa int,
	@legitimatie int
AS
	INSERT INTO studenti VALUES(@nume, @prenume, @grupa, @legitimatie)
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'afisare_studenti' AND type='P')
	DROP PROCEDURE afisare_studenti;
GO
CREATE PROCEDURE afisare_studenti -- procedura pentru afisarea tuturor datelor din tabelul studenti
AS
	SELECT * FROM studenti
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'note' AND type='P')
	DROP PROCEDURE note;
GO
CREATE PROCEDURE note --procedura pentru afisarea notelor unei anumite grupe
	@Grupa int
AS
	SELECT S.Nume, S.Prenume, C.Nota FROM studenti S, catalog_ C WHERE S.NrLeg = C.NrLeg AND S.Grupa = @Grupa
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'mod_stud ' AND type = 'TR')
	DROP TRIGGER mod_stud
GO

CREATE TRIGGER mod_stud  -- declansator care afiseaza un mesaj cu datele care au fost modificate pentru tabelul studenti
ON studenti
FOR UPDATE 
AS  IF UPDATE(NrLeg) AND UPDATE(grupa) SELECT 'Numarul de legitimatie si grupa  au fost modficate'
	ELSE IF UPDATE(grupa) SELECT 'Grupa  a fost modificata'
	ELSE IF UPDATE(NrLeg) SELECT 'Numarul de legitimatie a fost modificat'
	ELSE SELECT 'S-a modificat alt camp al tabelului studenti'
GO

Update studenti SET Grupa = 223 WHERE Nume = 'Nicolaescu'; -- testarea declansatorului
EXEC afisare_studenti; -- procedura pentru afisarea tabelului 'studenti'
EXEC note 223; --procedura pentru afisarea notelor studentilor dintr-o anumita grupa
