
WITH total_sum AS (
    SELECT c.CustomerId , SUM(i.Total) AS TotalSpent 
    FROM Customer c
    JOIN Invoice i
    ON c.CustomerId = i.CustomerId
    GROUP BY c.CustomerId

) 
SELECT CustomerId , TotalSpent 
FROM total_sum 
ORDER BY TotalSpent DESC ;