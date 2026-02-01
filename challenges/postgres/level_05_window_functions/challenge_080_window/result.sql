
WITH monthly_revenue AS (
    SELECT
        DATE_TRUNC('month', invoice_date)::date AS month_start,
        SUM(total) AS monthly_revenue
    FROM invoice
    GROUP BY DATE_TRUNC('month', invoice_date)::date
)
SELECT
    month_start,
    monthly_revenue,
    LAG(monthly_revenue) OVER (ORDER BY month_start ASC) AS previous_month_revenue,
    (monthly_revenue - LAG(monthly_revenue) OVER (ORDER BY month_start ASC)) AS revenue_change
FROM monthly_revenue
ORDER BY month_start ASC;
