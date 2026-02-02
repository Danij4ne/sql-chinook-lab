
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(i.total) AS total_revenue
FROM customer c
JOIN invoice i
    ON c.customer_id = i.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING SUM(i.total) >= 40.00
ORDER BY total_revenue DESC, c.customer_id ASC;
