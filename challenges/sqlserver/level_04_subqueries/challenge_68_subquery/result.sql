
SELECT TOP 5
    t.CustomerId, t.FirstName, t.LastName, t.TotalSpent
FROM (
    SELECT
        c.CustomerId, c.FirstName, c.LastName,
        SUM(i.Total) AS TotalSpent
    FROM Customer c
    JOIN Invoice i ON i.CustomerId = c.CustomerId
    GROUP BY c.CustomerId, c.FirstName, c.LastName
) t
ORDER BY t.TotalSpent DESC;
