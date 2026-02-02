
SELECT CustomerId , FirstName , LastName ,  SUM(I.Total) AS TotalSpent, 
RANK() OVER(ORDER BY SUM(I.Total) DESC) AS Rank
FROM Invoice i
JOIN Customer c
ON  c.CustomerId = i.CustomerId
GROUP BY CustomerId , FirstName , LastName ;