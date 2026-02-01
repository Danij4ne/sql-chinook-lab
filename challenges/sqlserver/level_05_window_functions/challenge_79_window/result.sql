
WITH ranked AS (
    SELECT
        t.TrackId,
        t.Name AS TrackName,
        ar.Name AS ArtistName,
        t.UnitPrice,
        ROW_NUMBER() OVER (
            PARTITION BY ar.ArtistId
            ORDER BY t.UnitPrice DESC, t.TrackId
        ) AS RowNumber
    FROM Artist ar
    JOIN Album al
        ON al.ArtistId = ar.ArtistId
    JOIN Track t
        ON t.AlbumId = al.AlbumId
)
SELECT
    TrackId,
    TrackName,
    ArtistName,
    UnitPrice,
    RowNumber
FROM ranked
WHERE RowNumber <= 3
ORDER BY ArtistName, RowNumber;