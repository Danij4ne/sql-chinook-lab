
SELECT
    billing_country,
    SUM(total) AS total_revenue,
    COUNT(invoice_id) AS invoice_count
FROM invoice
GROUP BY billing_country
HAVING COUNT(invoice_id) >= 5
ORDER BY total_revenue DESC, billing_country ASC;
