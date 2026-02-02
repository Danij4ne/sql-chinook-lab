
SELECT
    il.invoice_line_id,
    il.invoice_id,
    t.name AS track_name,
    a.title AS album_title,
    il.unit_price,
    il.quantity
FROM invoice_line il
JOIN track t
    ON il.track_id = t.track_id
JOIN album a
    ON t.album_id = a.album_id
WHERE il.quantity >= 2
ORDER BY il.invoice_id ASC, t.name ASC;
