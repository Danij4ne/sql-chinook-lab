

-- CHALLENGE 060 - CUSTOMERS ABOVE AVERAGE SPENDING
-- Difficulty: MEDIUM
-- Topic: CORRELATED SUBQUERY
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve customers whose total spending is higher than the overall average customer spending.
-- This challenge focuses on using a subquery that aggregates invoice totals.

-- REQUIREMENTS:
--   1. Select the following columns from the Customer table:
--        - CustomerId
--        - FirstName
--        - LastName
--   2. Use a subquery on the Invoice table to:
--        - Calculate total spending per customer (SUM of Invoice.Total).
--   3. Use another subquery or a nested query to:
--        - Calculate the average total spending across all customers.
--   4. Return only customers whose total spending is greater than this global average.
--   5. Sort results by LastName in ascending order.
