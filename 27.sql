-- Day 27/100 Days SQL Challenge


-- You are working with a table called orders that tracks customer orders with their order dates and amounts. 

-- Write a query to find each customer’s latest order amount
-- along with the amount of the second latest order. 

-- Your output should be like 
-- customer_id, lastest_order_amount, second_lastest_order_amount    


DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    order_amount DECIMAL(10, 2)
);

INSERT INTO orders (order_id, customer_id, order_date, order_amount) VALUES
(1, 101, '2024-01-10', 150.00),
(2, 101, '2024-02-15', 200.00),    -- What if the order_amount is smaller than the other two amounts but still the client wants the second_latest_order_Amount, on the case the code will not pass the test cases        
(3, 101, '2024-03-20', 180.00),
(4, 102, '2024-01-12', 200.00),
(5, 102, '2024-02-25', 250.00),
(6, 102, '2024-03-10', 320.00),
(7, 103, '2024-01-25', 400.00),
(8, 103, '2024-02-15', 420.00);



SELECT * FROM orders;


SELECT 
    o1.customer_id,
    o1.order_amount as latest_order_amount,
    (SELECT 
        MAX(o3.order_amount) 
    FROM orders as o3
    WHERE 
        o3.customer_id = o1.customer_id
        AND
        o3.order_date < o1.order_date   
    ) as second_latest_order_amount
    -- order_date
FROM orders as o1
WHERE 
    o1.order_date = (SELECT MAX(order_date) 
                    FROM orders as o2 
                    WHERE o2.customer_id = o1.customer_id)



--- The below code will pass the every test case
WITH RankedOrders AS (
    SELECT 
        customer_id, 
        order_amount,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS rn
    FROM 
        orders
)
SELECT 
    customer_id,
    MAX(CASE WHEN rn = 1 THEN order_amount END) AS latest_order_amount,
    MAX(CASE WHEN rn = 2 THEN order_amount END) AS second_latest_order_amount
FROM 
    RankedOrders
GROUP BY 
    customer_id;



