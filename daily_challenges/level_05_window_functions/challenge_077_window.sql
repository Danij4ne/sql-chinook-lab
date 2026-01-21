
-- CHALLENGE 077 - AVERAGE TRACK PRICE PER GENRE (WINDOW VERSION)
-- Difficulty: MEDIUM
-- Topic: AVG() OVER(PARTITION BY)
-- Database: Chinook

-- DESCRIPTION:
-- Calculate the average track price per genre using a window function.

-- REQUIREMENTS:
--   1. Select Track.TrackId, Track.Name, Genre.Name AS GenreName, UnitPrice.
--   2. Join Track → Genre.
--   3. Add AVG(UnitPrice) OVER (PARTITION BY Genre.Name) AS AvgGenrePrice.
--   4. Order by GenreName, then TrackId.

SELECT 
    Track.TrackId,
    Track.Name,
    Genre.Name AS GenreName,
    Track.UnitPrice,
    AVG(Track.UnitPrice) OVER (PARTITION BY Genre.Name) AS AvgGenrePrice
FROM Track
JOIN Genre 
    ON Track.GenreId = Genre.GenreId
ORDER BY GenreName, Track.TrackId;


