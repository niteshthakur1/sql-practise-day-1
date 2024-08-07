CREATE DATABASE ResortDB;
USE ResortDB;
CREATE TABLE Guests (
    GuestID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15)
);

INSERT INTO Guests (FirstName, LastName, Email, PhoneNumber)
VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890'),
('Jane', 'Smith', 'jane.smith@example.com', '987-654-3210'),
('Alice', 'Johnson', 'alice.johnson@example.com', '555-123-4567');


CREATE TABLE Rooms (
    RoomID INT PRIMARY KEY AUTO_INCREMENT,
    RoomNumber INT,
    RoomType VARCHAR(50),
    PricePerNight DECIMAL(10, 2)
);
INSERT INTO Rooms (RoomNumber, RoomType, PricePerNight)
VALUES
(101, 'Single', 100.00),
(102, 'Double', 150.00),
(201, 'Suite', 300.00);


CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    GuestID INT,
    RoomID INT,
    CheckInDate DATE,
    CheckOutDate DATE,
    FOREIGN KEY (GuestID) REFERENCES Guests(GuestID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
);
SET FOREIGN_KEY_CHECKS=0;
SET GLOBAL FOREIGN_KEY_CHECKS=0;
INSERT INTO Bookings (GuestID, RoomID, CheckInDate, CheckOutDate)
VALUES
(1, 101, '2023-08-01', '2023-08-05'),
(2, 102, '2023-08-10', '2023-08-15'),
(3, 201, '2023-09-01', '2023-09-10');


CREATE TABLE Services (
    ServiceID INT PRIMARY KEY AUTO_INCREMENT,
    ServiceName VARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO Services (ServiceName, Price)
VALUES
('Spa', 50.00),
('Gym', 20.00),
('Pool', 30.00);


CREATE TABLE Staff (
    StaffID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2)
);
INSERT INTO Staff (FirstName, LastName, Position, Salary)
VALUES
('Michael', 'Brown', 'Manager', 60000.00),
('Sara', 'Davis', 'Receptionist', 35000.00),
('David', 'Wilson', 'Chef', 45000.00);


SELECT*from Guests;
SELECT*from Rooms;
SELECT*from Bookings;
SELECT*from Services;
SELECT*from Staff;

-- Find the details of rooms that cost more than $150 per night.
SELECT * from Rooms 
Where Pricepernight > 150;

-- find the names of guests who have booked a room that costs more than $200 per night.
Select Firstname, lastname from
Guests
where Guestid in (
select Guestid from Bookings 
where Roomid in (
Select Roomid from Rooms
where pricepernight > 200
)
);

-- List all bookings with guest names and room details.
SELECT B.BookingID, G.FirstName, G.LastName, R.RoomNumber, R.RoomType, B.CheckInDate, B.CheckOutDate
FROM Bookings B
JOIN Guests G ON B.GuestID = G.GuestID
JOIN Rooms R ON B.RoomID = R.RoomID;

-- List all staff members with their positions and salaries.

 SELECT * FROM staff;
 
-- Find the total revenue generated from room bookings.

SELECT sum(R.pricepernight *datediff(B.checkindate,B.checkoutdate) ) as total_revenue
From Bookings B
join Rooms R  ON B.Roomid = R.Roomid;


-- List the guests who have stayed for more than 5 days

SELECT G.FirstName, G.LastName
FROM Guests G
JOIN Bookings B ON G.GuestID = B.GuestID
WHERE DATEDIFF(B.CheckOutDate, B.CheckInDate) > 5;

-- Find the most frequently booked room type
SELECT R.RoomType, COUNT(*) AS BookingCount
FROM Bookings B
JOIN Rooms R ON B.RoomID = R.RoomID
GROUP BY R.RoomType
ORDER BY BookingCount DESC
LIMIT 1;

-- List all the services along with their prices, and show the average price of all services.

SELECT S.ServiceName, S.Price, (SELECT AVG(Price) FROM Services) AS AveragePrice
FROM Services S;

