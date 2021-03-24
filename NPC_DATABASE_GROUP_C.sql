DROP TABLE NC_prescription;
DROP TABLE NC_medication;
DROP TABLE NC_diagnosis;
DROP TABLE NC_schedule;
DROP TABLE NC_appointment;
DROP TABLE NC_fee;
DROP TABLE NC_doctor;
DROP TABLE NC_nurse;
DROP TABLE NC_pet;
DROP TABLE NC_owner;

CREATE TABLE NC_owner (
ownerID NUMBER(8,0) CONSTRAINT ownIDpk PRIMARY KEY,
ownerFNAME VARCHAR(50) NOT NULL,
ownerLNAME VARCHAR(50) NOT NULL, 
ownerADDRESS VARCHAR(100)
);

CREATE TABLE NC_pet (
petID NUMBER(8,0) CONSTRAINT petIDpk PRIMARY KEY,
petTYPE VARCHAR2(30),
petNAME VARCHAR2(30) NOT NULL,
petDOB DATE NOT NULL, 
petGENDER CHAR(1),
petCOLOUR VARCHAR2(30),
petWEIGHT NUMBER(5,2),
ownerID NUMBER(8) NOT NULL
);

ALTER TABLE NC_pet ADD CONSTRAINT ownIDfk FOREIGN KEY (ownerID)
REFERENCES NC_owner (ownerID);

CREATE TABLE NC_nurse (
nurseID NUMBER(8,0) CONSTRAINT nurIDpk PRIMARY KEY,
nurseFNAME VARCHAR(50) NOT NULL,
nurseLNAME VARCHAR(50) NOT NULL,
nurseEMAIL VARCHAR2(50),
nurseTEL NUMBER(12),
nurseOFFICE VARCHAR2(5),
nurseSCHEDULE VARCHAR2(2),
CONSTRAINT nurEMAILuk UNIQUE (nurseemail)
);

CREATE TABLE NC_doctor (
docID NUMBER(8,0) CONSTRAINT docIDpk PRIMARY KEY,
docFNAME VARCHAR2(50),
docLNAME VARCHAR2(50),
docOFFICE VARCHAR2(5),
docEMAIL VARCHAR2(50),
docTEL NUMBER(12),
docSCHEDULE VARCHAR2(2),
CONSTRAINT docEMAILuk UNIQUE (docEMAIL)
);

CREATE TABLE NC_fee (
feeID NUMBER(8,0) CONSTRAINT feeIDpk PRIMARY KEY,
feeDUE NUMBER(5,2),
cancellationFEE CHAR(1)
);

CREATE TABLE NC_appointment (
appointID NUMBER(8,0) CONSTRAINT appIDpk PRIMARY KEY,
docID NUMBER(8,0) NOT NULL,
nurseID NUMBER(8,0) NOT NULL,
petID NUMBER(4,0) NOT NULL,
appointDATE DATE,
attendance CHAR(1),
cancellation CHAR(1),
feeID NUMBER(8,2)
);

ALTER TABLE NC_appointment ADD CONSTRAINT docIDfk FOREIGN KEY (docID)
REFERENCES NC_doctor (docID);  

ALTER TABLE NC_appointment ADD CONSTRAINT nurIDfk FOREIGN KEY (nurseID)
REFERENCES NC_nurse (nurseID);

ALTER TABLE NC_appointment ADD CONSTRAINT petIDfk FOREIGN KEY (petID)
REFERENCES NC_pet (petID);

ALTER TABLE NC_appointment ADD CONSTRAINT feeIDfk FOREIGN KEY (feeID)
REFERENCES NC_fee (feeID);

CREATE TABLE NC_schedule (
appointID NUMBER(8,0),
nurseID NUMBER(8,0),
CONSTRAINT schedIDpk2 PRIMARY KEY (appointID, nurseID)
);

ALTER TABLE NC_schedule ADD CONSTRAINT appIDfk3 FOREIGN KEY (appointID)
REFERENCES NC_appointment (appointID);

ALTER TABLE NC_schedule ADD CONSTRAINT nurIDfk2 FOREIGN KEY (nurseID)
REFERENCES NC_nurse (nurseID);

CREATE TABLE NC_diagnosis (
diagnosisID NUMBER(8,0) CONSTRAINT diagIDpk PRIMARY KEY,
appointID NUMBER(8,0) NOT NULL,
diagnosisDESC VARCHAR2(200),
diagnosisDATE DATE
);

ALTER TABLE NC_diagnosis ADD CONSTRAINT appdiagIDfk FOREIGN KEY (appointID)
REFERENCES NC_appointment (appointID);

CREATE TABLE NC_medication (
medID NUMBER(8,0) CONSTRAINT medIDpk PRIMARY KEY,
medNAME VARCHAR2(50),
medCOST NUMBER(5,2)
);

CREATE TABLE NC_prescription (
diagnosisID NUMBER(8,0),
medID NUMBER(8,0),
CONSTRAINT presIDpk PRIMARY KEY (diagnosisID, medID) 
);

ALTER TABLE NC_prescription ADD CONSTRAINT presIDfk FOREIGN KEY (diagnosisID)
REFERENCES NC_diagnosis (diagnosisID);
                           
ALTER TABLE NC_prescription ADD CONSTRAINT medIDfk FOREIGN KEY (medID)
REFERENCES NC_medication (medID);

INSERT INTO NC_fee (feeID,feeDUE,cancellationFEE)
VALUES (00001, 5, 'Y');
INSERT INTO NC_fee VALUES (00002,5,'N');
INSERT INTO NC_fee VALUES (00003,10,'Y');
INSERT INTO NC_fee VALUES (00004,10,'N');
INSERT INTO NC_fee VALUES (00005,15,'Y');
INSERT INTO NC_fee VALUES (00006,15,'N');
INSERT INTO NC_fee VALUES (00007,20,'Y');
INSERT INTO NC_fee VALUES (00008,20,'N');
INSERT INTO NC_fee VALUES (00009,25,'Y');
INSERT INTO NC_fee VALUES (00010,25,'N');
INSERT INTO NC_fee VALUES (00011,30,'Y');
INSERT INTO NC_fee VALUES (00012,30,'N');
INSERT INTO NC_fee VALUES (00013,35,'Y');
INSERT INTO NC_fee VALUES (00014,35,'N');
INSERT INTO NC_fee VALUES (00015,40,'Y');
INSERT INTO NC_fee VALUES (00016,40,'N');
INSERT INTO NC_fee VALUES (00017,45,'Y');
INSERT INTO NC_fee VALUES (00018,45,'N');
INSERT INTO NC_fee VALUES (00019,50,'Y');
INSERT INTO NC_fee VALUES (00020,50,'N');
INSERT INTO NC_fee VALUES (00021,55,'Y');
INSERT INTO NC_fee VALUES (00022,55,'N');
INSERT INTO NC_fee VALUES (00023,60,'Y');
INSERT INTO NC_fee VALUES (00024,60,'N');

INSERT INTO NC_owner (ownerID,ownerFNAME,ownerLNAME,ownerADDRESS) 
VALUES (40001,'David','Aintnohassle','51 issomehassle lane');
INSERT INTO NC_owner VALUES (40002,'Sam','Samari','99 aintnomountain street');
INSERT INTO NC_owner VALUES (40003,'Craig','Furgus','23 whatsmorefunny lane');
INSERT INTO NC_owner VALUES (40004,'George','Anderson','24 shulz lane');
INSERT INTO NC_owner VALUES (40005,'Kylie','Pee','45 tonystank road');
INSERT INTO NC_owner VALUES (40006,'Chabbu','Dabbo','33 melancholy hill');
INSERT INTO NC_owner VALUES (40007,'Sarah','Swedish','88 plastic beach');
INSERT INTO NC_owner VALUES (40008,'Kylie','Africa','13 itsgonnatake lane');
INSERT INTO NC_owner VALUES (40009,'Kylie','Tot','76 alottodragme street');
INSERT INTO NC_owner VALUES (40010,'Gabby','Mcdonalds','10 awayfromyou road');
INSERT INTO NC_owner VALUES (40011,'Kylie','Smiley','44 nothingmorethnhrdmen road');
INSERT INTO NC_owner VALUES (40012,'Toto','Africa','112 baker st');
INSERT INTO NC_owner VALUES (40013,'Arnold','Gunit','64 zoo lane');
INSERT INTO NC_owner VALUES (40014,'Delboy','Mrkus','89 tonyreallystank lane');
INSERT INTO NC_owner VALUES (40015,'Meredith','Grey','48 moon lane');
INSERT INTO NC_owner VALUES (40016,'Elis','Webber','321 liftoff lane');

INSERT INTO NC_pet (petID, petTYPE, petNAME, petDOB, petGENDER, petCOLOUR, petWEIGHT, ownerID) 
VALUES (1000,'Alsation','chappyDog', TO_DATE('01-01-2018','dd-mm-yyyy'),'M','Beige',3,40001);
INSERT INTO NC_pet (petID, petTYPE, petNAME, petDOB, petGENDER, petCOLOUR, petWEIGHT, ownerID) VALUES (1001,'Chiwawa','chiwado',TO_DATE('15-03-2010','dd-mm-yyyy'),'F','Black',1,40002);
INSERT INTO NC_pet (petID, petTYPE, petNAME, petDOB, petGENDER, petCOLOUR, petWEIGHT, ownerID) VALUES (1002,'Bulldog','bullyTom',TO_DATE('25-09-2014','dd-mm-yyyy'),'F','Grey',4.5,40003);
INSERT INTO NC_pet (petID, petTYPE, petNAME, petDOB, petGENDER, petCOLOUR, petWEIGHT, ownerID) VALUES (1003,'Terrier','terryToe',TO_DATE('07-06-2016','dd-mm-yyyy'),'F','White',1.2,40004);
INSERT INTO NC_pet (petID, petTYPE, petNAME, petDOB, petGENDER, petCOLOUR, petWEIGHT, ownerID) VALUES (1004,'Boxer','poody',TO_DATE('02-04-2012','dd-mm-yyyy'),'M','Black',1,40005);
INSERT INTO NC_pet (petID, petTYPE, petNAME, petDOB, petGENDER, petCOLOUR, petWEIGHT, ownerID) VALUES (1005,'Dalmation','dood',TO_DATE('19-12-2017','dd-mm-yyyy'),'F','Spotted',7,40006);
INSERT INTO NC_pet (petID, petTYPE, petNAME, petDOB, petGENDER, petCOLOUR, petWEIGHT, ownerID) VALUES (1006,'SheepWolf','Dood',TO_DATE('20-07-2009','dd-mm-yyyy'),'M','Brown',10,40007);
INSERT INTO NC_pet (petID, petTYPE, petNAME, petDOB, petGENDER, petCOLOUR, petWEIGHT, ownerID) VALUES (1007,'Labrador','LabbyDee',TO_DATE('10-10-2008','dd-mm-yyyy'),'M','White',11,40008);
INSERT INTO NC_pet (petID, petTYPE, petNAME, petDOB, petGENDER, petCOLOUR, petWEIGHT, ownerID) VALUES (1008,'Shih Tzu','shiTzo',TO_DATE('20-12-2013','dd-mm-yyyy'),'F','MixedBrown',1, 40009);
INSERT INTO NC_pet (petID, petTYPE, petNAME, petDOB, petGENDER, petCOLOUR, petWEIGHT, ownerID) VALUES (1009,'Shih Tzu','Jake',TO_DATE('25-12-2017','dd-mm-yyyy'),'M','GreyishWhite',4,40010);
INSERT INTO NC_pet (petID, petTYPE, petNAME, petDOB, petGENDER, petCOLOUR, petWEIGHT, ownerID) VALUES (1010,'Shih Tzu','Gotty',TO_DATE('03-11-2016','dd-mm-yyyy'),'M','MixedBrown',1,40011);
INSERT INTO NC_pet (petID, petTYPE, petNAME, petDOB, petGENDER, petCOLOUR, petWEIGHT, ownerID) VALUES (1011,'Labrador', 'Africa',TO_DATE('03-12-2015','dd-mm-yyyy'),'M','White',15, 40012);
INSERT INTO NC_pet (petID, petTYPE, petNAME, petDOB, petGENDER, petCOLOUR, petWEIGHT, ownerID) VALUES (1012,'Bulldog','PostmaloneJR',TO_DATE('04-11-2010','dd-mm-yyyy'),'F','Black',12, 40013);
INSERT INTO NC_pet (petID, petTYPE, petNAME, petDOB, petGENDER, petCOLOUR, petWEIGHT, ownerID) VALUES (1013,'Boxer','Cheese',TO_DATE('06-11-2018','dd-mm-yyyy'),'F','Brown',7,40014);
INSERT INTO NC_pet (petID, petTYPE, petNAME, petDOB, petGENDER, petCOLOUR, petWEIGHT, ownerID) VALUES (1014,'Terrier','Weetus',TO_DATE('03-11-2015','dd-mm-yyyy'),'F','Grey',4,40015);
INSERT INTO NC_pet (petID, petTYPE, petNAME, petDOB, petGENDER, petCOLOUR, petWEIGHT, ownerID) VALUES (1015,'Boxer','Grey',TO_DATE('03-1-2018','dd-mm-yyyy'),'M','MixedBrown',9,40016);

INSERT INTO NC_nurse (nurseID, nurseFNAME, nurseLNAME, nurseEMAIL, nurseTEL, nurseSCHEDULE, nurseOFFICE)
VALUES  ('90001','Sara','Doog','saraD@noahs.com','0121567999','PT','00');
INSERT INTO NC_nurse VALUES  (90002,'Alex','Kirk','alexK@noahs.com','0121567999','FT',00);
INSERT INTO NC_nurse VALUES  (90003,'Tony','Stank','tonyS@noahs.com','0121567999','FT',00);
INSERT INTO NC_nurse VALUES  (90004,'Liz','Keen','LizK@noahs.com','0121567999','FT',00);
INSERT INTO NC_nurse VALUES  (90005,'Ali','Jean','aliJ@noahs.com','0121567999','PT',00);
INSERT INTO NC_nurse VALUES  (90006,'Frank','Schmuck','frankS@noahs.com','0121567999','FT',00);
INSERT INTO NC_nurse VALUES  (90007,'Pepper','Stank','pepperS@noahs.com','0121567999','PT',00);
INSERT INTO NC_nurse VALUES  (90008,'Ted','Shed','tedS@noahs.com','0121567999','FT',00);
INSERT INTO NC_nurse VALUES  (90009,'Karen','Manager','karenM@noahs.com','0121567999','FT',00);
INSERT INTO NC_nurse VALUES  (90010,'Amy','Pond','amyP@noahs.com','0121567999','PT',00);
INSERT INTO NC_nurse VALUES  (90011,'Baily','Smoosh','bailys@noahs.com','0121567999','FT',00);
INSERT INTO NC_nurse VALUES  (90012,'Sandra','Billings','sandraB@noahs.com','0121567999','FT',00);

INSERT INTO NC_doctor (docID, docFNAME, docLNAME, docEMAIL, docTEL, docSCHEDULE, docOFFICE)
VALUES ('2200','Cleverly','CL','cleaverly_cl@noahs.com', '0121564569','FT','12');
INSERT INTO NC_doctor (docID, docFNAME, docLNAME, docEMAIL, docTEL, docSCHEDULE, docOFFICE) VALUES (2201,'Mike','K','mikeK@noahs.com','0121564898','FT',34);
INSERT INTO NC_doctor (docID, docFNAME, docLNAME, docEMAIL, docTEL, docSCHEDULE, docOFFICE) VALUES (2202,'Farraday','F','farradayF@noahs.com','0121564890','FT',34);
INSERT INTO NC_doctor (docID, docFNAME, docLNAME, docEMAIL, docTEL, docSCHEDULE, docOFFICE) VALUES (2203,'Fred','F','fredF@noahs.com','0121564899','FT',41);
INSERT INTO NC_doctor (docID, docFNAME, docLNAME, docEMAIL, docTEL, docSCHEDULE, docOFFICE) VALUES (2204,'Watson','S','watS@noahs.com','0121564763','FT',1);
INSERT INTO NC_doctor (docID, docFNAME, docLNAME, docEMAIL, docTEL, docSCHEDULE, docOFFICE) VALUES (2205,'Freeman','F','freemanF@noahs.com','0121564111','FT',2);
INSERT INTO NC_doctor (docID, docFNAME, docLNAME, docEMAIL, docTEL, docSCHEDULE, docOFFICE) VALUES (2206,'Crowley','C','crowleyC@noahs.com','01215641213','FT',10);
INSERT INTO NC_doctor (docID, docFNAME, docLNAME, docEMAIL, docTEL, docSCHEDULE, docOFFICE) VALUES (2207,'Rahib','B','rahibB@noahs.com','0121564189','FT',16);
INSERT INTO NC_doctor (docID, docFNAME, docLNAME, docEMAIL, docTEL, docSCHEDULE, docOFFICE) VALUES (2208,'Shab','Y','shabY@noahs.com','0121564190','PT',17);
INSERT INTO NC_doctor (docID, docFNAME, docLNAME, docEMAIL, docTEL, docSCHEDULE, docOFFICE) VALUES (2209,'Rah','B','rahB@noahs.com','0121564191','PT',18);
INSERT INTO NC_doctor (docID, docFNAME, docLNAME, docEMAIL, docTEL, docSCHEDULE, docOFFICE) VALUES (2210,'Nab','B','nabB@noahs.com','0121564191','PT',19);
INSERT INTO NC_doctor (docID, docFNAME, docLNAME, docEMAIL, docTEL, docSCHEDULE, docOFFICE) VALUES (2211,'Naha','c','nahac@noahs.com','0121564192','PT',10);

INSERT INTO NC_appointment (appointID, appointDATE, attendance, cancellation, feeID, docID,nurseID,petID) 
VALUES (100601, TO_DATE('05-08-2019:08:30:00AM','dd-mm-yy:hh:mi:ssam'),'Y','N',00001,2201,90009,1002);
INSERT INTO NC_appointment (appointID, appointDATE, attendance, cancellation, feeID, docID,nurseID,petID) VALUES (100603, TO_DATE('09-08-2019:08:30:00AM','dd-mm-yy:hh:mi:ssam'),'Y','N',00002,2201,90011,1003);
INSERT INTO NC_appointment (appointID, appointDATE, attendance, cancellation, feeID, docID,nurseID,petID) VALUES (100604, TO_DATE('09-10-2020:08:45:00AM','dd-mm-yyyy:hh:mi:ssam'),'Y','N',00003,2207,90001,1004);
INSERT INTO NC_appointment (appointID, appointDATE, attendance, cancellation, feeID, docID,nurseID,petID) VALUES (100605, TO_DATE('05-09-2019:08:45:00AM','dd-mm-yyyy:hh:mi:ssam'),'Y','N',00004,2211,90002,1005);
INSERT INTO NC_appointment (appointID, appointDATE, attendance, cancellation, feeID, docID,nurseID,petID) VALUES (100606, TO_DATE('27-09-2019:09:00:00AM','dd-mm-yyyy:hh:mi:ssam'),'Y','N',00005,2210,90003,1006);
INSERT INTO NC_appointment (appointID, appointDATE, attendance, cancellation, feeID, docID,nurseID,petID) VALUES (100607, TO_DATE('04-10-2019:09:00:00AM','dd-mm-yyyy:hh:mi:ssam'),'Y','N',00006,2202,90004,1007);
INSERT INTO NC_appointment (appointID, appointDATE, attendance, cancellation, feeID, docID,nurseID,petID) VALUES (100602, TO_DATE('11-10-2019:09:15:00AM','dd-mm-yyyy:hh:mi:ssam'),'Y','N',00007,2206,90005,1008);
INSERT INTO NC_appointment (appointID, appointDATE, attendance, cancellation, feeID, docID,nurseID,petID) VALUES (100608, TO_DATE('13-12-2019:09:15:00AM','dd-mm-yyyy:hh:mi:ssam'),'Y','N',00008,2207,90006,1009);
INSERT INTO NC_appointment (appointID, appointDATE, attendance, cancellation, feeID, docID,nurseID,petID) VALUES (100609, TO_DATE('02-01-2017:09:30:00AM','dd-mm-yyyy:hh:mi:ssam'),'N','Y',00009,2205,90007,1004);
INSERT INTO NC_appointment (appointID, appointDATE, attendance, cancellation, feeID, docID,nurseID,petID) VALUES (100610, TO_DATE('22-09-2017:09:30:00AM','dd-mm-yyyy:hh:mi:ssam'),'N','Y',00010,2208,90008,1006);
INSERT INTO NC_appointment (appointID, appointDATE, attendance, cancellation, feeID, docID,nurseID,petID) VALUES (100611, TO_DATE('08-05-2017:09:45:00AM','dd-mm-yyyy:hh:mi:ssam'),'N','Y',00011,2201,90009,1005);
INSERT INTO NC_appointment (appointID, appointDATE, attendance, cancellation, feeID, docID,nurseID,petID) VALUES (100612, TO_DATE('10-04-2017:09:45:00AM','dd-mm-yyyy:hh:mi:ssam'),'N','Y',00012,2205,90010,1000);
INSERT INTO NC_appointment (appointID, appointDATE, attendance, cancellation, feeID, docID,nurseID,petID) VALUES (100613, TO_DATE('16-06-2017:10:00:00AM','dd-mm-yyyy:hh:mi:ssam'),'N','Y',00013,2205,90011,1003);
INSERT INTO NC_appointment (appointID, appointDATE, attendance, cancellation, feeID, docID,nurseID,petID) VALUES (100622, TO_DATE('25-09-2020:10:00:00AM','dd-mm-yyyy:hh:mi:ssam'),'N','Y',00014,2205,90012,1005);
INSERT INTO NC_appointment (appointID, appointDATE, attendance, cancellation, feeID, docID,nurseID,petID) VALUES (100623, TO_DATE('09-10-2020:10:15:00AM','dd-mm-yyyy:hh:mi:ssam'),'N','Y',00015,2208,90001,1006);
INSERT INTO NC_appointment (appointID, appointDATE, attendance, cancellation, feeID, docID,nurseID,petID) VALUES (100614, TO_DATE('16-10-2020:11:00:00AM','dd-mm-yyyy:hh:mi:ssam'),'N','Y',00016,2209,90002,1004);
INSERT INTO NC_appointment (appointID, appointDATE, attendance, cancellation, feeID, docID,nurseID,petID) VALUES (100615, TO_DATE('05-10-2020:12:00:00PM','dd-mm-yyyy:hh:mi:sspm'),'N','Y',00017,2210,90003,1003);
INSERT INTO NC_appointment (appointID, appointDATE, attendance, cancellation, feeID, docID,nurseID,petID) VALUES (100616, TO_DATE('12-10-2020:01:00:00PM','dd-mm-yyyy:hh:mi:sspm'),'Y','N',00018,2211,90004,1000);
INSERT INTO NC_appointment (appointID, appointDATE, attendance, cancellation, feeID, docID,nurseID,petID) VALUES (100617, TO_DATE('02-10-2020:02:40:00PM','dd-mm-yyyy:hh:mi:sspm'),'Y','N',00019,2211,90005,1004);
INSERT INTO NC_appointment (appointID, appointDATE, attendance, cancellation, feeID, docID,nurseID,petID) VALUES (100618, TO_DATE('28-09-2020:02:55:00PM','dd-mm-yyyy:hh:mi:sspm'),'Y','N',00020,2211,90006,1004);
INSERT INTO NC_appointment (appointID, appointDATE, attendance, cancellation, feeID, docID,nurseID,petID) VALUES (100619, TO_DATE('16-10-2020:03:20:00PM','dd-mm-yyyy:hh:mi:sspm'),'Y','N',00021,2208,90007,1000);
INSERT INTO NC_appointment (appointID, appointDATE, attendance, cancellation, feeID, docID,nurseID,petID) VALUES (100620, TO_DATE('06-09-2019:03:55:00PM', 'dd-mm-yyyy:hh:mi:sspm'),'Y','N',00022,2206,90008,1010);
INSERT INTO NC_appointment (appointID, appointDATE, attendance, cancellation, feeID, docID,nurseID,petID) VALUES (105091, TO_DATE('09-09-2019:04:40:00PM', 'dd-mm-yyyy:hh:mi:sspm'),'Y','N',00023,2205,90009,1009);
INSERT INTO NC_appointment (appointID, appointDATE, attendance, cancellation, feeID, docID,nurseID,petID) VALUES (105187, TO_DATE('27-09-2019:04:20:00PM', 'dd-mm-yyyy:hh:mi:sspm'),'Y','N',00024,2202,90010,1002);
INSERT INTO NC_appointment (appointID, appointDATE, attendance, cancellation, feeID, docID,nurseID,petID) VALUES (105235, TO_DATE('07-10-2019:04:55:00', 'dd-mm-yyyy:hh:mi:sspm'),'Y','N',00001,2202,90011,1003);


INSERT INTO NC_diagnosis (diagnosisID, appointID, diagnosisDESC, diagnosisDATE) VALUES (105078, 100601, 'Needs socialisation treats', TO_DATE('06-09-2019', 'dd-mm-yyyy'));
INSERT INTO NC_diagnosis VALUES (105091,100602,'Ultrasonic dental scalling in two weeks', TO_DATE('09-09-2019', 'dd-mm-yyyy'));
INSERT INTO NC_diagnosis VALUES (105187,100603,'Needs socialisation treats and worming treatment', TO_DATE('29-09-2019', 'dd-mm-yyyy'));
INSERT INTO NC_diagnosis VALUES (105235,100604,'Overgrown skin, take park walks every evening',TO_DATE('07-10-2019', 'dd-mm-yyyy'));
INSERT INTO NC_diagnosis VALUES (100600,100605,'Deferal Bring in on tuesday 10-12pm ', TO_DATE('05-08-2019', 'dd-mm-yyyy'));
INSERT INTO NC_diagnosis VALUES (100601,100606,'Get drug AA from smiths pharmacy', TO_DATE('05-08-2019', 'dd-mm-yyyy'));
INSERT INTO NC_diagnosis VALUES (100602,100607,'surgery required on 21 Novemeber 2019', TO_DATE('11-10-2019', 'dd-mm-yyyy'));
INSERT INTO NC_diagnosis VALUES (100603,100608,'Needs a bath', TO_DATE('09-08-2019', 'dd-mm-yyyy'));
INSERT INTO NC_diagnosis VALUES (100604,100609,'N/A', TO_DATE('16-08-2019', 'dd-mm-yyyy'));
INSERT INTO NC_diagnosis VALUES (100605,100610,'Dental treatment', TO_DATE('05-09-2019', 'dd-mm-yyyy'));
INSERT INTO NC_diagnosis VALUES (100606,100611,'Underweight, Needs more food', TO_DATE('27-09-2019', 'dd-mm-yyyy'));
INSERT INTO NC_diagnosis VALUES (100607,100612,'Bring back for ear treatment', TO_DATE('04-10-2019', 'dd-mm-yyyy'));
INSERT INTO NC_diagnosis VALUES (100608,100613,'Dental treatment', TO_DATE('13-12-2019', 'dd-mm-yyyy'));
INSERT INTO NC_diagnosis VALUES (100609,100614,'N/A', TO_DATE('03-01-2017', 'dd-mm-yyyy'));
INSERT INTO NC_diagnosis VALUES (100610,100615,'N/A', TO_DATE('22-09-2017', 'dd-mm-yyyy'));
INSERT INTO NC_diagnosis VALUES (100611,100616,'N/A', TO_DATE('09-05-2017', 'dd-mm-yyyy'));
INSERT INTO NC_diagnosis VALUES (100612,100617,'N/A', TO_DATE('11-04-2017', 'dd-mm-yyyy'));
INSERT INTO NC_diagnosis VALUES (100613,100618,'N/A', TO_DATE('30-09-2020', 'dd-mm-yyyy'));
INSERT INTO NC_diagnosis VALUES (100614,100619,'N/A', TO_DATE('13-10-2020', 'dd-mm-yyyy'));
INSERT INTO NC_diagnosis VALUES (100615,100620,'N/A', TO_DATE('10-10-2020', 'dd-mm-yyyy'));

INSERT INTO NC_medication (medID, medNAME, medCOST)
VALUES (00001, 'SorePaws', 5);
INSERT INTO NC_medication VALUES (00002, 'SmellyCat', 10);
INSERT INTO NC_medication VALUES (00003, 'Calmz', 7.5);
INSERT INTO NC_medication VALUES (00004, 'WormAway', 6.65);
INSERT INTO NC_medication VALUES (00005, 'D-Flea', 12);
INSERT INTO NC_medication VALUES (00006, 'Puppium', 8);
INSERT INTO NC_medication VALUES (00007, 'Catuprofen', 10);
INSERT INTO NC_medication VALUES (00008, 'RashBash', 11);
INSERT INTO NC_medication VALUES (00009, 'Poochodium', 2.5);
INSERT INTO NC_medication VALUES (000010, 'LizardLunch', 12);