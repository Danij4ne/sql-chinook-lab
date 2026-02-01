
SELECT name , milliseconds , bytes
FROM track
WHERE milliseconds > 250000 and bytes > 5000000
ORDER BY milliseconds DESC ;