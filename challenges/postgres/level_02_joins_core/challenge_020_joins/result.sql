
SELECT
    t.track_id,
    t.name,
    ar.name AS artist_name,
    t.unit_price
FROM track t
JOIN album al
    ON t.album_id = al.album_id
JOIN artist ar
    ON al.artist_id = ar.artist_id
WHERE t.unit_price > 0.99
ORDER BY ar.name ASC, t.name ASC;
