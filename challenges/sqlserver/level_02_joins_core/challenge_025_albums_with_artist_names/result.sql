
SELECT
    a.AlbumId,
    a.Title AS AlbumTitle,
    ar.Name AS ArtistName
FROM Album a
INNER JOIN Artist ar
    ON a.ArtistId = ar.ArtistId
ORDER BY
    ArtistName;