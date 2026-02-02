
WITH ranked_invoices AS (
    SELECT
        customer_id,
        invoice_id,
        invoice_date,
        total,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY total DESC, invoice_id ASC
        ) AS invoice_rank
    FROM invoice
)
SELECT
    customer_id,
    invoice_id,
    invoice_date,
    total,
    invoice_rank
FROM ranked_invoices
WHERE invoice_rank <= 3
ORDER BY customer_id ASC, invoice_rank ASC, invoice_id ASC;
