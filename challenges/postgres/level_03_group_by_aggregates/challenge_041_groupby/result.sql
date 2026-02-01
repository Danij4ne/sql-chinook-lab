
SELECT
    t.track_id,
    t.name,
    SUM(il.quantity) AS total_quantity_sold
FROM invoice_line il
JOIN track t
    ON il.track_id = t.track_id
GROUP BY
    t.track_id,
    t.name
HAVING SUM(il.quantity) >= 5
ORDER BY total_quantity_sold DESC, t.name ASC;
