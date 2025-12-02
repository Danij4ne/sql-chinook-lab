
-- CHALLENGE 005 - DISTINCT CUSTOMER COUNTRIES
-- Difficulty: EASY
-- Topic: SELECT DISTINCT
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve the list of unique countries where customers reside.
-- This challenge focuses on removing duplicates using DISTINCT.

-- REQUIREMENTS:
--   1. Select the Country column from the Customer table.
--   2. Return only unique country names (no duplicates).
--   3. Sort the countries alphabetically.

SELECT DISTINCT Country
FROM Customer
ORDER BY Country ASC
