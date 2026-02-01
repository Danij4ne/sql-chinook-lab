

-- CHALLENGE 058 - CUSTOMERS WITH AT LEAST ONE INVOICE
-- Difficulty: MEDIUM
-- Topic: WHERE + IN
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve customers that have at least one invoice in the system.
-- This challenge focuses on using IN with a subquery.

-- REQUIREMENTS:
--   1. Select the following columns from the Customer table:
--        - CustomerId
--        - FirstName
--        - LastName
--   2. Use a subquery on the Invoice table to:
--        - Select the CustomerId values that appear in invoices.
--   3. Filter customers whose CustomerId is IN that subquery.
--   4. Sort the results by LastName in ascending order.
