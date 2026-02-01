
WITH customer_totals AS (
    SELECT
        c.country,
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(i.total) AS total_spent
    FROM customer c
    JOIN invoice i
        ON c.customer_id = i.customer_id
    GROUP BY
        c.country,
        c.customer_id,
        c.first_name,
        c.last_name
),
country_averages AS (
    SELECT
        country,
        AVG(total_spent) AS avg_country_spent
    FROM customer_totals
    GROUP BY country
)
SELECT
    ct.country,
    ct.customer_id,
    ct.first_name,
    ct.last_name,
    ct.total_spent,
    ca.avg_country_spent
FROM customer_totals ct
JOIN country_averages ca
    ON ct.country = ca.country
WHERE ct.total_spent > ca.avg_country_spent
ORDER BY ct.country ASC, ct.total_spent DESC, ct.customer_id ASC;
