
-- CHALLENGE 082 - CTE WITH FILTERED CUSTOMER SPENDING
-- Difficulty: MEDIUM
-- Topic: CTE + HAVING/FILTER
-- Database: Chinook

-- DESCRIPTION:
-- Use a CTE to find customers whose total spending exceeds 100.

-- REQUIREMENTS:
--   1. Create a CTE that:
--        - Joins Customer → Invoice.
--        - Calculates SUM(Invoice.Total) AS TotalSpent per customer.
--   2. In the main query, select:
--        - CustomerId
--        - TotalSpent
--   3. Filter the CTE results to only include customers with TotalSpent > 100.
--   4. Order by TotalSpent in descending order.
