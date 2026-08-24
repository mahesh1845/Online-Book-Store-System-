# Online-Book-Store-System-

## 📚 Overview

The **Online Book System** is a database management project developed using **PostgreSQL**, **SQL**, and **pgAdmin 4**.

The system is designed to store and manage information about books, authors, customers, categories, orders, and book transactions. SQL queries are used to insert, update, delete, retrieve, and manage data efficiently.

## 🛠️ Technologies Used

* **Database:** PostgreSQL
* **Database Management Tool:** pgAdmin 4
* **Language:** SQL

## 🎯 Objectives

* Manage book information efficiently.
* Store author and category details.
* Manage customer information.
* Track book orders and transactions.
* Perform searching and filtering using SQL queries.
* Maintain relationships between different entities using relational database concepts.

## 📋 Main Modules

### 1. Books

Stores information about books, including:

* Book ID
* Book title
* Author
* Category
* Price
* Publication details
* Available quantity

### 2. Authors

Stores information about book authors.

### 3. Categories

Stores different categories or genres of books.

### 4. Customers

Stores customer information.

### 5. Orders

Stores customer orders and transaction details.

## 🗃️ Database Structure

The database can contain tables such as:

```text
Authors
   │
   └──< Books >── Categories
          │
          │
Customers ──< Orders
              │
              └──< Order_Items >── Books
```

## 🔑 Database Concepts Used

This project demonstrates the use of:

* `CREATE DATABASE`
* `CREATE TABLE`
* Primary Keys
* Foreign Keys
* `NOT NULL`
* `UNIQUE`
* `CHECK`
* `DEFAULT`
* `INSERT`
* `SELECT`
* `UPDATE`
* `DELETE`
* `WHERE`
* `ORDER BY`
* `GROUP BY`
* Aggregate functions
* `JOIN`
* Subqueries
* Views
* Functions/Procedures
* Triggers
* Constraints

## ⚙️ How to Run

### Step 1: Install PostgreSQL

Install PostgreSQL on your computer.

### Step 2: Open pgAdmin 4

Open **pgAdmin 4** and connect to your PostgreSQL server.

### Step 3: Create the Database

Create a new database, for example:

```sql
CREATE DATABASE online_book_system;
```

### Step 4: Connect to the Database

Select the `online_book_system` database in pgAdmin 4 and open the **Query Tool**.

### Step 5: Create Tables

Run the SQL commands provided in the project SQL file to create the required tables.

### Step 6: Insert Data

Execute the `INSERT` statements to add sample books, authors, customers, categories, and orders.

### Step 7: Run Queries

Use SQL queries to retrieve and manage information from the database.

## 📁 Project Files

```text
Online-Book-System/
│
├── Online Book Store Management System Report
├── Online Book Store System Code
├── Online Book Store System Table Screen Shot
└── README.md
```

## 🔍 Example Queries

### Display all books

```sql
SELECT * FROM books;
```

### Search for a book

```sql
SELECT *
FROM books
WHERE title ILIKE '%database%';
```

### Display books with their authors

```sql
SELECT b.title, a.author_name
FROM books b
JOIN authors a
ON b.author_id = a.author_id;
```

### Find the number of books

```sql
SELECT COUNT(*) AS total_books
FROM books;
```

## 📌 Requirements

* PostgreSQL
* pgAdmin 4
* Basic knowledge of SQL

No programming language or web framework is required for this database project.

## 👨‍💻 Project Type

**Database Management System (DBMS) Project**

Built using **SQL + PostgreSQL + pgAdmin 4**.
