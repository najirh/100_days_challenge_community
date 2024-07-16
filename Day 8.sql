-- Day 08/100 Days Challenge



DROP TABLE IF EXISTS trips;

CREATE TABLE trips (
    id INT PRIMARY KEY,
    driver_id INT,
    city VARCHAR(50),
    trip_distance FLOAT,
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    rating INT
);


INSERT INTO trips (id, driver_id, city, trip_distance, start_time, end_time, rating) VALUES
(1, 101, 'Mumbai', 5.2, '2024-07-01 08:00:00', '2024-07-01 08:20:00', 4),
(2, 101, 'Mumbai', 3.0, '2024-07-01 09:00:00', '2024-07-01 09:15:00', 5),
(3, 102, 'Delhi', 7.1, '2024-07-01 10:00:00', '2024-07-01 10:30:00', 4),
(4, 102, 'Delhi', 2.5, '2024-07-01 11:00:00', '2024-07-01 11:12:00', 2), -- Rating is 3 or below, should be ignored
(5, 103, 'Bangalore', 4.8, '2024-07-01 12:00:00', '2024-07-01 12:25:00', 4),
(6, 103, 'Bangalore', 6.2, '2024-07-01 13:00:00', '2024-07-01 13:40:00', 5),
(7, 101, 'Mumbai', 8.0, '2024-07-02 14:00:00', '2024-07-02 14:30:00', 5),
(8, 102, 'Delhi', 5.5, '2024-07-02 15:00:00', '2024-07-02 15:25:00', 4),
(9, 103, 'Bangalore', 3.6, '2024-07-02 16:00:00', '2024-07-02 16:18:00', 3),
(10, 104, 'Chennai', 6.5, '2024-07-02 09:30:00', '2024-07-02 10:00:00', 4),
(11, 103, 'Hyderabad', 3.2, '2024-07-02 11:00:00', '2024-07-02 11:20:00', 5),
(12, 104, 'Chennai', 4.9, '2024-07-03 13:00:00', '2024-07-03 13:35:00', 4),
(13, 104, 'Kolkata', 7.8, '2024-07-03 15:30:00', '2024-07-03 16:10:00', 5),
(14, 103, 'Hyderabad', 2.7, '2024-07-03 17:00:00', '2024-07-03 17:18:00', 3),
(15, 104, 'Kolkata', 5.4, '2024-07-04 08:45:00', '2024-07-04 09:15:00', 4),
(16, 104, 'Chennai', 3.3, '2024-07-04 10:30:00', '2024-07-04 10:50:00', 5);


SELECT * FROM trips;

/*
You are given a table trips that contains information about taxi trips. The table schema is as follows:

trips
---------
id INT PRIMARY KEY
driver_id INT
city VARCHAR(50)
trip_distance FLOAT
start_time TIMESTAMP
end_time TIMESTAMP
rating INT


Write an SQL query to find the average trip duration for each driver in each city excluding trips where the rating is below 3. The result should include driver_id, city, and average_trip_duration rounded to two decimal places. 

Note:
The average_trip_duration is calculated as the average of the differences between end_time and start_time for each trip.

-- Expected Output Schema:
driver_id INT
city VARCHAR(50)
average_trip_duration FLOAT

*/

-- driver_id, in each city avg duration group by 1, 2
-- AVG 
--  avg(end time - start time = time diff)
-- RATING >=3



end time - start time

SELECT 
    driver_id,
    city,
    ROUND(AVG(EXTRACT(EPOCH FROM (end_time - start_time)/60)), 2) as avg_time_duration    
FROM trips
GROUP BY 
        driver_id,
        city


