

-- CHALLENGE 053 - NUMBER OF ALBUMS PER ARTIST
-- Difficulty: MEDIUM
-- Topic: GROUP BY + COUNT
-- Database: Chinook

-- DESCRIPTION:
-- Count how many albums each artist has released.
-- This challenge focuses on grouping album records by artist.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - Artist.Name AS ArtistName
--        - COUNT(Album.AlbumId) AS AlbumCount
--   2. Join Artist → Album using ArtistId.
--   3. Group results by ArtistName.
--   4. Sort results by AlbumCount in descending order.
