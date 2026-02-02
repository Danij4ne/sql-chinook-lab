
SELECT
    customer_id,
    first_name,
    last_name,
    country
FROM customer
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM invoice
)
ORDER BY country ASC, last_name ASC, first_name ASC;
