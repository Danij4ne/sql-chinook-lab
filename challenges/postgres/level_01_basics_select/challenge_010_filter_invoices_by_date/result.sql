
SELECT
    invoice_id,
    customer_id,
    invoice_date,
    total
FROM invoice
WHERE invoice_date >= '2012-01-01'
ORDER BY invoice_date ASC;
