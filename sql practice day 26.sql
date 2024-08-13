CREATE DATABASE SwiggyDB;

USE SwiggyDB;

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15),
    Address VARCHAR(255)
);

-- Create Restaurants Table
CREATE TABLE Restaurants (
    RestaurantID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15)
);

-- Create MenuItems Table
CREATE TABLE MenuItems (
    MenuItemID INT PRIMARY KEY AUTO_INCREMENT,
    RestaurantID INT,
    Name VARCHAR(100),
    Price DECIMAL(10, 2),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    RestaurantID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);

-- Create OrderItems Table
CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    MenuItemID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (MenuItemID) REFERENCES MenuItems(MenuItemID)
);

-- Insert into Customers
INSERT INTO Customers (Name, Email, PhoneNumber, Address) VALUES
('John Doe', 'john@example.com', '1234567890', '123 Elm St, City'),
('Jane Smith', 'jane@example.com', '0987654321', '456 Oak St, City');

-- Insert into Restaurants
INSERT INTO Restaurants (Name, Address, PhoneNumber) VALUES
('Pizza Palace', '789 Maple St, City', '1112223333'),
('Burger Haven', '101 Pine St, City', '4445556666');

-- Insert into MenuItems
INSERT INTO MenuItems (RestaurantID, Name, Price) VALUES
(1, 'Pepperoni Pizza', 12.99),
(1, 'Cheese Pizza', 10.99),
(2, 'Classic Burger', 8.99),
(2, 'Veggie Burger', 7.99);

-- Insert into Orders
INSERT INTO Orders (CustomerID, RestaurantID, OrderDate, TotalAmount) VALUES
(1, 1, '2024-08-12 12:34:56', 23.98),
(2, 2, '2024-08-13 13:45:00', 16.98);

-- Insert into OrderItems
INSERT INTO OrderItems (OrderID, MenuItemID, Quantity, Price) VALUES
(1, 1, 1, 12.99),
(1, 2, 1, 10.99),
(2, 3, 1, 8.99),
(2, 4, 1, 7.99);


SELECT Name, Email FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID FROM Orders
    WHERE RestaurantID = (
        SELECT RestaurantID FROM Restaurants WHERE Name = 'Pizza Palace'
    )
);


SELECT Orders.OrderID, Customers.Name AS CustomerName, Restaurants.Name AS RestaurantName, Orders.OrderDate, Orders.TotalAmount
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN Restaurants ON Orders.RestaurantID = Restaurants.RestaurantID;

SELECT Restaurants.Name AS RestaurantName, SUM(Orders.TotalAmount) AS TotalRevenue
FROM Orders
JOIN Restaurants ON Orders.RestaurantID = Restaurants.RestaurantID
GROUP BY Restaurants.Name;

SELECT Restaurants.Name AS RestaurantName, MenuItems.Name AS MenuItemName, SUM(OrderItems.Quantity) AS TotalQuantity
FROM OrderItems
JOIN MenuItems ON OrderItems.MenuItemID = MenuItems.MenuItemID
JOIN Restaurants ON MenuItems.RestaurantID = Restaurants.RestaurantID
GROUP BY Restaurants.Name, MenuItems.Name
ORDER BY Restaurants.Name, TotalQuantity DESC;


