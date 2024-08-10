
CREATE DATABASE Amazon;
USE Amazon;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(50),
    Country VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Product VARCHAR(100),
    OrderDate DATE,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers (CustomerID, Name, Email, Country)
VALUES
(1, 'John Doe', 'johndoe@example.com', 'USA'),
(2, 'Jane Smith', 'janesmith@example.com', 'UK'),
(3, 'Alice Johnson', 'alicej@example.com', 'Canada'),
(4, 'Bob Brown', 'bobb@example.com', 'USA');


INSERT INTO Orders (OrderID, CustomerID, Product, OrderDate, Amount)
VALUES
(101, 1, 'Laptop', '2024-08-01', 1200.00),
(102, 2, 'Tablet', '2024-08-02', 600.00),
(103, 1, 'Smartphone', '2024-08-03', 800.00),
(104, 3, 'Monitor', '2024-08-04', 300.00),
(105, 4, 'Keyboard', '2024-08-05', 50.00);


SELECT * FROM Customers 
WHERE Country =  'USA';


SELECT * FROM Orders
WHERE Amount > 500;

SELECT C.Name ,O.Amount
FROM CUSTOMERS C
Join Orders O on C.Customerid = O.Customerid
where Amount >1000;

SELECT Name  FROM Customers
WHERE Customerid = (SELECT Customerid FROM Orders
order by Amount Desc limit 1);


SELECT C.Name , sum(O.Amount)
FROM CUSTOMERS C
JOIN ORDERS O ON C.Customerid = O.Customerid
group by C.NAME;

SELECT avg(Amount) as average_amount FROM
Orders ; 	


SELECT Orders.OrderID, Customers.Name, Orders.Product, Orders.Amount
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

SELECT Customers.Name FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderID IS NULL;

ALTER TABLE Customers ADD PhoneNumber VARCHAR(15);

ALTER TABLE Customers DROP COLUMN Email;

CREATE INDEX idx_order_date ON Orders(OrderDate);

SELECT Name FROM Customers WHERE CustomerID = 
(SELECT CustomerID FROM Orders GROUP BY CustomerID ORDER BY SUM(Amount) DESC LIMIT 1);

SELECT Product, COUNT(*) AS NumberOfOrders FROM Orders GROUP BY Product;




