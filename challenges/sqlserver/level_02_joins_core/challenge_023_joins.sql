
-- CHALLENGE 023 - TRACK GENRES
-- Difficulty: EASY
-- Topic: INNER JOIN
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve tracks along with their associated genre names.
-- This challenge focuses on joining Track and Genre.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - Track.TrackId
--        - Track.Name AS TrackName
--        - Genre.Name AS GenreName
--   2. Join Track → Genre using GenreId.
--   3. Sort the results alphabetically by GenreName, then TrackName.

SELECT t.trackid,
       t.name AS TrackName,
       g.name AS GenreName
FROM track t
JOIN genre g
ON t.genreid = g.genreid
ORDER BY GenreName, TrackName;
