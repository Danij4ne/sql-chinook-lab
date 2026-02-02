
SELECT
    il.invoice_line_id,
    il.invoice_id,
    t.name AS track_name,
    g.name AS genre_name,
    il.unit_price,
    il.quantity
FROM invoice_line il
JOIN track t
    ON il.track_id = t.track_id
JOIN genre g
    ON t.genre_id = g.genre_id
WHERE g.name = 'Rock'
ORDER BY il.invoice_id ASC, t.name ASC;
