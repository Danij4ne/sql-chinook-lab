
-- CHALLENGE 057 - TRACKS MORE EXPENSIVE THAN AVERAGE
-- Difficulty: MEDIUM
-- Topic: SCALAR SUBQUERY
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve tracks whose unit price is higher than the average track price.
-- This challenge focuses on comparing values to a scalar subquery.

-- REQUIREMENTS:
--   1. Select the following columns from the Track table:
--        - TrackId
--        - Name
--        - UnitPrice
--   2. Use a subquery to calculate the average UnitPrice of all tracks.
--   3. Return only tracks where UnitPrice is greater than this average.
--   4. Sort the results by UnitPrice in descending order.
