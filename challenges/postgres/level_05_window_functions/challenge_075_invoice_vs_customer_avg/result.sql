
WITH invoice_with_avg AS (
    SELECT
        invoice_id,
        customer_id,
        invoice_date,
        total,
        AVG(total) OVER (PARTITION BY customer_id) AS customer_avg_total
    FROM invoice
)
SELECT
    invoice_id,
    customer_id,
    invoice_date,
    total,
    customer_avg_total,
    (total - customer_avg_total) AS diff_from_avg
FROM invoice_with_avg
WHERE invoice_date >= '2013-01-01'
ORDER BY customer_id ASC, invoice_date ASC, invoice_id ASC;
