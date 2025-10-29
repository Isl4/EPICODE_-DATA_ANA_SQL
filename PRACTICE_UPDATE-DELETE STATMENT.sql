/* Uno store è collocato in una precisa area geografica.

In unʼarea geografica possono essere collocati store diversi.

 1.Crea una tabella Store per la gestione degli store ID, nome, data apertura, ecc.)
2.Crea una tabella Region per la gestione delle aree geografiche ID, città, regione, area geografica, …)
3. Popola le tabelle con pochi record esemplificativi Esegui operazioni di aggiornamento
4.modifica ed eliminazione record*/
CREATE DATABASE STORE;
USE STORE;

CREATE TABLE store (
StoreID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Name_store VARCHAR (25),
Opening_date DATE NOT NULL 
);

INSERT INTO store (Name_store,Opening_date)
VALUES ('ZARA','2010-10-10'),('H&M','2011-12-01'),('NorthF','2012-09-10'),('Bershka','2013-03-10');

SELECT * FROM store;


CREATE TABLE Region (
Geografic_Area INT PRIMARY KEY,
StoreID INT NOT NULL,
City VARCHAR (25),
Region VARCHAR (25),
FOREIGN KEY (StoreID) REFERENCES store(StoreID)
);

INSERT INTO Region (Geografic_Area,StoreID,City,Region)
VALUES ('101','1','ZURICH','SWZ'),('102','2','PARIS','FR'),('103','3','LONDON','GB'),('104','4','AMESTERDAM','NL');

SELECT * FROM store;
SELECT * FROM Region;

START TRANSACTION;
UPDATE store 
SET Opening_date= '2015-04-01'
WHERE storeID= 4;
COMMIT;

SELECT * FROM store;

SELECT S.StoreID, S.Name_store, S.Opening_date, R. Geografic_Area,R.City, R.Region
FROM store AS S JOIN Region AS R ON S.StoreID=R.StoreID;

ALTER TABLE store CHANGE Name_store Store_Name VARCHAR(25);

SELECT S.StoreID, S.Store_Name, S.Opening_date, R. Geografic_Area,R.City, R.Region
FROM store AS S JOIN Region AS R ON S.StoreID=R.StoreID;

BEGIN;
START TRANSACTION;
DELETE FROM Region WHERE Geografic_Area= 104;
SELECT * FROM Region;
ROLLBACK;
SELECT * FROM Region;

