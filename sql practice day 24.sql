CREATE DATABASE Universities;
USE Universities;
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL,
    DepartmentHead VARCHAR(50)
);
CREATE TABLE Professors (
    ProfessorID INT PRIMARY KEY,
    ProfessorName VARCHAR(50) NOT NULL,
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    DepartmentID INT,
    Credits INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50) NOT NULL,
    EnrollmentYear INT,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentHead) VALUES
(1, 'Computer Science', 'Dr. Smith'),
(2, 'Mathematics', 'Dr. Johnson'),
(3, 'Physics', 'Dr. Davis');

INSERT INTO Professors (ProfessorID, ProfessorName, DepartmentID, Salary) VALUES
(1, 'Dr. Allen', 1, 90000.00),
(2, 'Dr. Baker', 1, 85000.00),
(3, 'Dr. Carter', 2, 80000.00),
(4, 'Dr. Daniels', 3, 95000.00);

INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits) VALUES
(1, 'Data Structures', 1, 4),
(2, 'Calculus', 2, 3),
(3, 'Quantum Physics', 3, 4),
(4, 'Algorithms', 1, 4);


INSERT INTO Students (StudentID, StudentName, EnrollmentYear, DepartmentID) VALUES
(1, 'John Doe', 2021, 1),
(2, 'Jane Smith', 2020, 2),
(3, 'Michael Johnson', 2022, 3),
(4, 'Emily Davis', 2021, 1);


SELECT * FROM DEPARTMENTS;
SELECT * FROM PROFESSORS;
SELECT * FROM COURSES;
SELECT * FROM STUDENTS;

SELECT StudentName 
from STUDENTS
WHERE DEPARTMENTID = (SELECT DEPARTMENTID FROM DEPARTMENTS
WHERE DEPARTMENTNAME = 'COMPUTER SCIENCE');																						

SELECT DepartmentID,avg(SALARY) AS AVERAGE_SALARY FROM PROFESSORS
group by DepartmentID;


SELECT ProfessorName 
FROM Professors p 
WHERE Salary > (SELECT AVG(Salary) FROM Professors WHERE DepartmentID = p.DepartmentID);

ALTER TABLE STUDENTS add EMAIL VARCHAR(100);

SELECT CourseName, DepartmentName 
FROM Courses 
INNER JOIN Departments ON Courses.DepartmentID = Departments.DepartmentID;

SELECT DepartmentName, ProfessorName 
FROM Departments 
LEFT JOIN Professors ON Departments.DepartmentID = Professors.DepartmentID;

SELECT ProfessorName, DepartmentName 
FROM Professors 
RIGHT JOIN Departments ON Professors.DepartmentID = Departments.DepartmentID;



