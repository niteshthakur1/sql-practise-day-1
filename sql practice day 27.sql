CREATE DATABASE RealEstate;
USE RealEstate;
CREATE TABLE Properties (
    PropertyID INT PRIMARY KEY AUTO_INCREMENT,
    Address VARCHAR(255) NOT NULL,
    City VARCHAR(100) NOT NULL,
    State VARCHAR(50) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Bedrooms INT NOT NULL,
    Bathrooms DECIMAL(2, 1) NOT NULL
);
INSERT INTO Properties (Address, City, State, Price, Bedrooms, Bathrooms)
VALUES 
('123 Elm St', 'Los Angeles', 'CA', 850000.00, 3, 2.5),
('456 Maple Ave', 'San Francisco', 'CA', 1250000.00, 4, 3.0),
('789 Oak Dr', 'Austin', 'TX', 650000.00, 3, 2.0),
('101 Pine St', 'Seattle', 'WA', 950000.00, 3, 2.5),
('202 Birch Ln', 'Portland', 'OR', 700000.00, 2, 1.5);

CREATE TABLE Agents (
    AgentID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    Email VARCHAR(100),
    PropertyID INT,
    FOREIGN KEY (PropertyID) REFERENCES Properties(PropertyID)
);

INSERT INTO Agents (Name, Phone, Email, PropertyID)
VALUES 
('John Doe', '123-456-7890', 'jdoe@example.com', 1),
('Jane Smith', '987-654-3210', 'jsmith@example.com', 2),
('Alice Brown', '555-555-5555', 'abrown@example.com', 3);


-- alter the Properties table to add a new column for YearBuilt

ALTER TABLE properties Add YearBuilt int;

-- drop the YearBuilt column from the Properties table?

ALTER TABLE properties DROP YearBuilt;

-- rename the Properties table to RealEstateProperties

ALTER TABLE Properties RENAME TO RealEstateProperties;

-- Write a query to list all properties along with the agent's name who is responsible for them.

SELECT P.address,p.city,p.state ,a.name as agent_name
FROM properties p
LEFT JOIN Agents a ON  P.propertyid = a.propertyid;

-- : Write a query to show properties that do not have an assigned agent.

SELECT P.Address, P.City, P.State
FROM Properties P
LEFT JOIN Agents A ON P.PropertyID = A.PropertyID
WHERE A.AgentID IS NULL;


-- Write a query to find the address of the property with the highest price
SELECT address
from properties
where price = (SELECT max(price) from properties);


-- Write a query to find properties in cities where the average price is greater than $900,000.
SELECT city from
properties
group by city
Having avg(price)>900000;

-- Write a query to calculate the average price of properties in each state.
SELECT State, AVG(Price) AS AveragePrice
FROM Properties
GROUP BY State;

-- Write a query to find the total number of bedrooms in all properties combined.
SELECT SUM(Bedrooms) AS TotalBedrooms
FROM Properties;

-- Write a query to find the maximum and minimum number of bathrooms in the properties.
SELECT MAX(Bathrooms) AS MaxBathrooms, MIN(Bathrooms) AS MinBathrooms
FROM Properties;

