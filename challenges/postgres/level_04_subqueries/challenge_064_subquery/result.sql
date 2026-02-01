
SELECT
    t.track_id,
    t.name,
    a.title AS album_title,
    t.milliseconds
FROM track t
JOIN album a
    ON t.album_id = a.album_id
WHERE t.milliseconds > (
    SELECT AVG(t2.milliseconds)
    FROM track t2
    WHERE t2.album_id = t.album_id
)
ORDER BY a.title ASC, t.milliseconds DESC, t.name ASC;
