/*	A DATABASE DESIGN FOR A HOSPITAL MANAGEMENT. DESIGNED BY KASALI A. SAMSON */

-- Creating a database for a Hospital Management System
CREATE DATABASE HospitalDatabase;
USE [HospitalDatabase];

--Hospital has different tables we start by Creating the Patients Table
CREATE TABLE Patients (
	PatientsID INT PRIMARY KEY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50)NOT NULL,
	DateOfBirth DATE,
	Gender CHAR(1),
	PhoneNumber VARCHAR(20)NOT NULL,
	PatientsAddress VARCHAR(255)NOT NULL,
	BloodType VARCHAR(10),
	);
SELECT * FROM Patients;

--Creating the department Table
CREATE TABLE DEPARTMENT(
	DepartmentID INT PRIMARY KEY,
	DepartmentName VARCHAR(50) NOT NULL,
	);
SELECT * FROM DEPARTMENT;

-- CREATE DOCTORS TABLE
CREATE TABLE Doctors(
	DoctorsID INT PRIMARY KEY,
	FirstName VARCHAR(30)NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	Speciaty VARCHAR(225),
	PhoneNumber VARCHAR(20),
	Email VARCHAR(100),
	DepartmentID INT REFERENCES Department(DepartmentID) --FOREIGN KEY
	);
SELECT * FROM Doctors;

--CREATING APPOINTMENTS TABLE
CREATE TABLE Appointments(
	AppointmentID INT PRIMARY KEY,
	AppointmentDate DATE,
	AppointmentTime TIME ,
	PatientsID INT REFERENCES Patients(PatientsID),
	DoctorsID INT REFERENCES Doctors(DoctorsID)
	);
SELECT * FROM Appointments;

--CREATE  TREATMENTS TABLE
CREATE TABLE Treatments(
	TreatmentID INT PRIMARY KEY,
	TreatmentDescription TEXT,
	TreatmentDate DATE,
	AppointmentID INT REFERENCES Appointments(AppointmentID), --FOREIGN KEY FOR APPOINTMENTS
	DoctorsID INT REFERENCES Doctors(DoctorsID)
	);
SELECT * FROM Treatments;

--CREATE MEDICAL RECORDS
CREATE TABLE MedicalRecords(
	RecordID INT PRIMARY KEY,
	RecordDate DATE,
	RecordDetails TEXT,
	PatientsID INT REFERENCES Patients(PatientsID),
	DoctorsID INT REFERENCES Doctors(DoctorsID)
	);
SELECT * FROM MedicalRecords;

--Select all the tables 
SELECT * FROM Patients;
SELECT * FROM DEPARTMENT;
SELECT * FROM Doctors;
SELECT * FROM Appointments;
SELECT * FROM Treatments;
SELECT * FROM MedicalRecords;


--Inserting data into the department table 
INSERT INTO DEPARTMENT 
VALUES (1, 'Cardiology'),
	(2, 'Ophthalmology'),
	(3, 'Neonatology'),
	(4, 'Dermatology'),
	(5, 'Otolaryngologyy');

-- INSERING VALUES INTO PATIENTS
INSERT INTO Patients 
VALUES (001, 'Faith', 'Jayden', 'November 11, 1986', 'F', '08187387018', '10 Wuse Abuja, Nigeria', 'O-'),
	(002, 'Jane', 'Peter', 'November 24, 1987', 'F', '09087387018', '567 Maple St, Springfield, USA', 'O-'),
	(003, 'John', 'Timber', 'January 2, 1999', 'M', '09087399008', '577 Maple St,Springfield, USA', 'A-'),
	(004, 'Alfred', 'Cliton', 'June 14, 1987', 'M', '09087387088', '124 Palm Ave, Miami, Florida, USA', 'AB-'),
	(005, 'Winny', 'Fred', 'February 24, 1987', 'F', '08187387000', '432, Ocean Blvd, Santa Monica, Califonia, USA', 'A+'),
	(006, 'Victor', 'Clever', 'September 1, 1977', 'M', '07099738701', '765 Desert Rd, Phoenix, Arizona, USA', 'AB-'),
	(007, 'Kate', 'Andrew', 'March 25, 1996', 'F', '07066538481', '890, Lakeshore Dr, Chicago, USA', 'O+'),
	(008, 'Harlan', 'Smith', 'April 21, 1993', 'M', '08166538481', '891, Lakeshore Dr,Chicago, USA', 'AB+'),
	(009, 'Angeina', 'Davis', 'May 10, 1976', 'F', '07098387010', '1600 Pennysylvania Ave NW, Washington, USA', 'B-'),
	(010, 'Harden', 'Miller', 'November 26, 1989', 'M', '09027387023', '456 Ranch Rd, Asutin, Texas, USA', 'B-');	

--INSERTING VALUES INTO DOCTORS TABLE
INSERT INTO Doctors 
VALUES (001, 'Tiwatope', 'Adeoye', 'Cardiology', '09076752172', 'Tiwatope@nhis.com', 1),
	(002, 'Williams', 'Faith', 'Ophthalmology', '08176752172', 'Williams@nhis.com', 2),
	(003, 'Enioluwa', 'Joel', 'Neonatology', '08176776512', 'Enioluwa@nhis.com', 3),
	(004, 'Murewa', 'Barnabas', 'Dermatology', '07076776512', 'Murewa@nhis.com', 4),
	(005, 'Christopher', 'Martinez', 'Otolaryngology', '09076776765', 'Christopher@nhis.com', 5);
	

-- INSERING VALUES INTO APPOINTMENT
INSERT INTO Appointments 
VALUES (001, '2024/08/21', '02:00pm', 001, 001),
	   (002, '2024/09/22', '03:00pm', 002, 002),
	   (003, '2024/10/23', '04:00pm', 003, 003),
	   (004, '2024/11/24', '05:00pm', 004, 004),
	   (005, '2024/12/25', '06:00pm', 005, 005);

---INSERTING VALUES INTO TREATMENTS
INSERT INTO Treatments 
VALUES (001, 'Blood pressure management', '2024/10/5', 001, 001),
	   (002, 'Beta-blocker therapy', '2024/10/6', 002, 002),
	   (003, 'Glaucoma management', '2024/10/7', 003, 003),
	   (004, 'Latanoprost for eye pressure', '2024/10/8', 004, 004),
	   (005, 'Respiratory syncytial virus (RSV) treatment', '2024/10/9', 005, 005);

---INSERTING VALUES INTO MEDICALRECORDS
INSERT INTO MedicalRecords 
VALUES (001, '2024/8/10', 'Blood pressure within normal range, patient responding well to Atenolol, Continue with current medication.', 001, 001),
	   (002, '2024/9/11', 'Patient showed improvement with beta-blocker therapy, Monitor side effect and adjust dosage if necesary.', 002, 002),
	   (003, '2024/10/12', 'Intraocular pressure reduced after starting glaucoma treatment, Recommed continued us of Bromonidine.', 003, 003),
	   (004, '2024/11/13', 'Patient eye pressure improving woth Latanoprost, Advise follow-up after two weeks.', 004, 004),
	   (005, '2024/12/14', 'RSV treatment administered, patient stabilized, Monitor respiratory status for further complication.',005, 005);