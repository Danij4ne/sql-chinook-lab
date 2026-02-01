

-- CHALLENGE 059 - TRACKS NEVER PURCHASED
-- Difficulty: MEDIUM
-- Topic: WHERE + NOT IN
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve tracks that have never been purchased in any invoice.
-- This challenge focuses on using NOT IN with a subquery.

-- REQUIREMENTS:
--   1. Select the following columns from the Track table:
--        - TrackId
--        - Name
--   2. Use a subquery on the InvoiceLine table to:
--        - Select all TrackId values that appear in InvoiceLine.
--   3. Return only tracks whose TrackId is NOT IN that subquery.
--   4. Sort the results alphabetically by Name.
