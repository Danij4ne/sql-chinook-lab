
SELECT
    i.invoice_id,
    i.invoice_date,
    c.first_name,
    c.last_name,
    i.billing_city,
    i.total
FROM invoice i
JOIN customer c
    ON i.customer_id = c.customer_id
WHERE i.billing_country = 'USA'
ORDER BY i.total DESC, i.invoice_date ASC;
