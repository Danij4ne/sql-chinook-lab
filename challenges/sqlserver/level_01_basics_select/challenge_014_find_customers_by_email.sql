
-- CHALLENGE 014 - FIND CUSTOMERS BY EMAIL
-- Difficulty: EASY
-- Topic: WHERE + LIKE
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve customers whose email address matches a specific pattern.
-- This challenge focuses on text filtering using the LIKE operator.

-- REQUIREMENTS:
--   1. Select the following columns from the Customer table:
--        - FirstName
--        - LastName
--        - Email
--   2. Return only customers whose Email ends with '.com'.
--        Example pattern: '%.com'
--   3. Sort the results alphabetically by LastName.

SELECT firstname , lastname , email 
FROM customer 
WHERE email LIKE '%.com'
ORDER BY lastname ASC ;

