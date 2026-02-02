
WITH daily_revenue AS (
    SELECT
        invoice_date,
        SUM(total) AS daily_total
    FROM invoice
    GROUP BY invoice_date
)
SELECT
    invoice_date,
    daily_total,
    SUM(daily_total) OVER (ORDER BY invoice_date ASC) AS running_total
FROM daily_revenue
ORDER BY invoice_date ASC;
