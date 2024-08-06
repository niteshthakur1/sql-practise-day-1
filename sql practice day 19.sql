CREATE DATABASE Hospital_1;
USE Hospital_1;
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Gender VARCHAR(10),
    Disease VARCHAR(100),
    DoctorID INT
);

INSERT INTO Patients (PatientID, FirstName, LastName, Age, Gender, Disease, DoctorID) VALUES
(1, 'John', 'Doe', 25, 'Male', 'Flu', 101),
(2, 'Jane', 'Smith', 30, 'Female', 'Diabetes', 102),
(3, 'Sam', 'Brown', 45, 'Male', 'Hypertension', 103),
(4, 'Lisa', 'White', 50, 'Female', 'Arthritis', 101),
(5, 'Mike', 'Davis', 35, 'Male', 'Asthma', 104);



CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialty VARCHAR(100)
);

INSERT INTO Doctors (DoctorID, FirstName, LastName, Specialty) VALUES
(101, 'Alice', 'Green', 'General Practitioner'),
(102, 'Bob', 'White', 'Endocrinologist'),
(103, 'Charlie', 'Black', 'Cardiologist'),
(104, 'Daisy', 'Yellow', 'Pulmonologist');


SELECT * FROM Doctors;
SELECT * FROM patients;

UPDATE Patients
SET Age = 46
WHERE Patientid = 3;

SELECT firstname,lastname from patients
where  Doctorid = 101;
 
SELECT distinct d.firstname,d.lastname
from Doctors d
Join patients p on d.doctorid = p.doctorid
where p.age >40;

SELECT P.firstname as Patientfirstname ,P.lastname as Patientlastname,d.firstname as doctorfirstname, d.lastname as doctorlastname
from patients p
join doctors d on p.doctorid = d.doctorid;

SELECT avg(P.AGE) as average_age from patients p;

SELECT p.PatientID, p.FirstName AS PatientFirstName, p.LastName AS PatientLastName,
       d.DoctorID, d.FirstName AS DoctorFirstName, d.LastName AS DoctorLastName
FROM Patients p
INNER JOIN Doctors d ON p.DoctorID = d.DoctorID;


SELECT p.PatientID, p.FirstName AS PatientFirstName, p.LastName AS PatientLastName,
       d.DoctorID, d.FirstName AS DoctorFirstName, d.LastName AS DoctorLastName
FROM Patients p
LEFT JOIN Doctors d ON p.DoctorID = d.DoctorID;


SELECT p.PatientID, p.FirstName AS PatientFirstName, p.LastName AS PatientLastName,
       d.DoctorID, d.FirstName AS DoctorFirstName, d.LastName AS DoctorLastName
FROM Patients p
RIGHT JOIN Doctors d ON p.DoctorID = d.DoctorID;



