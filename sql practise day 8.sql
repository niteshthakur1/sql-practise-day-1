CREATE DATABASE restraunt;
USE restraunt;
CREATE TABLE Restaurants (
    restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    address VARCHAR(255),
    phone VARCHAR(20),
    rating DECIMAL(3,1),
    cuisine VARCHAR(50)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    restaurant_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

CREATE TABLE MenuItems (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT,
    name VARCHAR(100),
    price DECIMAL(10,2),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

-- Inserting into Restaurants table
INSERT INTO Restaurants (name, address, phone, rating, cuisine)
VALUES ('Restaurant A', '123 Main St, City, Country', '123-456-7890', 4.5, 'Italian'),
       ('Restaurant B', '456 Oak St, City, Country', '987-654-3210', 4.2, 'Mexican'),
       ('Restaurant C', '789 Elm St, City, Country', '111-222-3333', 4.8, 'Japanese'),
       ('Restaurant D', '321 Pine St, City, Country', '444-555-6666', 4.4, 'Indian'),
       ('Restaurant E', '555 Maple St, City, Country', '777-888-9999', 4.7, 'Thai');


-- Inserting into Customers table
INSERT INTO Customers (name, email, phone)
VALUES ('John Doe', 'john.doe@example.com', '555-1234'),
       ('Jane Smith', 'jane.smith@example.com', '555-5678'),
       ('Emily Johnson', 'emily.j@example.com', '555-1111'),
       ('Michael Brown', 'michael.b@example.com', '555-2222'),
       ('Sophia Davis', 'sophia.d@example.com', '555-3333');


-- Inserting into Orders table
INSERT INTO Orders (customer_id, restaurant_id, order_date, total_amount)
VALUES (1, 1, '2024-07-20', 45.67),
       (2, 2, '2024-07-21', 32.50),
       (1, 1, '2024-07-22', 55.00),
       (2, 3, '2024-07-23', 42.75),
       (3, 2, '2024-07-22', 30.50),
       (4, 4, '2024-07-23', 25.00),
       (5, 1, '2024-07-23', 48.99);


-- Inserting into MenuItems table
INSERT INTO MenuItems (restaurant_id, name, price)
VALUES (1, 'Spaghetti Carbonara', 12.99),
       (1, 'Margherita Pizza', 9.99),
       (2, 'Tacos', 8.50),
       (1, 'Lasagna', 14.99),
       (1, 'Tiramisu', 7.99),
       (2, 'Burrito', 9.50),
       (2, 'Enchiladas', 10.99),
       (3, 'Sushi Combo', 18.75),
       (3, 'Tempura', 12.50),
       (4, 'Butter Chicken', 13.99),
       (4, 'Naan', 2.99),
       (5, 'Pad Thai', 11.50),
       (5, 'Green Curry', 12.75);
       
       
	SELECT * FROM Restaurants;
    
	SELECT * FROM Customers;
    
	SELECT * FROM Orders;
    
	SELECT * FROM MenuItems;
        
    
SELECT name, rating
FROM Restaurants
WHERE rating > 4.0;


SELECT DISTINCT c.*
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id;


SELECT COUNT(*) AS TOTAL_ORDERS FROM ORDERS;

SELECT r.name, AVG(mi.price) AS average_price
FROM Restaurants r
LEFT JOIN MenuItems mi ON r.restaurant_id = mi.restaurant_id
GROUP BY r.name;
						

SELECT DISTINCT c.*
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id
INNER JOIN Restaurants r ON o.restaurant_id = r.restaurant_id
WHERE r.rating > 4.5;




