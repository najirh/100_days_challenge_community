-- Day 07/100 SQL Problems

DROP TABLE IF EXISTS orders;
CREATE TABLE ORDERS (
    order_id VARCHAR(10),
    customer_id INTEGER,
    order_datetime TIMESTAMP,
    item_id VARCHAR(10),
    order_quantity INTEGER,
    PRIMARY KEY (order_id, item_id)
);

-- Inserting sample data

-- Assuming the ORDERS table is already created as mentioned previously

-- Inserting the provided data
INSERT INTO ORDERS (order_id, customer_id, order_datetime, item_id, order_quantity) VALUES
('O-005', 1, '2023-01-12 11:48:00', 'C005', 1),
('O-005', 1, '2023-01-12 00:48:00', 'C008', 1),
('O-006', 4, '2023-01-16 02:52:00', 'C012', 2),
('O-001', 4, '2023-06-15 04:35:00', 'C004', 3),
('O-007', 1, '2024-07-13 09:15:00', 'C007', 2),
('O-010', 3, '2024-07-13 13:45:00', 'C008', 5),
('O-011', 3, '2024-07-13 16:20:00', 'C006', 2),
('O-012', 1, '2024-07-14 10:15:00', 'C005', 3),
('O-008', 1, '2024-07-14 11:00:00', 'C004', 4),
('O-013', 2, '2024-07-14 12:40:00', 'C007', 1),
('O-009', 3, '2024-07-14 14:22:00', 'C006', 3),
('O-014', 2, '2024-07-14 15:30:00', 'C004', 6),
('O-015', 1, '2024-07-15 05:00:00', 'C012', 4);




DROP TABLE IF EXISTS ITEMS;
CREATE TABLE ITEMS (
    item_id VARCHAR(10) PRIMARY KEY,
    item_category VARCHAR(50)
);

-- Inserting sample data
INSERT INTO ITEMS (item_id, item_category) VALUES
('C004', 'Books'),
('C005', 'Books'),
('C006', 'Apparel'),
('C007', 'Electronics'),
('C008', 'Electronics'),
('C012', 'Apparel');

SELECT * FROM ITEMS;
SELECT * FROM orders;

/*
-- Amazon Asked Interview Questions
1. How many units were ordered yesterday?
2. In the last 7 days (including today), how many units were ordered in each category?
3. Write a query to get the earliest order_id for all customers for each date they placed an order.
4. Write a query to find the second earliest order_id for each customer for each date they placed two or more orders.
*/


-- How many units were ordered yesterday?

SELECT 
    COUNT(*)
FROM orders
-- WHERE order_datetime = '2024-07-14'
WHERE 
    EXTRACT(DAY FROM order_datetime) = 
    EXTRACT (DAY FROM CURRENT_DATE) - 1
   

-- 2. In the last 7 days (including today), how many units were ordered in each category?

-- ORDER * items items id
-- filter data for last 7 days
-- group by category COUNT(*)

SELECT 
    i.item_category,
    COUNT(o.order_id) as total_orders
FROM orders as o
JOIN 
items as i
ON o.item_id = i.item_id
WHERE order_datetime::date BETWEEN CURRENT_DATE - 6 AND  CURRENT_DATE
GROUP BY i.item_category


-- SELECT 
--     *,
--     order_datetime::date
-- FROM orders


-- SELECT CURRENT_DATE - 6
-- 2024-07-15
09th july


3. Write a query to get the earliest order_id for all customers for each date they placed an order.

SELECT 
    order_id
FROM 
(
    SELECT 
    *,
        ROW_NUMBER() OVER(PARTITION BY customer_id, order_datetime::date ORDER BY order_datetime) as rn
    FROM orders
) as x
WHERE rn = 1


-- 4. Write a query to find the second earliest order_id for each customer for each date they placed 3 or more orders.

WITH x_table
AS
(
    SELECT
        *,
        ROW_NUMBER() OVER(PARTITION BY customer_id, order_datetime::date ORDER BY order_datetime) as rn
    FROM orders
)
SELECT 
    order_id
FROM x_table
WHERE rn = 2






