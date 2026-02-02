
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