
SELECT
    t.track_id,
    t.name,
    g.name AS genre_name,
    t.unit_price
FROM track t
JOIN genre g
    ON t.genre_id = g.genre_id
WHERE t.unit_price > (
    SELECT AVG(t2.unit_price)
    FROM track t2
    WHERE t2.genre_id = t.genre_id
)
ORDER BY g.name ASC, t.unit_price DESC, t.name ASC;
