
SELECT
    i.invoice_id,
    i.total,
    il.invoice_line_id,
    t.track_id,
    t.name AS track_name,
    il.unit_price,
    il.quantity
FROM invoice i
JOIN invoice_line il
    ON il.invoice_id = i.invoice_id
JOIN track t
    ON il.track_id = t.track_id
WHERE i.invoice_id = (
    SELECT invoice_id
    FROM invoice
    ORDER BY total DESC
    LIMIT 1
)
ORDER BY il.invoice_line_id ASC;
