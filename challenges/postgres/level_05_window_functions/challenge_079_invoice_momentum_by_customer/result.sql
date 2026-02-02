
WITH invoice_with_prev AS (
    SELECT
        invoice_id,
        customer_id,
        invoice_date,
        total,
        LAG(total) OVER (
            PARTITION BY customer_id
            ORDER BY invoice_date ASC, invoice_id ASC
        ) AS previous_total
    FROM invoice
)
SELECT
    invoice_id,
    customer_id,
    invoice_date,
    total,
    previous_total,
    (total - previous_total) AS diff_from_previous
FROM invoice_with_prev
WHERE invoice_date >= '2013-01-01'
ORDER BY customer_id ASC, invoice_date ASC, invoice_id ASC;
