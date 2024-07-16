CREATE DATABASE data;
USE data;

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    SaleDate DATE,
    SaleAmount DECIMAL(10, 2),
    Quantity INT,
    Region VARCHAR(50),
    PaymentMethod VARCHAR(50)
);

INSERT INTO Sales (SaleID, ProductID, CustomerID, SaleDate, SaleAmount, Quantity, Region, PaymentMethod) VALUES
(1, 101, 1001, '2023-01-05', 150.00, 2, 'North', 'Credit Card'),
(2, 102, 1002, '2023-01-10', 75.50, 1, 'South', 'Cash'),
(3, 103, 1003, '2023-01-15', 200.25, 3, 'West', 'Credit Card'),
(4, 104, 1004, '2023-01-20', 50.00, 1, 'East', 'Credit Card'),
(5, 105, 1005, '2023-01-25', 120.75, 2, 'North', 'Cash'),
(6, 106, 1006, '2023-02-01', 80.50, 1, 'South', 'Credit Card'),
(7, 107, 1007, '2023-02-05', 300.00, 3, 'West', 'Credit Card'),
(8, 108, 1008, '2023-02-10', 90.25, 2, 'East', 'Cash'),
(9, 109, 1009, '2023-02-15', 180.75, 3, 'North', 'Credit Card'),
(10, 110, 1010, '2023-02-20', 60.00, 1, 'South', 'Cash'),
(11, 111, 1011, '2023-03-01', 250.50, 2, 'West', 'Credit Card'),
(12, 112, 1012, '2023-03-05', 45.25, 1, 'East', 'Cash'),
(13, 113, 1013, '2023-03-10', 150.75, 3, 'North', 'Credit Card'),
(14, 114, 1014, '2023-03-15', 70.00, 1, 'South', 'Credit Card'),
(15, 115, 1015, '2023-03-20', 180.25, 2, 'West', 'Cash'),
(16, 116, 1016, '2023-03-25', 200.50, 3, 'East', 'Credit Card'),
(17, 117, 1017, '2023-04-01', 85.75, 1, 'North', 'Cash'),
(18, 118, 1018, '2023-04-05', 120.00, 2, 'South', 'Credit Card'),
(19, 119, 1019, '2023-04-10', 300.25, 3, 'West', 'Cash'),
(20, 120, 1020, '2023-04-15', 95.50, 2, 'East', 'Credit Card'),
(21, 121, 1021, '2023-04-20', 50.75, 1, 'North', 'Credit Card'),
(22, 122, 1022, '2023-05-01', 180.00, 3, 'South', 'Cash'),
(23, 123, 1023, '2023-05-05', 75.25, 1, 'West', 'Credit Card'),
(24, 124, 1024, '2023-05-10', 210.50, 2, 'East', 'Cash'),
(25, 125, 1025, '2023-05-15', 110.75, 2, 'North', 'Credit Card'),
(26, 126, 1026, '2023-05-20', 40.00, 1, 'South', 'Cash'),
(27, 127, 1027, '2023-06-01', 150.25, 3, 'West', 'Credit Card'),
(28, 128, 1028, '2023-06-05', 80.50, 1, 'East', 'Credit Card'),
(29, 129, 1029, '2023-06-10', 200.75, 2, 'North', 'Cash'),
(30, 130, 1030, '2023-06-15', 95.00, 2, 'South', 'Credit Card'),
(31, 131, 1031, '2023-06-20', 130.25, 3, 'West', 'Credit Card'),
(32, 132, 1032, '2023-06-25', 55.50, 1, 'East', 'Cash'),
(33, 133, 1033, '2023-07-01', 180.75, 3, 'North', 'Credit Card'),
(34, 134, 1034, '2023-07-05', 70.00, 1, 'South', 'Credit Card'),
(35, 135, 1035, '2023-07-10', 250.25, 2, 'West', 'Cash'),
(36, 136, 1036, '2023-07-15', 120.50, 2, 'East', 'Credit Card'),
(37, 137, 1037, '2023-07-20', 85.75, 1, 'North', 'Cash'),
(38, 138, 1038, '2023-08-01', 110.00, 2, 'South', 'Credit Card'),
(39, 139, 1039, '2023-08-05', 300.25, 3, 'West', 'Cash'),
(40, 140, 1040, '2023-08-10', 95.50, 2, 'East', 'Credit Card');

SELECT * from sales;

SELECT*FROM sales 
WHERE saleamount>200
order by saleamount desc
limit 5;

select sum(saleamount) as totalsaleamount from sales
where saledate >='2023-03-01' and saledate <'2023-04-01';


select region ,count(paymentmethod) from sales
group by region;


SELECT CustomerID, MAX(SaleAmount) AS MaxSaleAmount
FROM Sales
group by customerid
order by maxsaleamount desc
limit 1;




SELECT saleid, MAX(SaleAmount) AS highestSaleAmount
FROM Sales
group by saleid
order by highestsaleamount desc
limit 5;


SELECT CustomerID, COUNT(*) AS NumSales
FROM Sales
GROUP BY CustomerID;


SELECT Region, SUM(Quantity) AS TotalQuantity
FROM Sales
GROUP BY Region;

SELECT SaleDate, MAX(SaleAmount) AS HighestSaleAmount
FROM Sales
group by saledate
order by highestsaleamount desc
limit 1;




