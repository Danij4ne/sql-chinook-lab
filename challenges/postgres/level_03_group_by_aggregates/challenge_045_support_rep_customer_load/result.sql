 
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    COUNT(c.customer_id) AS customer_count
FROM employee e
JOIN customer c
    ON c.support_rep_id = e.employee_id
GROUP BY
    e.employee_id,
    e.first_name,
    e.last_name
HAVING COUNT(c.customer_id) >= 5
ORDER BY customer_count DESC, e.last_name ASC, e.first_name ASC;
