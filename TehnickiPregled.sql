CREATE TABLE POLISE_OSIGURANJA(
 broj_polise VARCHAR2(15),
 id_zaposlenog NUMBER(15) NOT NULL,
 broj_sasije VARCHAR2(20) NOT NULL,
 jmbg_stranke NUMBER(13) NOT NULL,
 pocetak_osiguranja DATE NOT NULL,
 istek_osiguranja DATE NOT NULL,
 premijski_stepen NUMBER(3) NOT NULL,
 CONSTRAINT pk_polise PRIMARY KEY(broj_polise),
 CONSTRAINT fk_id_zaposlenog_polise FOREIGN KEY (id_zaposlenog) REFERENCES ZAPOSLENI(id_zaposlenog),
 CONSTRAINT fk_broj_sasije_jmbg_polise FOREIGN KEY (broj_sasije,jmbg_stranke) REFERENCES VOZILA(broj_sasije,jmbg_stranke)
);
CREATE TABLE ZAPOSLENI(
 id_zaposlenog NUMBER(10) PRIMARY KEY,
 prezime VARCHAR2(30) NOT NULL,
 ime VARCHAR2(30) NOT NULL,
 broj_telefona VARCHAR2(15) NOT NULL,
 adresa VARCHAR2(40) NOT NULL,
 email VARCHAR2(64)
);
CREATE TABLE TEHNICKI_PREGLEDI_VOZILA(
 datum_pregleda DATE,
 vreme_pregleda VARCHAR2(10),
 broj_sasije VARCHAR2(20),
 jmbg_stranke NUMBER(13),
 id_zaposlenog NUMBER(10),
 ispravnost VARCHAR2(50) NOT NULL,
 cena NUMBER(10,2) NOT NULL,
 CONSTRAINT pk_pregled PRIMARY KEY(datum_pregleda,vreme_pregleda,broj_sasije,jmbg_stranke,id_zaposlenog),
 CONSTRAINT fk_pregled_vozila FOREIGN KEY(broj_sasije, jmbg_stranke) REFERENCES VOZILA(broj_sasije,jmbg_stranke),
 CONSTRAINT fk_zaposlenog FOREIGN KEY(id_zaposlenog) REFERENCES ZAPOSLENI(id_zaposlenog)
);
CREATE TABLE STRANKE(
 jmbg NUMBER(13) PRIMARY KEY,
 prezime VARCHAR2(30) NOT NULL,
 ime VARCHAR2(30) NOT NULL,
 datum_rodjenja DATE NOT NULL,
 pol VARCHAR2(10) NOT NULL,
 broj_licne_karte NUMBER(9) NOT NULL,
 broj_telefona VARCHAR2(15) NOT NULL,
 email VARCHAR2(64)
);
CREATE TABLE VRSTE(
 sifra NUMBER(15) PRIMARY KEY,
 naziv VARCHAR2(30) NOT NULL
);
CREATE TABLE VOZILA(
 broj_sasije VARCHAR2(20),
 jmbg_stranke NUMBER(13),
 sifra_vrste NUMBER(15) NOT NULL,
 marka VARCHAR2(25) NOT NULL,
 registarska_oznaka VARCHAR2(10) NOT NULL,
 datum_prve_registacije DATE NOT NULL,
 masa NUMBER(10,2) NOT NULL,
 nosivost NUMBER(10) NOT NULL,
 snaga NUMBER(10) NOT NULL,
 kubikaza NUMBER(8,2) NOT NULL,
 boja VARCHAR2(25) NOT NULL,
 broj_mesta NUMBER(2) NOT NULL,
 broj_motora VARCHAR2(25) NOT NULL,
 godiste NUMBER(4) NOT NULL,
 predjena_kilometraza NUMBER(13,2),
 CONSTRAINT pk_vozila PRIMARY KEY(broj_sasije, jmbg_stranke),
 CONSTRAINT fk_jmbg_stranke_vozila FOREIGN KEY(jmbg_stranke) REFERENCES STRANKE(jmbg),
 CONSTRAINT fk_sifra_vrste_vozila FOREIGN KEY(sifra_vrste) REFERENCES VRSTE(sifra)
);
---------------------unos podataka
INSERT INTO VRSTE VALUES(1,'Limuzina(sedan)');
INSERT INTO VRSTE VALUES(2,'Pickup');
INSERT INTO VRSTE VALUES(3,'Dzip/SUV');
INSERT INTO VRSTE VALUES(4,'Monovolumen(miniven)');
INSERT INTO VRSTE VALUES(5,'Kabriolet/roadster');
INSERT INTO VRSTE VALUES(6,'Kupe');
INSERT INTO VRSTE VALUES(7,'karavan');
INSERT INTO VRSTE VALUES(8,'Hecbek');

INSERT INTO STRANKE
VALUES(1708997720017,'Vuković','Marija','08/17/1997','žensko',784215963,'0616745839','');
INSERT INTO STRANKE
VALUES(2105990860034,'Đorđević','Ivan','05/21/1990','muško',236485179,'0649247581','ivandjordjevic90@gmail.com');
INSERT INTO STRANKE
VALUES(0602010600014,'Stojanović','Ana','02/06/2001','žensko',609287354,'0615832461','stojanovicana01@gmail.com');
INSERT INTO STRANKE
VALUES(2202929500009,'Nikolić','Nikola','02/22/1995','muško',482967135,'0603618479','nikolanikolic95@gmail.com');
INSERT INTO STRANKE
VALUES(2709997400015,'Janković','Jovana','09/27/1974','žensko',357692148,'0648149253','');
INSERT INTO STRANKE
VALUES(1803879400004,'Milenković','Marko','03/18/1987','muško',821754963,'0613925167','');
INSERT INTO STRANKE
VALUES(0107999760002,'Popović','Milica','07/01/1999','žensko',163574892,'0604753216','milicapopovic99@gmail.com');
INSERT INTO STRANKE
VALUES(1402941680032,'Simić','Dušan','02/14/1994','muško',295813476,'0601967832','dusansimic94@gmail.com');
INSERT INTO STRANKE
VALUES(0709987360035,'Radulović','Katarina','09/07/1987','žensko',674821935,'0618543769','');
INSERT INTO STRANKE
VALUES(3105001360037,'Mladenović','Aleksandar','05/31/2000','muško',738942615,'0643278561','aleksandarmladenovic00@gmail.com');

INSERT INTO VOZILA VALUES ('VF3XUHRYMJM123456', 1708997720017, 8, 'Peugeot 307', 'NI-0311-FG', '06/25/2016', 1100, 600, 65, 1199, 'Siva', 5, 'E6T9K1N7P2', 2016, 90000);
INSERT INTO VOZILA VALUES ('WBAGN832005E54963', 2105990860034, 3, 'BMW X3', 'BG-4321-DC', '10/18/2018', 1850, 650, 220, 2993, 'Plava', 5, 'G2F5D1H7R9', 2018, 35000);
INSERT INTO VOZILA VALUES ('WBAJC510200B12345', 0602010600014, 1, 'BMW G22', 'BG-3399-EE', '12/05/2019', 1650, 750, 150, 1995, 'Bela', 5, 'Q3D6M9K5R8', 2019, 15000);
INSERT INTO VOZILA VALUES ('XLWDR123456789012', 2202929500009, 1, 'Toyota Avensis', 'NS-5678-AB', '03/12/2015', 1250, 850, 85, 1598, 'Crvena', 5, 'Z7B5J3L8F9', 2015, 75000);
INSERT INTO VOZILA VALUES ('YV1FW848810123456', 2709997400015, 1, 'Volvo S60', 'BG-2345-GH', '08/21/2017', 1350, 900, 120, 1969, 'Braon', 5, 'P4N8T6D3H2', 2017, 55000);
INSERT INTO VOZILA VALUES ('JH2SC5741CM308901', 1803879400004, 6, 'Honda Accord Coupe', 'BG-1224-CD', '06/05/2012', 1050, 600, 70, 1247, 'Crna', 4, 'K5R7L9Q2S1', 2012, 100000);
INSERT INTO VOZILA VALUES ('VF1FC0L0500012345', 0107999760002, 8, 'Renault 308', 'BG-3456-EF', '02/14/2014', 950, 500, 55, 1149, 'Plava', 5, 'B2F6GJ8D7M', 2014, 95000);
INSERT INTO VOZILA VALUES ('WDD2130042A123456', 1402941680032, 1, 'Mercedes-Benz E-class', 'BG-6789-FG', '01/08/2019', 1950, 850, 200, 2996, 'Crna', 5, 'X9C5VJ3K1T', 2019, 20000);
INSERT INTO VOZILA VALUES ('JTEBU5JR0F5201234', 0709987360035, 3, 'BMW X7', 'NI-4321-GH', '10/11/2015', 1800, 1000, 270, 3956, 'Bela', 7, 'D4N7YF6H9L', 2015, 85000);
INSERT INTO VOZILA VALUES ('WAUZZZ8K5AA123456', 3105001360037, 3, 'Audi A4', 'BG-9876-DC','05/01/2012', 1850, 700, 200, 2000, 'Bela', 5, 'R6H8JN5E72', 2012, 135000);


INSERT INTO POLISE_OSIGURANJA VALUES('P21578', 8, 'VF3XUHRYMJM123456', 1708997720017, '02/20/2022', '02/20/2023', 2);
INSERT INTO POLISE_OSIGURANJA VALUES('P10342', 1, 'WBAGN832005E54963', 2105990860034, '03/10/2022', '03/10/2023', 1);
INSERT INTO POLISE_OSIGURANJA VALUES('P51934', 6, 'WBAJC510200B12345', 0602010600014, '04/01/2022', '04/01/2023', 1);
INSERT INTO POLISE_OSIGURANJA VALUES('P78965', 3, 'XLWDR123456789012', 2202929500009, '05/05/2022', '05/05/2023', 1);
INSERT INTO POLISE_OSIGURANJA VALUES('P43215', 4, 'YV1FW848810123456', 2709997400015, '05/01/2022', '05/01/2023', 2);
INSERT INTO POLISE_OSIGURANJA VALUES('P77892', 5, 'JH2SC5741CM308901', 1803879400004, '06/15/2022', '06/15/2023', 3);
INSERT INTO POLISE_OSIGURANJA VALUES('P95123', 9, 'VF1FC0L0500012345', 0107999760002, '07/10/2022', '07/10/2023', 3);
INSERT INTO POLISE_OSIGURANJA VALUES('P36105', 2, 'WDD2130042A123456', 1402941680032, '08/01/2022', '08/01/2023', 2);
INSERT INTO POLISE_OSIGURANJA VALUES('P43251', 10, 'JTEBU5JR0F5201234', 0709987360035, '09/12/2022', '09/12/2023', 3);
INSERT INTO POLISE_OSIGURANJA VALUES('P27654', 7, 'WAUZZZ8K5AA123456', 3105001360037, '10/01/2022', '10/01/2023', 2);

INSERT INTO ZAPOSLENI VALUES (1, 'Janković', 'Nikola', '0632345673', 'Bulevar Kralja Aleksandra 27, Beograd', 'nikolajankovic23@gmail.com');
INSERT INTO ZAPOSLENI VALUES (2, 'Ilić', 'Ana', '0647890125', 'Kralja Petra I 28, Novi Sad', 'anailic32@gmail.com');
INSERT INTO ZAPOSLENI VALUES (3, 'Kovačević', 'Marko', '0612345675', 'Mileve Maric 2, Novi Beograd', 'markokovacevic45@gmail.com');
INSERT INTO ZAPOSLENI VALUES (4, 'Petrović', 'Jelena', '0653456782', 'Svetogorska 5, Kragujevac', 'jelenapetrovic321@gmail.com');
INSERT INTO ZAPOSLENI VALUES (5, 'Popović', 'Milan', '0627890123', 'Bulevar Mihajla Pupina 23, Zrenjanin', 'milanpopovic31@gmail.com');
INSERT INTO ZAPOSLENI VALUES (6, 'Đurić', 'Ivana', '0641234566', 'Kneza Miloša 1, Niš', 'ivanadjuric32@gmail.com');
INSERT INTO ZAPOSLENI VALUES (7, 'Stanković', 'Petar', '0614567897', 'Narodnog fronta 12, Kraljevo', 'petarstankovic09@gmail.com');
INSERT INTO ZAPOSLENI VALUES (8, 'Milić', 'Sara', '0657890123', 'Cara Dušana 32, Subotica', 'saramilic54@gmail.com');
INSERT INTO ZAPOSLENI VALUES (9, 'Kostić', 'Nina', '0623456781', 'Karađorđeva 8, Čačak', 'ninakostic65@gmail.com');
INSERT INTO ZAPOSLENI VALUES (10, 'Stojanović', 'Nikolina', '0649012340', 'Vuka Karadžića 3, Sombor', 'nikolinastojanovic32@gmail.com');

INSERT INTO TEHNICKI_PREGLEDI_VOZILA VALUES ('01/04/2023', '09:15', 'XLWDR123456789012', 2202929500009, 3, 'Prošao', 35000);
INSERT INTO TEHNICKI_PREGLEDI_VOZILA VALUES ('05/08/2022', '14:30', 'JTEBU5JR0F5201234', 0709987360035, 10, 'Prošao', 45000);
INSERT INTO TEHNICKI_PREGLEDI_VOZILA VALUES ('01/12/2021', '10:00', 'WAUZZZ8K5AA123456', 3105001360037, 7, 'Prošao', 40000);
INSERT INTO TEHNICKI_PREGLEDI_VOZILA VALUES ('12/07/2022', '11:45', 'JH2SC5741CM308901', 1803879400004, 5, 'Prošao', 25000);
INSERT INTO TEHNICKI_PREGLEDI_VOZILA VALUES ('02/21/2023', '08:00', 'VF3XUHRYMJM123456', 1708997720017, 8, 'Prošao', 30000);
INSERT INTO TEHNICKI_PREGLEDI_VOZILA VALUES ('10/06/2021', '15:00', 'WBAJC510200B12345', 0602010600014, 6, 'Nije prošao', 22000);
INSERT INTO TEHNICKI_PREGLEDI_VOZILA VALUES ('07/21/2022', '12:15', 'WDD2130042A123456', 1402941680032, 2, 'Prošao', 50000);
INSERT INTO TEHNICKI_PREGLEDI_VOZILA VALUES ('04/22/2023', '10:30', 'VF1FC0L0500012345', 0107999760002, 9, 'Prošao', 20000);
INSERT INTO TEHNICKI_PREGLEDI_VOZILA VALUES ('11/25/2022', '13:00', 'YV1FW848810123456', 2709997400015, 4, 'Prošao', 35000);
INSERT INTO TEHNICKI_PREGLEDI_VOZILA VALUES ('07/09/2021', '08:45', 'WBAGN832005E54963', 2105990860034, 1, 'Nije prošao', 22000);
---------trigeri---------
ALTER TABLE VOZILA
ADD broj_telefona VARCHAR2(15);

UPDATE VOZILA SET broj_telefona = (
  SELECT broj_telefona
  FROM STRANKE
  WHERE VOZILA.jmbg_stranke = STRANKE.jmbg
);

ALTER TABLE VOZILA
MODIFY broj_telefona NOT NULL

------------triger1------

CREATE or REPLACE TRIGGER update_broj_telefona_stranke
AFTER UPDATE OF broj_telefona ON STRANKE
FOR EACH ROW
DECLARE
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    EXECUTE IMMEDIATE 'ALTER TRIGGER update_insert_broj_telefona_vozila DISABLE';
    EXECUTE IMMEDIATE 'ALTER TRIGGER zabrana_azuriranja_broja_telefona_vozila DISABLE';
    UPDATE VOZILA
    SET broj_telefona = :NEW.broj_telefona
    WHERE jmbg_stranke = :NEW.jmbg;
    EXECUTE IMMEDIATE 'ALTER TRIGGER update_insert_broj_telefona_vozila ENABLE';
    EXECUTE IMMEDIATE 'ALTER TRIGGER zabrana_azuriranja_broja_telefona_vozila ENABLE';
    COMMIT;
END;
-------test1---------
UPDATE STRANKE
SET broj_telefona='0616387034'
WHERE jmbg=1708997720017;
------------triger2----
CREATE OR REPLACE TRIGGER update_insert_broj_telefona_vozila
BEFORE INSERT OR UPDATE ON VOZILA
FOR EACH ROW
DECLARE priv VARCHAR2(30);
BEGIN
 SELECT broj_telefona INTO priv
 FROM STRANKE
 WHERE jmbg=:NEW.jmbg_stranke;
 :NEW.broj_telefona:=priv;
END;
-------test2--------
INSERT INTO VOZILA VALUES ('WDC2050041R024729', 2105990860034, 6, 'Mercedes-Benz', 'CA-1234-AB', '03/10/2015', 2200, 180, 136, 2143, 'Crna', 4, 'EQ738A14DS', 2015, 120000,'');	

UPDATE VOZILA
SET jmbg_stranke=1803879400004
WHERE broj_sasije='WDC2050041R024729';

---------triger3-------
CREATE OR REPLACE TRIGGER zabrana_azuriranja_broja_telefona_vozila
BEFORE UPDATE OF broj_telefona ON VOZILA
FOR EACH ROW
BEGIN
RAISE_APPLICATION_ERROR (-20002,'Azuriranje kolone broj_telefona u tabeli VOZILA nije dozvoljeno!');
END;
--------test3---------
UPDATE VOZILA
SET broj_telefona ='0633044823'
WHERE jmbg_stranke=1803879400004
----------------------
ALTER TABLE POLISE_OSIGURANJA
ADD prezime VARCHAR2(30)

UPDATE POLISE_OSIGURANJA SET prezime =(
 SELECT prezime
 FROM ZAPOSLENI
 WHERE polise_osiguranja.id_zaposlenog=zaposleni.id_zaposlenog
)

ALTER TABLE POLISE_OSIGURANJA
MODIFY prezime NOT NULL

-------triger4-----
CREATE OR REPLACE TRIGGER prezime_zaposlni_update
AFTER UPDATE OF prezime ON ZAPOSLENI
FOR EACH ROW
DECLARE PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
EXECUTE IMMEDIATE 'ALTER TRIGGER polise_osiguranja_insert_update DISABLE';
EXECUTE IMMEDIATE 'ALTER TRIGGER zabrana_azuriranja_prezime_polise_osiguranja DISABLE';
 UPDATE POLISE_OSIGURANJA
 SET prezime=:NEW.prezime
 WHERE id_zaposlenog=:NEW.id_zaposlenog;
 EXECUTE IMMEDIATE 'ALTER TRIGGER polise_osiguranja_insert_update ENABLE';
 EXECUTE IMMEDIATE 'ALTER TRIGGER zabrana_azuriranja_prezime_polise_osiguranja ENABLE';
END;
-------test4-------
UPDATE ZAPOSLENI
SET prezime='Marijanovic'
WHERE id_zaposlenog=3;
------triger5------
CREATE OR REPLACE TRIGGER polise_osiguranja_insert_update
BEFORE INSERT OR UPDATE ON POLISE_OSIGURANJA
FOR EACH ROW
DECLARE priv VARCHAR2(30);
BEGIN
 SELECT prezime INTO priv
 FROM ZAPOSLENI
 WHERE id_zaposlenog=:NEW.id_zaposlenog;
 :NEW.prezime:=priv;
END;
----test5------
INSERT INTO POLISE_OSIGURANJA VALUES('P03456', 7, 'VF3XUHRYMJM123456', 1708997720017, '02/20/2021', '02/20/2022', 2,'');

UPDATE POLISE_OSIGURANJA
SET id_zaposlenog=8
WHERE broj_polise='P03456';
------triger6------
CREATE OR REPLACE TRIGGER zabrana_azuriranja_prezime_polise_osiguranja
BEFORE UPDATE OF prezime ON POLISE_OSIGURANJA
FOR EACH ROW
BEGIN
 RAISE_APPLICATION_ERROR(-20002,'Azuriranje kolone prezime u tabeli POLISE_OSIGURANJA nije dozvoljeno!');
END;
------test6---------
UPDATE POLISE_OSIGURANJA
SET prezime='Peric'
WHERE id_zaposlenog=4;
------------trigeri2ifuncije
-----kod za pod tabele
ALTER TABLE VOZILA
ADD prosecna_potrosnja_vozila NUMBER(10,2);
UPDATE VOZILA v
SET prosecna_potrosnja_vozila=(
 SELECT (masa+(nosivost/2))/1000 * 235.21 / POWER(kubikaza, 0.8)*10
 FROM VOZILA
 WHERE broj_sasije=v.broj_sasije
 );
---------------------- triger
CREATE OR REPLACE TRIGGER update_insert_prosecna_potrosnja_vozila
BEFORE UPDATE OF masa,nosivost,kubikaza ON VOZILA
DECLARE
  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
  EXECUTE IMMEDIATE 'UPDATE VOZILA v SET prosecna_potrosnja_vozila=(
   SELECT (masa+(nosivost/2))/1000 * 235.21 / POWER(kubikaza, 0.8)*10
   FROM VOZILA WHERE broj_sasije=v.broj_sasije)';
  COMMIT;
END;
---TEST1---
INSERT INTO VOZILA VALUES ('AC3UIHRGM3M214421', 1708997720017, 8, 'Peugeot 308', 'NI-0333-FG', '07/25/2016', 1500, 700, 75, 1399, 'Plava', 5, 'A4S91137PA', 2018, 70000,'',7);

UPDATE VOZILA SET masa = 1600 WHERE broj_sasije = 'AC3UIHRGM3M214421';
----TRIGER2---
CREATE OR REPLACE TRIGGER update_prosecna_potrosnja_vozila_zabrana
BEFORE UPDATE OF prosecna_potrosnja_vozila ON VOZILA
FOR EACH ROW
BEGIN
 RAISE_APPLICATION_ERROR(-20002,'Kolona prosecna_potrosnja_vozila se ne moze direktno menjati!');
END;
----test2----
UPDATE VOZILA
SET prosecna_potrosnja_vozila = 6.4
WHERE broj_sasije='AC3UIHRGM3M214421'
-----indeksi
CREATE INDEX petraga_stranke_broj_telefona ON STRANKE(broj_telefona);
-----
CREATE INDEX petraga_zaposleni_ime_i_prezime ON ZAPOSLENI(ime,prezime);
----
CREATE INDEX petraga_vozila_godiste ON VOZILA(godiste);
----
CREATE INDEX petraga_vozila_registarska_oznaka ON VOZILA(registarska_oznaka);
-------------funcija
CREATE OR REPLACE FUNCTION brojVozila
(p_godiste IN NUMBER)
RETURN VARCHAR2
IS
v_brojac NUMBER(4);
BEGIN
 SELECT COUNT(broj_sasije) INTO v_brojac
 FROM VOZILA
 WHERE godiste=p_godiste;
 IF v_brojac=0
 THEN RAISE_APPLICATION_ERROR
 (-20000,'Nema vozila koja su prozivedena
'||p_godiste||'!');
 END IF;
RETURN 'Broj vozila sa godistem '||p_godiste||' je '||v_brojac||'.';
END;
---test1.1---
SELECT brojVozila(2025) FROM DUAL
---test1.2---
SELECT brojVozila(2012) FROM DUAL

---procedura2----
    CREATE OR REPLACE PROCEDURE proveri_ekonomicnost_vozila (p_broj_sasije IN VARCHAR2)
    IS
    v_prosecna_potrosnja_vozila NUMBER;
    BEGIN
    SELECT prosecna_potrosnja_vozila INTO v_prosecna_potrosnja_vozila FROM VOZILA WHERE broj_sasije = p_broj_sasije;
    
    IF v_prosecna_potrosnja_vozila < 10 THEN
        DBMS_OUTPUT.PUT_LINE('Vozilo nije ekonomično. Prosečna potrošnja vozila je ' || v_prosecna_potrosnja_vozila || ' litara na 100 kilometara.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Vozilo je ekonomično. Prosečna potrošnja vozila je ' || v_prosecna_potrosnja_vozila || ' litara na 100 kilometara.');
    END IF;

    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Vozilo nije pronađeno po broju šasije!');
    END;

---test2----
DECLARE
  v_broj_sasije VARCHAR2(20) := 'VF3XUHRYMJM123456';
BEGIN
  proveri_ekonomicnost_vozila(v_broj_sasije);
  
END;
----test2.1--
DECLARE
  v_broj_sasije VARCHAR2(20) := '21343215512343';
BEGIN
  proveri_ekonomicnost_vozila(v_broj_sasije);
  
END;
