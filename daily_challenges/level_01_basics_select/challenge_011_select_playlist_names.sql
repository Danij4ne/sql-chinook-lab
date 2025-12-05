
-- CHALLENGE 011 - SELECT PLAYLIST NAMES
-- Difficulty: EASY
-- Topic: SELECT
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve the names of all playlists stored in the database.
-- This challenge focuses on selecting simple text columns.

-- REQUIREMENTS:
--   1. Select the following columns from the Playlist table:
--        - PlaylistId
--        - Name
--   2. Sort the results alphabetically by Name.

SELECT playlistid , name 
FROM playlist 
ORDER BY name ;
