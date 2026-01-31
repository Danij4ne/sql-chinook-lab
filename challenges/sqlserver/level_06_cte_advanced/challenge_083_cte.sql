
-- CHALLENGE 083 - CTE FOR ALBUM TRACK COUNTS
-- Difficulty: MEDIUM
-- Topic: CTE + AGGREGATION
-- Database: Chinook

-- DESCRIPTION:
-- Use a CTE to calculate the number of tracks per album and then filter by a threshold.

-- REQUIREMENTS:
--   1. Create a CTE that:
--        - Joins Album → Track.
--        - Calculates COUNT(Track.TrackId) AS TrackCount per AlbumId.
--   2. In the main query, select:
--        - AlbumId
--        - TrackCount
--   3. Return only albums with TrackCount >= 10.
--   4. Order results by TrackCount in descending order.


WITH album_tracks AS (
    SELECT 
        a.AlbumId,
        COUNT(t.TrackId) AS TrackCount
    FROM Album a
    JOIN Track t
        ON a.AlbumId = t.AlbumId
    GROUP BY a.AlbumId
)

SELECT
    AlbumId,
    TrackCount
FROM album_tracks
WHERE TrackCount >= 10
ORDER BY TrackCount DESC;


