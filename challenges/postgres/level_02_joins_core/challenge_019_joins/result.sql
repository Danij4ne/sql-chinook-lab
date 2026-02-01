
SELECT
    t.track_id,
    t.name,
    a.title,
    t.unit_price
FROM track t
JOIN album a
    ON t.album_id = a.album_id
WHERE t.unit_price >= 0.99
ORDER BY a.title ASC, t.name ASC;
