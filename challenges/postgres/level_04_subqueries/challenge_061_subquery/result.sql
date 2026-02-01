
SELECT
    a.album_id,
    a.title AS album_title,
    COUNT(t.track_id) AS track_count
FROM album a
JOIN track t
    ON t.album_id = a.album_id
GROUP BY
    a.album_id,
    a.title
HAVING COUNT(t.track_id) > (
    SELECT AVG(track_per_album)
    FROM (
        SELECT
            COUNT(track_id) AS track_per_album
        FROM track
        GROUP BY album_id
    ) sub
)
ORDER BY track_count DESC, album_title ASC;
