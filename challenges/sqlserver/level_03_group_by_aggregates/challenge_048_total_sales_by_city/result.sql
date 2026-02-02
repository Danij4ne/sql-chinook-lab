
SELECT
    c.City,
    SUM(i.Total) AS TotalSales
FROM Customer c
JOIN Invoice i
    ON c.CustomerId = i.CustomerId
GROUP BY c.City
ORDER BY TotalSales DESC;