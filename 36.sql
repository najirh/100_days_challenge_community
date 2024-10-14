-- Day 36/100
-- Amazon and Google SQL Problems

Create table If Not Exists Weather (Id int, RecordDate date, Temperature int);

insert into Weather (Id, RecordDate, Temperature) values ('1', '2015-01-01', '10');
insert into Weather (Id, RecordDate, Temperature) values ('2', '2015-01-02', '25');
insert into Weather (Id, RecordDate, Temperature) values ('3', '2015-01-03', '20');
insert into Weather (Id, RecordDate, Temperature) values ('4', '2015-01-04', '30');

SELECT * FROM weather;

/*
Write an SQL query to find all dates' id with higher temperature compared to its previous dates (yesterday).
*/

WITH weather_data
AS
(
	SELECT *,
		LAG(temperature, 1) OVER(ORDER BY recorddate) as prev_day_temp
	FROM weather
)
SELECT 
	id
FROM weather_data
WHERE 
	temperature > prev_day_temp
	

