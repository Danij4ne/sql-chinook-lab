
SELECT
    g.Name AS GenreName,
    COUNT(t.TrackId) AS TrackCount
FROM Genre g
JOIN Track t
    ON t.GenreId = g.GenreId
GROUP BY
    g.GenreId,
    g.Name
HAVING
    COUNT(t.TrackId) > (
        SELECT AVG(genre_track_count)
        FROM (
            SELECT
                COUNT(t2.TrackId) AS genre_track_count
            FROM Track t2
            GROUP BY t2.GenreId
        ) x
    )
ORDER BY
    TrackCount DESC;