
SELECT
    t.track_id,
    t.name,
    g.name AS genre_name,
    mt.name AS media_type_name
FROM track t
JOIN genre g
    ON t.genre_id = g.genre_id
JOIN media_type mt
    ON t.media_type_id = mt.media_type_id
WHERE g.name = 'Rock'
ORDER BY t.name ASC;
