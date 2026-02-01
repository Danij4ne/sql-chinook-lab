
WITH monthly_country_revenue AS (
    SELECT
        billing_country,
        DATE_TRUNC('month', invoice_date)::date AS month_start,
        SUM(total) AS monthly_revenue
    FROM invoice
    GROUP BY
        billing_country,
        DATE_TRUNC('month', invoice_date)::date
)
SELECT
    billing_country,
    month_start,
    monthly_revenue
FROM monthly_country_revenue
WHERE month_start >= '2012-01-01'
ORDER BY billing_country ASC, month_start ASC;
