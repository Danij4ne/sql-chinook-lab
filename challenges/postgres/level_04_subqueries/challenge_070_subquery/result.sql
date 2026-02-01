
SELECT DISTINCT
    a.album_id,
    a.title
FROM album a
WHERE a.album_id IN (
    SELECT album_id
    FROM track
    WHERE unit_price > 0.99
)
ORDER BY a.title ASC;
