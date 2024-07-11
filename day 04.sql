-- Day 04/100 days challenge


CREATE TABLE employees (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Manager_ID INT
);


INSERT INTO employees (Emp_ID, Emp_Name, Manager_ID) VALUES
(1, 'John', 3),
(2, 'Philip', 3),
(3, 'Keith', 7),
(4, 'Quinton', 6),
(5, 'Steve', 7),
(6, 'Harry', 5),
(7, 'Gill', 8),
(8, 'Rock', NULL);


-- 2.2 Given table employees, write a 
query to display employee names along with manager names


SELECT 
    e1.emp_id,
    e1.emp_name,
    e1.manager_id,
    e2.emp_id,
    e2.emp_name as manager_name  
FROM employees as e1 
JOIN
employees as e2
ON e1.manager_id = e2.emp_id
















