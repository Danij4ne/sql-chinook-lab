
WITH customer_totals AS (
    SELECT
        customer_id,
        SUM(total) AS total_spent
    FROM invoice
    GROUP BY customer_id
)
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.country,
    ct.total_spent
FROM customer c
JOIN customer_totals ct
    ON c.customer_id = ct.customer_id
ORDER BY ct.total_spent DESC, c.customer_id ASC
LIMIT 10;
