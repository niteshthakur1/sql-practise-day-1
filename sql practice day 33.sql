create database flipkart;

use flipkart;
-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10)
);

-- Create the Categories table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);

-- Create the Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2),
    StockQuantity INT,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create the OrderDetails table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert data into Customers table
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, PhoneNumber, Address, City, State, ZipCode)
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '1234567890', '123 Elm St', 'Bangalore', 'Karnataka', '560001'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '0987654321', '456 Oak St', 'Mumbai', 'Maharashtra', '400001');

-- Insert data into Categories table
INSERT INTO Categories (CategoryID, CategoryName)
VALUES
(1, 'Electronics'),
(2, 'Books'),
(3, 'Clothing');

-- Insert data into Products table
INSERT INTO Products (ProductID, ProductName, Price, StockQuantity, CategoryID)
VALUES
(1, 'iPhone 13', 799.99, 50, 1),
(2, 'Samsung Galaxy S21', 699.99, 30, 1),
(3, 'The Great Gatsby', 10.99, 100, 2),
(4, 'Levi\'s Jeans', 59.99, 200, 3);

-- Insert data into Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(1, 1, '2024-08-01', 810.98),
(2, 2, '2024-08-02', 769.98);

-- Insert data into OrderDetails table
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, Price)
VALUES
(1, 1, 1, 1, 799.99),
(2, 1, 3, 1, 10.99),
(3, 2, 2, 1, 699.99),
(4, 2, 4, 1, 59.99);

SELECT OrderID, OrderDate, TotalAmount
FROM Orders
WHERE CustomerID = 1;

SELECT Products.ProductName, OrderDetails.Quantity, OrderDetails.Price
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE OrderDetails.OrderID = 1;

SELECT Products.ProductName, SUM(OrderDetails.Quantity * OrderDetails.Price) AS TotalSales
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY Products.ProductName;

SELECT ProductName, StockQuantity
FROM Products
WHERE StockQuantity < 50;


SELECT FirstName, LastName, Email, PhoneNumber
FROM Customers
WHERE City = 'Bangalore';

SELECT Categories.CategoryName, SUM(OrderDetails.Quantity * OrderDetails.Price) AS TotalAmount
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
JOIN Categories ON Products.CategoryID = Categories.CategoryID
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
GROUP BY Categories.CategoryName;

SELECT Customers.FirstName, Customers.LastName, SUM(Orders.TotalAmount) AS TotalSpent
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.FirstName, Customers.LastName
ORDER BY TotalSpent DESC
LIMIT 1;


