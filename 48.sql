-- Question No 48
-- Google, Goldman Sachs, Microsoft

-- Create ENUM type for login activities
DROP TABLE IF EXISTS traffic;

-- Create Traffic table
CREATE TABLE IF NOT EXISTS traffic (
    user_id INT,
    activity VARCHAR(25),
    activity_date DATE
);

-- Insert data into Traffic table with more diverse activities
INSERT INTO traffic (user_id, activity, activity_date) VALUES
    (1, 'login', '2019-05-01'),
    (1, 'homepage', '2019-05-01'),
    (1, 'logout', '2019-05-01'),
    (1, 'groups', '2019-05-02'),
  	(1, 'login', '2019-06-15'),
    (1, 'logout', '2019-06-15'),
    (1, 'login', '2019-06-25'),
    (1, 'homepage', '2019-06-25'),
    (2, 'login', '2019-06-21'),
    (2, 'logout', '2019-06-21'),
    (2, 'jobs', '2019-06-22'),
    (3, 'login', '2019-01-01'),
    (3, 'jobs', '2019-01-01'),
    (3, 'logout', '2019-01-01'),
    (3, 'homepage', '2019-06-25'),
    (4, 'login', '2019-06-21'),
    (4, 'groups', '2019-06-21'),
    (4, 'logout', '2019-06-21'),
    (4, 'homepage', '2019-06-23'),
    (5, 'login', '2019-03-01'),
    (5, 'logout', '2019-03-01'),
    (5, 'login', '2019-06-21'),
    (5, 'logout', '2019-06-21'),
    (5, 'jobs', '2019-06-24');

SELECT * FROM traffic;

/*
Write an SQL query that reports for every date 
within at most 90 days from today, 

the number of users that logged in for the 
first time on that date. 
Assume today is 2019-06-30.

Note that we only care about dates with non zero user count.
*/

-- 1. Filter data for last 90 days (today = 2019-06-30)
-- each user activity = login
-- login the first time

-- 90 days duration -- all dates

SELECT * FROM traffic;




















SELECT 
	activity_date, -- group by 
	COUNT(DISTINCT user_id) as no_user_logged_in
FROM traffic
WHERE 
	activity_date >= '2019-06-30'::DATE - INTERVAL '90 days'
	AND
	activity = 'login'
	AND
	(user_id, activity_date) IN 
								(
								SELECT 
									user_id,
									MIN(activity_date)
								FROM traffic
								WHERE 
									activity = 'login'
								GROUP BY user_id
								)
GROUP BY activity_date
HAVING COUNT(user_id) > 0;



-- SELECT CURRENT_DATE - INTERVAL '90 days'


























-- SELECT 
-- 	activity_date,
-- 	COUNT(*)
-- FROM traffic
-- WHERE 
-- 	activity_date >= '2019-06-30'::date - INTERVAL '90 days'
-- 	AND
-- 	activity = 'login'
-- 	AND
-- 	(user_id, activity_date) IN
-- 								(
-- 									SELECT 
-- 										user_id, 
-- 										MIN(activity_date) 
-- 									FROM traffic
-- 									WHERE activity = 'login'
-- 									GROUP BY user_id
-- 								)
	
-- GROUP BY 1
-- HAVING COUNT(*) > 0
