

-- CHALLENGE 068 - TOP 5 CUSTOMERS BY TOTAL SPENDING USING SUBQUERY
-- Difficulty: MEDIUM
-- Topic: SUBQUERY + ORDER + LIMIT/TOP
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve the top 5 customers by total spending using a subquery for aggregation.
-- This challenge focuses on using a subquery as a derived table.

-- REQUIREMENTS:
--   1. In a subquery (derived table):
--        - Join Customer → Invoice.
--        - Calculate SUM(Invoice.Total) AS TotalSpent per customer.
--   2. In the outer query:
--        - Select CustomerId, FirstName, LastName, TotalSpent.
--   3. Order the results by TotalSpent in descending order.
--   4. Return only the top 5 rows.
