create  database office ;

use office;
INSERT INTO employees (employee_id, first_name, last_name, department, salary, hire_date)
VALUES
    (101, 'John', 'Doe', 'HR', 50000.00, '2018-01-15'),
    (102, 'Jane', 'Smith', 'IT', 60000.00, '2017-05-20'),
    (103, 'Michael', 'Johnson', 'Sales', 55000.00, '2019-02-10'),
    (104, 'Emily', 'Williams', 'IT', 62000.00, '2016-11-30'),
    (105, 'James', 'Brown', 'HR', 48000.00, '2020-03-25'),
    (106, 'Emma', 'Jones', 'Sales', 58000.00, '2017-08-12'),
    (107, 'Daniel', 'Davis', 'IT', 59000.00, '2018-06-18'),
    (108, 'Olivia', 'Martinez', 'HR', 51000.00, '2019-09-05'),
    (109, 'Alexander', 'Garcia', 'Sales', 54000.00, '2018-04-01'),
    (110, 'Sophia', 'Rodriguez', 'IT', 63000.00, '2020-01-10');
  
  select * from employees;
  
  
  SELECT  distinct  department FROM employees;
  
  select * from employees where salary >55000;
   
   select department , count(first_name) from employees group by department;
   
   SELECT AVG(salary)  FROM employees;
 
SELECT * FROM employees ORDER BY salary desc limit 1;

select * from employees where hire_date>2019-01-01;

set sql_safe_updates = 0;

DELETE FROM employees WHERE hire_date < '2018-01-01';





 
