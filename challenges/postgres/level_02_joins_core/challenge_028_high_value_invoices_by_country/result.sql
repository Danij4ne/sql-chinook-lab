
SELECT
    i.invoice_id,
    i.invoice_date,
    c.country,
    i.total
FROM invoice i
JOIN customer c
    ON i.customer_id = c.customer_id
WHERE i.total > 10.00
ORDER BY i.total DESC;
