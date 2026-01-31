
-- CHALLENGE 047 - AVERAGE TRACK LENGTH PER GENRE
-- Difficulty: MEDIUM
-- Topic: GROUP BY + AVG
-- Database: Chinook

-- DESCRIPTION:
-- Calculate the average track duration (in milliseconds) for each genre.
-- This challenge focuses on grouping by genre and applying AVG.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - Genre.Name AS GenreName
--        - AVG(Track.Milliseconds) AS AvgDurationMs
--   2. Join Track → Genre using GenreId.
--   3. Group results by GenreName.
--   4. Sort results by AvgDurationMs in descending order.

SELECT 
    g.Name AS GenreName,
    AVG(t.Milliseconds) AS AvgDurationMs
FROM Track t
JOIN Genre g 
    ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY AvgDurationMs DESC;
