-- Day 28/100

DROP TABLE IF EXISTS sales;
CREATE TABLE sales (id SERIAL,
    sale_date DATE,
    sale_amount DECIMAL(10, 2)
);

DELETE FROM sales;  -- Clear the table to avoid duplicates

INSERT INTO sales (sale_date, sale_amount) VALUES
('2024-06-01', 100.00),
('2024-06-02', 150.00),
('2024-07-03', 200.00),
('2024-07-04', 180.00),
('2024-07-05', 120.00),
('2024-07-08', 130.00),
('2024-07-09', 170.00),
('2024-07-10', 210.00),
('2024-07-11', 190.00),
('2024-07-12', 200.00),
('2024-07-13', 150.00),
('2024-07-14', 180.00), -- Sunday
('2024-07-15', 220.00),
('2024-07-16', 250.00),
('2024-07-17', 230.00),
('2024-07-18', 210.00),
('2024-07-19', 200.00),
('2024-07-20', 240.00), -- Saturday
('2024-07-21', 260.00), -- Sunday
('2024-07-22', 230.00),
('2024-07-23', 210.00),
('2024-07-24', 180.00),
('2024-07-25', 220.00),
('2024-07-26', 250.00),
('2024-07-27', 270.00), -- Saturday
('2024-07-28', 280.00), -- Sunday
('2024-07-29', 230.00),
('2024-07-30', 210.00),
('2024-07-31', 180.00);



SELECT * FROM sales;


-- -- Question:
-- You have a table of daily sales data of Amazon. Write a query to:
-- Find the total sales for each weekend day (Saturday and Sunday) in July 2024.

-- filter for 2024 and july
-- weekends column (saturday, sunday)
-- weekend and total sale
-- group by each weekend sum(sale)



SELECT 
	EXTRACT(WEEK FROM sale_date) as weekends,
	-- TO_CHAR(sale_date, 'Day')
	SUM(sale_amount) as total_sale_weekends
FROM sales
WHERE 
	TO_CHAR(sale_date, 'yyyy-mm') = '2024-07'
	AND
	EXTRACT(DOW FROM sale_date) IN (6, 0)
GROUP BY 1


