CREATE DATABASE PracticeDB;
USE practiceDB;
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    HireDate DATE
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary, HireDate) VALUES
(1, 'John', 'Doe', 101, 60000.00, '2020-01-15'),
(2, 'Jane', 'Smith', 102, 65000.00, '2019-02-20'),
(3, 'Michael', 'Johnson', 103, 70000.00, '2018-03-10'),
(4, 'Emily', 'Davis', 101, 72000.00, '2021-04-25'),
(5, 'David', 'Wilson', 102, 68000.00, '2022-05-30');


CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(101, 'Human Resources'),
(102, 'Finance'),
(103, 'IT');


SELECT Employees.FirstName, Employees.LastName, Departments.DepartmentName
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;


SELECT Employees.FirstName, Employees.LastName, Departments.DepartmentName
FROM Employees
LEFT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;


SELECT Employees.FirstName, Employees.LastName, Departments.DepartmentName
FROM Employees
RIGHT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;



SELECT Employees.FirstName, Employees.LastName, Departments.DepartmentName
FROM Employees
CROSS JOIN Departments;


SELECT E1.FirstName AS Employee1, E2.FirstName AS Employee2, E1.DepartmentID
FROM Employees E1, Employees E2
WHERE E1.DepartmentID = E2.DepartmentID AND E1.EmployeeID <> E2.EmployeeID;

