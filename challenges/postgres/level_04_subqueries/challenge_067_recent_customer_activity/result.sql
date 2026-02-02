
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    MAX(i.invoice_date) AS most_recent_invoice_date
FROM customer c
JOIN invoice i
    ON c.customer_id = i.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING MAX(i.invoice_date) >= '2013-01-01'
ORDER BY most_recent_invoice_date DESC, c.customer_id ASC;
