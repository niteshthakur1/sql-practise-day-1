CREATE DATABASE ecommerce;
USE ecommerce;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email) VALUES
(1, 'John', 'Doe', 'john.doe@example.com'),
(2, 'Jane', 'Smith', 'jane.smith@example.com'),
(3, 'Emily', 'Johnson', 'emily.johnson@example.com'),
(4, 'Michael', 'Williams', 'michael.williams@example.com'),
(5, 'Sophia', 'Brown', 'sophia.brown@example.com'),
(6, 'Liam', 'Davis', 'liam.davis@example.com'),
(7, 'Olivia', 'Miller', 'olivia.miller@example.com'),
(8, 'Noah', 'Wilson', 'noah.wilson@example.com'),
(9, 'Ava', 'Moore', 'ava.moore@example.com'),
(10, 'Ethan', 'Taylor', 'ethan.taylor@example.com'),
(11, 'Isabella', 'Anderson', 'isabella.anderson@example.com'),
(12, 'Lucas', 'Thomas', 'lucas.thomas@example.com'),
(13, 'Mia', 'Jackson', 'mia.jackson@example.com'),
(14, 'Jackson', 'White', 'jackson.white@example.com'),
(15, 'Amelia', 'Harris', 'amelia.harris@example.com');

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, Amount) VALUES
(101, 1, '2024-07-01', 250.75),
(102, 1, '2024-07-15', 150.00),
(103, 2, '2024-07-20', 300.00),
(104, 3, '2024-07-25', 450.50),
(105, 4, '2024-07-30', 125.00),
(106, 5, '2024-07-05', 275.50),
(107, 5, '2024-07-12', 320.00),
(108, 6, '2024-07-10', 150.25),
(109, 7, '2024-07-15', 500.00),
(110, 8, '2024-07-18', 200.75),	
(111, 9, '2024-07-22', 100.00),
(112, 10, '2024-07-25', 175.00),
(113, 11, '2024-07-28', 225.00),
(114, 12, '2024-07-29', 300.00),
(115, 13, '2024-07-30', 450.00),
(116, 14, '2024-07-30', 350.50),
(117, 15, '2024-07-31', 125.75),
(118, 1, '2024-07-04', 180.00),
(119, 2, '2024-07-11', 90.00),
(120, 3, '2024-07-17', 275.00);

SELECT C.Firstname,C.lastname,O.Orderid,O.Orderdate,O.amount
FROM Customers C
LEFT JOIN Orders O on C.customerID = O.customerid;


SELECT Customers.FirstName, Customers.LastName
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderID IS NULL;


SELECT Customers.FirstName, Customers.LastName, SUM(Orders.Amount) AS TotalSpent
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName;


SELECT Orders.OrderID, Orders.OrderDate, Orders.Amount,Customers.EMAIL
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Customers.Email LIKE '%@example.com';


SELECT C.Firstname,C.lastname,O.Orderid,O.Orderdate,O.amount
FROM Customers C
INNER JOIN Orders O on C.customerID = O.customerid
WHERE O.orderdate =(
SELECT max(Orderdate)
FROM ORDERS
WHERE O.CustomerID = C.CustomerID
);


SELECT O.Orderid ,O.Orderdate,O.amount,C.Firstname,C.Lastname
FROM Orders O
LEFT JOIN Customers C ON  O.CustomerID = C.CustomerID;


SELECT  C.Firstname,C.Lastname,O.Orderid,O.Orderdate,O.amount
FROM Customers C
left join Orders O ON C.CustomerID= O.CustomerID;


SELECT Customers.FirstName, Customers.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName
ORDER BY NumberOfOrders DESC
LIMIT 1;


SELECT C.firstname,C.lastname,avg(O.amount)as 'avgspent'
FROM Customers C
Join Orders O ON  C. customerid = O.customerid
group by C.customerid, C.firstname,C.lastname;


SELECT count(Orderid) as totalorders
FROM Orders
WHERE orderdate between '2024-07-01' and '2024-07-31';


SELECT Customers.FirstName, Customers.LastName, SUM(Orders.Amount) AS TotalSpent
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName
HAVING SUM(Orders.Amount) > 300;


SELECT Customers.FirstName, Customers.LastName, AVG(Orders.Amount) AS AverageOrderAmount
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName
HAVING COUNT(Orders.OrderID) > 2;


SELECT Customers.FirstName, Customers.LastName, Orders.OrderID, Orders.OrderDate, Orders.Amount
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Orders.OrderDate = (
    SELECT MAX(OrderDate)
    FROM Orders AS o
    WHERE o.CustomerID = Orders.CustomerID
)
AND Customers.CustomerID IN (
    SELECT CustomerID
    FROM Orders
    GROUP BY CustomerID
    HAVING COUNT(OrderID) >= 3
);


