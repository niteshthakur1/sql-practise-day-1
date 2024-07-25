create database office_2;
use office_2;
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID)
VALUES 
    (1, 'John', 'Doe', 1),
    (2, 'Jane', 'Smith', 2),
    (3, 'Michael', 'Johnson', 1),
    (4, 'Emily', 'Davis', 3);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES 
    (1, 'Sales'),
    (2, 'Marketing'),
    (3, 'Finance');

SELECT e.firstname,e.lastname,d.departmentname from
employees e inner join departments d on e.departmentid = d.departmentid;


select e.firstname ,e.lastname,coalesce(d.departmentname,'no department') as departmentname
from employees e left join  departments d on e.departmentid=d.departmentid;


select d.departmentname ,coalesce(e.firstname || '' || e.lastname,'no employees') as employees
from departments d left join employees e on d.departmentid = e.departmentid;


SELECT e1.FirstName || ' ' || e1.LastName AS Employee1, e2.FirstName || ' ' || e2.LastName AS Employee2
FROM Employees e1
INNER JOIN Employees e2 ON e1.DepartmentID = e2.DepartmentID AND e1.EmployeeID < e2.EmployeeID;


SELECT e.FirstName || ' ' || e.LastName AS Employee, d.DepartmentName
FROM Employees e
CROSS JOIN Departments d;

