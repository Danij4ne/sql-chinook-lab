
SELECT
    a.Name AS ArtistName
FROM Artist a
WHERE NOT EXISTS (
    SELECT 1
    FROM Album al
    JOIN Track t   ON t.AlbumId  = al.AlbumId
    JOIN Genre g   ON g.GenreId  = t.GenreId
    WHERE al.ArtistId = a.ArtistId
      AND g.Name = 'Rock'
)
ORDER BY ArtistName;