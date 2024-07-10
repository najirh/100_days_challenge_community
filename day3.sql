-- Day 03/100 

-- Create the student_details table
CREATE TABLE students (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Gender CHAR(1)
);

-- Insert the data into the student_details table
INSERT INTO students (ID, Name, Gender) VALUES
(1, 'Gopal', 'M'),
(2, 'Rohit', 'M'),
(3, 'Amit', 'M'),
(4, 'Suraj', 'M'),
(5, 'Ganesh', 'M'),
(6, 'Neha', 'F'),
(7, 'Isha', 'F'),
(8, 'Geeta', 'F');


/*
Given table student_details, 
write a query which displays names 
alternately by gender and sorted 
by ascending order of column ID.
*/

SELECT * FROM students;

WITH ranked_table
AS
(
    SELECT *,
        ROW_NUMBER() OVER(PARTITION BY gender ORDER BY id) as rn
    FROM students
),
ranked_table2
AS
(
SELECT 
    id,
    name,
    gender,
    rn
FROM ranked_table    
ORDER BY rn,
         CASE
             WHEN gender='M' THEN 1 
             ELSE 2
         END   
)

SELECT
    id,
    name,
    gender
FROM ranked_table2   









































WITH ranked_table
AS
(
SELECT 
    *,
    ROW_NUMBER() OVER(PARTITION BY gender ORDER BY id) as rn
FROM students
),

cte2
AS
(
SELECT 
    id,
    name,
    gender,
    rn
FROM ranked_table
ORDER BY 
    rn,
    (CASE 
        WHEN gender = 'M' 
        THEN 1 ELSE 2 
    END)
)
SELECT 
    id,
    name,
    gender
FROM
CTE2


