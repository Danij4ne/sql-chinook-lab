
SELECT
    billing_country,
    SUM(total) AS total_revenue
FROM invoice
GROUP BY billing_country
HAVING SUM(total) >= 50.00
ORDER BY total_revenue DESC, billing_country ASC;
