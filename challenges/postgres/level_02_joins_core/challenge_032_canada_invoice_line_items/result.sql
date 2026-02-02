
SELECT
    il.invoice_line_id,
    il.invoice_id,
    c.country,
    il.unit_price,
    il.quantity
FROM invoice_line il
JOIN invoice i
    ON il.invoice_id = i.invoice_id
JOIN customer c
    ON i.customer_id = c.customer_id
WHERE c.country = 'Canada'
ORDER BY il.invoice_id ASC, il.invoice_line_id ASC;
