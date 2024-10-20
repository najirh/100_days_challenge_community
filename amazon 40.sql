-- Day 40/100
-- Amazon 


CREATE TABLE IF NOT EXISTS Delivery (
    delivery_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    customer_pref_delivery_date DATE
);


INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES
(1, 1, '2019-08-01', '2019-08-02'),
(2, 2, '2019-08-02', '2019-08-02'),
(3, 1, '2019-08-11', '2019-08-12'),
(4, 3, '2019-08-24', '2019-08-24'),
(5, 3, '2019-08-21', '2019-08-22'),
(6, 2, '2019-08-11', '2019-08-13'),
(7, 4, '2019-08-09', '2019-08-09');

SELECT * FROM delivery;


-- Problem Statement
-- SQL Query
-- Write an SQL query to calculate the percentage of immediate orders 
-- among the first orders of all customers. 
-- The result should be rounded to 2 decimal places.

-- Definitions:
-- If the preferred delivery date of the customer is the same as the order date,
-- then the order is classified as "immediate." Otherwise, it is classified as "scheduled."

WITH delivery_cte
AS
(SELECT *,
	ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) as rn
FROM delivery
),
first_order_cte
AS
(SELECT 
	CASE
		WHEN order_date = customer_pref_delivery_date THEN 'immediate'
		ELSE 'scheduled'
		END as order_type
FROM delivery_cte
WHERE rn = 1
)
SELECT 
	ROUND(
	COUNT(*)::numeric/
	(SELECT COUNT(*) FROM delivery) * 100
	,2) as immediate_order_percentage
FROM first_order_cte
WHERE order_type = 'immediate'





WITH delivery_cte
AS
(SELECT *,
	ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) as rn
FROM delivery
)
(SELECT 
	ROUND(
		SUM(CASE
		WHEN order_date = customer_pref_delivery_date THEN 1
		ELSE 0
		END)::numeric/(SELECT COUNT(*) FROM delivery) 
		* 100
		,2) as immediate_order_percentage
FROM delivery_cte
WHERE rn = 1
)





