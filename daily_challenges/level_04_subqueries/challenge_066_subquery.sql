
-- CHALLENGE 066 - ARTISTS WITH NO TRACKS IN A SPECIFIC GENRE
-- Difficulty: MEDIUM
-- Topic: NOT EXISTS
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve artists that do not have any tracks in a given genre (for example, 'Rock').
-- This challenge focuses on using NOT EXISTS with a related subquery.

-- REQUIREMENTS:
--   1. Assume the target genre name is 'Rock'.
--   2. Select the following column from the Artist table:
--        - Artist.Name AS ArtistName
--   3. Use a subquery with EXISTS or NOT EXISTS that:
--        - Joins Artist → Album → Track → Genre.
--        - Checks whether the artist has any track where Genre.Name = 'Rock'.
--   4. Return only artists where such a track does NOT exist.
--   5. Sort results alphabetically by ArtistName.
