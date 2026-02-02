
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    i.invoice_id,
    i.invoice_date,
    i.total
FROM customer c
JOIN invoice i
    ON c.customer_id = i.customer_id
ORDER BY c.customer_id ASC, i.invoice_date ASC;
