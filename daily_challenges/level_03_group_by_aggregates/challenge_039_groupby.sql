
-- CHALLENGE 039 - AVERAGE TRACK PRICE BY MEDIA TYPE
-- Difficulty: MEDIUM
-- Topic: GROUP BY + AVG
-- Database: Chinook

-- DESCRIPTION:
-- Calculate the average track price for each media type.
-- This challenge focuses on grouping by media type and using AVG.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - MediaType.Name AS MediaTypeName
--        - AVG(Track.UnitPrice) AS AvgPrice
--   2. Join Track → MediaType using MediaTypeId.
--   3. Group results by MediaTypeName.
--   4. Sort the results by AvgPrice in descending order.

SELECT
    mt.Name AS MediaTypeName,
    AVG(t.UnitPrice) AS AvgPrice
FROM Track t
JOIN MediaType mt
    ON t.MediaTypeId = mt.MediaTypeId
GROUP BY
    mt.Name
ORDER BY
    AvgPrice DESC;
