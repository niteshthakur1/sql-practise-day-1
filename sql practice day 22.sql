CREATE DATABASE bank;
USE bank;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Address VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(50)
);
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    AccountID INT,
    TransactionDate DATE,
    Amount DECIMAL(10, 2),
    TransactionType VARCHAR(10),
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);
INSERT INTO Customers (FirstName, LastName, Address, Phone, Email)
VALUES
('John', 'Doe', '123 Elm St', '123-456-7890', 'john.doe@example.com'),
('Jane', 'Smith', '456 Oak St', '987-654-3210', 'jane.smith@example.com'),
('Alice', 'Johnson', '789 Pine St', '456-789-0123', 'alice.johnson@example.com');

INSERT INTO Accounts (CustomerID, AccountType, Balance)
VALUES
(1, 'Savings', 5000.00),
(1, 'Checking', 1500.00),
(2, 'Savings', 3000.00),
(3, 'Checking', 1200.00);

INSERT INTO Transactions (AccountID, TransactionDate, Amount, TransactionType)
VALUES
(1, '2024-08-01', 200.00, 'Deposit'),
(1, '2024-08-03', 50.00, 'Withdrawal'),
(2, '2024-08-05', 150.00, 'Deposit'),
(3, '2024-08-07', 100.00, 'Withdrawal'),
(4, '2024-08-09', 200.00, 'Deposit');

SELECT count(*) as Savings_customers 
FROM Accounts 
Where AccountType = 'Savings';

SELECT sum(Balance) from Accounts;

Select * from 
Transactions where ACCOUNTID = 1;

SELECT c.FirstName, c.LastName, a.Balance 
FROM Customers c
JOIN Accounts a ON c.CustomerID = a.CustomerID
ORDER BY a.Balance DESC
LIMIT 1;

SELECT AVG(Amount) AS AvgTransactionAmount
FROM Transactions;

SELECT COUNT(*) AS TotalDeposits
FROM Transactions
WHERE TransactionType = 'Deposit';

SELECT DISTINCT c.FirstName, c.LastName
FROM Customers c
JOIN Accounts a ON c.CustomerID = a.CustomerID
JOIN Transactions t ON a.AccountID = t.AccountID
WHERE t.TransactionType = 'Withdrawal';

