-- DAY - 49/100

-- 5 Most Asked SQL Interview Questions

-- INSERT STATEMENT DATA
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50),
    salary DECIMAL(10, 2),
    department_id INT,
    manager_id INT
);


INSERT INTO employees (employee_name, salary, department_id, manager_id) VALUES
-- Managers
('Sophia', 150000, 1, NULL),  -- Manager of Dept 1
('Liam', 140000, 2, NULL),    -- Manager of Dept 2

-- Employees under Sophia (Dept 1)
('Olivia', 80000, 1, 1),       -- Earns less than manager
('Noah', 90000, 1, 1),         -- Earns less than manager
('Ava', 160000, 1, 1),         -- Earns more than manager

-- Employees under Liam (Dept 2)
('Emma', 85000, 2, 2),         -- Earns less than manager
('Lucas', 145000, 2, 2),       -- Earns more than manager
('Mia', 95000, 2, 2),
('Ethan', 135000, 2, 2),       -- Close to manager salary


-- Employee without correct department id
('John', 65000, 4, 1),         -- Earns less than manager
('Mike', 55000, 4, 2),       -- Earns more than manager
('Sam', 85000, 4, NULL),
('Alex', 110000, 4, 2);       -- Close to manager salary


SELECT * FROM employees;




-- 5 Data Analystics Interview Questions

1. Identify Employees who earn more than their managers
2. Return each employee along with their manager name
3. 2nd highest salary (use subquery)
4 Display the names of employees who have a salary 
  above the average salary in their department.

5. Can we get same task done using FULL JOIN instead LEFT JOIN 
-- IF yes explain how (also tell which join will get the job done in faster)


-- 1. Identify Employees who earn more than their managers
SELECT 
e1.*
FROM 
employees as e1
JOIN
employees as e2
ON e1.manager_id = e2.employee_id
WHERE 
	e1.salary > e2.salary


-- Return each employee along with their manager name


SELECT 
e1.*,
e2.employee_name as manager_name
FROM 
employees as e1
JOIN
employees as e2
ON e1.manager_id = e2.employee_id



-- 3. 2nd highest salary (use subquery)

SELECT 
MAX(salary)
salary
FROM employees
WHERE salary < (SELECT MAX(SALARY) FROM employees)
ORDER BY salary DESC

4. 
-- 4 Display the names of employees who have a salary 
--   above the average salary in their department.

-- d-id 1- 120k
-- did 2 -- 120k
-- d 3 -- 78k

SELECT 
	e1.employee_name,
	e1.salary,
	e1.department_id
FROM employees as e1
WHERE e1.salary > (SELECT AVG(e2.salary) 
					FROM employees as e2 
					WHERE e2.department_id = e1.department_id)




