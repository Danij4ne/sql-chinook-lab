
SELECT
    country,
    COUNT(customer_id) AS customer_count
FROM customer
GROUP BY country
HAVING COUNT(customer_id) >= 3
ORDER BY customer_count DESC, country ASC;
