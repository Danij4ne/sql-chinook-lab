
WITH genre_sales AS (
    SELECT
        g.Name AS GenreName,
        SUM(il.UnitPrice * il.Quantity) AS TotalSales
    FROM Genre g
    JOIN Track t
        ON t.GenreId = g.GenreId
    JOIN InvoiceLine il
        ON il.TrackId = t.TrackId
    GROUP BY
        g.Name
)
SELECT TOP 5
    GenreName,
    TotalSales
FROM genre_sales
ORDER BY
    TotalSales DESC;