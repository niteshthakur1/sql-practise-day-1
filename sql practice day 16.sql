CREATE DATABASE Hospital;
USE Hospital;


CREATE TABLE Patients (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Age INT,
    Gender CHAR(1),
    Diagnosis VARCHAR(255),
    AdmissionDate DATE
);

INSERT INTO Patients (Name, Age, Gender, Diagnosis, AdmissionDate) VALUES
('John Doe', 45, 'M', 'Hypertension', '2024-07-15'),
('Jane Smith', 29, 'F', 'Asthma', '2024-07-20'),
('Emily Davis', 34, 'F', 'Diabetes', '2024-07-25'),
('Michael Brown', 50, 'M', 'Heart Disease', '2024-07-30'),
('Sarah Johnson', 42, 'F', 'Migraine', '2024-08-01');

select * from patients;

select * from patients 
where age  > 40;

select * from patients 
where gender = 'F';

SELECT  * FROM PATIENTS
where admissiondate between 2024-07-01 and 2024-07-31;


select * from patients
order by  age  desc
limit 1;

update patients
set diagnosis = 'cancer'
where patientid = 1;

delete from patients where patientid = 1;