CREATE DATABASE tourism;
USE tourism;
CREATE TABLE destinations (
    destination_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    country VARCHAR(100),
    type VARCHAR(50),
    average_cost DECIMAL(10,2),
    rating DECIMAL(2,1),
    best_season VARCHAR(50)
);
INSERT INTO destinations (name, country, type, average_cost, rating, best_season) VALUES
('Bali', 'Indonesia', 'Beach', 1200.00, 4.8, 'Summer'),
('Paris', 'France', 'City', 2000.00, 4.7, 'Spring'),
('Machu Picchu', 'Peru', 'Mountain', 1500.00, 4.9, 'Autumn'),
('Kyoto', 'Japan', 'City', 1800.00, 4.6, 'Spring'),
('Santorini', 'Greece', 'Beach', 1400.00, 4.8, 'Summer'),
('Banff', 'Canada', 'Mountain', 1000.00, 4.7, 'Winter'),
('Dubai', 'UAE', 'City', 2500.00, 4.5, 'Winter');

SELECT name, country, average_cost 
FROM destinations 
ORDER BY average_cost DESC 
LIMIT 1;


SELECT name, country, rating, average_cost 
FROM destinations 
WHERE rating > 4.7 
ORDER BY average_cost ASC;


SELECT AVG(average_cost) AS average_city_cost 
FROM destinations 
WHERE type = 'City';


SELECT COUNT(*) AS summer_destinations 
FROM destinations 
WHERE best_season = 'Summer';


SELECT * 
FROM destinations 
ORDER BY rating ASC 
LIMIT 1;


SELECT name, country, average_cost, rating 
FROM destinations 
WHERE average_cost BETWEEN 1000 AND 2000 
AND rating >= 4.7;


SELECT name, country, rating 
FROM destinations 
WHERE type != 'City' 
ORDER BY rating DESC 
LIMIT 3;
