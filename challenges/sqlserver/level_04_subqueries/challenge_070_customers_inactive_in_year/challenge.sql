

-- CHALLENGE 070 - CUSTOMERS WITH NO PURCHASES IN A SPECIFIC YEAR
-- Difficulty: MEDIUM
-- Topic: NOT EXISTS + DATE FILTERING
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve customers who did not make any purchases in a specific year
-- (for example, the year 2010).
-- This challenge focuses on filtering using NOT EXISTS with a date condition.

-- REQUIREMENTS:
--   1. Assume the target year is 2010.
--   2. Select the following columns from the Customer table:
--        - CustomerId
--        - FirstName
--        - LastName
--   3. Use a NOT EXISTS subquery on the Invoice table that:
--        - Filters invoices by the same CustomerId.
--        - Checks that InvoiceDate falls in the year 2010.
--   4. Return only customers for whom such an invoice does not exist.
--   5. Sort results by LastName in ascending order.
