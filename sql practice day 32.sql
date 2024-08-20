-- Create the Universities Database
CREATE DATABASE Universities_1;

-- Use the Universities Database
USE Universities_1;

-- Create the Universities Table
CREATE TABLE UniversityRankings (
    UniversityID INT PRIMARY KEY AUTO_INCREMENT,
    UniversityName VARCHAR(255),
    Country VARCHAR(100),
    QSWorldRank INT,
    QSWorldScore DECIMAL(5, 2)
);

-- Insert Sample Data into UniversityRankings
INSERT INTO UniversityRankings (UniversityName, Country, QSWorldRank, QSWorldScore) VALUES
('Massachusetts Institute of Technology (MIT)', 'United States', 1, 100.00),
('Stanford University', 'United States', 2, 98.60),
('Harvard University', 'United States', 3, 97.90),
('University of Cambridge', 'United Kingdom', 4, 97.50),
('University of Oxford', 'United Kingdom', 5, 97.20),
('California Institute of Technology (Caltech)', 'United States', 6, 96.50),
('ETH Zurich - Swiss Federal Institute of Technology', 'Switzerland', 7, 95.80),
('University College London (UCL)', 'United Kingdom', 8, 94.70),
('Imperial College London', 'United Kingdom', 9, 94.00),
('University of Chicago', 'United States', 10, 93.50);

-- Create Countries Table
CREATE TABLE Countries (
    CountryID INT PRIMARY KEY AUTO_INCREMENT,
    CountryName VARCHAR(100),
    Region VARCHAR(100)
);

-- Insert Sample Data into Countries Table
INSERT INTO Countries (CountryName, Region) VALUES
('United States', 'North America'),
('United Kingdom', 'Europe'),
('Switzerland', 'Europe');


-- Create Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    UniversityID INT,
    DepartmentName VARCHAR(255),
    FacultyCount INT,
    StudentCount INT,
    FOREIGN KEY (UniversityID) REFERENCES UniversityRankings(UniversityID)
);

-- Insert Sample Data into Departments
INSERT INTO Departments (UniversityID, DepartmentName, FacultyCount, StudentCount) VALUES
(1, 'Computer Science', 120, 2000),
(1, 'Engineering', 150, 2500),
(2, 'Computer Science', 110, 1800),
(2, 'Business', 100, 1500),
(3, 'Law', 90, 1400),
(4, 'Engineering', 130, 2300),
(4, 'Computer Science', 100, 1900),
(5, 'Medicine', 160, 2200),
(5, 'Computer Science', 80, 1700),
(6, 'Physics', 70, 1200);

SELECT UniversityRankings.UniversityName, UniversityRankings.QSWorldRank, Countries.Region
FROM UniversityRankings
JOIN Countries ON UniversityRankings.Country = Countries.CountryName;

SELECT Country, COUNT(*) AS NumberOfUniversities
FROM UniversityRankings
GROUP BY Country;

SELECT U.UniversityName, U.QSWorldRank
FROM UniversityRankings U
JOIN Departments D ON U.UniversityID = D.UniversityID
WHERE D.DepartmentName = 'Computer Science' AND D.StudentCount > 1000;
;

SELECT U.UniversityName, SUM(D.StudentCount) AS TotalStudents
FROM UniversityRankings U
JOIN Departments D ON U.UniversityID = D.UniversityID
GROUP BY U.UniversityName;

SELECT U.UniversityName, SUM(D.StudentCount) AS TotalStudents
FROM UniversityRankings U
JOIN Departments D ON U.UniversityID = D.UniversityID
GROUP BY U.UniversityName
HAVING SUM(D.StudentCount) > 5000;


SELECT U.UniversityName, SUM(D.FacultyCount) AS TotalFaculty
FROM UniversityRankings U
JOIN Departments D ON U.UniversityID = D.UniversityID
GROUP BY U.UniversityName
ORDER BY TotalFaculty DESC;

SELECT DepartmentName
FROM Departments D1
WHERE FacultyCount > (
    SELECT AVG(FacultyCount) 
    FROM Departments D2 
    WHERE D2.UniversityID = D1.UniversityID
);

