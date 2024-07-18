create database share_market;
use share_market;
-- Create table
CREATE TABLE Stocks (
    StockID INT PRIMARY KEY,
    StockName VARCHAR(50),
    Symbol VARCHAR(10),
    Price DECIMAL(10, 2),
    Quantity INT,
    PurchaseDate DATE
);

-- Insert sample data
INSERT INTO Stocks (StockID, StockName, Symbol, Price, Quantity, PurchaseDate)
VALUES
    (1, 'Apple Inc.', 'AAPL', 144.67, 100, '2023-01-15'),
    (2, 'Microsoft Corporation', 'MSFT', 268.45, 50, '2023-02-20'),
    (3, 'Amazon.com Inc.', 'AMZN', 3334.69, 25, '2023-03-10'),
    (4, 'Tesla Inc.', 'TSLA', 679.82, 75, '2023-04-05');
    
    select * from stocks;
   
   select *, (price* quantity) as totalvalue from stocks;
   
   
   SELECT StockName, Symbol, PurchaseDate
FROM Stocks
WHERE PurchaseDate > '2023-03-01';

update stocks
set price = 300
where stockid = 2;

delete  from stocks
where stockid = 4;


