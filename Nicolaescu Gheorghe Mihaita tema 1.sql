/*Crearea si introducerea datelor in baza de date  */
create table Sectii(
	IdSectie int primary key,
	Nume varchar(20) not null,
	Buget int not null
);

create table Angajati(
	IdAngajat int primary key,
	Nume varchar(20) not null,
	Prenume varchar(50) not null,
	DataNasterii date not null,
	Adresa varchar(20) not null,
	Functie varchar(25) not null,
	Salariu int not null,
	IdSectie int not null
);

create table Furnizori(
	IdFurnizor int primary key,
	Nume varchar(20) not null,
	Prenume varchar(30) not null,
	Adresa varchar(50) not null
);

create table Clienti(
	IdClient int primary key,
	Nume varchar(20) not null,
	Prenume varchar(30) not null,
	Adresa varchar(50) not null
);

create table Produse(
	IdProdus int primary key,
	Denumire varchar(20) not null,
	Descriere varchar(50) not null,
);

create table Componente(
	IdComponenta int primary key,
	Denumire varchar(20) not null,
	Descriere varchar(50) not null,
);

create table Dependenti(
	IdAngajat int ,
	Nume varchar(20) primary key not null,
	Prenume varchar(30) not null,
	DataNasterii date not null,
	GradRudenie varchar(20) not null
);

create table Ingineri(
	IdAngajat int primary key not null,
	Specialitate varchar(20) not null,
);

create table Secretare(
	IdAngajat int primary key not null,
	VitezaRedactare int not null,
);

create table Achizitii(
	IdAchizitie int primary key,
	IdAchizitor int not null,
	IdFurnizor int not null,
	IdComponenta int not null,
	Data date not null,
	NrComponente int not null,
	PretUnitar float not null,
	IdAngajat int not null
);

create table Compozitii(
	NrComponente int not null,
	IdComponenta int not null,
	IdProdus int not null
);

create table Vanzari(
	IdVanzare int primary key,
	IdVanzator int not null,
	IdProdus int not null,
	IdClient int not null,
	Data date not null,
	NrProduse int not null,
	IdAngajat int not null
);

create table Activitati(
	IdProiect int not null,
	IdAngajat int not null,
	Ore int not null,
);

create table Proiecte(
	IdProiect int primary key,
	Denumire varchar(50) not null,
	Termen date not null,
	Buget int not null
);


insert into sectii values(1,'Productie',500000);
insert into sectii values(2,'Motoare',10000000);
insert into sectii values(3,'Caroserie',750000);
insert into sectii values(4,'Asamblare',1250000);
insert into sectii values(5,'Testare',400000);

INSERT INTO angajati VALUES (1,'Popa','Mihai','10/02/1990','Craiova', 'Tester', 1500,1);
INSERT INTO angajati VALUES (2,'Popescu','Andrei','02/10/1990','Bucuresti', 'Programator', 1700,2);
INSERT INTO angajati VALUES (3, 'Ilie', 'Mihai', '10/02/1987', 'Ploiesti', 'Tester', 2100, 3);
INSERT INTO angajati VALUES (4,'Mihai','Daniel','1989/12/21','Craiova', 'Muncitor', 1950,4);
INSERT INTO angajati VALUES (5,'Ion','Razvan','1985/07/10','Bucuresti', 'Programator', 2250,5);
INSERT INTO angajati VALUES (6,'Dumitru','Ion','1970/01/01','Brasov', 'Tester', 2500,1);
INSERT INTO angajati VALUES (7,'Dinu','Andrei','02/10/1989','Timisoara', 'Tester', 1800,2);
INSERT INTO angajati VALUES (8,'Andrei','Alin','12/05/1987','Bucuresti', 'Programator', 2300,3);
INSERT INTO angajati VALUES (9,'Mihalcea','Daniela','1989/12/21','Craiova', 'Tester', 2150,4);
INSERT INTO angajati VALUES (10,'Mihnea','Razvy','1989/12/21','Brasov', 'Muncitor', 1550,5);
INSERT INTO angajati VALUES (11,'Mitatu','Robert','1989/12/21','Craiova', 'Muncitor', 60000,5);

insert into furnizori values(1, 'Popescu', 'Razvan', 'Craiova');
insert into furnizori values(2, 'Danescu', 'Ovidiu', 'Constanta');
insert into furnizori values(3, 'Dancioiu', 'Andrei', 'Bucuresti');
insert into furnizori values(4, 'Popa', 'Alin', 'Pitesti');

insert into Clienti values(1,'Alexandru','Lucian','Slatina');
insert into Clienti values(2,'Stefran','Marian','Bucuresti');
insert into Clienti values(3,'Andrei','Mihai','Rimisoara');
insert into Clienti values(4,'Lia','Virgy','Gorj');
insert into Clienti values(5,'Alexandru','Maria','Bucuresti');
insert into Clienti values(6,'Stefan','Ioana','Iasi');
insert into Clienti values(7,'Andrei','Alexa','Craiova');
insert into Clienti values(8,'Mihai','Andreea','Timisoara');
insert into Clienti values(9,'Liviu','Ics','Valcea');
insert into Clienti values(10,'Popa','Andrei','Constanta');
insert into Clienti values(11,'Marinescu','Ion','Bucuresti');


insert into produse values(1,'Monitor','ecran 15 inch');
insert into produse values(2,'Tastatura','---');
insert into produse values(3,'Mouse','---');
insert into produse values(4,'Unitate','---');
insert into produse values(5,'Sistem audio','---');

insert into componente values(1,'rezistenta','rezistenta de caldura');
insert into componente values(2,'condensator','disp. electric');
insert into componente values(3,'tranzistor','-------');
insert into componente values(4,'circuit integrat','-------');
insert into componente values(5,'termistor','--?---');

insert into dependenti values (10,'Andrei','Costinela','12/15/1989','fiica');
insert into dependenti values (8,'Boboc','Laura','05/17/1989','nepoata');
insert into dependenti values (6,'Rat','Andrey','05/12/1988','unchi');
insert into dependenti values (4,'Mirelus','Iulian','11/11/1969','strabunic');
insert into dependenti values (2,'Gheorghe','Constantin','01/01/1980','var');
insert into dependenti values (3,'Popescu','Ion','03/02/1980','fiu');

insert into ingineri values (5, 'electronica');
insert into ingineri values (4, 'mecanica');
insert into ingineri values (3, 'elecrotehnica');
insert into ingineri values (2, 'chimie');
insert into ingineri values (1, 'informatica');

insert into secretare values (9, 250);
insert into secretare values (8, 270);
insert into secretare values (7, 290);
insert into secretare values (6, 200);
insert into secretare values (10, 150);

insert into achizitii values (1, 1, 1, 1, '01/01/2010', 100, 5, 8);
insert into achizitii values (2, 2, 2, 2, '01/01/2010', 200, 7, 9);
insert into achizitii values (3, 3, 3, 3, '01/01/2010', 300, 4, 5);
insert into achizitii values (4, 4, 4, 4, '01/01/2010', 400, 6, 1);
insert into achizitii values (5, 5, 3, 5, '01/01/2010', 400, 5, 6);

insert into Compozitii values(30,1,2);
insert into Compozitii values(20,2,3);
insert into Compozitii values(10,3,5);
insert into Compozitii values(40,4,4);
insert into Compozitii values(50,5,1);

insert into vanzari values(1,1,1,1,'01/01/2010',10,3);
insert into vanzari values(2,1,2,7,'01/01/2010',20,3);
insert into vanzari values(3,1,3,9,'01/01/2010',30,3);
insert into vanzari values(4,1,4,4,'01/01/2010',40,3);
insert into vanzari values(5,1,5,6,'01/01/2010',50,3);
insert into vanzari values(6,1,5,11,'01/01/2010',50,3);

insert into Proiecte values(1,'Sistem de achizitie de date','12/01/2010',5000);
insert into Proiecte values(2,'Modul 2','07/07/2010',4500);
insert into Proiecte values(3,'Modul 3','10/01/2010',7000);
insert into Proiecte values(4,'Modul 4','09/03/2010',9000);
insert into Proiecte values(5,'Modul 5','05/09/2010',2500);

insert into activitati values(1,1,5);
insert into activitati values(2,3,5);
insert into activitati values(3,5,5);
insert into activitati values(4,7,5);
insert into activitati values(5,9,5);

--=============Rezolvari exerciti laborator==========
--3.1 
SELECT Nume, Prenume FROM Furnizori WHERE Adresa = 'Bucuresti' UNION SELECT Nume, Prenume FROM Clienti WHERE Adresa = 'Bucuresti';
--3.2 
SELECT * FROM Sectii, Angajati;
--3.3 
SELECT Nume,Prenume FROM Furnizori WHERE Furnizori.IdFurnizor in(SELECT IdFurnizor FROM Achizitii WHERE NrComponente >= 200); 
--3.4 
SELECT Nume,Prenume FROM Angajati WHERE Angajati.IdAngajat in(SELECT IdAchizitor FROM Achizitii WHERE IdComponenta = 2); 
--3.5 
SELECT Nume,Prenume,Adresa FROM Furnizori WHERE Furnizori.IdFurnizor in(SELECT IdAchizitor FROM Achizitii WHERE IdComponenta = 1); 
--3.6 
SELECT Nume,Prenume,Adresa FROM Furnizori WHERE Furnizori.IdFurnizor in(SELECT IdAchizitor FROM Achizitii WHERE IdComponenta = 2 and NrComponente >= 150);
--3.7 
SELECT Nume,Prenume,Adresa FROM Clienti WHERE Clienti.IdClient in(SELECT IdVanzare FROM Vanzari WHERE IdProdus = 1 and NrProduse >= 10); 
--3.8 
SELECT Nume,Prenume,Adresa FROM Angajati WHERE Angajati.IdAngajat in(SELECT IdVanzator FROM Vanzari WHERE IdProdus = 1); 
--3.9 
SELECT Nume,Prenume,DataNasterii FROM Angajati WHERE Angajati.IdAngajat in(SELECT IdAngajat FROM Activitati WHERE IdProiect = 1); 
--3.10 
SELECT Sectii.Nume FROM Sectii, Angajati,Proiecte,Activitati WHERE (Angajati.IdAngajat = Activitati.IdAngajat) AND (Activitati.IdProiect = Proiecte.IdProiect) AND (Proiecte.Denumire = 'Sistem de achizitie de date') AND (Angajati.IdSectie = Sectii.IdSectie);
--3.11 
SELECT Nume, Prenume, DataNasterii FROM Angajati, Ingineri WHERE (Angajati.IdAngajat = Ingineri.IdAngajat) AND (Ingineri.Specialitate = 'electronica');
--3.12 
SELECT Angajati.Nume, Angajati.Prenume FROM Angajati, Dependenti, Sectii WHERE (Angajati.IdAngajat = Dependenti.IdAngajat) AND (Sectii.Nume = 'Productie') AND (Dependenti.Prenume = 'Ion') AND (Dependenti.GradRudenie='fiu');
--3.13 
SELECT Angajati.Nume, Angajati.Prenume FROM Angajati, Ingineri, Sectii WHERE (Ingineri.IdAngajat = Angajati.IdAngajat) AND (Sectii.Nume = 'Productie') AND (Angajati.IdSectie = Sectii.IdSectie);
--3.14 
SELECT Angajati.Nume, Angajati.Prenume FROM Angajati, Furnizori, Achizitii WHERE (Furnizori.Nume = 'Popescu' AND Furnizori.Prenume = 'Razvan') AND (Furnizori.IdFurnizor = Achizitii.IdFurnizor) AND (Angajati.IdAngajat = Achizitii.IdAchizitor); 
--3.15 
SELECT Angajati.Nume, Angajati.Prenume FROM Angajati, Clienti, Vanzari WHERE (Clienti.Nume = 'Marinescu' AND Clienti.Prenume = 'Ion') AND (Clienti.IdClient = Vanzari.IdClient) AND (Angajati.IdAngajat = Vanzari.IdVanzator); 
--3.16 
SELECT Produse.Denumire FROM Produse, Furnizori, Compozitii, Achizitii WHERE (Furnizori.Nume = 'Danescu' AND Furnizori.Prenume = 'Ovidiu') AND (Furnizori.IdFurnizor = Achizitii.IdFurnizor) AND (Compozitii.IdComponenta = Achizitii.IdComponenta) AND (Compozitii.IdProdus = Produse.IdProdus) ;
--Exercitiul 17 am realizat ca este identic cu 16.