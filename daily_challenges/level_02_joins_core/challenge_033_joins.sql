
-- CHALLENGE 033 - CUSTOMER TOTAL SPENDING
-- Difficulty: EASY
-- Topic: JOIN + AGGREGATION
-- Database: Chinook

-- DESCRIPTION:
-- Calculate the total amount spent by each customer.
-- This challenge focuses on joining Invoice with Customer and aggregating totals.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - Customer.FirstName
--        - Customer.LastName
--        - SUM(Invoice.Total) AS TotalSpent
--   2. Join Customer → Invoice using CustomerId.
--   3. Group the results by Customer.FirstName and Customer.LastName.
--   4. Sort the results by TotalSpent in descending order.
