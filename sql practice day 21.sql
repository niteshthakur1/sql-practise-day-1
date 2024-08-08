CREATE DATABASE HouseSale;
USE HouseSale;

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    HouseID INT,
    SaleDate DATE,
    SalePrice INT,
    BuyerID INT,
    AgentID INT
);
INSERT INTO Sales (SaleID, HouseID, SaleDate, SalePrice, BuyerID, AgentID)
VALUES
(1, 101, '2024-01-15', 300000, 201, 301),
(2, 102, '2024-02-10', 350000, 202, 302),
(3, 103, '2024-03-05', 250000, 203, 303),
(4, 104, '2024-03-20', 400000, 204, 304),
(5, 105, '2024-04-15', 450000, 205, 305);

-- Q1: Retrieve all records where the sale price is greater than $300,000.

SELECT * FROM sales 
where SalePrice > 300000;

-- Find the maximum sale price in the Sales table and retrieve the corresponding HouseID

SELECT Houseid,max(saleprice) from sales
group by houseid;

-- Update the sale price of the house with SaleID = 3 to $260,000.

UPDATE Sales SET SalePrice = 260000 WHERE SaleID = 3;

-- Add a new column Commission (INT) to the Sales table.
ALTER TABLE Sales ADD Commission INT;

-- Drop the Commission column from the Sales table
ALTER TABLE Sales DROP COLUMN Commission;







