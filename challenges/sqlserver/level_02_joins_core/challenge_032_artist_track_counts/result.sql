
SELECT
    ar.Name AS ArtistName,
    COUNT(t.TrackId) AS TrackCount
FROM Artist ar
INNER JOIN Album al
    ON ar.ArtistId = al.ArtistId
INNER JOIN Track t
    ON al.AlbumId = t.AlbumId
GROUP BY
    ar.Name
ORDER BY
    TrackCount DESC;