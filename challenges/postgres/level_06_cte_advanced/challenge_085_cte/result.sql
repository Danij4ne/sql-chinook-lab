
WITH city_revenue AS (
    SELECT
        billing_city,
        SUM(total) AS total_revenue
    FROM invoice
    GROUP BY billing_city
)
SELECT
    billing_city,
    total_revenue
FROM city_revenue
ORDER BY total_revenue DESC, billing_city ASC
LIMIT 5;
