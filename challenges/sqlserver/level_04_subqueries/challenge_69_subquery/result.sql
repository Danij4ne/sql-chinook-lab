
SELECT
    t.TrackId,
    t.Name
FROM Track t
JOIN Album al ON al.AlbumId = t.AlbumId
WHERE al.ArtistId = (
    SELECT TOP 1 ar.ArtistId
    FROM Artist ar
    JOIN Album al2      ON al2.ArtistId = ar.ArtistId
    JOIN Track t2       ON t2.AlbumId = al2.AlbumId
    JOIN InvoiceLine il ON il.TrackId = t2.TrackId
    GROUP BY ar.ArtistId
    ORDER BY SUM(il.UnitPrice * il.Quantity) DESC
)
ORDER BY t.Name;