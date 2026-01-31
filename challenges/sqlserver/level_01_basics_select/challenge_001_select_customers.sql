
-- CHALLENGE 001 - BASIC CUSTOMER LIST
-- Difficulty: EASY
-- Topic: SELECT + ORDER BY
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve a basic list of customers from the Customer table.
-- This challenge focuses on selecting specific columns and sorting results.

-- REQUIREMENTS:
--   1. Select the following columns from the Customer table:
--        - FirstName
--        - LastName
--        - Country
--   2. Sort the results alphabetically by LastName (ascending).
--   3. Limit the output to the first 10 rows.
--

SELECT TOP 10 
       CONCAT(FirstName, ' ', LastName) AS FullName,
       Country
FROM Customer
ORDER BY LastName ASC;
