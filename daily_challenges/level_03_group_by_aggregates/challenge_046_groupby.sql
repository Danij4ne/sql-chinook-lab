
-- CHALLENGE 046 - MIN AND MAX TRACK PRICE PER GENRE
-- Difficulty: MEDIUM
-- Topic: GROUP BY + MIN + MAX
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve the minimum and maximum track price for each genre.
-- This challenge focuses on numeric aggregation grouped by genre.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - Genre.Name AS GenreName
--        - MIN(Track.UnitPrice) AS MinPrice
--        - MAX(Track.UnitPrice) AS MaxPrice
--   2. Join Track → Genre using GenreId.
--   3. Group results by GenreName.
--   4. Sort results alphabetically by GenreName.

SELECT
    g.Name AS GenreName,
    MIN(t.UnitPrice) AS MinPrice,
    MAX(t.UnitPrice) AS MaxPrice
FROM Track t
JOIN Genre g
    ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY GenreName ASC;
