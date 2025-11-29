
-- CHALLENGE 038 - TOTAL SALES PER COUNTRY
-- Difficulty: MEDIUM
-- Topic: GROUP BY + SUM
-- Database: Chinook

-- DESCRIPTION:
-- Calculate the total invoice sales per billing country.
-- This challenge focuses on aggregating invoice totals grouped by country.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - Invoice.BillingCountry
--        - SUM(Invoice.Total) AS TotalSales
--   2. Group results by Invoice.BillingCountry.
--   3. Sort the results by TotalSales in descending order.
