
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    i.invoice_id,
    il.invoice_line_id,
    il.unit_price,
    il.quantity
FROM customer c
JOIN invoice i
    ON c.customer_id = i.customer_id
JOIN invoice_line il
    ON i.invoice_id = il.invoice_id
WHERE i.total >= 10.00
ORDER BY c.customer_id ASC, i.invoice_id ASC, il.invoice_line_id ASC;
