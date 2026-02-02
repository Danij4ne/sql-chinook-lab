
WITH album_tracks AS (
    SELECT 
        a.AlbumId,
        COUNT(t.TrackId) AS TrackCount
    FROM Album a
    JOIN Track t
        ON a.AlbumId = t.AlbumId
    GROUP BY a.AlbumId
)

SELECT
    AlbumId,
    TrackCount
FROM album_tracks
WHERE TrackCount >= 10
ORDER BY TrackCount DESC;