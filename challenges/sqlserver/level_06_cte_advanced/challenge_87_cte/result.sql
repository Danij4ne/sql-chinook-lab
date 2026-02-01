
WITH artist_tracks AS (
    SELECT
        ar.Name AS ArtistName,
        COUNT(t.TrackId) AS TrackCount
    FROM Artist ar
    JOIN Album al
        ON al.ArtistId = ar.ArtistId
    JOIN Track t
        ON t.AlbumId = al.AlbumId
    GROUP BY
        ar.Name
)
SELECT TOP 10
    ArtistName,
    TrackCount
FROM artist_tracks
ORDER BY
    TrackCount DESC;