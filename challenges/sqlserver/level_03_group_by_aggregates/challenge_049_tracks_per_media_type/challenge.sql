

-- CHALLENGE 049 - NUMBER OF TRACKS PER MEDIA TYPE
-- Difficulty: MEDIUM
-- Topic: GROUP BY + COUNT
-- Database: Chinook

-- DESCRIPTION:
-- Count how many tracks belong to each media type.
-- This challenge focuses on grouping and counting related records.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - MediaType.Name AS MediaTypeName
--        - COUNT(Track.TrackId) AS TrackCount
--   2. Join Track → MediaType using MediaTypeId.
--   3. Group results by MediaTypeName.
--   4. Sort results by TrackCount in descending order.
