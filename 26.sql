-- 24/100 days

-- Write SQL query to find average processing time by each machine!

DROP TABLE IF EXISTS activity;
CREATE TABLE Activity (
    machine_id INT,
    process_id INT,
    activity_type VARCHAR(10),
    timestamp FLOAT
);


INSERT INTO Activity (machine_id, process_id, activity_type, timestamp)
VALUES
(1, 1, 'start', 10.5),
(1, 1, 'end', 15.0),
(1, 2, 'start', 20.0),
(1, 2, 'end', 25.5),
(2, 1, 'start', 5.0),
(2, 1, 'end', 12.5),
(2, 2, 'start', 15.0),
(2, 2, 'end', 20.0);


--
SELECT * FROM activity;







