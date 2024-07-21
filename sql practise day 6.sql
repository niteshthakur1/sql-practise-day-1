create database office_1;
use office_1;
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary)
VALUES
    (1, 'John', 'Doe', 'IT', 60000.00),
    (2, 'Jane', 'Smith', 'HR', 55000.00),
    (3, 'Michael', 'Johnson', 'Finance', 65000.00),
    (4, 'Emily', 'Brown', 'IT', 62000.00),
    (5, 'David', 'Williams', 'Finance', 68000.00),
    (6, 'Sarah', 'Jones', 'HR', 58000.00);

select * from  employees;

SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

SELECT Department, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department
ORDER BY AvgSalary DESC
LIMIT 1;

SELECT FirstName, LastName, Department
FROM Employees
WHERE Department = (SELECT Department FROM Employees WHERE FirstName = 'John' AND LastName = 'Doe');

SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary = (SELECT MAX(Salary) FROM Employees);


SELECT DISTINCT Department
FROM Employees e1
WHERE NOT EXISTS (
    SELECT *
    FROM Employees e2
    WHERE e2.Department = e1.Department AND e2.Salary <= 50000
);


