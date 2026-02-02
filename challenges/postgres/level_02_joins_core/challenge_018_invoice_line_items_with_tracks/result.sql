
SELECT
    il.invoice_line_id,
    il.invoice_id,
    t.name,
    il.unit_price,
    il.quantity
FROM invoice_line il
JOIN track t
    ON il.track_id = t.track_id
ORDER BY il.invoice_id ASC, il.invoice_line_id ASC;
