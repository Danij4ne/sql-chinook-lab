
SELECT
    g.genre_id,
    g.name AS genre_name,
    COUNT(t.track_id) AS track_count
FROM genre g
JOIN track t
    ON t.genre_id = g.genre_id
GROUP BY
    g.genre_id,
    g.name
HAVING COUNT(t.track_id) > (
    SELECT AVG(tracks_per_genre)
    FROM (
        SELECT
            COUNT(track_id) AS tracks_per_genre
        FROM track
        GROUP BY genre_id
    ) sub
)
ORDER BY track_count DESC, genre_name ASC;
