
-- CHALLENGE 051 - TOTAL TRACKS PER ARTIST
-- Difficulty: MEDIUM
-- Topic: GROUP BY + COUNT
-- Database: Chinook

-- DESCRIPTION:
-- Count how many tracks each artist has in the database.
-- This challenge focuses on joining through the album relationship.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - Artist.Name AS ArtistName
--        - COUNT(Track.TrackId) AS TrackCount
--   2. Join Artist → Album using ArtistId.
--   3. Join Album → Track using AlbumId.
--   4. Group results by ArtistName.
--   5. Sort results by TrackCount in descending order.

SELECT 
    Artist.Name AS ArtistName,
    COUNT(Track.TrackId) AS TrackCount
FROM Artist
JOIN Album 
    ON Artist.ArtistId = Album.ArtistId
JOIN Track 
    ON Album.AlbumId = Track.AlbumId
GROUP BY 
    Artist.Name
ORDER BY 
    TrackCount DESC;
