-- Day 35/100 days 

/*
Problem: Find the Products with Sales on Consecutive Days
You are given a sales table with records of sales for each product. 

Write a query to find all products that were sold on consecutive days at least once. 
Return the ProductID and the first date in each pair of consecutive sales days.
*/

-- Create Sales Table
DROP TABLE IF EXISTS sales;
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    SaleDate DATE,
    Quantity INT
);

-- Insert records into Sales Table
INSERT INTO Sales (SaleID, ProductID, SaleDate, Quantity) VALUES
(1, 1, '2024-01-01', 100),  
(2, 1, '2024-01-02', 200), 
(3, 1, '2024-01-04', 150),  
(4, 2, '2024-01-03', 50),   
(5, 2, '2024-01-04', 75),   
(6, 3, '2024-01-05', 300), 
(7, 3, '2024-01-07', 250); 

WITH cte
AS
(
SELECT 
	s1.saleid,
	s1.productid as product_id,
	s1.saledate as first_sale_date,
	s2.saledate as second_sale_date
FROM sales as s1
JOIN
sales as s2
ON s2.productid = s1.productid
WHERE 
	ABS(s1.saledate - s2.saledate) = 1	
)
SELECT 
	product_id,
	MIN(first_sale_date) as first_sale_date
FROM cte
GROUP BY 1







