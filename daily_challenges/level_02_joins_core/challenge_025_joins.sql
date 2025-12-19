
-- CHALLENGE 025 - ALBUMS WITH ARTIST NAMES
-- Difficulty: EASY
-- Topic: INNER JOIN
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve all albums together with the artist who created them.
-- This challenge focuses on joining Album with Artist.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - Album.AlbumId
--        - Album.Title AS AlbumTitle
--        - Artist.Name AS ArtistName
--   2. Join Album → Artist using ArtistId.
--   3. Sort the results alphabetically by ArtistName.

SELECT
    a.AlbumId,
    a.Title AS AlbumTitle,
    ar.Name AS ArtistName
FROM Album a
INNER JOIN Artist ar
    ON a.ArtistId = ar.ArtistId
ORDER BY
    ArtistName;
