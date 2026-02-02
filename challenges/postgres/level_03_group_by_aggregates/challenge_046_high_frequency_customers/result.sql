
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(i.invoice_id) AS invoice_count
FROM customer c
JOIN invoice i
    ON c.customer_id = i.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(i.invoice_id) >= 5
ORDER BY invoice_count DESC, c.customer_id ASC;
