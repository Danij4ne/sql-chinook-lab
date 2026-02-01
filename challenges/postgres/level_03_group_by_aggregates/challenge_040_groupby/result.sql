
SELECT
    g.name AS genre_name,
    COUNT(t.track_id) AS track_count
FROM track t
JOIN genre g
    ON t.genre_id = g.genre_id
GROUP BY
    g.genre_id,
    g.name
HAVING COUNT(t.track_id) >= 20
ORDER BY track_count DESC, g.name ASC;
