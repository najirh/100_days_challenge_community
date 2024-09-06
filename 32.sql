-- Day 32/100 Days Challenge
-- Q1. Write SQL query to find median salary 
-- If we add 1 more record with salary 91,000 what will be median?



-- Create Employee table and insert data
DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees (
    id INT,          -- Auto-incrementing ID for each employee
    name VARCHAR(100) NOT NULL,     -- Employee name
    salary NUMERIC(10, 2),          -- Employee salary
    department_id INT,              -- Foreign key linking to Department table
    manager_id INT,                 -- Employee's manager (self-referencing foreign key)
    hire_date DATE NOT NULL        -- Date of hire
);

-- Insert data into Employees table with manually assigned IDs
INSERT INTO Employees (id, name, salary, department_id, manager_id, hire_date)
VALUES 
(1, 'Alice', 90000, 1, NULL, '2022-01-15'),    -- Alice is a top-level manager (no manager)
(2, 'Bob', 80000, 2, 1, '2022-02-20'),         -- Bob reports to Alice
(3, 'Charlie', 75000, 2, 1, '2022-03-12'),     -- Charlie reports to Alice
(4, 'David', 85000, 2, 1, '2022-03-25'),       -- David reports to Alice
(5, 'Eve', 95000, 2, 2, '2022-04-01'),         -- Eve reports to Bob
(6, 'Frank', 78000, 2, 2, '2022-04-20'),       -- Frank reports to Bob
(7, 'Grace', 60000, 3, 3, '2022-05-12'),       -- Grace reports to Charlie
(8, 'Heidi', 88000, 3, 1, '2022-06-15'),       -- Heidi reports to Alice
(9,	'Sam',	 89000, 1, 2, '2022-06-15');


-- ALTER TABLE employees
-- DROP COLUMN department_id;

-- ALTER TABLE employees
-- DROP COLUMN manager_id;

-- ALTER TABLE employees
-- DROP COLUMN hire_date;


-- 1, 2, 3 4, 4, 5, 6 ,7, 1, 8, 9
-- Mean/ Median
-- 1,1, 2, 3, 4, 4, 5, 6, 7, 8, 9 4+4/2 = 4

INSERT INTO employees
VALUES
(9, 'sam', 91000);
SELECT * FROM employees;

WITH ordered_salary
AS
(SELECT *,
	ROW_NUMBER() OVER(ORDER BY salary ASC) as sal_asc,
	ROW_NUMBER() OVER(ORDER BY salary DESC) as sal_desc
FROM Employees
)
SELECT
	AVG(salary) as median_salary
FROM ordered_salary
WHERE 
	ABS(sal_asc - sal_desc) >= 1




