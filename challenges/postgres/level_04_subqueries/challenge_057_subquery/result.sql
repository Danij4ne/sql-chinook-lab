
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(i.total) AS total_spent
FROM customer c
JOIN invoice i
    ON c.customer_id = i.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING SUM(i.total) > (
    SELECT AVG(customer_total)
    FROM (
        SELECT
            SUM(total) AS customer_total
        FROM invoice
        GROUP BY customer_id
    ) sub
)
ORDER BY total_spent DESC, c.customer_id ASC;
