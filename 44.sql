-- SQL Challenge 44/100



CREATE TABLE IF NOT EXISTS ActorDirector (
    actor_id INT,
    director_id INT,
    timestamp INT
);

INSERT INTO ActorDirector (actor_id, director_id, timestamp) VALUES 
    (1, 1, 0),
    (1, 1, 1),
    (1, 1, 2),
    (1, 2, 3),
    (1, 2, 4),
    (2, 1, 5),
    (2, 1, 6);

SELECT * FROM ActorDirector;

/*
Write a SQL query for a report that provides the pairs (actor_id, director_id) 
where the actor have co-worked with the director at least 3 times.
*/

Result table:
+-------------+-------------+
| actor_id    | director_id |
+-------------+-------------+
| 1           | 1           |
+-------------+-------------+

SELECT 
	actor_id,
	director_id
	-- COUNT(*)
FROM ActorDirector
GROUP BY 1, 2
HAVING COUNT(*) >= 3




















