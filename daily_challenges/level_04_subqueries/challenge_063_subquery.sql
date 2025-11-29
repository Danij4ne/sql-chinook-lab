
-- CHALLENGE 063 - CUSTOMERS IN COUNTRIES WITH HIGH TOTAL SALES
-- Difficulty: MEDIUM
-- Topic: IN + SUBQUERY WITH GROUP BY
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve customers that live in countries where total invoice sales exceed a threshold.
-- This challenge focuses on filtering by aggregated country sales.

-- REQUIREMENTS:
--   1. Consider a threshold of 200 in total invoice sales per country.
--   2. Use a subquery on the Invoice table to:
--        - Group invoices by BillingCountry.
--        - Calculate SUM(Total) per country.
--        - Return only countries where this sum > 200.
--   3. In the main query, select the following columns from Customer:
--        - FirstName
--        - LastName
--        - Country
--   4. Return only customers whose Country is IN the result of the subquery.
--   5. Sort results by Country, then LastName.
