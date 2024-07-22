CREATE DATABASE employees_1;
USE employees_1;
CREATE TABLE employees(
emp_id int PRIMARY KEY ,
emp_name VARCHAR(20)NOT NULL ,
emp_salary DECIMAL(10,2) NOT NULL
);

CREATE TABLE departments(
dept_id INT PRIMARY KEY,
dept_name VARCHAR(20),
emp_id INT,
FOREIGN KEY(emp_id) REFERENCES employees(emp_id)
);

insert INTO employees(emp_id,emp_name,emp_salary)
VALUES
(101,'NITESH',34000.00),
(102,'SUMIT',44000.00),
(103,'HARSH',55000.00),
(104,'PIYUSH',66000.00),
(105,'AMAN',77000.00),
(106,'PRASHANT',22000.00),
(107,'John Doe', 50000.00), 
(108,'Jane Smith', 60000.00), 
(109,'Michael Johnson', 55000.00), 
(110,'Emily Brown', 52000.00),
(111,'Robert Lee', 58000.00),
(112,'Lisa Davis', 54000.00);

INSERT INTO departments(dept_id,dept_name,emp_id)
VALUES
(1,'HR',101),
(2,'OPERATION',102),
(3,'MARKETING',103),
(4,'DATA ANALYTICS',104),
(5,'FINANCE',105),
(6,'IT',106);


SELECT *FROM employees;
SELECT *FROM departments;

SELECT emp_id ,emp_name from employees
where emp_id =(SELECT emp_id from  departments
      where dept_name = 'IT'
      );
      
      
SELECT avg(emp_salary) as averagesalary from employees
where emp_id = (
    SELECT emp_id FROM departments 
	where dept_name = 'finance'
    );
    

SELECT max(emp_salary) from employees;

UPDATE employees
SET emp_salary =97000.00
WHERE emp_id = 101;

SELECT sum(EMP_SALARY) as total FROM EMPLOYEES;


SELECT count(dept_name) from departments;

SELECT emp_name,emp_salary FROM employees
order by emp_salary desc
limit 1;