create database practise;
use practise;
-- Create table for movies
CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    Title VARCHAR(100),
    Director VARCHAR(100),
    Year INT,
    Genre VARCHAR(50),
    Rating DECIMAL(3,1)  -- Assuming rating out of 10, with one decimal place
);

-- Insert sample data
INSERT INTO Movies (MovieID, Title, Director, Year, Genre, Rating)
VALUES
    (1, 'The Shawshank Redemption', 'Frank Darabont', 1994, 'Drama', 9.3),
    (2, 'The Godfather', 'Francis Ford Coppola', 1972, 'Crime', 9.2),
    (3, 'The Dark Knight', 'Christopher Nolan', 2008, 'Action', 9.0),
    (4, 'Pulp Fiction', 'Quentin Tarantino', 1994, 'Crime', 8.9),
    (5, 'Schindler''s List', 'Steven Spielberg', 1993, 'Biography', 8.9),
    (6, 'The Lord of the Rings: The Return of the King', 'Peter Jackson', 2003, 'Adventure', 8.9),
    (7, 'Fight Club', 'David Fincher', 1999, 'Drama', 8.8),
    (8, 'Forrest Gump', 'Robert Zemeckis', 1994, 'Drama', 8.8),
    (9, 'Inception', 'Christopher Nolan', 2010, 'Action', 8.7),
    (10, 'The Matrix', 'Lana Wachowski, Lilly Wachowski', 1999, 'Action', 8.7),
    (11, 'Goodfellas', 'Martin Scorsese', 1990, 'Biography', 8.7),
    (12, 'The Silence of the Lambs', 'Jonathan Demme', 1991, 'Crime', 8.6),
    (13, 'Saving Private Ryan', 'Steven Spielberg', 1998, 'Drama', 8.6),
    (14, 'Se7en', 'David Fincher', 1995, 'Crime', 8.6),
    (15, 'Gladiator', 'Ridley Scott', 2000, 'Action', 8.5),
    (16, 'The Departed', 'Martin Scorsese', 2006, 'Crime', 8.5),
    (17, 'The Prestige', 'Christopher Nolan', 2006, 'Drama', 8.5),
    (18, 'The Green Mile', 'Frank Darabont', 1999, 'Crime', 8.6),
    (19, 'The Usual Suspects', 'Bryan Singer', 1995, 'Crime', 8.5),
    (20, 'The Lion King', 'Roger Allers, Rob Minkoff', 1994, 'Animation', 8.5);

select*from movies;

SELECT Title
FROM Movies
WHERE Director = 'Christopher Nolan';

select title,max(rating) from movies
group by title
limit 1;


select title,year from movies
where year between 1990 and 1999;

select count(*) from movies
where genre = 'crime';

select title,max(rating) from movies
group by title
limit 5;

SELECT Title, Director
FROM Movies
WHERE Director IN ('Steven Spielberg', 'Martin Scorsese');


select avg(rating) as average_rating from movies;

select distinct genre from movies;

select title,year from movies
order by year asc
limit 1;

select title from movies 
where title like '%the%';