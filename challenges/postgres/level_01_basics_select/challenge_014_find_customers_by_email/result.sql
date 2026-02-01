
SELECT
    customer_id,
    first_name,
    last_name,
    email
FROM customer
WHERE email ILIKE '%@gmail.com'
ORDER BY email ASC;
