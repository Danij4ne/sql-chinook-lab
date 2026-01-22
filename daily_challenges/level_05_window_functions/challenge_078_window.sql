
-- CHALLENGE 078 - TRACK LENGTH PERCENTILE PER GENRE
-- Difficulty: MEDIUM
-- Topic: PERCENT_RANK()
-- Database: Chinook

-- DESCRIPTION:
-- Compute track duration percentiles within each genre.

-- REQUIREMENTS:
--   1. Select TrackId, Name, GenreId, Milliseconds.
--   2. Use PERCENT_RANK() OVER (PARTITION BY GenreId ORDER BY Milliseconds).
--   3. Order results by GenreId, then Milliseconds.

SELECT 
    TrackId,
    Name,
    GenreId,
    Milliseconds,
    PERCENT_RANK() OVER (
        PARTITION BY GenreId 
        ORDER BY Milliseconds
    ) AS DurationPercentile
FROM Track
ORDER BY GenreId, Milliseconds;
