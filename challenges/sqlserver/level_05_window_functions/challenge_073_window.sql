
-- CHALLENGE 073 - DENSE RANK TRACK PRICES
-- Difficulty: MEDIUM
-- Topic: DENSE_RANK()
-- Database: Chinook

-- DESCRIPTION:
-- Assign a dense rank to each track based on its UnitPrice.

-- REQUIREMENTS:
--   1. Select TrackId, Name, UnitPrice.
--   2. Use DENSE_RANK() OVER (ORDER BY UnitPrice DESC).
--   3. Return the result set ordered by UnitPrice DESC.

SELECT 
    TrackId,
    Name,
    UnitPrice,
    DENSE_RANK() OVER (ORDER BY UnitPrice DESC) AS price_rank
FROM Track
ORDER BY UnitPrice DESC;
