
SELECT
    g.name AS genre_name,
    AVG(t.unit_price) AS avg_unit_price
FROM track t
JOIN genre g
    ON t.genre_id = g.genre_id
GROUP BY
    g.genre_id,
    g.name
HAVING AVG(t.unit_price) >= 1.00
ORDER BY avg_unit_price DESC, g.name ASC;
