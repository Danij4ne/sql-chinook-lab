
-- CHALLENGE 029 - TRACKS WITH GENRE AND MEDIA TYPE
-- Difficulty: EASY
-- Topic: MULTI JOIN
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve each track along with its genre and media type names.
-- This challenge focuses on joining three related tables.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - Track.TrackId
--        - Track.Name AS TrackName
--        - Genre.Name AS GenreName
--        - MediaType.Name AS MediaTypeName
--   2. Join Track → Genre using GenreId.
--   3. Join Track → MediaType using MediaTypeId.
--   4. Sort the results alphabetically by TrackName.
