 CREATE DATABASE Facebook;
USE Facebook;

CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    BirthDate DATE,
    Gender ENUM('Male', 'Female', 'Other'),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO Users (FirstName, LastName, Email, BirthDate, Gender)
VALUES 
('John', 'Doe', 'john.doe@example.com', '1990-05-15', 'Male'),
('Jane', 'Smith', 'jane.smith@example.com', '1985-07-23', 'Female'),
('Alex', 'Johnson', 'alex.johnson@example.com', '2000-01-10', 'Other'),
('Emily', 'Davis', 'emily.davis@example.com', '1995-12-02', 'Female'),
('Michael', 'Brown', 'michael.brown@example.com', '1988-03-30', 'Male');

SELECT * FROM Users;

SELECT * FROM Users WHERE Gender = 'Female';


SELECT * FROM Users WHERE BirthDate > '1990-01-01';

SELECT COUNT(*) FROM Users;

UPDATE Users SET Email = 'alex.j@example.com' WHERE UserID = 3;

SELECT * FROM Users WHERE CreatedAt >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);


SELECT * FROM Users ORDER BY BirthDate ASC;

SELECT AVG(YEAR('2024-08-15') - YEAR(BirthDate)) AS AverageAge FROM Users;

SELECT * FROM Users ORDER BY CreatedAt DESC LIMIT 3;

SELECT CONCAT(FLOOR(YEAR(BirthDate) / 10) * 10, 's') AS Decade, COUNT(*) AS Total
FROM Users
GROUP BY Decade;

SELECT LastName, COUNT(*) AS Total FROM Users GROUP BY LastName HAVING COUNT(*) > 1;


SELECT * FROM Users ORDER BY CreatedAt DESC LIMIT 3;

