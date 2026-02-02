
SELECT
    a.title AS album_title,
    COUNT(t.track_id) AS track_count
FROM album a
JOIN track t
    ON t.album_id = a.album_id
GROUP BY
    a.album_id,
    a.title
HAVING COUNT(t.track_id) >= 10
ORDER BY track_count DESC, a.title ASC;
