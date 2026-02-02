

-- CHALLENGE 041 - TOTAL TRACK DURATION PER ALBUM
-- Difficulty: MEDIUM
-- Topic: GROUP BY + SUM
-- Database: Chinook

-- DESCRIPTION:
-- Calculate the total duration of all tracks in each album.
-- This challenge focuses on summing numeric fields grouped by album.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - Album.AlbumId
--        - Album.Title
--        - SUM(Track.Milliseconds) AS TotalDurationMs
--   2. Join Album → Track using AlbumId.
--   3. Group results by Album.AlbumId and Album.Title.
--   4. Sort results by TotalDurationMs in descending order.
