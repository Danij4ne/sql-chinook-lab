
SELECT
    Genre.Name AS GenreName,
    SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity) AS TotalSales
FROM Genre
JOIN Track
    ON Genre.GenreId = Track.GenreId
JOIN InvoiceLine
    ON Track.TrackId = InvoiceLine.TrackId
GROUP BY Genre.Name
ORDER BY TotalSales DESC;