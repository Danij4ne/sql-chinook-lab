
SELECT
    i.invoice_id,
    c.customer_id,
    c.first_name,
    c.last_name,
    i.total,
    COUNT(il.invoice_line_id) AS line_count
FROM invoice i
JOIN customer c
    ON i.customer_id = c.customer_id
JOIN invoice_line il
    ON i.invoice_id = il.invoice_id
WHERE i.billing_country = 'USA'
GROUP BY
    i.invoice_id,
    c.customer_id,
    c.first_name,
    c.last_name,
    i.total
ORDER BY line_count DESC, i.total DESC;
