

-- CHALLENGE 032 - ARTISTS WITH THEIR TRACKS COUNT
-- Difficulty: EASY
-- Topic: JOIN + GROUP BY
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve artists along with the number of tracks associated with each one.
-- This challenge focuses on joining and grouping aggregated results.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - Artist.Name AS ArtistName
--        - COUNT(Track.TrackId) AS TrackCount
--   2. Join Artist → Album using ArtistId.
--   3. Join Album → Track using AlbumId.
--   4. Group the results by ArtistName.
--   5. Sort the results by TrackCount in descending order.
