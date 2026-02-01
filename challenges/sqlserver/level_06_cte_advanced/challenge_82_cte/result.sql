
WITH total_sum_100 AS (
    SELECT c.CustomerId ,  SUM(I.Total) AS TotalSpent
    FROM  Customer c 
    JOIN Invoice i
    ON c.CustomerId = i.CustomerId
    GROUP BY c.CustomerId
    HAVING  SUM(I.Total) > 100
)
SELECT CustomerId , TotalSpent 
FROM total_sum_100
ORDER BY TotalSpent DESC;