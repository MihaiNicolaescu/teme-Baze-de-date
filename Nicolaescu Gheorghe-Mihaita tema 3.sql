
DROP TABLE clienti;
DROP TABLE companie;
DROP TABLE fabrici;
DROP TABLE articole;
DROP TABLE comenzi;
DROP TABLE titlu;
DROP TABLE salariati;
DROP TABLE stoc;
DROP TABLE emitere_comenzi;
DROP TABLE catalog_;
DROP TABLE studenti;
DROP TABLE discipline;
DROP view note2;

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
	NrLeg int
);

CREATE TABLE emitere_comenzi(
	id int IDENTITY(1,1) PRIMARY KEY,
	nume_client varchar(255),
	data_comanda date
);

CREATE TABLE stoc(
	id int IDENTITY(1,1) PRIMARY KEY,
	id_fabrica int,
	id_art int
);

CREATE TABLE salariati(
	id int IDENTITY(1,1) PRIMARY KEY,
	nume varchar(255),
	prenume varchar(255),
	id_titlu int,
	adresa varchar(255)
);

CREATE TABLE titlu(
	id int IDENTITY(1,1) PRIMARY KEY,
	denumire varchar(255),
	sal_ora int
);

CREATE TABLE clienti(
	id int IDENTITY(1,1) PRIMARY KEY,
	Nume varchar(255),
	Prenume varchar(255),
	Oras varchar(255),
	Strada varchar(255),
	nr int
);

CREATE TABLE companie(
	id int IDENTITY(1,1) PRIMARY KEY,
	Oras varchar(255),
	nr_com int
);

CREATE TABLE fabrici(
	id int IDENTITY(1,1) PRIMARY KEY,
	id_fabrica varchar(255),
	termen_liv int,
	oras varchar(255),
	strada varchar(255),
	nr int
);

CREATE TABLE articole(
	id int IDENTITY(1,1) PRIMARY KEY,
	nr_com int,
	cd_art int,
	id_fabrica varchar(255),
	pret float,
	pret_total int,
	denumire varchar(255)
);

CREATE TABLE comenzi(
	id int IDENTITY(1,1) PRIMARY KEY,
	nr_comanda int,
	data_comanda date,
	id_client int,
	data_livrarii date,
	id_articol int
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
--Exemplu unire naturala(Natural join)
SELECT S.*, C.cod_disciplina, C.Nota FROM studenti S INNER JOIN catalog_ C ON S.Nrleg = C.NrLeg;
--Exemplu unire externa la stanga
SELECT S.NrLeg, S.Nume, S.Prenume, Nota FROM studenti S LEFT OUTER JOIN catalog_ C ON S.NrLeg=C.NrLeg;
--Exemplu unire externa la dreapta
SELECT S.NrLeg, S.Nume, S.Prenume, Nota FROM studenti S RIGHT OUTER JOIN catalog_ C ON S.NrLeg=C.NrLeg;
--Exemplu unire completa
SELECT S.NrLeg, S.Nume, S.Prenume, Nota FROM studenti S FULL OUTER JOIN catalog_ C ON S.NrLeg=C.NrLeg;
--crearea unei vederi cu notele mari decat 5 ale studentilor al caror nume se termina in 'escu'
exec('CREATE VIEW note2 AS SELECT C.* FROM studenti s, catalog_ C WHERE S.NrLeg=C.NrLeg and s.Nume like ''%escu'' and Nota > 5 ');
SELECT * FROM note2;
--Singura modalitate prin care am reusit sa execut CREATE VIEW fara a folosi un query separat a fost prin functia exec()