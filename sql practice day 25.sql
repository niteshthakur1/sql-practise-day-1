CREATE DATABASE world_universities;
USE world_universities;

CREATE TABLE universities (
    university_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    country VARCHAR(100) NOT NULL,
    established_year INT,
    student_population INT,
    ranking INT
);
INSERT INTO universities (name, country, established_year, student_population, ranking)
VALUES 
('Harvard University', 'United States', 1636, 21000, 1),
('University of Cambridge', 'United Kingdom', 1209, 24000, 3),
('Stanford University', 'United States', 1885, 17000, 2),
('University of Tokyo', 'Japan', 1877, 30000, 25),
('University of Sydney', 'Australia', 1850, 70000, 38),
('Tsinghua University', 'China', 1911, 49000, 15),
('University of Toronto', 'Canada', 1827, 90000, 26);

CREATE TABLE faculties (
    faculty_id INT AUTO_INCREMENT PRIMARY KEY,
    faculty_name VARCHAR(255) NOT NULL,
    university_id INT,
    FOREIGN KEY (university_id) REFERENCES universities(university_id)
);

INSERT INTO faculties (faculty_name, university_id)
VALUES 
('Faculty of Arts and Sciences', 1),
('Faculty of Medicine', 1),
('Faculty of Engineering', 2),
('Faculty of Law', 2),
('Faculty of Computer Science', 3),
('Faculty of Engineering', 3),
('Faculty of Economics', 4),
('Faculty of Science', 5);

SELECT u.name AS University, f.faculty_name AS Faculty
FROM universities u
INNER JOIN faculties f ON u.university_id = f.university_id;

SELECT u.name AS University, f.faculty_name AS Faculty
FROM universities u
LEFT JOIN faculties f ON u.university_id = f.university_id;

SELECT u.name AS University, f.faculty_name AS Faculty
FROM universities u
RIGHT JOIN faculties f ON u.university_id = f.university_id;

SELECT AVG(student_population) AS Average_Student_Population
FROM universities;

SELECT country, SUM(student_population) AS Total_Students
FROM universities
GROUP BY country;

SELECT name, student_population
FROM universities
WHERE student_population = (SELECT MAX(student_population) FROM universities);

SELECT u.name, u.country, u.student_population
FROM universities u
WHERE u.student_population > 
      (SELECT AVG(student_population) 
       FROM universities 
       WHERE country = u.country);

SELECT name, country, established_year FROM universities WHERE established_year < 1900;

SELECT country, COUNT(*) AS University_Count
FROM universities
GROUP BY country
HAVING COUNT(*) > 1;

SELECT faculty_name
FROM faculties
GROUP BY faculty_name
HAVING COUNT(university_id) = 1;
