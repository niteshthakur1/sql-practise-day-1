-- Create the bookstore database
CREATE DATABASE bookstore;

-- Switch to the newly created database
USE bookstore;

-- Create table for authors
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL,
    nationality VARCHAR(50)
);

-- Create table for books
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    book_title VARCHAR(200) NOT NULL,
    author_id INT,
    genre VARCHAR(50),
    price DECIMAL(8, 2),
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Insert some sample data into the authors table
INSERT INTO authors (author_name, nationality) VALUES
('J.K. Rowling', 'British'),
('George R.R. Martin', 'American'),
('Haruki Murakami', 'Japanese'),
('Jane Austen', 'British');

-- Insert some sample data into the books table
INSERT INTO books (book_title, author_id, genre, price) VALUES
('Harry Potter and the Philosopher''s Stone', 1, 'Fantasy', 15.99),
('A Game of Thrones', 2, 'Fantasy', 19.99),
('Norwegian Wood', 3, 'Fiction', 12.50),
('Pride and Prejudice', 4, 'Classic', 9.99),
('Harry Potter and the Chamber of Secrets', 1, 'Fantasy', 16.99),
('1Q84', 3, 'Fiction', 18.00);


SELECT * FROM Authors;
SELECT *FROM  Books;


SELECT book_title FROM Books
WHERE Author_id in(SELECT Author_id FROM Authors
WHERE Nationality = 'British');


SELECT Author_name FROM Authors
WHERE Author_id IN ( SELECT Author_id FROM BOOKS
group by  author_id
HAVING count(*)>1
);


SELECT GENRE ,avg(PRICE) FROM BOOKS
GROUP BY GENRE;


SELECT book_title, price
FROM books
WHERE price > (
    SELECT AVG(price)
    FROM books
    WHERE author_id IN (
        SELECT author_id
        FROM authors
        WHERE nationality = 'Japanese'
    )
);



SELECT author_name
FROM authors
WHERE author_id NOT IN (
    SELECT DISTINCT author_id
    FROM books
    WHERE genre = 'Fantasy'
);


