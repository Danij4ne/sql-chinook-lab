
SELECT
    billing_country,
    COUNT(invoice_id) AS invoice_count
FROM invoice
GROUP BY billing_country
HAVING COUNT(invoice_id) >= 5
ORDER BY invoice_count DESC, billing_country ASC;
