
-- CHALLENGE 081 - BASIC CTE FOR CUSTOMER INVOICE TOTALS
-- Difficulty: MEDIUM
-- Topic: CTE + GROUP BY
-- Database: Chinook

-- DESCRIPTION:
-- Use a CTE to calculate the total spending per customer.

-- REQUIREMENTS:
--   1. Create a CTE that:
--        - Joins Customer → Invoice.
--        - Calculates SUM(Invoice.Total) AS TotalSpent per CustomerId.
--   2. In the main query, select:
--        - CustomerId
--        - TotalSpent
--   3. Order results by TotalSpent in descending order.

WITH total_sum AS (
    SELECT c.CustomerId , SUM(i.Total) AS TotalSpent 
    FROM Customer c
    JOIN Invoice i
    ON c.CustomerId = i.CustomerId
    GROUP BY c.CustomerId

) 
SELECT CustomerId , TotalSpent 
FROM total_sum 
ORDER BY TotalSpent DESC 

