
SELECT
    g.name AS genre_name,
    SUM(il.quantity) AS total_quantity_sold
FROM invoice_line il
JOIN track t
    ON il.track_id = t.track_id
JOIN genre g
    ON t.genre_id = g.genre_id
GROUP BY
    g.genre_id,
    g.name
HAVING SUM(il.quantity) >= 50
ORDER BY total_quantity_sold DESC, g.name ASC;
