
SELECT
    c.CustomerId,
    c.FirstName,
    c.LastName
FROM Customer c
JOIN Invoice i
    ON i.CustomerId = c.CustomerId
GROUP BY
    c.CustomerId, c.FirstName, c.LastName
HAVING COUNT(*) > (
    SELECT COUNT(*)
    FROM Invoice
    WHERE CustomerId = 5
)
ORDER BY c.CustomerId;
