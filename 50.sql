-- 𝐒𝐜𝐡𝐞𝐦𝐚 𝐚𝐧𝐝 𝐃𝐚𝐭𝐚𝐬𝐞𝐭:
CREATE TABLE train_arrivals (train_id INT, arrival_time TIMESTAMP);

INSERT INTO train_arrivals (train_id, arrival_time) VALUES(1, '2024-11-17 08:00'),(2, '2024-11-17 08:05'),(3, '2024-11-17 08:05'),(4, '2024-11-17 08:10'),(5, '2024-11-17 08:10'),(6, '2024-11-17 12:15'),(7, '2024-11-17 12:20'),(8, '2024-11-17 12:25'),(9, '2024-11-17 15:00'),(10, '2024-11-17 15:00'),(11, '2024-11-17 15:00'),(12, '2024-11-17 15:06'),(13, '2024-11-17 20:00'),(14, '2024-11-17 20:10');

CREATE TABLE train_departures (train_id INT, departure_time TIMESTAMP);

INSERT INTO train_departures (train_id, departure_time) VALUES(1, '2024-11-17 08:15'),(2, '2024-11-17 08:10'),(3, '2024-11-17 08:20'),(4, '2024-11-17 08:25'),(5, '2024-11-17 08:20'),(6, '2024-11-17 13:00'),(7, '2024-11-17 12:25'),(8, '2024-11-17 12:30'),(9, '2024-11-17 15:05'),(10, '2024-11-17 15:10'),(11, '2024-11-17 15:15'),(12, '2024-11-17 15:15'),(13, '2024-11-17 20:15'),(14, '2024-11-17 20:15');

-----------


/*
You are given two tables, train_arrivals and train_departures, 
with the arrival and departure times of trains at a station. 

One platform can accommodate only one train at a time, 
from the beginning of the minute the train arrives until the 
end of the minute it departs. 

Write a query to find the minimum number of platforms 
required to handle all train traffic on the given day.
*/


SELECT * FROM train_arrivals;
SELECT * FROM train_departures;

WITH train_schedule
AS
(SELECT 
	arrival_time as event_time, 1 as events
FROM train_arrivals
UNION ALL
SELECT 
	departure_time as event_time, -1 as events
FROM train_departures

),
running_total
AS
(SELECT 
	event_time,
	SUM(events) OVER(ORDER BY event_time) as total_events
FROM train_schedule
)
SELECT 	
	MAX(total_events)as min_platform_required
FROM running_total