-- Day 38/100 DAYS SQL CHALLENGE

-- Walmart SQL Question

DROP TABLE IF EXISTS Transactions;

CREATE TABLE Transactions
(transaction_id int, day timestamp, amount int);

insert into Transactions (transaction_id, day, amount) 
values 
('8', '2021-4-3 15:57:28', '57'),
('9', '2021-4-28 08:47:25', '21'),
('1', '2021-4-29 13:28:30', '58'),
('5', '2021-4-28 16:39:59', '40'),
('6', '2021-4-29 23:39:28', '58'),
('10', '2021-4-3 16:57:28', '57');

SELECT * FROM transactions;


Write an SQL query to report the IDs of the transactions
with the maximum amount on their respective day. 

If in one day there are multiple such transactions, return all of them.










SELECT 
	transaction_id
FROM
	(SELECT 
		*,
		RANK() OVER(PARTITION BY 
		(EXTRACT(DAY FROM day) ) 
		ORDER BY amount DESC)
		as ranks
	FROM transactions
	) as x
WHERE ranks = 1







