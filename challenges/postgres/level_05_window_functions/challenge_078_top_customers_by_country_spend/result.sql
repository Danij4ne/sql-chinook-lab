
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
ranked_customers AS (
    SELECT
        country,
        customer_id,
        first_name,
        last_name,
        total_spent,
        ROW_NUMBER() OVER (
            PARTITION BY country
            ORDER BY total_spent DESC, customer_id ASC
        ) AS country_rank
    FROM customer_totals
)
SELECT
    country,
    customer_id,
    first_name,
    last_name,
    total_spent,
    country_rank
FROM ranked_customers
WHERE country_rank <= 3
ORDER BY country ASC, country_rank ASC, customer_id ASC;
