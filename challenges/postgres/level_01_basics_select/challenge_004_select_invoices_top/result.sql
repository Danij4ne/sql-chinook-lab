
SELECT
    invoice_id,
    customer_id,
    invoice_date,
    total
FROM invoice
ORDER BY total DESC
LIMIT 10;
