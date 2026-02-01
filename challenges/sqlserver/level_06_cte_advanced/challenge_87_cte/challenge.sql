

-- CHALLENGE 087 - CTE FOR TOP ARTISTS BY TRACK COUNT
-- Difficulty: MEDIUM
-- Topic: CTE + GROUP BY + LIMIT/TOP
-- Database: Chinook

-- DESCRIPTION:
-- Use a CTE to identify the top 10 artists by number of tracks.

-- REQUIREMENTS:
--   1. Create a CTE that:
--        - Joins Artist → Album → Track.
--        - Calculates COUNT(Track.TrackId) AS TrackCount per artist.
--   2. In the main query, select:
--        - ArtistName
--        - TrackCount
--   3. Order results by TrackCount in descending order.
--   4. Return only the top 10 artists.
