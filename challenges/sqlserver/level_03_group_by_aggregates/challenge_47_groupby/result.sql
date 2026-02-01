
SELECT 
    g.Name AS GenreName,
    AVG(t.Milliseconds) AS AvgDurationMs
FROM Track t
JOIN Genre g 
    ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY AvgDurationMs DESC;