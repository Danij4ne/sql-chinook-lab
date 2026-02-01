
SELECT
    g.Name AS GenreName,
    MIN(t.UnitPrice) AS MinPrice,
    MAX(t.UnitPrice) AS MaxPrice
FROM Track t
JOIN Genre g
    ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY GenreName ASC;