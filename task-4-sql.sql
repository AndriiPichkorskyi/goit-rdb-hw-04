CREATE SCHEMA LibraryManagement;

CREATE TABLE authors (
	author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(45)
);

CREATE TABLE genres (
	genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(45)
);

CREATE TABLE books (
	book_id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(45),
    publication_year YEAR,
    author_id INT,
    genre_id INT,
    FOREIGN KEY (author_id ) REFERENCES authors,
    FOREIGN KEY (genre_id ) REFERENCES genres
);

CREATE TABLE users (
	user_id INT AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(45),
	email VARCHAR(45)
);

CREATE TABLE borrowed_books (
	borrow_id INT AUTO_INCREMENT PRIMARY KEY,
	book_id  INT,
	user_id  INT,
    FOREIGN KEY (book_id ) REFERENCES books,
    FOREIGN KEY (user_id ) REFERENCES users,
    borrow_date DATE,
    return_date DATE
);