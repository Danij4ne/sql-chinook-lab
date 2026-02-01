
SELECT
    c.country AS country,
    SUM(i.total) AS total_revenue
FROM customer c
JOIN invoice i
    ON c.customer_id = i.customer_id
WHERE c.country IN ('USA', 'Canada', 'Brazil')
GROUP BY c.country
ORDER BY total_revenue DESC, country ASC;
