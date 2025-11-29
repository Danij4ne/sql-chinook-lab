
-- CHALLENGE 036 - TOTAL INVOICE AMOUNT BY CUSTOMER
-- Difficulty: MEDIUM
-- Topic: GROUP BY + SUM
-- Database: Chinook

-- DESCRIPTION:
-- Calculate the total amount spent by each customer across all their invoices.
-- This challenge focuses on basic aggregation using SUM and GROUP BY.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - Customer.CustomerId
--        - Customer.FirstName
--        - Customer.LastName
--        - SUM(Invoice.Total) AS TotalSpent
--   2. Join Customer → Invoice using CustomerId.
--   3. Group the results by:
--        - Customer.CustomerId
--        - Customer.FirstName
--        - Customer.LastName
--   4. Sort the results by TotalSpent in descending order.
