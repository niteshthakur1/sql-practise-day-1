create database practice_1;
use practice_1;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2),
    hire_date DATE
);
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO employees (emp_id, first_name, last_name, department_id, salary, hire_date) VALUES
(1, 'John', 'Doe', 1, 50000, '2020-01-15'),
(2, 'Jane', 'Smith', 2, 80000, '2019-03-23'),
(3, 'Mike', 'Johnson', 2, 60000, '2021-11-30'),
(4, 'Emily', 'Davis', 3, 70000, '2018-07-12'),
(5, 'William', 'Brown', 4, 90000, '2020-06-01'),
(6, 'Emma', 'Wilson', 1, 55000, '2019-08-19');




INSERT INTO departments (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Marketing'),
(4, 'Finance');


SELECT * FROM employees WHERE department_id = 2;

SELECT e.emp_id, e.first_name, e.last_name, d.dept_name
FROM employees e
JOIN departments d ON e.department_id = d.dept_id;


SELECT * FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);


SELECT d.dept_name, COUNT(e.emp_id) AS num_employees
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.department_id
GROUP BY d.dept_name;


SELECT e.emp_id, e.first_name, e.last_name, d.dept_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.dept_id;


SELECT e1.first_name AS emp1, e1.salary AS salary1, e2.first_name AS emp2, e2.salary AS salary2, d.dept_name
FROM employees e1
JOIN employees e2 ON e1.department_id = e2.department_id AND e1.salary > e2.salary
JOIN departments d ON e1.department_id = d.dept_id;


SELECT d.dept_name, SUM(e.salary) AS total_salary
FROM employees e
JOIN departments d ON e.department_id = d.dept_id
GROUP BY d.dept_name;


SELECT d.dept_name, AVG(e.salary) AS avg_salary
FROM employees e
JOIN departments d ON e.department_id = d.dept_id
GROUP BY d.dept_name
HAVING AVG(e.salary) > 60000;


SELECT e.emp_id, e.first_name, e.last_name, e.salary, d.dept_name
FROM employees e
JOIN departments d ON e.department_id = d.dept_id
WHERE e.salary = (SELECT MAX(salary) FROM employees WHERE department_id = e.department_id);

