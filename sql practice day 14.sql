CREATE DATABASE practice_9;
USE practice_9;
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Position VARCHAR(50),
    Salary DECIMAL(10, 2)
);
INSERT INTO Employees (EmployeeID, FirstName, LastName, DateOfBirth, Position, Salary)
VALUES (1, 'John', 'Doe', '1985-05-15', 'Software Engineer', 75000.00);


SELECT * FROM Employees;

UPDATE Employees
SET Salary = 80000.00
WHERE EmployeeID = 1;

DELETE FROM Employees
WHERE EmployeeID = 1;

ALTER TABLE Employees
ADD Email VARCHAR(100);
