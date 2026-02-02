
SELECT
    i.invoice_id,
    i.invoice_date,
    c.country,
    i.total
FROM invoice i
JOIN customer c
    ON i.customer_id = c.customer_id
ORDER BY c.country ASC, i.total DESC;
