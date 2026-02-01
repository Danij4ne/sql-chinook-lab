
SELECT TrackId , Name , UnitPrice
FROM Track
WHERE UnitPrice > (
    SELECT AVG(UnitPrice)
    FROM Track
)
ORDER BY UnitPrice DESC;