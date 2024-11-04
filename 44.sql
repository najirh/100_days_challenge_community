-- SQL Day 44/100 Challenge

DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);


INSERT INTO employees (name, department, salary) VALUES
('Alice', 'Sales', 50000),
('Bob', 'Sales', 55000),
('Charlie', 'Marketing', 60000),
('Diana', 'IT', 70000),
('Eve', 'IT', 65000),
('Frank', 'HR', 48000);

BEGIN;

SELECT * FROM employees;

-- Task Change employee salary from it to 90,000

UPDATE employees
SET salary = 9000
WHERE department = 'IT'


ROLLBACK;

COMMIT;



