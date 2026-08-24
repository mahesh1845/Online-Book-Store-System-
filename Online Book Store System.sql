
/* ONLINE BOOK STORE MANAGEMENT SYSTEM - SQL PROJECT*/

/*SECTION 1: CREATE TABLES*/


DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Authors;
DROP TABLE IF EXISTS Publishers;
DROP TABLE IF EXISTS Customers;

CREATE TABLE Authors (
    author_id     INTEGER PRIMARY KEY,
    author_name   VARCHAR(100) NOT NULL,
    country       VARCHAR(50)
);

CREATE TABLE Publishers (
    publisher_id  INTEGER PRIMARY KEY,
    publisher_name VARCHAR(100) NOT NULL,
    city          VARCHAR(50)
);

CREATE TABLE Books (
    book_id        INTEGER PRIMARY KEY,
    title          VARCHAR(150) NOT NULL,
    author_id      INTEGER,
    publisher_id   INTEGER,
    genre          VARCHAR(50),
    price          DECIMAL(10,2) NOT NULL,
    stock_quantity INTEGER NOT NULL,
    published_year INTEGER,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id)
);

CREATE TABLE Customers (
    customer_id   INTEGER PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email         VARCHAR(100),
    city          VARCHAR(50),
    phone         VARCHAR(15)
);

CREATE TABLE Orders (
    order_id      INTEGER PRIMARY KEY,
    customer_id   INTEGER,
    order_date    DATE,
    status        VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE OrderDetails (
    order_detail_id INTEGER PRIMARY KEY,
    order_id        INTEGER,
    book_id         INTEGER,
    quantity        INTEGER NOT NULL,
    unit_price      DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);



/*SECTION 2: INSERT SAMPLE DATA*/


-- Authors
INSERT INTO Authors VALUES (1, 'R.K. Narayan', 'India');
INSERT INTO Authors VALUES (2, 'J.K. Rowling', 'UK');
INSERT INTO Authors VALUES (3, 'Chetan Bhagat', 'India');
INSERT INTO Authors VALUES (4, 'Agatha Christie', 'UK');
INSERT INTO Authors VALUES (5, 'Paulo Coelho', 'Brazil');
INSERT INTO Authors VALUES (6, 'Dan Brown', 'USA');
INSERT INTO Authors VALUES (7, 'Ruskin Bond', 'India');

-- Publishers
INSERT INTO Publishers VALUES (1, 'Penguin Books', 'Delhi');
INSERT INTO Publishers VALUES (2, 'HarperCollins', 'Mumbai');
INSERT INTO Publishers VALUES (3, 'Bloomsbury', 'London');
INSERT INTO Publishers VALUES (4, 'Rupa Publications', 'Delhi');
INSERT INTO Publishers VALUES (5, 'Random House', 'New York');

-- Books
INSERT INTO Books VALUES (1, 'Malgudi Days', 1, 1, 'Fiction', 250.00, 30, 1943);
INSERT INTO Books VALUES (2, 'Harry Potter and the Sorcerer''s Stone', 2, 3, 'Fantasy', 499.00, 0, 1997);
INSERT INTO Books VALUES (3, 'Half Girlfriend', 3, 4, 'Romance', 199.00, 45, 2014);
INSERT INTO Books VALUES (4, 'Murder on the Orient Express', 4, 5, 'Mystery', 350.00, 12, 1934);
INSERT INTO Books VALUES (5, 'The Alchemist', 5, 1, 'Fiction', 299.00, 20, 1988);
INSERT INTO Books VALUES (6, 'The Da Vinci Code', 6, 5, 'Thriller', 450.00, 8, 2003);
INSERT INTO Books VALUES (7, 'The Blue Umbrella', 7, 4, 'Fiction', 150.00, 0, 1980);
INSERT INTO Books VALUES (8, 'Five Point Someone', 3, 4, 'Fiction', 180.00, 25, 2004);
INSERT INTO Books VALUES (9, 'And Then There Were None', 4, 5, 'Mystery', 320.00, 15, 1939);
INSERT INTO Books VALUES (10, 'Harry Potter and the Chamber of Secrets', 2, 3, 'Fantasy', 520.00, 10, 1998);
INSERT INTO Books VALUES (11, 'Inferno', 6, 5, 'Thriller', 399.00, 6, 2013);
INSERT INTO Books VALUES (12, 'Veronika Decides to Die', 5, 1, 'Fiction', 275.00, 0, 1998);

-- Customers
INSERT INTO Customers VALUES (1, 'Amit Sharma', 'amit.sharma@mail.com', 'Delhi', '9811111111');
INSERT INTO Customers VALUES (2, 'Priya Verma', 'priya.verma@mail.com', 'Mumbai', '9822222222');
INSERT INTO Customers VALUES (3, 'Rahul Singh', 'rahul.singh@mail.com', 'Bangalore', '9833333333');
INSERT INTO Customers VALUES (4, 'Sneha Iyer', 'sneha.iyer@mail.com', 'Chennai', '9844444444');
INSERT INTO Customers VALUES (5, 'Vikram Rao', 'vikram.rao@mail.com', 'Delhi', '9855555555');
INSERT INTO Customers VALUES (6, 'Anjali Gupta', 'anjali.gupta@mail.com', 'Mumbai', '9866666666');

-- Orders
INSERT INTO Orders VALUES (1, 1, '2024-01-10', 'Delivered');
INSERT INTO Orders VALUES (2, 2, '2024-01-15', 'Delivered');
INSERT INTO Orders VALUES (3, 1, '2024-02-05', 'Delivered');
INSERT INTO Orders VALUES (4, 3, '2024-02-20', 'Pending');
INSERT INTO Orders VALUES (5, 4, '2024-03-01', 'Delivered');
INSERT INTO Orders VALUES (6, 5, '2024-03-12', 'Cancelled');
INSERT INTO Orders VALUES (7, 2, '2024-03-18', 'Delivered');
INSERT INTO Orders VALUES (8, 6, '2024-04-02', 'Delivered');
INSERT INTO Orders VALUES (9, 1, '2024-04-10', 'Pending');

-- OrderDetails
INSERT INTO OrderDetails VALUES (1, 1, 1, 2, 250.00);
INSERT INTO OrderDetails VALUES (2, 1, 5, 1, 299.00);
INSERT INTO OrderDetails VALUES (3, 2, 3, 3, 199.00);
INSERT INTO OrderDetails VALUES (4, 3, 4, 1, 350.00);
INSERT INTO OrderDetails VALUES (5, 3, 9, 2, 320.00);
INSERT INTO OrderDetails VALUES (6, 4, 6, 1, 450.00);
INSERT INTO OrderDetails VALUES (7, 5, 8, 4, 180.00);
INSERT INTO OrderDetails VALUES (8, 6, 11, 1, 399.00);
INSERT INTO OrderDetails VALUES (9, 7, 5, 2, 299.00);
INSERT INTO OrderDetails VALUES (10, 7, 1, 1, 250.00);
INSERT INTO OrderDetails VALUES (11, 8, 10, 1, 520.00);
INSERT INTO OrderDetails VALUES (12, 9, 3, 2, 199.00);



/*SECTION 3: PRACTICE QUESTIONS (Q1 - Q16)*/


-- Q1. List all books along with their author name and publisher name.
SELECT b.title, a.author_name, p.publisher_name
FROM Books b
JOIN Authors a ON b.author_id = a.author_id
JOIN Publishers p ON b.publisher_id = p.publisher_id;

-- Q2. Find all books priced above 300.
SELECT title, price
FROM Books
WHERE price > 300;

-- Q3. Find books that are out of stock (stock_quantity = 0).
SELECT title, stock_quantity
FROM Books
WHERE stock_quantity = 0;

-- Q4. Count the total number of books written by each author.
SELECT a.author_name, COUNT(b.book_id) AS total_books
FROM Authors a
JOIN Books b ON a.author_id = b.author_id
GROUP BY a.author_name;

-- Q5. Find the average price of books in each genre.
SELECT genre, ROUND(AVG(price),2) AS avg_price
FROM Books
GROUP BY genre;

-- Q6. List customers who have placed more than 1 order.
SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING COUNT(o.order_id) > 1;

-- Q7. Find the total revenue generated from all delivered orders.
SELECT ROUND(SUM(od.quantity * od.unit_price),2) AS total_revenue
FROM OrderDetails od
JOIN Orders o ON od.order_id = o.order_id
WHERE o.status = 'Delivered';

-- Q8. Find the top 3 best-selling books by quantity sold.
SELECT b.title, SUM(od.quantity) AS total_sold
FROM OrderDetails od
JOIN Books b ON od.book_id = b.book_id
GROUP BY b.title
ORDER BY total_sold DESC
LIMIT 3;

-- Q9. Find customers who have never placed an order.
SELECT c.customer_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Q10. Find books that have never been ordered.
SELECT b.title
FROM Books b
LEFT JOIN OrderDetails od ON b.book_id = od.book_id
WHERE od.order_id IS NULL;

-- Q11. Find the customer who has spent the most money overall.
SELECT c.customer_name, ROUND(SUM(od.quantity * od.unit_price),2) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN OrderDetails od ON o.order_id = od.order_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 1;

-- Q12. Find the publisher who has published the maximum number of books.
SELECT p.publisher_name, COUNT(b.book_id) AS books_published
FROM Publishers p
JOIN Books b ON p.publisher_id = b.publisher_id
GROUP BY p.publisher_name
ORDER BY books_published DESC
LIMIT 1;

-- Q13. Find the second highest priced book.
SELECT title, price
FROM Books
ORDER BY price DESC
LIMIT 1 OFFSET 1;

-- Q14. List all books published after the year 2000.
SELECT title, published_year
FROM Books
WHERE published_year > 2000;

-- Q15. Display order details showing customer name, book title, quantity and total amount for each order item.
SELECT c.customer_name, b.title, od.quantity,
       ROUND(od.quantity * od.unit_price,2) AS total_amount
FROM OrderDetails od
JOIN Orders o ON od.order_id = o.order_id
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Books b ON od.book_id = b.book_id
ORDER BY o.order_id;
