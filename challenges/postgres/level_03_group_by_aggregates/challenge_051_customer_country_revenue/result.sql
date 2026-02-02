
SELECT
    c.country AS country,
    SUM(i.total) AS total_revenue
FROM customer c
JOIN invoice i
    ON c.customer_id = i.customer_id
GROUP BY c.country
HAVING SUM(i.total) >= 100.00
ORDER BY total_revenue DESC, country ASC;
