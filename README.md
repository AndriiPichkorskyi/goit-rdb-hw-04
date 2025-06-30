# SQL Tasks

**Point 1.1:**
```sql
CREATE SCHEMA LibraryManagement;

USE LibraryManagement;

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
```
![Image for the task 1.1](/task-4-point-1-1.webp)
![Image for the task 1.2](/task-4-point-1-2.webp)

**Point 2:**
```sql

INSERT INTO LibraryManagement.authors 
	(author_name)
VALUES 
	("J. R. R. Tolkien"),
	("Lewis Carroll");

INSERT INTO LibraryManagement.genres 
	(genre_name)
VALUES 
	("children's fiction"),
	("absurdist fiction");

INSERT INTO LibraryManagement.books 
	(title, publication_year, author_id, genre_id)
VALUES 
	("The Hobbit", 1937, 1, 1),
	("Alice's Adventures in Wonderland", 1901, 2, 2);
    
INSERT INTO LibraryManagement.users 
	(username, email)
VALUES 
	("Alex", "alex@example.com"),
	("Bob", "bob@example.com");
    
INSERT INTO LibraryManagement.borrowed_books 
	(book_id, user_id , borrow_date, return_date)
VALUES 
	(1, 1, "2020-02-03", "2021-02-03"),
	(2, 2, "2022-03-04", "2023-03-04");
```
![Image for the task 2](/task-4-point-2.webp)

**Point 3:**
```sql
USE goit_dataset;

SELECT * FROM order_details
INNER JOIN orders ON order_details.order_id = orders.id
INNER JOIN customers ON orders.customer_id = customers.id
INNER JOIN employees ON orders.employee_id = employees.employee_id
INNER JOIN shippers ON orders.shipper_id = shippers.id

INNER JOIN products ON order_details.product_id = products.id

INNER JOIN suppliers ON products.supplier_id = suppliers.id
INNER JOIN categories ON products.category_id = categories.id;
```
![Image for the task 3](/task-4-point-3.webp)

**Point 4.1:**
```sql
SELECT COUNT(*) FROM order_details
INNER JOIN orders ON order_details.order_id = orders.id
INNER JOIN customers ON orders.customer_id = customers.id
INNER JOIN employees ON orders.employee_id = employees.employee_id
INNER JOIN shippers ON orders.shipper_id = shippers.id

INNER JOIN products ON order_details.product_id = products.id

INNER JOIN suppliers ON products.supplier_id = suppliers.id
INNER JOIN categories ON products.category_id = categories.id;
```
![Image for the task 4.1](/task-4-point-4.1.webp)

**Point 4.2:**
```sql
SELECT COUNT(*) FROM order_details
LEFT JOIN orders ON order_details.order_id = orders.id
RIGHT JOIN customers ON orders.customer_id = customers.id
LEFT JOIN employees ON orders.employee_id = employees.employee_id
LEFT JOIN shippers ON orders.shipper_id = shippers.id

RIGHT JOIN products ON order_details.product_id = products.id

RIGHT JOIN suppliers ON products.supplier_id = suppliers.id
RIGHT JOIN categories ON products.category_id = categories.id;
```
![Image for the task 4.2](/task-4-point-4.2.webp)

**Point 4.3:**
```sql
SELECT * FROM order_details
INNER JOIN orders ON order_details.order_id = orders.id
INNER JOIN customers ON orders.customer_id = customers.id
INNER JOIN employees ON orders.employee_id = employees.employee_id
INNER JOIN shippers ON orders.shipper_id = shippers.id

INNER JOIN products ON order_details.product_id = products.id

INNER JOIN suppliers ON products.supplier_id = suppliers.id
INNER JOIN categories ON products.category_id = categories.id

WHERE employees.employee_id > 3 AND  employees.employee_id <= 10;
```
![Image for the task 4.3](/task-4-point-4.3.webp)

**Point 4.4:**
```sql
SELECT categories.name, COUNT(*), AVG(order_details.quantity) as average_quantity FROM order_details
INNER JOIN orders ON order_details.order_id = orders.id
INNER JOIN customers ON orders.customer_id = customers.id
INNER JOIN employees ON orders.employee_id = employees.employee_id
INNER JOIN shippers ON orders.shipper_id = shippers.id

INNER JOIN products ON order_details.product_id = products.id

INNER JOIN suppliers ON products.supplier_id = suppliers.id
INNER JOIN categories ON products.category_id = categories.id

WHERE employees.employee_id > 3 AND  employees.employee_id <= 10
GROUP BY categories.name;
```
![Image for the task 4.4](/task-4-point-4.4.webp)

**Point 4.5:**
```sql
SELECT categories.name, COUNT(*), AVG(order_details.quantity) as average_quantity FROM order_details
INNER JOIN orders ON order_details.order_id = orders.id
INNER JOIN customers ON orders.customer_id = customers.id
INNER JOIN employees ON orders.employee_id = employees.employee_id
INNER JOIN shippers ON orders.shipper_id = shippers.id

INNER JOIN products ON order_details.product_id = products.id

INNER JOIN suppliers ON products.supplier_id = suppliers.id
INNER JOIN categories ON products.category_id = categories.id

WHERE employees.employee_id > 3 AND  employees.employee_id <= 10
GROUP BY categories.name
HAVING average_quantity > 21;
```
![Image for the task 4.5](/task-4-point-4.5.webp)

**Point 4.6:**
```sql
SELECT categories.name, COUNT(*) as count, AVG(order_details.quantity) as average_quantity FROM order_details
INNER JOIN orders ON order_details.order_id = orders.id
INNER JOIN customers ON orders.customer_id = customers.id
INNER JOIN employees ON orders.employee_id = employees.employee_id
INNER JOIN shippers ON orders.shipper_id = shippers.id

INNER JOIN products ON order_details.product_id = products.id

INNER JOIN suppliers ON products.supplier_id = suppliers.id
INNER JOIN categories ON products.category_id = categories.id

WHERE employees.employee_id > 3 AND  employees.employee_id <= 10
GROUP BY categories.name
HAVING average_quantity > 21
ORDER BY count DESC;
```
![Image for the task 4.6](/task-4-point-4.6.webp)

**Point 4.7:**
```sql
SELECT categories.name, COUNT(*) as count, AVG(order_details.quantity) as average_quantity FROM order_details
INNER JOIN orders ON order_details.order_id = orders.id
INNER JOIN customers ON orders.customer_id = customers.id
INNER JOIN employees ON orders.employee_id = employees.employee_id
INNER JOIN shippers ON orders.shipper_id = shippers.id

INNER JOIN products ON order_details.product_id = products.id

INNER JOIN suppliers ON products.supplier_id = suppliers.id
INNER JOIN categories ON products.category_id = categories.id

WHERE employees.employee_id > 3 AND  employees.employee_id <= 10
GROUP BY categories.name
HAVING average_quantity > 21
ORDER BY count DESC
LIMIT 4 OFFSET 1;
```
![Image for the task 4.7](/task-4-point-4.7.webp)
