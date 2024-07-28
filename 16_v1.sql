-- Day 16 of 100 days challenge

--write a query to find users whose transactions has breached their credit limit
DROP TABLE IF EXISTS users;

create table users
(
	user_id int,
	user_name varchar(20),
	credit_limit int
);

create table transactions
(
	trans_id int,
	paid_by int,
	paid_to int,
	amount int,
	trans_date date
);

insert into users(user_id,user_name,credit_limit)values
(1,'Peter',100),
(2,'Roger',200),
(3,'Jack',10000),
(4,'John',800);

insert into transactions(trans_id,paid_by,paid_to,amount,trans_date)values
(1,1,3,400,'01-01-2024'),
(2,3,2,500,'02-01-2024'),
(3,2,1,200,'02-01-2024');


-- 1. users and trans table
-- 2. each users and total paid
-- 3. each users money they have received
-- 4. credit limit + rm = new limit
-- 5. each spent > cl

A 300 + 500 = new limit 800
801 
200 =100 + 500
B --> A 500 

select * from users;
select * from transactions;

WITH spent_table
AS
(
select 
    paid_by as user_id,
    SUM(amount) as total_spent
from transactions
GROUP BY 1
),
money_received
AS
(select 
    paid_to as user_id,
    SUM(amount) as total_received
from transactions
GROUP BY 1
),
new_limit
as
(
SELECT
    u.user_id,
    u.user_name,
    u.credit_limit,
    COALESCE(st.total_spent, 0) as total_spent,
    COALESCE(mr.total_received, 0) as total_money_received,
    (u.credit_limit + COALESCE(mr.total_received, 0)) as new_limit
FROM users as u
LEFT JOIN
spent_table as st
ON u.user_id = st.user_id
LEFT JOIN 
money_received as mr
ON u.user_id = mr.user_id
)
SELECT 
    user_id,
    user_name,
    credit_limit,
    total_spent,
    total_money_received,
    new_limit
FROM new_limit
WHERE total_spent > new_limit

    