
-- CHALLENGE 048 - TOTAL SALES PER CUSTOMER CITY
-- Difficulty: MEDIUM
-- Topic: GROUP BY + SUM
-- Database: Chinook

-- DESCRIPTION:
-- Calculate total invoice sales grouped by customer city.
-- This challenge focuses on joining invoice data with customer location.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - Customer.City
--        - SUM(Invoice.Total) AS TotalSales
--   2. Join Customer → Invoice using CustomerId.
--   3. Group results by Customer.City.
--   4. Sort results by TotalSales in descending order.
