-- day 23/100
-- spotify

DROP TABLE IF EXISTS spotify;
CREATE TABLE spotify (
    user_id INT,
    song_id INT,
    play_date DATE
);

INSERT INTO spotify (user_id, song_id, play_date) VALUES
(1, 101, '2023-01-01'), -- Week 1
(2, 101, '2023-01-01'), -- Week 1
(3, 101, '2023-01-02'), -- Week 1
(7, 101, '2023-01-09'), -- Week 2
(8, 101, '2023-01-09'), -- Week 2
(1, 101, '2023-01-09'), -- Week 2
(2, 101, '2023-01-09'), -- Week 2
(3, 101, '2023-01-10'), -- Week 2
(4, 101, '2023-01-10'), -- Week 2
(5, 101, '2023-01-11'), -- Week 2
(1, 102, '2023-01-01'), -- Week 1
(2, 102, '2023-01-08'), -- Week 2
(3, 102, '2023-01-09'), -- Week 2
(4, 102, '2023-01-09'), -- Week 2
(5, 102, '2023-01-09'), -- Week 2
(1, 103, '2023-01-01'), -- Week 1
(2, 103, '2023-01-02'), -- Week 1
(3, 103, '2023-01-03'), -- Week 1
(4, 103, '2023-01-10'), -- Week 2
(5, 103, '2023-01-10'), -- Week 2
(1, 104, '2023-01-01'), -- Week 1
(2, 104, '2023-01-05'), -- Week 1
(3, 104, '2023-01-07'), -- Week 1
(4, 104, '2023-01-12'), -- Week 2
(5, 104, '2023-01-13'); -- Week 2



/*
Question:
Identifying Trending Songs:
Spotify wants to identify songs that have suddenly gained popularity within a week.

Write a SQL query to find the song_id and week_start 
date of all songs that had a play count increase of 
at least 300% from one week to the next. 
Consider weeks starting on Mondays.
*/

-- 1. each song_id play cnt for each
-- 2. each song and their last week play cnt    



WITH weekly_plays
AS    
(SELECT 
     song_id,
     DATE_TRUNC('week', play_date) as week_start_day,
     COUNT(*)::numeric as play_cnt   
FROM spotify
GROUP BY 1, 2
),
prev_plays
AS    
(SELECT 
     song_id,
     week_start_day,
     play_cnt,   
    LAG(play_cnt) OVER(PARTITION BY song_id ORDER BY week_start_day) as prev_w_play_cnt
FROM weekly_plays
),
growth_ratio
AS    
(SELECT 
     song_id,
     week_start_day,
     play_cnt,   
     prev_w_play_cnt,
    ROUND((play_cnt-prev_w_play_cnt)/prev_w_play_cnt * 100, 2) as growth_ratio
FROM prev_plays
WHERE play_cnt > prev_w_play_cnt
)
SELECT 
     song_id,
     week_start_day 
FROM growth_ratio    
WHERE growth_ratio > 300;
    
    





















-- SELECT DATE_TRUNC('week', '2024-08-15'::DATE)


growth ratio = cr_sale - prev_sale/prev_sale * 100

300- 300/300 * 100




