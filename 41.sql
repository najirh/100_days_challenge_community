-- Day 41/100 SQL Challenge


DROP TABLE IF EXISTS salaries;
CREATE TABLE Salaries (
    company_id INT, 
    employee_id INT, 
    employee_name VARCHAR(50), 
    salary INT
);

INSERT INTO Salaries (company_id, employee_id, employee_name, salary) VALUES
(1, 1, 'Tony', 2000),
(1, 2, 'Pronub', 21300),
(1, 3, 'Tyrrox', 10800),
(2, 1, 'Pam', 300),
(2, 7, 'Bassem', 450),
(2, 9, 'Hermione', 700),
(3, 7, 'Bocaben', 100),
(3, 2, 'Ognjen', 2200),
(3, 13, 'Nyancat', 3300),
(3, 15, 'Morninngcat', 7777);


-- Category Hard
-- Company Altasian
-- HSBC 

Problem
Write an SQL query to find the salaries of the employees after applying taxes.

The tax rate is calculated for each company based on the following criteria:

0% If the max salary of any employee in the company is less than 1000$.
24% If the max salary of any employee in the company is in the range [1000, 10000] inclusive.
49% If the max salary of any employee in the company is greater than 10000$.
Return the result table in any order. Round the salary to the nearest integer.

SELECT * FROM salaries;

-- cte - max sal
-- each company -- max salary
-- group by c id max(salary)

join salaries
- max salary
-- case statement -- tax%
-- 2000 * (1 - 24/100)

with max_sal
AS
(
	SELECT 
		company_id,
		MAX(salary) as max_salary
	FROM salaries
	GROUP BY company_id
),
salary_before_tax
AS
(
		SELECT 
			s.company_id,
			s.employee_id,
			s.employee_name,
			s.salary,
			ms.max_salary,
			CASE
				WHEN ms.max_salary < 1000 THEN 0
				WHEN ms.max_salary BETWEEN 1000 AND 10000 THEN 24
				ELSE 49
			END as tax_slab
		FROM salaries as s
		JOIN max_sal as ms
		ON s.company_id = ms.company_id
)
SELECT 
	company_id,
	employee_id,
	employee_name,
	ROUND(
			(salary) * (1- tax_slab::numeric/100)
			) as salary_after_tax
FROM salary_before_tax


