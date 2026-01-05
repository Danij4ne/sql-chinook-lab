
-- CHALLENGE 062 - GENRES WITH MORE TRACKS THAN AVERAGE
-- Difficulty: MEDIUM
-- Topic: SUBQUERY + GROUP BY
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve genres that have more tracks than the average number of tracks per genre.
-- This challenge focuses on comparing grouped counts to a subquery.

-- REQUIREMENTS:
--   1. For each genre, count the number of tracks.
--   2. Select the following columns:
--        - Genre.Name AS GenreName
--        - COUNT(Track.TrackId) AS TrackCount
--   3. Use a subquery to compute the average TrackCount across all genres.
--   4. Return only genres whose TrackCount is greater than this average.
--   5. Sort results by TrackCount in descending order.

SELECT
    g.Name AS GenreName,
    COUNT(t.TrackId) AS TrackCount
FROM Genre g
JOIN Track t
    ON t.GenreId = g.GenreId
GROUP BY
    g.GenreId,
    g.Name
HAVING
    COUNT(t.TrackId) > (
        SELECT AVG(genre_track_count)
        FROM (
            SELECT
                COUNT(t2.TrackId) AS genre_track_count
            FROM Track t2
            GROUP BY t2.GenreId
        ) x
    )
ORDER BY
    TrackCount DESC;
