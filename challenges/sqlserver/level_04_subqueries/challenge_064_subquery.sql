
-- CHALLENGE 064 - TRACKS LONGER THAN ALBUM AVERAGE
-- Difficulty: MEDIUM
-- Topic: CORRELATED SUBQUERY
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve tracks whose duration is longer than the average track duration of their own album.
-- This challenge focuses on comparing each track to an album-level average.

-- REQUIREMENTS:
--   1. Select the following columns from the Track table:
--        - TrackId
--        - Name
--        - AlbumId
--        - Milliseconds
--   2. Use a correlated subquery on the Track table to:
--        - Calculate AVG(Milliseconds) per AlbumId.
--   3. Return only tracks where:
--        - Track.Milliseconds > average milliseconds for that same AlbumId.
--   4. Sort results by AlbumId, then by Milliseconds in descending order.

 
SELECT
    t.TrackId,
    t.Name,
    t.AlbumId,
    t.Milliseconds
FROM Track t
WHERE t.Milliseconds > (
    SELECT AVG(tr.Milliseconds)
    FROM Track tr
    WHERE tr.AlbumId = t.AlbumId
)
ORDER BY
    t.AlbumId,
    t.Milliseconds DESC;
    