-- 22/100 Days SQL Challenge

-- Given a user_activity table, write a SQL query to find all users who have logged in on at least 3 consecutive days.

DROP TABLE IF EXISTS user_activity;
CREATE TABLE user_activity (
    user_id INT,
    login_date DATE
);

INSERT INTO user_activity (user_id, login_date) VALUES
(1, '2024-08-01'),
(1, '2024-08-02'),
(1, '2024-08-05'),
(1, '2024-08-07'),
(2, '2024-08-01'),
(2, '2024-08-02'),
(2, '2024-08-03'),
(2, '2024-08-04'),
(2, '2024-08-06'),
(3, '2024-08-01'),
(3, '2024-08-02'),
(3, '2024-08-03'),
(3, '2024-08-07'),
(4, '2024-08-02'),
(4, '2024-08-05'),
(4, '2024-08-07');

-- SQL query to find users who logged in on at least 3 consecutive days
WITH consecutive_logins AS (
    SELECT
        user_id,
        login_date,
        login_date - INTERVAL (ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY login_date)) DAY AS streak_group
    FROM user_activity
),
streaks AS (
    SELECT
        user_id,
        COUNT(*) AS consecutive_days
    FROM consecutive_logins
    GROUP BY user_id, streak_group
)
SELECT DISTINCT user_id
FROM streaks
WHERE consecutive_days >= 3;



