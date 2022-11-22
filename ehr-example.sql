create table PATIENT
(PID integer not null,
FirstName varchar(15),
LastName varchar(25),
Gender varchar(6),
Age integer,
CONSTRAINT PT_PK PRIMARY KEY (PID) 
);

INSERT INTO PATIENT
	(PID, FirstName, LastName, Gender, Age)
VALUES
	('1001','John','Porter','Male','30');
INSERT INTO PATIENT
	(PID, FirstName, LastName, Gender, Age)
VALUES
	('1002','Jaehoon','Adams','Male','15');
INSERT INTO PATIENT
	(PID, FirstName, LastName, Gender, Age)
VALUES
	('1003','Alice','Smith',' ','22');
INSERT INTO PATIENT
	(PID, FirstName, LastName, Gender, Age)
VALUES
	('1004','Lisa','Hong','Female','78');
INSERT INTO PATIENT
	(PID, FirstName, LastName, Gender, Age)
VALUES
	('1005','Maria','Lopez','Female','');
SELECT * FROM PATIENT ;
INSERT INTO PATIENT
	(PID, FirstName, LastName, Gender, Age)
VALUES
	('1006','Mike','Johnson','Male','34');


CREATE TABLE ICD9
(SystemName varchar(6),
Codes float,
Descriptions varchar(300),
EffectiveDts date,
CONSTRAINT Codes_pk PRIMARY KEY (Codes)
);
INSERT INTO ICD9
	(SystemName, Codes, Descriptions, EffectiveDts)
VALUES
	('ICD9CM', '250.00','Type 2 diabetes mellitus without complications','2017/10/1');
INSERT INTO ICD9
	(SystemName, Codes, Descriptions, EffectiveDts)
VALUES
	('ICD9CM', '174.9','Malignant neoplasm of unspecified site of unspecified female breast','2017/10/1');
INSERT INTO ICD9
	(SystemName, Codes, Descriptions, EffectiveDts)
VALUES
	('ICD9CM', '175.9','Malignant neoplasm of unspecified site of unspecified male breast','2017/11/1');
INSERT INTO ICD9
	(SystemName, Codes, Descriptions, EffectiveDts)
VALUES
	('ICD9CM', '401','Essential (primary) hypertension','2017/12/15');


CREATE TABLE DRUGFORMULARY
(DID integer not null,
DrugName varchar(300),
Strength varchar(30) null,
DoseForm Varchar(30) null,
Route varchar(30) null,
CONSTRAINT DID_pk PRIMARY KEY (DID)
);
INSERT INTO DRUGFORMULARY
	(DID, DrugName, Strength, DoseForm, Route)
VALUES
	('5000','Oxaliplatin',NULL,NULL,'IV');
INSERT INTO DRUGFORMULARY
	(DID, DrugName, Strength, DoseForm, Route)
VALUES
	('5001','Metformin hydrochloride 500 MG Oral Tablet',NULL,NULL,NULL);
INSERT INTO DRUGFORMULARY
	(DID, DrugName, Strength, DoseForm, Route)
VALUES
	('5002','Paclitaxel','5 mg/ml','Injectable Suspension','IV');
INSERT INTO DRUGFORMULARY
	(DID, DrugName, Strength, DoseForm, Route)
VALUES
	('5003','Metoprolol',NULL,'Tablet','Oral');
INSERT INTO DRUGFORMULARY
	(DID, DrugName, Strength, DoseForm, Route)
VALUES
	('5004','Xeloda','500 mg',NULL,NULL);
INSERT INTO DRUGFORMULARY
	(DID, DrugName, Strength, DoseForm, Route)
VALUES
	('5005','Fluticasone propionate','0.1 mg/actuat','Inhalant Product',NULL);
INSERT INTO DRUGFORMULARY
	(DID, DrugName, Strength, DoseForm, Route)
VALUES
	('5006','Ipilimumab','5 mg/ml','Injectable Solution',NULL);
    
CREATE TABLE DIAGNOSIS
(DxID integer NOT NULL,
PID integer NOT NULL,
DxCode varchar(10),
InitialDxDts date,
DxStatus varchar(8),
CONSTRAINT DX_PK PRIMARY KEY (DxID),
CONSTRAINT DX_FK1 FOREIGN KEY (PID) REFERENCES PATIENT (PID),
CONSTRAINT DX_FK2 FOREIGN KEY (DxCode) REFERENCES ICD9 (Codes)
);
INSERT INTO DIAGNOSIS
	(DxID, PID, DxCode, InitialDxDts, DxStatus)
VALUES
	('101', '1001', '250.00','03-12-01','Active');
INSERT INTO DIAGNOSIS
	(DxID, PID, DxCode, InitialDxDts, DxStatus)
VALUES
	('102', '1001', '174.9','05-07-20','Inactive');
INSERT INTO DIAGNOSIS
	(DxID, PID, DxCode, InitialDxDts, DxStatus)
VALUES
	('103', '1001', '175.9','01-02-03','Inactive');
DELETE FROM DIAGNOSIS WHERE DxID = '103';
INSERT INTO DIAGNOSIS
	(DxID, PID, DxCode, InitialDxDts, DxStatus)
VALUES
	('103', '1001', '175.9','01-02-03','Active');
INSERT INTO DIAGNOSIS
	(DxID, PID, DxCode, InitialDxDts, DxStatus)
VALUES
	('104', '1002', 'C18.0','13-03-09','Active');
INSERT INTO DIAGNOSIS
	(DxID, PID, DxCode, InitialDxDts, DxStatus)
VALUES
	('105', '1002', '401','06-09-27','Active');
INSERT INTO DIAGNOSIS
	(DxID, PID, DxCode, InitialDxDts, DxStatus)
VALUES
	('106', '1003', '162.9','13-04-18','Active');
INSERT INTO DIAGNOSIS
	(DxID, PID, DxCode, InitialDxDts, DxStatus)
VALUES
	('107', '1006', '153.9','13-05-28','Active');

CREATE TABLE DRUGORDER
(ORDERID integer,
PID integer not null,
DID integer not null,
OrderDts date,
OrderStatus varchar(20),
CONSTRAINT ORDERID_PK PRIMARY KEY (ORDERID),
CONSTRAINT PID_FK1 FOREIGN KEY (PID) REFERENCES PATIENT (PID),
CONSTRAINT DID_FK2 FOREIGN KEY (DID) REFERENCES DRUGFORMULARY (DID)
);
INSERT INTO DRUGORDER
	(ORDERID, PID, DID, OrderDts, OrderStatus)
VALUES
	('1','1001','5001','13-03-12','Complete');
INSERT INTO DRUGORDER
	(ORDERID, PID, DID, OrderDts, OrderStatus)
VALUES
	('2','1002','5000','09-07-21','Complete');
INSERT INTO DRUGORDER
	(ORDERID, PID, DID, OrderDts, OrderStatus)
VALUES
	('3','1002','5000','13-05-08','Discontinued');
INSERT INTO DRUGORDER
	(ORDERID, PID, DID, OrderDts, OrderStatus)
VALUES
	('4','1002','5003','13-03-14','Complete');
INSERT INTO DRUGORDER
	(ORDERID, PID, DID, OrderDts, OrderStatus)
VALUES
	('5','1001','5002','05-07-20','Complete');
INSERT INTO DRUGORDER
	(ORDERID, PID, DID, OrderDts, OrderStatus)
VALUES
	('6','1001','5000','10-09-12','Discontinued');
INSERT INTO DRUGORDER
	(ORDERID, PID, DID, OrderDts, OrderStatus)
VALUES
	('7','1003','5005','13-04-18','Complete');
INSERT INTO DRUGORDER
	(ORDERID, PID, DID, OrderDts, OrderStatus)
VALUES
	('8','1006','5004','13-05-28','Pending');
INSERT INTO DRUGORDER
	(ORDERID, PID, DID, OrderDts, OrderStatus)
VALUES
	('9','1004','5000','13-05-28','Complete');
INSERT INTO DRUGORDER
	(ORDERID, PID, DID, OrderDts, OrderStatus)
VALUES
	('10','1004','5004','08-04-13','Complete');
    
    
/* PRACTICE QUERYING */   
/* Q1: Number of patients are female */
select Gender, count(*) from PATIENT group by Gender;

/* Q2: average age of patients */
select avg(Age) from PATIENT;

/* Q3: times medication order was made totally */
select ORDERID, count(*) from DRUGORDER;

/* Q4: List drug orders having OrderStatus Complete or Pending */
select * from DRUGORDER where OrderStatus in('Complete','Pending');

/* Q5: List ICD9 diagnosis codes and names with dates earlier than 11/2/2017 */
select SystemName, Codes from ICD9 where EffectiveDts<'2017/11/02';

/* Q6: List ICD9 codes and names with word 'Malignant' */
select SystemName, Codes from ICD9 where Descriptions like 'Malignant%';

/*Q7: List number of times each drug was ordered after 2010 */
select DID, count(*) from DRUGORDER where OrderDts>'10-12-31' group by DID;

/*Q8: List medication formulary for those dose form and route are null */
select DrugName from DRUGFORMULARY where DoseForm is NULL and Route is NULL;

/*Q9: List first and last names of patients having at least one diagnosis. */
select DISTINCT FirstName, LastName from PATIENT natural join DIAGNOSIS;

/*Q10: List first and last names of patients having at least one medication.*/
select DISTINCT FirstName, LastName from PATIENT natural join DRUGORDER;

/*Q11: List firstand last names of patients having both diagnosis and medication.*/
select DISTINCT FirstName, LastName from PATIENT natural join DRUGORDER natural join DIAGNOSIS;

/* Q12: List first and last names of patients whose medication order dose from is 'Tablet'*/
select FirstName, LastName from PATIENT natural join DRUGFORMULARY natural join DRUGORDER where DoseForm = 'Tablet';

/*Q13: List names codes and names of medication ordered at least twice.*/
select DRUGFORMULARY.DID, DRUGFORMULARY.DrugName from DRUGORDER
join DRUGFORMULARY on DRUGORDER.DID = DRUGFORMULARY.DID
group by DRUGORDER.DID having count(DRUGORDER.DID) >= 2;

/*Q14: List first and last naes of patients don't have any medication.*/
select FirstName, LastName from PATIENT where not (PID in (select PID from DRUGORDER));