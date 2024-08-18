CREATE DATABASE CompanyDB;
USE CompanyDB;
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE
);
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate)
VALUES 
(1, 'John', 'Doe', 'HR', 60000.00, '2020-01-15'),
(2, 'Jane', 'Smith', 'IT', 75000.00, '2019-03-12'),
(3, 'Michael', 'Johnson', 'Finance', 80000.00, '2021-07-22'),
(4, 'Emily', 'Davis', 'IT', 72000.00, '2018-10-05'),
(5, 'David', 'Wilson', 'Marketing', 65000.00, '2022-02-18');
SELECT Department, COUNT(*) AS NumberOfEmployees
FROM Employees
GROUP BY Department;

SELECT * FROM Employees
ORDER BY HireDate DESC;

SELECT * FROM Employees
WHERE FirstName LIKE 'J%';

SET SQL_SAFE_UPDATES = 0;

UPDATE Employees
SET Salary = Salary * 1.05
WHERE Department = 'IT';

DELETE FROM Employees
WHERE EmployeeID = 5;

SELECT * FROM Employees
WHERE HireDate > '2020-01-01';

SELECT * FROM Employees
WHERE Salary BETWEEN 60000 AND 80000;



