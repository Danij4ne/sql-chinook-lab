
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
country_totals AS (
    SELECT
        country,
        SUM(total_spent) AS country_total_spent
    FROM customer_totals
    GROUP BY country
)
SELECT
    ct.country,
    ct.customer_id,
    ct.first_name,
    ct.last_name,
    ct.total_spent,
    ctot.country_total_spent,
    (ct.total_spent / ctot.country_total_spent) * 100.0 AS country_revenue_share_pct
FROM customer_totals ct
JOIN country_totals ctot
    ON ct.country = ctot.country
WHERE ct.country = 'USA'
ORDER BY country_revenue_share_pct DESC, ct.customer_id ASC;
