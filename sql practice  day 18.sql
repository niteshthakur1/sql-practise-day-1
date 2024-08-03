CREATE DATABASE BankDB;
USE BankDB;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Address VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    AccountBalance DECIMAL(15, 2)
);
INSERT INTO Customers (CustomerID, FirstName, LastName, DateOfBirth, Address, City, State, ZipCode, AccountBalance)
VALUES
(1, 'John', 'Doe', '1980-01-15', '123 Elm St', 'Springfield', 'IL', '62701', 1200.50),
(2, 'Jane', 'Smith', '1990-05-22', '456 Oak St', 'Chicago', 'IL', '60611', 2500.75),
(3, 'Sam', 'Brown', '1975-08-30', '789 Pine St', 'Naperville', 'IL', '60540', 3750.00),
(4, 'Nancy', 'Davis', '1985-12-05', '101 Maple St', 'Peoria', 'IL', '61602', 1800.40),
(5, 'Mike', 'Wilson', '1995-03-10', '202 Birch St', 'Champaign', 'IL', '61820', 1500.25);


SELECT * FROM Customers WHERE City = 'Chicago';

SELECT * FROM Customers ORDER BY AccountBalance DESC LIMIT 1;

SELECT AVG(AccountBalance) AS AverageBalance FROM Customers;

SELECT * FROM Customers WHERE DateOfBirth < '1985-01-01';

UPDATE Customers
SET AccountBalance = AccountBalance + 500
WHERE CustomerID = 3;
