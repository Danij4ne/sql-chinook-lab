
SELECT
    c.CustomerId,
    c.FirstName,
    c.LastName
FROM Customer c
WHERE
 
    (
        SELECT SUM(i.Total)
        FROM Invoice i
        WHERE i.CustomerId = c.CustomerId
    )
    >
 
    (
        SELECT AVG(customer_total)
        FROM (
            SELECT SUM(i2.Total) AS customer_total
            FROM Invoice i2
            GROUP BY i2.CustomerId
        ) t
    )
ORDER BY c.LastName ASC;
