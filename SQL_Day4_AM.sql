CREATE DATABASE IF NOT EXISTS LIBRARYDB;
USE LIBRARYDB;
CREATE TABLE IF NOT EXISTS tbl_books(
    BookID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Author VARCHAR(100) NOT NULL,
    Genre VARCHAR(100) NOT NULL,
    PublishedYear INT NOT NULL
);
CREATE TABLE IF NOT EXISTS tbl_borrowers(
    BorrowerID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    BorrowerName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS tbl_borrowedbooks(
    BorrowedID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    BookID INT,
    BorrowerID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    CONSTRAINT fk_book FOREIGN KEY (BookID) REFERENCES tbl_books(BookID) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_borrower FOREIGN KEY (BorrowerID) REFERENCES tbl_borrowers(BorrowerID) ON DELETE CASCADE
);
INSERT INTO tbl_books (Title, Author, Genre, PublishedYear)  
VALUES  
('Horus Rising', 'Dan Abnett', 'Science Fiction', 2006),  
('False Gods', 'Graham McNeill', 'Science Fiction', 2006),  
('Galaxy in Flames', 'Ben Counter', 'Science Fiction', 2006),  
('The Flight of the Eisenstein', 'James Swallow', 'Science Fiction', 2007),  
('Fulgrim', 'Graham McNeill', 'Science Fiction', 2007),  
('Descent of Angels', 'Mitchel Scanlon', 'Science Fiction', 2007),  
('Legion', 'Dan Abnett', 'Science Fiction', 2008),  
('Battle for the Abyss', 'Ben Counter', 'Science Fiction', 2008),  
('Mechanicum', 'Graham McNeill', 'Science Fiction', 2008),  
('Tales of Heresy', 'Various Authors', 'Science Fiction', 2009),  
('The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 1937),  
('The Fellowship of the Ring', 'J.R.R. Tolkien', 'Fantasy', 1954),  
('The Two Towers', 'J.R.R. Tolkien', 'Fantasy', 1954),  
('The Return of the King', 'J.R.R. Tolkien', 'Fantasy', 1955);
INSERT INTO tbl_borrowers (BorrowerName, Email, PhoneNumber)
VALUES 
('John Doe', 'john.doe@example.com', '103-456-7890'),
('Jane Smith', 'jane.smith@example.com', '234-567-8901'),
('Michael Johnson', 'michael.johnson@example.com', '345-678-9012'),
('Emily Williams', 'emily.williams@example.com', '456-789-0123'),
('David Brown', 'david.brown@example.com', '567-890-1234'),
('Sarah Jones', 'sarah.jones@example.com', '678-901-2345'),
('William Garcia', 'william.garcia@example.com', '789-012-3456'),
('Sophia Martinez', 'sophia.martinez@example.com', '890-123-4567'),
('James Davis', 'james.davis@example.com', '901-234-5678'),
('Olivia Lopez', 'olivia.lopez@example.com', '012-345-6789');
INSERT INTO tbl_borrowedbooks (BookID, BorrowerID, BorrowDate, ReturnDate)
VALUES
(1, 1, '2025-03-01', '2025-03-15'),
(2, 2, '2025-03-02', '2025-03-16'),
(3, 3, '2025-03-03', '2025-03-17'),
(4, 4, '2025-03-04', '2025-03-18'),
(5, 5, '2025-03-05', '2025-03-19'),
(6, 6, '2025-03-06', '2025-03-20'),
(7, 7, '2025-03-07', '2025-03-21'),
(8, 8, '2025-03-08', '2025-03-22'),
(9, 9, '2025-03-09', '2025-03-23'),
(10, 10, '2025-03-10', '2025-03-24');
SELECT * FROM tbl_books;
SELECT * FROM tbl_borrowers;
SELECT * FROM tbl_borrowedbooks;
/* TRUNCATE TABLE tbl_borrowedbooks; */
UPDATE tbl_borrowedbooks
SET ReturnDate = CURDATE()
WHERE BorrowedID = 1;
UPDATE tbl_borrowedbooks
SET ReturnDate = '2025-03-15'
WHERE BorrowedID = 1;
DELETE FROM tbl_borrowers
WHERE BorrowerID NOT IN (SELECT DISTINCT BorrowerID FROM tbl_borrowedbooks);
SELECT * FROM tbl_borrowers;