
SELECT
    il.invoice_line_id,
    il.invoice_id,
    i.invoice_date,
    il.track_id,
    il.unit_price,
    il.quantity
FROM invoice_line il
JOIN invoice i
    ON il.invoice_id = i.invoice_id
WHERE i.invoice_date >= '2013-01-01'
ORDER BY i.invoice_date ASC, il.invoice_line_id ASC;
