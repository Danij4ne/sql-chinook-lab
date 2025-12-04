
-- CHALLENGE 009 - SORT TRACKS BY NAME
-- Difficulty: EASY
-- Topic: ORDER BY
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve all track names and sort them alphabetically.
-- This challenge focuses on ordering text columns.

-- REQUIREMENTS:
--   1. Select the following columns from the Track table:
--        - TrackId
--        - Name
--   2. Sort the results alphabetically by Name (ascending).
--   3. Return the full list without limiting rows.

SELECT trackid , name
FROM track
ORDER BY name ASC
