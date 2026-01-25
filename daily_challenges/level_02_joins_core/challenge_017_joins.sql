
-- CHALLENGE 017 - TRACKS WITH THEIR ALBUMS
-- Difficulty: EASY
-- Topic: INNER JOIN
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve tracks along with the albums they belong to.
-- This challenge focuses on joining the Track and Album tables.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - Track.TrackId
--        - Track.Name AS TrackName
--        - Album.Title AS AlbumTitle
--   2. Use an INNER JOIN between Track and Album on AlbumId.
--   3. Sort the results alphabetically by TrackName.

SELECT t.trackid , t.name AS TrackName , a.title AS AlbumTitle
FROM track t
INNER JOIN album a
ON t.albumid = a.albumid
ORDER BY TrackName ASC ;