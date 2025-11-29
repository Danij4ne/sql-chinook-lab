
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
