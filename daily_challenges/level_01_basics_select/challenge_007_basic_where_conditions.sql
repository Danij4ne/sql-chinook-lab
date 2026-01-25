
-- CHALLENGE 007 - BASIC WHERE CONDITIONS
-- Difficulty: EASY
-- Topic: WHERE clause
-- Database: Chinook

-- DESCRIPTION:
-- Practice filtering rows using basic comparison operators.
-- This challenge focuses on applying simple WHERE conditions.

-- REQUIREMENTS:
--   1. Select the following columns from the Track table:
--        - Name
--        - Milliseconds
--        - Bytes
--   2. Return only tracks that meet ALL of the following conditions:
--        a) Milliseconds is greater than 250000
--        b) Bytes is greater than 5000000
--   3. Sort the results by Milliseconds in descending order.

SELECT name , milliseconds , bytes
FROM track
WHERE milliseconds > 250000 and bytes > 5000000
ORDER BY milliseconds DESC ;