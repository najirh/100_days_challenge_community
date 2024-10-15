-- Day 37/100
-- Flipkart

Create table If Not Exists Logs (Id int, Num int);

insert into Logs (Id, Num) values ('1', '1');
insert into Logs (Id, Num) values ('2', '1');
insert into Logs (Id, Num) values ('3', '1');
insert into Logs (Id, Num) values ('4', '2');
insert into Logs (Id, Num) values ('5', '1');
insert into Logs (Id, Num) values ('6', '2');
insert into Logs (Id, Num) values ('7', '2');


-- Problem statement
-- Table: Logs

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | num         | varchar |
-- +-------------+---------+
-- id is the primary key for this table.

-- Write an SQL query to find all numbers that appear at least three times consecutively.

-- Return the result table in any order.

SELECT 
	num
FROM
(
	SELECT *,
		LAG(num, 1) OVER(ORDER BY id) as prev_rec,
		LAG(num, 2) OVER(ORDER BY id) as sec_prev_rec
	FROM logs
) as subquery
WHERE
	num = prev_rec
	AND
	prev_rec = sec_prev_rec




  
