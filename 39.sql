-- Day 39/40 SQL Challeng

-- AirBnb
-- Problem statement
-- Table: Customers



Create table If Not Exists Customers (customer_id int, customer_name varchar(20));
insert into Customers (customer_id, customer_name) values ('1', 'Alice');
insert into Customers (customer_id, customer_name) values ('4', 'Bob');
insert into Customers (customer_id, customer_name) values ('5', 'Charlie');
-- insert into Customers (customer_id, customer_name) values ('101', 'John');
-- insert into Customers (customer_id, customer_name) values ('99', 'Mike');

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | customer_id   | int     |
-- | customer_name | varchar |
-- +---------------+---------+


-- customer_id is the primary key for this table.
-- Each row of this table contains the name and the id customer.


-- Write an SQL query to find the missing customer IDs. 
-- The missing IDs are ones that are not in the 
-- Customers table but are in the range between 1
-- and the maximum customer_id present in the table.

-- Notice that the maximum customer_id will not exceed 100.

SELECT * FROM Customers;

