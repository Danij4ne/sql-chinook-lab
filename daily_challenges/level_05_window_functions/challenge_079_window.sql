
-- CHALLENGE 079 - TOP 3 TRACKS PER ARTIST BY PRICE
-- Difficulty: MEDIUM
-- Topic: ROW_NUMBER() OVER(PARTITION BY)
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve the top 3 most expensive tracks for each artist.

-- REQUIREMENTS:
--   1. Join Artist → Album → Track.
--   2. Select TrackId, Track.Name, Artist.Name AS ArtistName, UnitPrice.
--   3. Use ROW_NUMBER() OVER (PARTITION BY Artist.ArtistId ORDER BY UnitPrice DESC).
--   4. Filter the outer query for rows where RowNumber ≤ 3.

WITH ranked AS (
    SELECT
        t.TrackId,
        t.Name AS TrackName,
        ar.Name AS ArtistName,
        t.UnitPrice,
        ROW_NUMBER() OVER (
            PARTITION BY ar.ArtistId
            ORDER BY t.UnitPrice DESC, t.TrackId
        ) AS RowNumber
    FROM Artist ar
    JOIN Album al
        ON al.ArtistId = ar.ArtistId
    JOIN Track t
        ON t.AlbumId = al.AlbumId
)
SELECT
    TrackId,
    TrackName,
    ArtistName,
    UnitPrice,
    RowNumber
FROM ranked
WHERE RowNumber <= 3
ORDER BY ArtistName, RowNumber;


