
-- CHALLENGE 071 - ROW NUMBER FOR TRACKS
-- Difficulty: MEDIUM
-- Topic: ROW_NUMBER()
-- Database: Chinook

-- DESCRIPTION:
-- Assign a sequential row number to each track ordered by Name.

-- REQUIREMENTS:
--   1. Select TrackId, Name, UnitPrice.
--   2. Add a ROW_NUMBER() window function ordered by Name.
--   3. Return the full result set.

SELECT TrackId , Name , UnitPrice ,
ROW_NUMBER() OVER(ORDER BY Name)
FROM tracks 