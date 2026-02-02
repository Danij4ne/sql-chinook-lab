
SELECT TrackId , Name , UnitPrice ,
ROW_NUMBER() OVER(ORDER BY Name)
FROM tracks ;