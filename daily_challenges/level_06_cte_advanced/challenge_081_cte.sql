
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
