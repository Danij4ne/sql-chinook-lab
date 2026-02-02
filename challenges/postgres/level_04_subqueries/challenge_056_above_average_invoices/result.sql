
SELECT
    invoice_id,
    customer_id,
    invoice_date,
    total
FROM invoice
WHERE total > (
    SELECT AVG(total)
    FROM invoice
)
ORDER BY total DESC, invoice_id ASC;
