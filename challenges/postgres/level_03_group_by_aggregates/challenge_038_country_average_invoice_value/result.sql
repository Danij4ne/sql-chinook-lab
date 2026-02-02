
SELECT
    billing_country,
    AVG(total) AS average_total
FROM invoice
GROUP BY billing_country
HAVING AVG(total) >= 5.00
ORDER BY average_total DESC, billing_country ASC;
