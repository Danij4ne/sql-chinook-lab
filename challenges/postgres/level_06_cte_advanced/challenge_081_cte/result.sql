
WITH customer_ltv AS (
    SELECT
        customer_id,
        SUM(total) AS lifetime_value
    FROM invoice
    GROUP BY customer_id
)
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.country,
    cl.lifetime_value
FROM customer c
JOIN customer_ltv cl
    ON c.customer_id = cl.customer_id
WHERE c.country = 'USA'
ORDER BY cl.lifetime_value DESC, c.customer_id ASC;
