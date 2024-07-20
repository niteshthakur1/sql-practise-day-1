create database employee_1;
use employee_1;
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate)
VALUES (1, 'John', 'Doe', 'Sales', 60000.00, '2020-01-15');

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate)
VALUES (2, 'Jane', 'Smith', 'Finance', 65000.00, '2021-03-20');

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate)
VALUES (3, 'Mike', 'Johnson', 'Sales', 58000.00, '2020-07-10');

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate)
VALUES (4, 'Emily', 'Davis', 'HR', 55000.00, '2022-02-05');

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate)
VALUES (5, 'Sam', 'Brown', 'Sales', 62000.00, '2021-09-18');

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate)
VALUES (6, 'Lisa', 'Wilson', 'Finance', 70000.00, '2020-11-30');
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate)
VALUES (7, 'Michael', 'Miller', 'IT', 68000.00, '2022-05-12');

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate)
VALUES (8, 'Sarah', 'Lee', 'Marketing', 63000.00, '2021-11-25');

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate)
VALUES (9, 'David', 'Clark', 'Finance', 7200000, '2019-08-03');

SELECT * FROM employees;

SELECT firstname,lastname FROM employees;

SELECT firstname,lastname FROM employees
where 	department = 'sales';

SELECT MAX(Salary) AS HighestSalary
FROM Employees;

SELECT department,AVG(salary) FROM employees
group by department
limit 1;

SELECT year(hiredate) as hireyear,count(*) as numemployees from employees
group by year(hiredate);




