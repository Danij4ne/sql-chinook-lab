
-- CHALLENGE 035 - MOST POPULAR GENRES BY TRACK COUNT
-- Difficulty: EASY
-- Topic: JOIN + GROUP BY
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve music genres ranked by the number of tracks they contain.
-- This challenge focuses on joining Track with Genre and aggregating counts.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - Genre.Name AS GenreName
--        - COUNT(Track.TrackId) AS TrackCount
--   2. Join Track → Genre using GenreId.
--   3. Group results by GenreName.
--   4. Sort the results by TrackCount in descending order.

SELECT
    g.Name AS GenreName,
    COUNT(t.TrackId) AS TrackCount
FROM Track t
INNER JOIN Genre g
    ON t.GenreId = g.GenreId
GROUP BY
    g.Name
ORDER BY
    TrackCount DESC;
