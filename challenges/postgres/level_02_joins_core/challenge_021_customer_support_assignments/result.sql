
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    e.first_name AS support_rep_first_name,
    e.last_name AS support_rep_last_name
FROM customer c
JOIN employee e
    ON c.support_rep_id = e.employee_id
ORDER BY e.last_name ASC, c.last_name ASC;
