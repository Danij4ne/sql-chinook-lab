
SELECT
    customer_id,
    first_name,
    last_name,
    country
FROM customer
WHERE country = 'USA'
ORDER BY last_name ASC, first_name ASC;
