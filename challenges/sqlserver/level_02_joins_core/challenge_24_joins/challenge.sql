

-- CHALLENGE 024 - PLAYLIST TRACKS WITH TRACK DETAILS
-- Difficulty: EASY
-- Topic: INNER JOIN
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve the tracks contained in each playlist along with track names.
-- This challenge focuses on joining PlaylistTrack with Track.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - PlaylistTrack.PlaylistId
--        - Track.TrackId
--        - Track.Name AS TrackName
--   2. Join PlaylistTrack → Track using TrackId.
--   3. Sort the results by PlaylistId, then by TrackName.
