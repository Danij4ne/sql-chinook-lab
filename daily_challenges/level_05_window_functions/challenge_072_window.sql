
-- CHALLENGE 072 - RANK CUSTOMERS BY TOTAL SPENDING
-- Difficulty: MEDIUM
-- Topic: RANK()
-- Database: Chinook

-- DESCRIPTION:
-- Rank customers based on their total invoice spending.

-- REQUIREMENTS:
--   1. Join Customer → Invoice.
--   2. Calculate SUM(Invoice.Total) AS TotalSpent.
--   3. Use RANK() OVER (ORDER BY TotalSpent DESC).
--   4. Return CustomerId, FirstName, LastName, TotalSpent, Rank.

SELECT CustomerId , FirstName , LastName ,  SUM(I.Total) AS TotalSpent, 
RANK() OVER(ORDER BY SUM(I.Total) DESC) AS Rank
FROM Invoice i
JOIN Customer c
ON  c.CustomerId = i.CustomerId
GROUP BY CustomerId , FirstName , LastName ;
