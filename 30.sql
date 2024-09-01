-- Day 30/100 Challenge
-- Google Data Analyst Interview Question



DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);



INSERT INTO Employees (id, name, manager_id)
VALUES
    (1, 'Alice', NULL),
    (2, 'Bob', 1),
    (3, 'Charlie', 2),
    (4, 'David', 2),
    (5, 'Eve', 3),
    (6, 'Frank', 3),
    (7, 'Grace', 4);


SELECT * FROM Employees

/*
Question:
You have a table called Employees with the following columns:
id: A unique number for each employee.
name: The name of the employee.
manager_id: The id of the employee’s manager (this can be NULL if the employee has no manager).

Write a SQL query to show each employee's name along with their level in the company hierarchy. 
The level should start at 1 for employees who don’t have a manager (they are at the top of the hierarchy).


-- Expected output
id	name	level
1	Alice	1
2	Bob	2
3	Charlie	3
4	David	3
5	Eve	4
6	Frank	4
7	Grace	4

*/


SELECT * FROM employees;

