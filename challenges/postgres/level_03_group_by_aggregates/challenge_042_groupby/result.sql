
SELECT
    g.name AS genre_name,
    SUM(il.unit_price * il.quantity) AS total_revenue
FROM invoice_line il
JOIN track t
    ON il.track_id = t.track_id
JOIN genre g
    ON t.genre_id = g.genre_id
GROUP BY
    g.genre_id,
    g.name
HAVING SUM(il.unit_price * il.quantity) >= 100.00
ORDER BY total_revenue DESC, g.name ASC;
