
-- CHALLENGE 018 - TRACKS WITH ALBUM AND ARTIST
-- Difficulty: EASY
-- Topic: MULTI-TABLE JOIN
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve each track together with its album title and artist name.
-- This challenge focuses on joining three related tables.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - Track.Name AS TrackName
--        - Album.Title AS AlbumTitle
--        - Artist.Name AS ArtistName
--   2. Join Track → Album using AlbumId.
--   3. Join Album → Artist using ArtistId.
--   4. Sort the results alphabetically by ArtistName.
