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

INSERT INTO discipline(cod_disciplina, nume_disciplina) values (1, 'OOP');
INSERT INTO discipline(cod_disciplina, nume_disciplina) values (2, 'Java');
INSERT INTO discipline(cod_disciplina, nume_disciplina) values (4, 'Baze de date');

INSERT INTO studenti(Nume, Prenume, Grupa, NrLeg) values ('Nicolaescu', 'Mihaita', 223, 1234);
INSERT INTO studenti(Nume, Prenume, Grupa, NrLeg) values ('Rogociu', 'Alexandru', 223, 1235);
INSERT INTO studenti(Nume, Prenume, Grupa, NrLeg) values ('Ciobanu', 'Alexandru', 223, 1238);
INSERT INTO studenti(Nume, Prenume, Grupa, NrLeg) values ('Popescu', 'Ion', 222, 1237);

INSERT INTO emitere_comenzi(nume_client, data_comanda) values ('Nicolaescu', '2020-09-04');
INSERT INTO emitere_comenzi(nume_client, data_comanda) values ('Popescu', '2020-09-04');
INSERT INTO emitere_comenzi(nume_client, data_comanda) values ('Miranda', '2020-09-03');
INSERT INTO emitere_comenzi(nume_client, data_comanda) values ('Doriana', '2020-09-05');

INSERT INTO salariati (nume, prenume, id_titlu, adresa) values ('Nicolaescu', 'Ovidiu', 1, 'tiu 255');
INSERT INTO salariati (nume, prenume, id_titlu, adresa) values ('Popesco', 'Bidilici', 3, 'craiova 26');
INSERT INTO salariati (nume, prenume, id_titlu, adresa) values ('Cioi', 'Benoni', 4, 'Cernatesti 255');
INSERT INTO salariati (nume, prenume, id_titlu, adresa) values ('Nicolaescu', 'Mihaita', 4, 'tiu 255');

INSERT INTO titlu (denumire, sal_ora) values ('Director', 300);
INSERT INTO titlu (denumire, sal_ora) values ('Angajat', 50);
INSERT INTO titlu (denumire, sal_ora) values ('Manager', 150);
INSERT INTO titlu (denumire, sal_ora) values ('Supervizor', 100);

INSERT INTO comenzi (nr_comanda, data_comanda, id_client, data_livrarii, id_articol) values (12, '2020-01-05', 2, '2020-02-01', 123); 
INSERT INTO comenzi (nr_comanda, data_comanda, id_client, data_livrarii, id_articol) values (13, '2020-01-05', 4, '2020-03-05', 2); 
INSERT INTO comenzi (nr_comanda, data_comanda, id_client, data_livrarii, id_articol) values (14, '2020-01-05', 3, '2019-08-28', 123); 

INSERT INTO clienti (Nume, Prenume, Oras, Strada, nr) values ('Nicolaescu', 'Mihaita', 'Craiova', 'Calea bucuresti', 255);
INSERT INTO clienti (Nume, Prenume, Oras, Strada, nr) values ('Popescu', 'Ion', 'Craiova', 'Petrichovici', 45);
INSERT INTO clienti (Nume, Prenume, Oras, Strada, nr) values ('Barbu', 'Mariana', 'Filiasi', 'Zambilelor', 32);
INSERT INTO clienti (Nume, Prenume, Oras, Strada, nr) values ('Alexandrescu', 'Ioan', 'Bucuresti', 'Principala', 67);
INSERT INTO clienti (Nume, Prenume, Oras, Strada, nr) values ('Popovici', 'Mincu', 'Bucuresi', 'Cronom', 345);

INSERT INTO companie(Oras, nr_com) values ('Craiova', 987);
INSERT INTO companie(Oras, nr_com) values ('Filiasi', 1015);
INSERT INTO companie(Oras, nr_com) values ('Bucuresti', 1020);

INSERT INTO fabrici(id_fabrica, termen_liv, oras, strada, nr) values ('Daewo', 10, 'Craiova', 'Petrache Poenaru', 1);
INSERT INTO fabrici(id_fabrica, termen_liv, oras, strada, nr) values ('Sony', 9, 'Filiasi', 'Lalelelor', 255);
INSERT INTO fabrici(id_fabrica, termen_liv, oras, strada, nr) values ('Trust', 11, 'Craiova', 'Calea Bucuresti', 65);
INSERT INTO fabrici(id_fabrica, termen_liv, oras, strada, nr) values ('HyperX', 5, 'Bucuresti', 'Electroputere', 2567);

INSERT INTO articole(nr_com, cd_art, id_fabrica, pret, pret_total, denumire) values (1, 213, 'HyperX', 250.98, 270, 'Memorii ram');
INSERT INTO articole(nr_com, cd_art, id_fabrica, pret, pret_total, denumire) values (1023, 240, 'Sony', 300.00, 250, 'Casti');
INSERT INTO articole(nr_com, cd_art, id_fabrica, pret, pret_total, denumire) values (1005, 232, 'Marvo', 150.29, 189, 'Tastatura');
INSERT INTO articole(nr_com, cd_art, id_fabrica, pret, pret_total, denumire) values (1, 124, 'Lenovo', 1920.30, 2300, 'Laptop');
INSERT INTO articole(nr_com, cd_art, id_fabrica, pret, pret_total, denumire) values (1, 124, 'Lenovo', 1920.30, 2300, 'Legion Y530');
INSERT INTO articole(nr_com, cd_art, id_fabrica, pret, pret_total, denumire) values (1, 123, 'Lenovo', 1920.30, 2300, 'IdeaPad');

INSERT INTO stoc(id_fabrica, id_art) values (4,3);
INSERT INTO stoc(id_fabrica, id_art) values (1,3);
INSERT INTO stoc(id_fabrica, id_art) values (2,2);
INSERT INTO stoc(id_fabrica, id_art) values (3,5);

--Exemplul 1
SELECT * FROM clienti WHERE oras=(SELECT oras FROM clienti WHERE NUME='Nicolaescu');
--Exemplul 2
SELECT * FROM clienti WHERE oras=(SELECT oras FROM companie WHERE nr_com=1015);
--Exemplul 3
SELECT * FROM fabrici WHERE termen_liv < (SELECT termen_liv FROM fabrici WHERE id_fabrica='Daewo');
--Exemplul 4
SELECT nr_com, cd_art, id_fabrica, pret FROM articole WHERE PRET<ALL(SELECT pret FROM articole WHERE nr_com=1023);
--Exemplul 5
SELECT DISTINCT nr_com FROM articole WHERE pret_total > ANY(SELECT pret_total FROM articole WHERE nr_com=1005);
--Exemplul 6
SELECT cd_art, denumire FROM articole WHERE id_fabrica IN (SELECT id_fabrica FROM fabrici WHERE oras='Bucuresti');
--Exemplul 7
SELECT Nume, Prenume FROM clienti WHERE id NOT IN(SELECT id_client FROM comenzi);
--Exemplul 8
SELECT cd_art, denumire, id_fabrica FROM articole WHERE pret_total > (SELECT 10*MIN(PRET_TOTAL) FROM articole);
--Exemplul 9 
SELECT cd_art, denumire, id_fabrica FROM articole WHERE pret_total <(SELECT AVG(PRET_TOTAL) FROM articole);
--Exemplul 10
SELECT data_livrarii FROM comenzi a WHERE 10>(SELECT COUNT(*) FROM comenzi b WHERE b.data_livrarii>a.data_livrarii) AND data_livrarii IS NOT NULL ORDER BY data_livrarii;
--Exemplul 11
SELECT nr_comanda FROM comenzi c WHERE 3<(SELECT COUNT(*) FROM articole a WHERE c.id = a.nr_com);
--Exemplu 12
SELECT * FROM comenzi c WHERE 'IdeaPad'=(SELECT denumire FROM articole a WHERE c.id_articol=a.cd_art);
--Exemplu 13
SELECT id, denumire FROM titlu t WHERE EXISTS(SELECT * FROM salariati s WHERE t.id = s.id_titlu);
--Exemplul 14
SELECT id, denumire FROM titlu t WHERE NOT  EXISTS(SELECT * FROM salariati s WHERE t.id=s.id_titlu);
--Exemplu 15
SELECT cd_art, id_fabrica FROM articole p WHERE NOT EXISTS(SELECT id, id_fabrica FROM articole a WHERE p.cd_art = a.id AND p.id_fabrica=a.id_fabrica);
--Exemplu 16
SELECT nr_com FROM articole WHERE pret_total>(SELECT max(pret_total) FROM articole WHERE nr_com = 1023);
--Exemplu 17
SELECT c.nr_comanda FROM comenzi c, articole a WHERE c.nr_comanda = a.nr_com AND pret_total=(SELECT AVG(pret_total) FROM articole WHERE c.nr_comanda=a.nr_com);

--Exemplul 18
SELECT DISTINCT nr_com FROM articole WHERE pret_total> ANY(SELECT pret_total FROM articole WHERE nr_com = 1023);
--Exemplul 19
SELECT DISTINCT nr_com FROM articole WHERE pret_total >(SELECT MIN(pret_total) FROM articole WHERE nr_com=1023);
--Exemplul 20
SELECT nume, prenume, nr_comanda FROM clienti, comenzi WHERE clienti.id=comenzi.id_client;
--Exemplul 21
SELECT a.id_fabrica, b.id_fabrica, c.id_fabrica, c.id_art FROM stoc a, stoc b, stoc c WHERE a.id_art = b.id_art AND a.id_art = c.id_art AND a.id_fabrica<b.id_fabrica AND a.id_art=c.id_art ORDER BY id_art;
--Exemplul 22
SELECT x.nume_client, x.data_comanda FROM emitere_comenzi x WHERE 1<(SELECT COUNT(id) FROM emitere_comenzi y WHERE x.nume_client = y.nume_client);
---EXERCITI---
--1
SELECT * FROM catalog_ WHERE NrLeg=(SELECT NrLeg FROM studenti WHERE Nume = 'Popescu' AND grupa='222');
--2
SELECT * FROM catalog_ WHERE NrLeg>(SELECT NrLeg FROM studenti WHERE Nume = 'Popescu' AND Grupa='222')
--3
SELECT S.NrLeg, S.Nume +' '+S.Prenume Student,Grupa, cod_disciplina, Nota FROM studenti as S, catalog_ as N WHERE S.NrLeg=N.NrLeg AND S.NrLeg=(SELECT N1.NrLeg FROM catalog_ N1, Discipline D WHERE N1.cod_disciplina=D.cod_disciplina AND D.cod_disciplina>3);
--4
SELECT S.NrLeg, S.Nume +' '+S.Prenume Student,Grupa, cod_disciplina, Nota FROM studenti as S, catalog_ as C WHERE S.NrLeg=C.NrLeg AND S.NrLeg = ANY (SELECT N1.NrLeg FROM catalog_ N1, Discipline D WHERE N1.cod_disciplina=D.cod_disciplina AND D.cod_disciplina>3);
--5
SELECT S.NrLeg, S.Nume +' '+S.Prenume Student,Grupa, cod_disciplina, Nota FROM studenti as S, catalog_ as N WHERE S.NrLeg=N.NrLeg AND S.NrLeg > any (SELECT N1.NrLeg FROM catalog_ N1, Discipline D WHERE N1.cod_disciplina=D.cod_disciplina AND D.cod_disciplina>3);
--6
SELECT S.NrLeg, S.Nume +' '+S.Prenume Student,Grupa, cod_disciplina, Nota FROM studenti as S, catalog_ as C WHERE S.NrLeg=C.NrLeg AND EXISTS (SELECT N1.NrLeg FROM catalog_ N1, Discipline D WHERE N1.cod_disciplina=D.cod_disciplina AND D.cod_disciplina>3);
--7
SELECT S.NrLeg, S.Nume +' '+S.Prenume Student,Grupa, cod_disciplina, Nota FROM studenti as S, catalog_ as C WHERE S.NrLeg=C.NrLeg AND EXISTS (SELECT N1.NrLeg FROM catalog_ N1, Discipline D WHERE N1.cod_disciplina=D.cod_disciplina AND D.cod_disciplina>8);
--8
SELECT S.NrLeg, S.Nume +' '+S.Prenume Student,Grupa, cod_disciplina, Nota FROM studenti as S, catalog_ as C WHERE S.NrLeg=C.NrLeg AND S.NrLeg <> ALL (SELECT N1.NrLeg FROM catalog_ N1, Discipline D WHERE N1.cod_disciplina=D.cod_disciplina AND D.cod_disciplina>3);