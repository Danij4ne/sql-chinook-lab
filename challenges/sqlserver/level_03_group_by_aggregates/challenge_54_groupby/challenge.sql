

-- CHALLENGE 054 - AVERAGE TRACK PRICE PER ALBUM
-- Difficulty: MEDIUM
-- Topic: GROUP BY + AVG
-- Database: Chinook

-- DESCRIPTION:
-- Calculate the average price of tracks for each album.
-- This challenge focuses on joining and applying AVG grouped by album.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - Album.Title AS AlbumTitle
--        - AVG(Track.UnitPrice) AS AvgTrackPrice
--   2. Join Album → Track using AlbumId.
--   3. Group results by AlbumTitle.
--   4. Sort results by AvgTrackPrice in descending order.
