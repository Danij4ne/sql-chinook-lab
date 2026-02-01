
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    i.invoice_id,
    i.total
FROM customer c
JOIN invoice i
    ON c.customer_id = i.customer_id
WHERE i.total >= 5.00
ORDER BY c.customer_id ASC, i.total DESC;
