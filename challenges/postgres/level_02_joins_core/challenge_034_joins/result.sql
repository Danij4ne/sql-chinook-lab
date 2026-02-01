
SELECT
    e.employee_id,
    e.first_name AS employee_first_name,
    e.last_name AS employee_last_name,
    c.customer_id,
    c.first_name AS customer_first_name,
    c.last_name AS customer_last_name,
    c.city AS customer_city
FROM employee e
JOIN customer c
    ON c.support_rep_id = e.employee_id
WHERE c.city = 'Paris'
ORDER BY e.last_name ASC, c.last_name ASC;
