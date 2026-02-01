
SELECT
    g.Name AS GenreName,
    COUNT(t.TrackId) AS TrackCount
FROM Track t
INNER JOIN Genre g
    ON t.GenreId = g.GenreId
GROUP BY
    g.Name
ORDER BY
    TrackCount DESC;