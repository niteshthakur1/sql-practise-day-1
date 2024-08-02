-- Create the e-commerce database
CREATE DATABASE ecommerce_1;

-- Switch to the e-commerce database
USE ecommerce_1;

-- Create a table for products
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);

-- Create a table for customers
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

-- Create a table for orders
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create a table for order items
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert some products
INSERT INTO products (product_name, category, price, stock) VALUES
('Laptop', 'Electronics', 999.99, 50),
('Smartphone', 'Electronics', 699.99, 100),
('Tablet', 'Electronics', 299.99, 75),
('Headphones', 'Accessories', 89.99, 200),
('Charger', 'Accessories', 19.99, 500);

-- Insert some customers
INSERT INTO customers (first_name, last_name, email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com'),
('Alice', 'Johnson', 'alice.johnson@example.com'),
('Bob', 'Brown', 'bob.brown@example.com');

-- Insert some orders
INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2024-07-01', 1089.98),
(2, '2024-07-02', 1399.98),
(3, '2024-07-03', 299.99);

-- Insert some order items
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 999.99),
(1, 5, 5, 89.99),
(2, 2, 2, 699.99),
(3, 3, 1, 299.99);




select * from products;
select * from customers;
select * from orders;
select * from order_items;


select product_name from products
where  category = 'Electronics';

select sum(stock) as total_stock from products;

select * from customers
join orders on customers.customer_id=orders.customer_id;




SELECT c.first_name, c.last_name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

select * from products 
order by price desc
limit 3;

SELECT o.order_id, o.order_date, p.product_name, oi.quantity, oi.price
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

SELECT AVG(total_amount) AS average_order_value
FROM orders;

SELECT DISTINCT c.first_name, c.last_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE p.product_name = 'Laptop';


