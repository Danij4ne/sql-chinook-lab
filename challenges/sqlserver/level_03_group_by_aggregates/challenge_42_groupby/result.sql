
SELECT
    ar.Name AS ArtistName,
    SUM(il.UnitPrice * il.Quantity) AS TotalSales
FROM Artist AS ar
INNER JOIN Album AS al
    ON al.ArtistId = ar.ArtistId
INNER JOIN Track AS t
    ON t.AlbumId = al.AlbumId
INNER JOIN InvoiceLine AS il
    ON il.TrackId = t.TrackId
GROUP BY
    ar.Name
ORDER BY
    TotalSales DESC;