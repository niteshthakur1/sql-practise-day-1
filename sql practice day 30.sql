CREATE DATABASE world;
USE world;
CREATE TABLE countries (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    continent VARCHAR(50) NOT NULL,
    population INT,
    area INT
);

INSERT INTO countries (id, name, continent, population, area) VALUES
(1, 'China', 'Asia', 1444216107, 9596961),
(2, 'India', 'Asia', 1393409038, 3287263),
(3, 'United States', 'North America', 331893745, 9833517),
(4, 'Indonesia', 'Asia', 276361783, 1904569),
(5, 'Brazil', 'South America', 213993437, 8515767),
(6, 'Nigeria', 'Africa', 211400708, 923768),
(7, 'Russia', 'Europe', 146171015, 17098242),
(8, 'Mexico', 'North America', 130262216, 1964375),
(9, 'Japan', 'Asia', 126050804, 377975),
(10, 'Germany', 'Europe', 83240525, 357022);

SELECT * FROM countries WHERE continent = 'Asia';

SELECT name FROM countries ORDER BY population DESC LIMIT 1;

SELECT name FROM countries WHERE population > 200000000;

SELECT name, area FROM countries ORDER BY area DESC;


SELECT AVG(population) AS avg_population FROM countries WHERE continent = 'North America';

SELECT name FROM countries ORDER BY area ASC LIMIT 1;

SELECT continent, COUNT(*) AS num_countries FROM countries GROUP BY continent;

SELECT name, (population / area) AS population_density 
FROM countries 
HAVING population_density > 500;

SELECT name, population 
FROM countries 
ORDER BY population DESC 
LIMIT 3;


