
SELECT 
    TrackId,
    Name,
    UnitPrice,
    DENSE_RANK() OVER (ORDER BY UnitPrice DESC) AS price_rank
FROM Track
ORDER BY UnitPrice DESC;