
SELECT
    i.invoice_id,
    i.invoice_date,
    c.first_name,
    c.last_name,
    e.first_name AS support_rep_first_name,
    e.last_name AS support_rep_last_name,
    i.total
FROM invoice i
JOIN customer c
    ON i.customer_id = c.customer_id
JOIN employee e
    ON c.support_rep_id = e.employee_id
ORDER BY i.invoice_date ASC;
