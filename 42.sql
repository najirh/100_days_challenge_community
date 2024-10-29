-- SQL Interview Question Day 42/100

-- EY Data Analyst SQL question.
-- SQL Mentor Question id 400

/*
Given a table named candidates with the following structure:
name (VARCHAR): Name of the candidate
skills (TEXT): List of skills the candidate possesses (stored as a comma-separated string)
Write a query to find candidates best suited for an open Data Science job.
A candidate is suitable if they possess all three required skills: Python, Tableau, and PostgreSQL.
*/

DROP TABLE IF NOT EXISTS candidates;

CREATE TABLE candidates (
    name VARCHAR(100),
    skills TEXT
);

INSERT INTO candidates (name, skills) VALUES
('Alice', 'Python,Tableau,SQL'),
('Bob', 'Python,Tableau,PostgreSQL'),
('Charlie', 'R,Excel,Python'),
('Dave', 'Tableau,Python,PostgreSQL'),
('Eve', 'SQL,Python,Tableau,PostgreSQL');

SELECT * FROM candidates;


-- Question 2

-- 43/100 SQL Challenge

-- EY SQL Question
-- SQL Mentor Question ID: 373

DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Transactions;

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    transaction_date DATE,
    amount DECIMAL(10, 2)
);



INSERT INTO Transactions (transaction_id, customer_id, transaction_date, amount) VALUES
(1, 1, '2023-09-01', 100.50),
(2, 2, '2023-09-01', 200.75),
(3, 1, '2023-09-05', 150.00),
(4, 3, '2023-09-10', 300.20),
(5, 2, '2023-09-15', 250.30),
(6, 1, '2023-09-20', 180.00),
(7, 3, '2023-09-21', 400.00),
(8, 1, '2023-09-25', 170.75),
(9, 1, '2023-09-28', 160.25),
(10, 1, '2023-09-30', 190.60);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);



INSERT INTO Customers (customer_id, customer_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');



/*
You are given two tables:
Transactions – Stores transaction details (ID, customer ID, date, and amount).
Customers – Stores customer details (ID and name).
The task is to find the average transaction amount for each customer who made more than 5 transactions in September 2023.
*/

SELECT 
	c.customer_name,
	AVG(t.amount)
FROM 
Transactions as t
JOIN
customers as c
ON t.customer_id = c.customer_id
WHERE t.transaction_date BETWEEN '2023-09-01' AND '2023-09-30'
GROUP BY c.customer_name
HAVING COUNT(*) > 5


	



