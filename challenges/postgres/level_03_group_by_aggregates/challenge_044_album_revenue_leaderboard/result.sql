
SELECT
    a.title AS album_title,
    SUM(il.unit_price * il.quantity) AS total_revenue
FROM invoice_line il
JOIN track t
    ON il.track_id = t.track_id
JOIN album a
    ON t.album_id = a.album_id
GROUP BY
    a.album_id,
    a.title
HAVING SUM(il.unit_price * il.quantity) >= 100.00
ORDER BY total_revenue DESC, a.title ASC;
