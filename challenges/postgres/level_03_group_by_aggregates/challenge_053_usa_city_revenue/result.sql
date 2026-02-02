
SELECT
    billing_city,
    SUM(total) AS total_revenue
FROM invoice
WHERE billing_country = 'USA'
GROUP BY billing_city
ORDER BY total_revenue DESC, billing_city ASC;
