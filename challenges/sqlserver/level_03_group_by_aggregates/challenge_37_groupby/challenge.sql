

-- CHALLENGE 037 - TOTAL TRACKS PER ALBUM
-- Difficulty: MEDIUM
-- Topic: GROUP BY + COUNT
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve all albums along with how many tracks each one contains.
-- This challenge focuses on counting related records using GROUP BY.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - Album.AlbumId
--        - Album.Title
--        - COUNT(Track.TrackId) AS TrackCount
--   2. Join Album → Track using AlbumId.
--   3. Group results by Album.AlbumId and Album.Title.
--   4. Sort the results by TrackCount in descending order.
