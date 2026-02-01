
SELECT
    ar.Name AS ArtistName,
    SUM(il.UnitPrice * il.Quantity) AS TotalSales
FROM Artist ar
INNER JOIN Album al
    ON ar.ArtistId = al.ArtistId
INNER JOIN Track t
    ON al.AlbumId = t.AlbumId
INNER JOIN InvoiceLine il
    ON t.TrackId = il.TrackId
GROUP BY
    ar.Name
ORDER BY
    TotalSales DESC;