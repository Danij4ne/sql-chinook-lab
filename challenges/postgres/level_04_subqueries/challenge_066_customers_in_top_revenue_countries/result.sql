
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.country
FROM customer c
WHERE c.country IN (
    SELECT country
    FROM (
        SELECT
            c2.country,
            SUM(i2.total) AS total_revenue
        FROM customer c2
        JOIN invoice i2
            ON c2.customer_id = i2.customer_id
        GROUP BY c2.country
        ORDER BY total_revenue DESC
        LIMIT 5
    ) top_countries
)
ORDER BY c.country ASC, c.last_name ASC, c.first_name ASC;
